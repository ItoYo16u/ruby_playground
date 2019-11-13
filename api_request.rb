module ApiHelper
	def get_json(url,limit=10)
		raise ArgumentError,"Too Many Redirects" if limit == 0
		uri =URI.parse(url)

		begin
			res = Net::HTTP.start(uri.host,uri.port,use_ssl: uri.scheme == "https") do |http|
				http.open_timeout = 5
				http.read_timeout = 10
				http.get(uri.request_uri)
			end
		case
			res
		when Net::HTTPSuccess
			json = res.body
			JSON.parse(json)
		when Net::HTTPRedirection
			url = res["location"]
			warn "redirected to #{url}"
			get_json(url,limit-1)
		else
			puts [uri.to_s, res.value].join(":")
			nil
		end
		rescue => e
			puts [uri.to_s,e.class,e].join(":")
			nil
		end
	end
end


