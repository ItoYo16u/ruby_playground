# メモ
# 抽象のEmployee class, 具体のStaff class, Manager classを作る
# rubyにはabstract classやinterfaceが存在しないため、実装にあたってはNotImplementedErrorを投げることで
# 具象クラスに実装を強制する

# Company classはEmployee classを持ち、StaffもManagerもEmployeeとして扱うことで
# StaffやManagerといった具象への依存を避ける

class Company
    :attr_reader :president,:employees,:country
    def initialize(args)
	    @president = args[:president]
	    @employees = args[:employees]
	    @country = args[:country]
    end

    def hire(employee)
	    pre_hire
	    @employees << employee
    end

    def fire(employee)
	    @employees.delete(employee)
    end

    def pre_hire
	    raise NotImplementedError,
		    "#post_hire method must be implemented for {self.class}"
    end
end

class NantokaCompany << Company
	def pre_hire
	    # do entrance exam
	end
end


class Employee
	
	# read only fields
	# 
	attr_reader :name,:group,:grade
        
	def initialize(args)
		@name = args[:name]
		@group = args[:group]
		@grade = default_grade]
		post_initialize(args)
	end
	
	def work
		# shared work
		subsequent_work
	end

	def post_initialize(args)
	    raise NotImplementedError,
		    "post_initialize method must be implemented for #{self.class}"
	end

	def subsequent_work
	    nil
	end


	# force to override method in concrete classes like interface or abstract class
	def default_grade
		raise NotImplementedError,
			"default_grade method must be implemented for #{self.class}"
	end
end

class Staff < Employee
	def subsequent_work
	    # do clean up!
	end

	def default_grade
	       :staff	
	end
end

class Manager < Employee
	# read only additional field for manager
	attr_reader :assistant
	def post_initialize(args)
		@assistant = args[:assistant]
	end

	def default_grade
		:admin
	end

	def subsecuent_work
	    # do check!
	end

end


