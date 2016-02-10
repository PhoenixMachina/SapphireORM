module SapphireORM

  using ODBC

  function connection(;username=nothing,
                   password=nothing,
                   dbname=nothing,
                   option = 3,
                   host = "localhost",
                   driver = "MySQL ODBC 5.3 Unicode Driver")

    conn = advancedconnect("Driver={$driver};Server=$host;Database=$dbname;User=$username;Password=$password;Option=$option;")
  end

  function get(;table=nothing)
    query("SELECT * FROM $table")
    return conn.resultset
  end
  function getAll() end
  function update() end
  function updateAll() end
  function insert() end

end
