module Fastlane
  module Actions
    module SharedValues
      
    end

    class FastlaneVersionAction
      def self.run(params)
        defined_version = ((Gem::Version.new(params.first) if params.first) rescue nil)
        raise "Please pass minimum fastlane version as parameter to fastlane_version".red unless defined_version

        if Gem::Version.new(Fastlane::VERSION) < defined_version
          raise "The Fastfile requires a fastlane version of >= #{defined_version}. You are on #{Fastlane::VERSION}. Please update using `sudo gem update fastlane`.".red
        end

        Helper.log.info "fastlane version valid"
      end

      def self.step_text
        "Verifying required fastlane version"
      end
    end
  end
end
