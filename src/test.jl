include("SapphireORM.jl")

using SapphireORM

sapphire = Sapphire(username="root", password="tututa", dbname="test");

SapphireORM.get(sapphire, table="toto", values=[])
