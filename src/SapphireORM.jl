module SapphireORM

  using DataFrames
  using ODBC
  export Sapphire

  # Sapphire
  function Sapphire(;dsn       =  nothing,
                     username  =  nothing,
                     password  =  nothing)

    return ODBC.DSN(dsn, username, password)
  end

  # GET
  function get(dsn::ODBC.DSN, params::Dict=Dict())

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

    # Where
    if haskey(params, "where")
      where = "WHERE " * params["where"]
    else
      where = ""
    end
    return DataFrame(ODBC.query(dsn, "SELECT $values FROM $table $where"))
  end


  # INSERT
  function insert(dsn::ODBC.DSN, params::Dict=Dict())

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
    return DataFrame(ODBC.query(dsn, "INSERT INTO $table $names VALUES($vals)"))
  end

  # UPDATE
  function update(dsn::ODBC.DSN, params::Dict=Dict())

    # Table
    if haskey(params, "table")
      table = params["table"]
    else
      error("No table specify")
    end

    # Set
    if haskey(params, "set") && isa(params["set"], Dict)
      set = "SET "
      for k in keys(params["set"])
        set *= k * " = '"params["set"][k] * "' "
      end
    else
      set = ""
    end

    # Where
    if haskey(params, "where")
      where = "WHERE " * params["where"]
    else
      where = ""
    end

    DataFrame(ODBC.query(dsn, "UPDATE $table $set $where"))
    return dsn.resultset
  end

  # DELETE
  function delete(dsn::ODBC.DSN, params::Dict=Dict())

    # Table
    if haskey(params, "table")
      table = params["table"]
    else
      error("No table specify")
    end

    # Where
    if haskey(params, "where")
      where = "WHERE " * params["where"]
    else
      where = ""
    end

    DataFrame(ODBC.query(dsn, "DELETE FROM $table $where"))
    return dsn.resultset

  end

end
