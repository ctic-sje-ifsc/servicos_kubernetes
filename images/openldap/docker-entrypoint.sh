#!/bin/sh
set -e

config="/etc/openldap/slapd.conf"
init_ldif=$(mktemp)
database="/var/lib/openldap/openldap-data/data.mdb"

if [ "${domain}" = "" ]
then
    domain="dc=example,dc=com"
fi
domain_dc=$(echo ${domain} | awk -F '=|,' '{print $2}')

if [ "${admin}" = "" ]
then
    # Default administrator is 'admin'
    admin="cn=admin,${domain}"
fi
admin_cn=$(echo ${admin} | awk -F '=|,' '{print $2}')

if [ "${admin_pass}" = "" ]
then
    # Default password is 'admin'.
    admin_pass="{SSHA}PvPQoJJLvZhDkpOxA6c2uzxFgPjB6QRF"
fi

if [ "${org}" = "" ]
then
    org="Example"
fi

cat > ${config} <<EOF
include /etc/openldap/schema/core.schema
include /etc/openldap/schema/cosine.schema
include /etc/openldap/schema/inetorgperson.schema
access to attrs=userPassword
    by dn="${admin}" write
    by anonymous auth
    by self write
    by * none
access to *
    by dn="${admin}" write
    by * read
access to dn.base=""
    by * read
database mdb
maxsize 1073741824
suffix "${domain}"
rootdn "${admin}"
rootpw "${admin_pass}"
directory /var/lib/openldap/openldap-data
index   objectClass eq
EOF

if [ -e "${database}" ]
then
    exec "$@"
    exit
fi

cat > ${init_ldif} <<EOF
# Domain
dn: ${domain}
objectClass: top
objectClass: dcObject
objectClass: organization
o: ${org}
dc: ${domain_dc}

# Administrator
dn: ${admin}
cn: ${admin_cn}
objectclass: organizationalRole
EOF

slapadd -l ${init_ldif}
rm -f ${init_ldif}

exec "$@"
