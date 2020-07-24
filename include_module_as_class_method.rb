# moduleを使ってクラスにクラスメソッドとインスタンスメソッドをmixinする
#
# クラスメソッドは状態を持たないServiceの機能として扱うとよさそう

module MyModule

	# なおActiveSupport::Concernを継承することでself.included(base)メソッドの定義が不要になる
	# include ActiveSupport::Concern
	def self.included(base)
		# ちなみに MyClass
		#   extend MyModule
		# とすれば、barをクラスメソッドMyClass.barとして呼び出せる
		base.extend(ClassMethods)
	end

	module ClassMethods
		def foo
			puts "this is independent of instance"
		end
	end
	
	def bar
		puts "this is dependent on instance"
	end
end

class MyClass
	include MyModule
end

# 特定のクラスにmixinするようなmoduleから、特定のクラスのクラスメソッドを呼び出すパターン

# mixin
module ModuleForTarget # on Target
	# なお、Activesupport::Concernを使うことで,self.included(base)をincluded do ... endに書き換えられる
	# extend ActiveSupport::Concern
	def self.included(base)
		base.class_eval do
			# base.class_evalブロックを使うことでinclude先のクラスメソッドを呼び出す
			scope :not_logically_deleted, lambda{ where(is_deleted: false)}
		end
	end
end

class Target < ActiveRecord::Base
	include ModuleForTarget
end

# なんとなく気になったのだが、ActiveRecord::Baseのscopeは"メソッドを定義するメソッド"??
# というのは、model.not_logically_deleted.all みたいにメソッドとして使えるから...
# 或いは、fluent interfaceをうまいこと実装している??
