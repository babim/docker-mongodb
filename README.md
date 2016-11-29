[![](https://images.microbadger.com/badges/image/babim/mongodb.svg)](https://microbadger.com/images/babim/mongodb "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mongodb.svg)](https://microbadger.com/images/babim/mongodb "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/mongodb:ssh.svg)](https://microbadger.com/images/babim/mongodb:ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mongodb:ssh.svg)](https://microbadger.com/images/babim/mongodb:ssh "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/mongodb:pass.svg)](https://microbadger.com/images/babim/mongodb:pass "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mongodb:pass.svg)](https://microbadger.com/images/babim/mongodb:pass "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/mongodb:pass.ssh.svg)](https://microbadger.com/images/babim/mongodb:pass.ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mongodb:pass.ssh.svg)](https://microbadger.com/images/babim/mongodb:pass.ssh "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/mongodb:alpine.svg)](https://microbadger.com/images/babim/mongodb:alpine "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mongodb:alpine.svg)](https://microbadger.com/images/babim/mongodb:alpine "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/mongodb:alpine.ssh.svg)](https://microbadger.com/images/babim/mongodb:alpine.ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mongodb:alpine.ssh.svg)](https://microbadger.com/images/babim/mongodb:alpine.ssh "Get your own version badge on microbadger.com")

### Usage

#### Run `mongod`

    docker run -d -p 27017:27017 --name mongodb babim/mongodb

#### Run `mongod` w/ persistent/shared directory

    docker run -d -p 27017:27017 -v <db-dir>:/data/db -v <db-dir>:/data/configdb --name mongodb babim/mongodb

#### Run `mongod` w/ HTTP support

    docker run -d -p 27017:27017 -p 28017:28017 --name mongodb babim/mongodb mongod --rest --httpinterface

#### Run `mongod` w/ Smaller default file size

    docker run -d -p 27017:27017 --name mongodb babim/mongodb mongod --smallfiles

#### Run `mongo`

    docker run -it --rm --link mongodb:mongodb babim/mongodb bash -c 'mongo --host mongodb'
