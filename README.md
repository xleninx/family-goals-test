## Rankmi Test

## Installation

1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`

## Methods for generate Combinations
If you want read .xslx use:
- `CombinationGenerator.new(:xlsx).save_family_goals`

If you want generate data from dummy array:
- `CombinationGenerator.new.save_family_goals`

## Usage

Run tests for check features `rspec spec`.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

This project rocks and uses MIT-LICENSE.