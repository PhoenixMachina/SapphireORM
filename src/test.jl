include("SapphireORM.jl")

using SapphireORM

test = SapphireORM.connection(username="", password="", dbname="");

print(SapphireORM.get(table=""))
