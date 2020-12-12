require "pg"
host_name = ""
port = ""
user_name = ""
password = ""
db_name = ""
conn = PG::connect(host: host_name, user: user_name, password: password, port: port, dbname: db_name)
#results = conn.exec("insert into movies (id,title,director,year,length_minutes) values (2,'Toy Story2','John Lasseter',2000,90);")
results = conn.exec("select * from movies")
results.each do |result|
  p result
end
conn.finish
