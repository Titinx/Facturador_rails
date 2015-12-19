module PeopleHelper
	def rellenar(param)
		param = "___" if param.nil? or param.size == 0
		param
	end
end
