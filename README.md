# sscript
Useful Shell scripts for projects

# Install

with npm

`npm install sscripts`

with yarn

`yarn add sscripts`

# Run

shell

`./node_modules/.bin/{script_name}`

npm

`npm run {script_name}`

yarn 

`yarn {script_name}`

# Scripts

## 📁 git (2)
subfolder: `/git`

### storage_push
Upload all changes in storage folder into git repository

### submodule_pull
Update git submodules

## 📁 File system (1)
subfolder: `/fs`

### fix_permissions

## 📁 Docker (3)
subfolder: `/docker`

### up
run docker-compose containers in demonise

`--build` - for (re)build containers

### down
stop docker-compose containers

## prune
Cleanup Docker

## 📁 app (6)
execute command in 'app' container

subfolder: `/app`

### php
### npm
### yarn
### git
### composer
### artisan

## 📁 db (3)
execute command in 'db' container

subfolder: `/db`

### mysql
### dump
### restore
