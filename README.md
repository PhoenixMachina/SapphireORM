# SapphireORM
[![Build Status](https://travis-ci.org/PhoenixMachina/SapphireORM.svg?branch=master)](https://travis-ci.org/PhoenixMachina/SapphireORM)

A Julia ORM.

# Requirements
The following dependencies need to be added :
- ODBC

To do that, you need to type in your :
```
Pkg.add("ODBC")
```

Here's how to call the constructor :
```
Sapphire(username, password, dbname, option, host, driver)
```
