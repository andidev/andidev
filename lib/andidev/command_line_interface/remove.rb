require 'thor'
require "andidev/command_line_interface/remove/file"
require "andidev/command_line_interface/remove/folder"
require "andidev/thor/bugfix/sub_task"

module Andidev
	module CommandLineInterface
		module Remove
			class Remove < SubTask
				# Bugfix
				# see http://stackoverflow.com/questions/5663519/namespacing-thor-commands-in-a-standalone-ruby-executable?answertab=votes#answer-7256898
				namespace :remove;
			end
		end
	end
end