# practice of object oriented programming
class Employee
  attr_reader :name, :group, :grade

  def initialize(args)
    @name = args[:name]
    @group = args[:group]
    @grade = default_grade
  end

  def default_grade
    ralse NotImprementedError,
          "#{self.class} requires default_grade method."
  end

  def work
    do_preparation
  end
end

class Staff < Employee
  def work
    super
    do_clean_up
  end

  def default_grade
    :staff
  end
end

class Manager < Employee
  attr_reader :assistant
  initialize(args)
  super
  @assistant = args[:assistant]

  def work
    super
    do_check
  end

  def default_grade
    :admin
  end
end
