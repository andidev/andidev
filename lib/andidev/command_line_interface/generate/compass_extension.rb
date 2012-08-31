require 'thor'
require 'thor/group'

module Andidev
	module CommandLineInterface
		module Generate
			class CompassExtension < Thor::Group
				include Thor::Actions

				argument :name, :type => :string, :defaut => nil, :desc => "Name of the extension, e.g. My Extension"
				class_option :version, :aliases => "-v", :type => :string, :desc => "Version of the extension, e.g. 1.8.2 or 2011-12-24"
				class_option :latest, :aliases => "-l", :type => :boolean, :desc => "Create latest (default) version or not", :default => true
				class_option :dependency, :aliases => "-d", :type => :string, :desc => "Dependency to use [none|jquery|bootstrap]", :default => "none"
				#class_option :directory, :aliases => "-dir", :type => :boolean, :desc => "Create directory for sub-modules, images and fonrs"

				class_option :force, :aliases => "-f", :type => :boolean, :desc => "Force creation of files to override existing files"
				class_option :skip, :aliases => "-s", :type => :boolean, :desc => "Skip creation of existing files"
				class_option :clean, :type => :boolean, :desc => "Clean up and remove current extension folder before generation"
				class_option :clean_version, :type => :boolean, :desc => "Clean up and remove current version before generation"
				class_option :help_files, :aliases => "-h", :type => :boolean, :desc => "Create user help files"


				def self.source_root
					File.join(File.dirname(__FILE__), "compass_extension", "templates")
				end

				def set_template_variables
					@variables = {
						:name_dashed => name.downcase.gsub(/[\s\.]/, "-")
					}
					if options[:latest]
						@version_directory = "project"
					else
						@version_directory = options[:version]
					end
				end

				def clean
					if options[:clean]
						folder_name = @variables[:name_dashed]
						if File.directory? folder_name and yes? "Clean up and remove folder \"#{folder_name}\"? [yN]", :RED
							remove_dir folder_name
						end
					end
				end

				def clean_version
					if options[:clean_version]
						folder_name = File.join(@variables[:name_dashed], "templates", @version_directory)
						if File.directory? folder_name and yes? "Clean up and remove folder \"#{folder_name}\"? [yN]", :RED
							remove_dir folder_name
						end
					end
				end

				def create_manifest
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/manifest.rb"
					case options[:dependency]
				 		when "bootstrap"
							template "dependency_bootstrap/manifest.rb.tt", file_name, @variables
					 	when "jquery"
							template "dependency_jquery/manifest.rb.tt", file_name, @variables
					 	else
							template "dependency_none/manifest.rb.tt", file_name, @variables
					 end
				end

				def create_scss
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/#{@variables[:name_dashed]}.scss"
					create_file file_name, "Place \"#{name}\" SCSS here"
				end

				def create_scss_sub_module_help_file
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/#{@variables[:name_dashed]}/place-scss-sub-modules-here"
					create_file file_name, "Place \"#{name}\" SCSS sub modules in this folder" if options[:help_files]
				end

				def create_javascript
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/#{@variables[:name_dashed]}.js"
					create_file file_name, "Place \"#{name}\" JavaScript here"
				end

				def create_javascript
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/#{@variables[:name_dashed]}/place-javascript-sub-modules-here"
					create_file file_name, "Place \"#{name}\" JavaScript sub modules in this folder" if options[:help_files]
				end

				def create_images_help_file
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/#{@variables[:name_dashed]}/place-images-here"
					create_file file_name, "" if options[:help_files]
				end

				def create_fonts_help_file
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/#{@variables[:name_dashed]}/place-fonts-here"
					create_file file_name, "" if options[:help_files]
				end

				def create_example
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/examples/#{@variables[:name_dashed]}-example.html"
					case options[:dependency]
				 		when "bootstrap"
							template "dependency_bootstrap/example.html.tt", file_name, @variables
					 	when "jquery"
							template "dependency_jquery/example.html.tt", file_name, @variables
					 	else
							template "dependency_none/example.html.tt", file_name, @variables
					 end
				end

				def create_source
					file_name = "#{@variables[:name_dashed]}/templates/#{@version_directory}/source/#{@variables[:name_dashed]}-#{options[:version]}.zip"
					create_file file_name, "Replace this file with \"#{name}\" zipped source"
				end
			end
		end
	end
end