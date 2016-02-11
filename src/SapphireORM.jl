module SapphireORM

  using ODBC

  export Sapphire

  type Sapphire
    conn::ODBC.Connection
    function Sapphire(;username=nothing,
                          password=nothing,
                          dbname=nothing,
                          option = 3,
                          host = "localhost",
                          driver = "MySQL ODBC 5.3 Unicode Driver")

      conn = advancedconnect("Driver={$driver};Server=$host;Database=$dbname;User=$username;Password=$password;Option=$option;")
      new(conn)
    end
  end

  function get(sapphire::Sapphire;
               table=nothing,
              values = [])

    if length(values) > 0
      values = join(values, ",")
    else
      values = "*"
    end
    query("SELECT $values FROM $table")
    return conn.resultset
  end

  function update(::Sapphire) end

  function insert(::Sapphire) end

end
