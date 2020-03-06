# OpenLDAP

A base `dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br` é utilizada para aplicações de ensino na área de Telecomunicações, como MATLAB e Octave.

O arquivo `Makefile` facilita a criação dos objetos Kubernetes:
- Objetos sensíveis: arquivo `Secret.yaml`.
- Objetos públicos: arquivos `openldap.yaml`.

## `Secret.yaml`

O arquivo `Secret.yaml` possui a seguinte estrutura:

```yaml
---
apiVersion: v1
data:
  slapd.conf: ***
  config.php: ***
kind: Secret
metadata:
  labels:
    app: openldap
  name: openldap
  namespace: testes
type: Opaque

```

Os atributos `data.slapd.conf` e `data.config.php` estão em formato Base64, e possuem como conteúdo a configuração do servidor OpenLDAP (`slapd.conf`) e do phpLDAPadmin (`config.php`).

### `slapd.conf`

O arquivo `sladp.conf` possui o seguinte conteúdo:

```
include /etc/openldap/schema/core.schema
include /etc/openldap/schema/cosine.schema
include /etc/openldap/schema/inetorgperson.schema
include /etc/openldap/schema/nis.schema

pidfile /run/openldap/slapd.pid
argsfile /run/openldap/slapd.args

modulepath /usr/lib/openldap
moduleload back_mdb.so

access to attrs=userPassword
  by dn="cn=professor,ou=usuarios,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br" write
  by self write
  by anonymous auth
  by * none
access to *
  by dn="cn=professor,ou=usuarios,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br" write
  by self write
  by * read

database mdb
maxsize 1073741824
suffix "dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br"
rootdn "cn=admin,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br"
rootpw ***

directory /var/lib/openldap/openldap-data

index objectClass,cn,uid,uidNumber,gidNumber eq
```

O atributo `rootpw` foi criado com o comando `slappasswd`, parte do pacote do OpenLDAP.

### `config.php`

O arquivo `config.php` tem o seguinte conteúdo:

```
<?php
$servers = new Datastore();
$servers->newServer('ldap_pla');
$servers->setValue('server','name','IFSC');
$servers->setValue('server','host','openldap-openldap');
$servers->setValue('server','port',389);
$servers->setValue('server','base',array('dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br'));
$servers->setValue('login','auth_type','cookie');
$servers->setValue('login','bind_id','cn=professor,ou=usuarios,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br');
$servers->setValue('server','tls',false);
?>
```

## `openldap.yaml`

O arquivo `openldap.yaml` define vários objetos Kubernetes:

0. Serviço phpLDAPadmin: _Ingress_, _Service_ e _Deployment_.
0. Serviço OpenLDAP: _Service_ e _Deployment_.

O relacionamento entre os objetos está da seguinte forma:

```
[phpLDAPadmin] Ingress --- Service --- Deployment ---\
                                       |             |
                                 /-----/             Secret
                                 |                   |
[OpenLDAP]                 Service --- Deployment ---/

```

# Base LDAP

A base mínima sugerida de trabalho é esta:

```ldif
version: 1

dn: dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br
dc: nuvem
o: IFSC
objectclass: organization
objectclass: dcObject
objectclass: top

dn: ou=grupos,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br
objectclass: organizationalUnit
objectclass: top
ou: grupos

dn: cn=alunos,ou=grupos,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br
cn: alunos
gidnumber: 501
objectclass: posixGroup
objectclass: top

dn: cn=professores,ou=grupos,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br
cn: professores
gidnumber: 500
objectclass: posixGroup
objectclass: top

dn: ou=usuarios,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br
objectclass: organizationalUnit
objectclass: top
ou: usuarios

dn: cn=professor,ou=usuarios,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br
cn: professor
gidnumber: 500
givenname: Professor
homedirectory: /home/professor
loginshell: /bin/bash
objectclass: inetOrgPerson
objectclass: posixAccount
objectclass: top
sn: de Tele
uid: professor
uidnumber: 1000
userpassword: ***
```

O atributo `userpassword` do DN `cn=professor,ou=usuarios,dc=nuvem,dc=sj,dc=ifsc,dc=edu,dc=br`, no caso o usuário `professor`, pode ser criado ou alterado na própria interface Web do phpLDAPadmin.
