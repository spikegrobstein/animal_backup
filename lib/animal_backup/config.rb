require 'yaml'

module AnimalBackup
  class Config

    attr_reader :bucket_name, :access_key_id, :secret_access_key

    # create a new backup config object
    def initialize(bucket_name, access_key_id, secret_access_key)
      @bucket_name = bucket_name
      @access_key_id = access_key_id
      @secret_access_key = secret_access_key
    end

    class << self

      # given a path to a YAML file
      # load the configuration
      # should have keys with the attr_readers above
      def load_from_file(file_path)
        config = YAML.load( File.read(file_path) )

        # return a new config object from the passed values
        new config['bucket_name'], config['access_key_id'], config['secret_access_key']
      end

    end
  end
end
