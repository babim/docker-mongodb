### Usage

#### Run `mongod`
```
    docker run -d -p 27017:27017 --name mongodb babim/mongodb
```
#### Run `mongod` w/ persistent/shared directory
```
    docker run -d -p 27017:27017 -v <db-dir>:/data/db -v <db-dir>:/data/configdb --name mongod babim/mongodb
```
#### Run `mongod` w/ HTTP support
```
    docker run -d -p 27017:27017 -p 28017:28017 --name mongodb babim/mongodb mongo --rest --httpinterface
```
#### Run `mongod` w/ Smaller default file size
```
    docker run -d -p 27017:27017 --name mongodb babim/mongodb mongo --smallfiles
```
#### Run `mongo`
```
    docker run -it --rm --link mongodb:mongodb babim/mongodb bash -c 'mongo --host mongodb'
```
#### Using a custom MongoDB configuration file

For a more complicated configuration setup, you can still use the MongoDB configuration file. mongod does not read a configuration file by default, so the --config option with the path to the configuration file needs to be specified. Create a custom configuration file and put it in the container by either creating a custom Dockerfile FROM mongo or mounting it from the host machine to the container. See the MongoDB manual for a full list of configuration file options.

For example, /my/custom/mongod.conf is the path to the custom configuration file. Then start the MongoDB container like the following:
```
    docker run --name some-mongo -v /my/custom:/etc/mongo -d mongo --config /etc/mongo/mongod.conf
```

### Environment Variables

When you start the mongo image, you can adjust the initialization of the MongoDB instance by passing one or more environment variables on the docker run command line. Do note that none of the variables below will have any effect if you start the container with a data directory that already contains a database: any pre-existing database will always be left untouched on container startup.
MONGO_INITDB_ROOT_USERNAME, MONGO_INITDB_ROOT_PASSWORD

These variables, used in conjunction, create a new user and set that user's password. This user is created in the admin authentication database and given the role of root. Both variables are required for a user to be created. If both are present then MongoDB will start with authentication enabled: mongod --auth. Authentication in MongoDB is fairly complex, so more complex user setup is explicitly left to the user via /docker-entrypoint-initdb.d/ (see Initializing a fresh instance below). The following is an example of using these two variables to create a MongoDB instance and then using the mongo cli to connect against the admin authentication database.
```
$ docker run -d --name some-mongo -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret mongo

$ docker run -it --rm --link some-mongo:mongo mongo mongo --host mongo -u mongoadmin -p secret --authenticationDatabase admin some-db
> db.getName();
some-db
```
If you do not provide these two variables or do not set the --auth flag with your own custom user setup, then MongoDB will not require authentication. For more details about the functionality described here, please see the sections in the official documentation which describe authentication and authorization in more detail.

### MONGO_INITDB_DATABASE

This variable allows you to specify the name of a database to be used for creation scripts in /docker-entrypoint-initdb.d/*.js (see Initializing a fresh instance below). MongoDB is fundamentally designed for "create on first use", so if you do not insert data with your JavaScript files, then no database is created.

### Docker Secrets

As an alternative to passing sensitive information via environment variables, _FILE may be appended to the previously listed environment variables, causing the initialization script to load the values for those variables from files present in the container. In particular, this can be used to load passwords from Docker secrets stored in /run/secrets/<secret_name> files. For example:
```
$ docker run --name some-mongo -e MONGO_INITDB_ROOT_PASSWORD_FILE=/run/secrets/mongo-root -d mongo
```
Currently, this is only supported for MONGO_INITDB_ROOT_USERNAME and MONGO_INITDB_ROOT_PASSWORD.


### via docker stack deploy or docker-compose

Example stack.yml for mongo:

#### Use root/example as user/password credentials
version: '3.1'
```
services:

  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
```