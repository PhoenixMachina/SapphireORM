using Base.Test
using SapphireORM

# Testing constructor
global conn = Sapphire(username="root", password="", dbname="phoenixMachina")


@test typeof(engine) == TlalocEngine
@test engine.viewPath == "thisIsTheViewPath/"
@test engine.templatePath == "thisIsTheTemplatePath/"
@test engine.resourcePath == "thisIsTheResource/"

#Testing Page constructor
aPage = Page(engine,"apage.html",Dict())
@test typeof(aPage) == Page
@test aPage.view == "apage.html"

#Trying to add args
addArg(aPage,"name","aValue")
@test haskey(aPage.args,"name")
@test (aPage.args)["name"] == "aValue"

#Testing view
aPage.tlaloc.viewPath = string(dirname(Base.source_path()),"/")
aPage.tlaloc.templatePath = string(dirname(Base.source_path()),"/")

println(render(aPage))
#@test render(aPage) == "Yop\n\nBest header ever\n \${something} Hello aValue, great to meet you!\n"
