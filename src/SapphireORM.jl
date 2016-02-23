module SapphireORM

  using ODBC
  export Sapphire

  # Sapphire
  function Sapphire(;username = nothing,
                          password = nothing,
                          dbname = nothing,
                          option = 3,
                          host = "localhost",
                          driver = "MySQL ODBC 5.3 Unicode Driver")

    return advancedconnect("Driver={$driver};Server=$host;Database=$dbname;User=$username;Password=$password;Option=$option;")

  end

  # GET
  function get(conn::Connection, params::Dict=Dict())

    # Table
    if haskey(params, "table")
      table = params["table"]
    else
      error("No table specify")
    end

    # Values
    if haskey(params, "values") && length(params["values"]) > 0
      values = join(params["values"], ",")
    else
      values = "*"
    end

    query("SELECT $values FROM $table", conn)
    return conn.resultset

  end


  # INSERT
  function insert(conn::Connection, params::Dict=Dict())

    # Table
    if haskey(params, "table")
      table = params["table"]
    else
      error("No table specify")
    end

    # Values

    # TODO: Support multiple values keys
    if haskey(params, "values") && length(params["values"]) > 0
      names = ""
      if isa(params["values"], Array)
        vals = join(params["values"], ",")
      else
        names = "(" * join(keys(params["values"]), ",") * ")"
        vals = join(values(params["values"]), ",")
      end
    else
      vals = "*"
    end
    query("INSERT INTO $table $names VALUES($vals)", conn)
    return conn.resultset
  end

  # UPDATE
  function update(::Connection) end

end
