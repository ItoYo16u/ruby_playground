require "net/http"
require "json"

q = URI.encode_www_form_component("parameter")
uri = URI.encode("https://path/to/endpoint?q=#{q}")
uri = URI.parse(uri)
res = Net::HTTP.get_response(uri)
res_json = JSON.parse(res.body)
