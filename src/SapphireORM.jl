module SapphireORM

  using ODBC
  export Sapphire

  function Sapphire(;username=nothing,
                          password=nothing,
                          dbname=nothing,
                          option = 3,
                          host = "localhost",
                          driver = "MySQL ODBC 5.3 Unicode Driver")
    return advancedconnect("Driver={$driver};Server=$host;Database=$dbname;User=$username;Password=$password;Option=$option;")
  end

  function get(conn::Connection;
               table=nothing,
               values = [])

    if length(values) > 0
      values = join(values, ",")
    else
      values = "*"
    end
    query("SELECT $values FROM $table", conn)
    return conn.resultset
  end

  function update(::Connection) end

  function insert(::Connection) end

end
