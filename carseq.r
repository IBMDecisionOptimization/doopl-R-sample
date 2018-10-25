if (!py_available())
  stop("missing Python interpreter")
if(!require(reticulate)) {
install.packages("reticulate")
}
library(reticulate)

if(!require(DBI)) {
  install.packages("RSQLite")
}

library(DBI)
con <- dbConnect(RSQLite::SQLite(), "carseq.db")

nbCars = data.frame(c(6))
nbOptions = data.frame(c(5))
nbSlots =data.frame(c(10))

demand = data.frame(c(1,2,3,4,5,6), c(1,1,2,2,2,2))
capacity = data.frame(c(1,2,3,4,5), c(1,2,1,2,1), c(2,3,3,5,5))


doopl <- import("doopl.factory")

with (doopl$create_opl_model("carseq.mod") %as% mdl, {
  # add input tables as IloTupleSet. Can be tuples or pandas df.
  mdl$set_input("nbCars", nbCars)
  mdl$set_input("nbOptions", nbOptions)
  mdl$set_input("nbSlots", nbSlots)
  mdl$set_input("demand", demand)
  mdl$set_input("capacity", capacity)
  mdl$set_input("option", dbReadTable(con, "option"))
  # pump a table from the DB.  mdl$set_input(option)

  mdl$run()
  outputs = mdl$output_table_names

  print("Output tables names are ");
  for (t in outputs)
    print(t)
  report = mdl$report
  for (name in names(report)){
    print(name)
    print(report[name])
  }

})
dbDisconnect(con)
