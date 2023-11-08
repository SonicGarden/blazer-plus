# Blazer Plus

Blazer Plus is a feature extension for the [blazer](https://github.com/ankane/blazer) gem.
It provides additional safety measures and enhancements to improve user experience and security when using Blazer for database queries.

- Support for CSV output with BOM
- Row limit for query result output
- Access restriction for dangerous actions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blazer-plus'
```

And then execute:

```
$ bundle install
```

## Usage

You can configure Blazer Plus in your application's initialization file.
Here's an example:

```ruby:config/initializers/blazer.rb
# Blazer::Plus.enabled = true
Blazer::Plus.blazer_danger_actionable_method = ->(blazer_user) { blazer_user.blazer_admin? }
```

In this example, `Blazer::Plus.enabled` is a flag to enable or disable the Blazer Plus features.
`Blazer::Plus.blazer_danger_actionable_method` is a lambda function that you can customize to handle dangerous queries action by Blazer Plus.

## License
This gem is available under the MIT license.
