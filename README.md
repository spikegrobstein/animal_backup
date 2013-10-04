# AnimalBackup

A backup script designed around dead-simple deployment, simple configuration and fast backups to S3.
All backups are streamed directly to S3 with no intermediary file.

This is a work-in-progress. Use at your own risk. Yada, yada.

## Installation

Add this line to your application's Gemfile:

    gem 'animal_backup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install animal_backup

## Usage

This is some experimental shit.

### Using global config:

    # configure the gem
    AnimalBackup::Config.configure 'backup.example.com', ACCESS_KEY, SECRET_ACCESS_KEY

    # define backup targets and backup using global configuration
    AnimalBackup::Config.backup! do
      backup_dir :home, '/home'
      backup_dir :etc, '/etc'
      backup_dir :log, '/var/log'

      backup_dir :music, '/mnt/music', :_gzip => false

      backup_cmd :mysql, 'mysqldump', '--username :username --password=:password --all-databases', :username => USERNAME, :password => PASSWORD, :_gzip => true
    end

    # create a new configuration and backup using it
    AnimalBackup::Config.new('backup.example.com', ACCESS_KEY, SECRET_ACCESS_KEY).backup! do |c|
      c.backup_dir :home, '/home'
    end

    # create a new configuration and backup using it, ad-hoc
    config = AnimalBackup::Config.new('backup.example.com', ACCESS_KEY, SECRET_ACCESS_KEY)
    config.backup do |c|
      c.backup_dir :home, '/home'
    end

    config.backup_dir :etc, '/etc'

    config.backup! # execute the backup

    # different ways of configuring it


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
