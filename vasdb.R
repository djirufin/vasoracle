library(RJDBC)

#create driver object
jdbcDriver <- JDBC("oracle.jdbc.OracleDriver", classPath = "lib/ojdbc.jar")

#Create connection object
cnx <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@//oem:1521/vasdb", "vas", "vas")

x <- dbGetQuery(cnx, "select transdate, activation_mode, msisdn, msisdnb, bundle_id, status_reason, bundle_name, bundle_price, module from cdr where transdate = to_date('01-JAN-2020', 'DD-MON-YYYY')")
barplot(x$STATUS_REASON, main = "Transactions status", ylab = "Count", xlab = "Status reason", col = rainbow(7), legend = rownames(table))
close(cnx)

