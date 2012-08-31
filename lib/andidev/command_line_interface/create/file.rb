require 'thor'

module Andidev
	module CommandLineInterface
		module Create
			class Create < SubTask
				desc 'file', 'Create file'
				def file
					say "Created file"
				end
			end
		end
	end
end