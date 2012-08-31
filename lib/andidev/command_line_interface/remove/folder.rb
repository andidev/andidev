require 'thor'

module Andidev
	module CommandLineInterface
		module Remove
			class Remove < SubTask
				desc 'folder', 'Remove a folder'
				def folder
					say "Removed folder"
				end
			end
		end
	end
end