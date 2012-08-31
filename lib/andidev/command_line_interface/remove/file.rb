require 'thor'

module Andidev
	module CommandLineInterface
		module Remove
			class Remove < SubTask
				desc 'file', 'Remove a file'
		        class_option :number, :type => :string, :description => 'Number to call', :default => '555-1212'
		        method_option :name, :type => :string, :description => 'Name to greet', :default => 'there'
				def file(file)
					say "Removed file  #{file}"
				end
			end
		end
	end
end