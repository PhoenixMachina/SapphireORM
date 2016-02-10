module SapphireORM

using MySQL

function connect(host::AbstractString,username::AbstractString,password::AbstractString,db_name::AbstractString)
  mysql_connect(host,username,password,db_name)
end

function get() end
function getAll() end
function update() end
function updateAll() end
function insert() end

end # end of module
