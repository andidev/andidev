require 'thor'

module Andidev
	module CommandLineInterface
		module Create
			class Create < SubTask
				desc 'html', 'Create html file'
				def html
					say "Created html file"
				end
			end
		end
	end
end