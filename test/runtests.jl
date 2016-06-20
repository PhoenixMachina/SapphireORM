using Base.Test
using SapphireORM

# Testing constructor
global conn = Sapphire(dsn=dsnTest,username=root,password="")
