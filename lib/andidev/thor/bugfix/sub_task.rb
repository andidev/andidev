# Bugfix
# see http://stackoverflow.com/questions/5663519/namespacing-thor-commands-in-a-standalone-ruby-executable?answertab=votes#answer-7256898
class SubTask < Thor
	def self.banner(task, namespace = true, subcommand = false)
		"#{basename} #{task.formatted_usage(self, true, subcommand)}"
	end
end