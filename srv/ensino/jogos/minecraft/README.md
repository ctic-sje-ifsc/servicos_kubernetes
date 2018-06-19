# Minecraft em Kubernetes
Utilizada a versão estável do [Helm](https://github.com/kubernetes/charts/tree/master/stable/minecraft).

A configuração foi feita via arquivo `values.yaml`:
```yaml
image: itzg/minecraft-server
imageTag: latest
resources:
  requests:
    memory: 1Gi
    cpu: 1
  limits:
    memory: 1Gi
    cpu: 4
minecraftServer:
  eula: "TRUE"
  version: "LATEST"
  difficulty: easy
  whitelist:
  ops:
  icon:
  maxPlayers: 20
  maxWorldSize: 10000
  allowNether: true
  announcePlayerAchievements: true
  enableCommandBlock: true
  forcegameMode: false
  generateStructures: true
  hardcore: false
  maxBuildHeight: 256
  maxTickTime: 60000
  spawnAnimals: true
  spawnMonsters: true
  spawnNPCs: true
  viewDistance: 10
  levelSeed:
  gameMode: creative
  motd: "Minecraft@IFSC"
  pvp: false
  levelType: DEFAULT
  generatorSettings:
  worldSaveName: world
  onlineMode: true
  jvmOpts: "-Xmx1G -Xms1G"
  serviceType: ClusterIP
  rcon:
    enabled: true
    port: 25575
    password: "********"
    serviceType: ClusterIP
persistence:
  storageClass: "ensino-jogos-minecraft"
  dataDir:
    enabled: true
    Size: 1Gi
```

Por fim, foi iniciado o servidor Minecraft com `make`:
```sh
make create
```
## Rcon
Há [alguns clientes rcon](http://wiki.vg/RCON#Example_implementations) para Minecraft. Uma boa sugestão é o [mrcon](https://github.com/Tiiffi/mcrcon/).
