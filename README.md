# UK Validators

This library contains validators for the following UK-centric data:

 * National Insurance Number


## Installation

Add this line to your application's Gemfile:

    gem 'uk_validators'

And then execute:

    $ bundle

## Usage

### National Insurance Number (Nino)

Simply add the following to your model

    validates :my_nino_attribute, nino: true


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
