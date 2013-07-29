class Common

	class << self

		def settings
			read_config 'config.yml'
		end

		private

    def settings_dir
      File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    end

    def read_config(filename)
      settings =  File.open(File.join(settings_dir, filename)) do |f|
        YAML.load f
      end
      settings.with_indifferent_access
    end

	end

end
