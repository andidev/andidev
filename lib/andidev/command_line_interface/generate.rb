require 'thor'
require "andidev/command_line_interface/generate/compass_extension"
require "andidev/thor/bugfix/sub_task"

module Andidev
	module CommandLineInterface
		module Generate
			class Generate < SubTask
				# Bugfix
				# see http://stackoverflow.com/questions/5663519/namespacing-thor-commands-in-a-standalone-ruby-executable?answertab=votes#answer-7256898
				namespace :generate;
				register CompassExtension, 'compass_extension', 'compass-extension', 'Genarate Compass Template'

				# Bugfix
				# see http://stackoverflow.com/questions/11760708/how-do-i-get-thor-to-display-options#answer-11767086
				tasks["compass_extension"].options = CompassExtension.class_options
			end
		end
	end
end
