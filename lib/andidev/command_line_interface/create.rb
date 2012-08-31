require 'thor'
require "andidev/command_line_interface/create/file"
require "andidev/command_line_interface/create/html"
require "andidev/thor/bugfix/sub_task"

module Andidev
	module CommandLineInterface
		module Create
			class Create < SubTask
				# Bugfix
				# see http://stackoverflow.com/questions/5663519/namespacing-thor-commands-in-a-standalone-ruby-executable?answertab=votes#answer-7256898
				namespace :create;
			end
		end
	end
end