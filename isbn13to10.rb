isbn10 = isbn13.to_s.chop.split("").drop(3).join() + ((isbn13).to_s.chop.split("").map(&:to_i).drop(3).map.with_index{|v,i| v*(10-i)}.sum%11*(-1) +11).to_s.gsub(/10/,'X').gsub(/11/,'0')
