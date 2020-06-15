def parse_start_end_block(lines,tmp=[])
	head = lines.shift
	tail = lines
	case head
	when nil
		tmp
	when "start"
		parse_start_end_block(tail)
	when "end"
		[tmp] + parse_start_end_block(tail)
	else
		tmp << head
		parse_start_end_block(tail,tmp)
	end
end

