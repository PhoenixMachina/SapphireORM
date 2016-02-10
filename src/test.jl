include("SapphireORM.jl")

using SapphireORM

test = SapphireORM.connection(username="root", password="tututa", dbname="test");

print(SapphireORM.get(table="toto", values=[]))
