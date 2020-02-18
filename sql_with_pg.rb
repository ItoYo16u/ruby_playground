require "pg"

connection = PG::connect(
 host: "localhost",
 user: "database_user",
 password: "database_password",
 dbname: "db_name",
 port: "5432",
) #=> <PG::Connection:>
result = connection.exec("select <target> from <table_name> where <condition>")
# => <PG:Result:.....  status=<status_message> ntuples=<N> cmd_tuples=<N>  >
# example result has users [{id: 1, name:"hoge", email: "test@example.com",},{id:2, name: "foo",email:"example@test.com",...}
result.each do |u|
	print(u)
end
#=> {"id"=>"1", "name"=>"hoge", "email"=>"test@example.com", "created_at"=>"2020-02-18 01:55:46.598279", "update_at"=>"2020-02-18 01:55:46.598279"}{"id"=>"2", "name"=>"taro", "email"=>"test@example.com", "created_at"=>"2020-02-18 01:57:03.564788", "update_at"=>"2020-02-18 02:16:00.981362"}=> #<PG::Result:0x00007fffd444b1b0 status=PGRES_TUPLES_OK ntuples=2 nfields=5 cmd_tuples=2>

