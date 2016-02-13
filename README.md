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
