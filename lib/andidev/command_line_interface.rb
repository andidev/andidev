require 'thor'
require "andidev/command_line_interface/generate"
require "andidev/command_line_interface/create"
require "andidev/command_line_interface/remove"

module Andidev
	module CommandLineInterface
		class Root < Thor
			register Generate::Generate, 'generate', 'generate [compass-template]', 'Genarate Helper'
			#register Create::Create, 'create', 'create [file|html]', 'Create helper'
			#register Remove::Remove, 'remove', 'remove [file|folder]', 'Remove helper'

			# Bugfix
			# see http://stackoverflow.com/questions/11760708/how-do-i-get-thor-to-display-options#answer-11767086
        	tasks["generate"].options = Generate::Generate.class_options
        	#tasks["create"].options = Create::Create.class_options
        	#tasks["remove"].options = Remove::Remove.class_options
		end
	end
end
