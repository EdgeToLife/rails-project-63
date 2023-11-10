# HexletCode

[![main workflow](https://github.com/EdgeToLife/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/EdgeToLife/hexlet-ci-app/actions/workflows/default.yml)
[![hexlet-check workflow](https://github.com/EdgeToLife/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/EdgeToLife/hexlet-ci-app/actions/workflows/default.yml)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

You can use the HexletCode module as follows:

### HexletCode::Tag.build

The build method returns the html code of the specified html tag.
The following tags are available:
* br
* img
* input
* label
* div

Usage examples:

```
HexletCode::Tag.build('br')
```
Generates the html code of the br tag
```
<br>
```
Tags can be created with parameters
```
HexletCode::Tag.build('img', src: 'path/to/image')
```
Generates the html code of the img tag
```
<img src='path/to/image'>
```
The value of the tag can be set as follows
```
HexletCode::Tag.build('label') { 'Simple text' }
```
You get html code like this:
```
<label>Simple text</label>
```
### HexletCode.form_for
Method generates html form code. 

The method accepts a Struct class object and block as mandatory arguments and an optional hash with additional form attributes.

The default attribute values for the form are:
1. action='#'
2. method='post'

These values can be overridden by passing them when calling the form_form method.

Example of use

Creating an empty form
```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'foo', job: 'bar', gender: 'm'
HexletCode.form_for user do |f|
end
```
The method will return this html code:
```
<form action='#' method='post'>
```
Creating an empty form with url /some_path and get mthod
```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'foo', job: 'bar', gender: 'm'
HexletCode.form_for user, url: '/some_path', method: 'get' do |f|
end
```
The method will return this html code:
```
<form action='/some_path' method='get'></form>
```

You can add elements using the instance methods of the FormBuilder class.

The available methods are:
1. obj.input - adds an input field with a label. Accepts 2 arguments:
   - name - element name (mandatory)
   - options - optional hash with the list of element's parameters.
   - text input field creation can be overridden by passing **as: :text**, in this case textarea element will be created with parameters **rows: 40** and **cols: 20** by default, which can also be overridden.
2. obj.submit - adds button with Save text, which can be overridden by passing name parameter.

Create a form with several elements
```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'foo', job: 'bar', gender: 'm'
HexletCode.form_for user, url: '#' do |f|
  f.input :name
  f.input :job, as: :text, rows: 50, cols: 50
  f.submit 'Text on button'
end
```
Generates this html code
```
<form action='#' method='post'><label for='name'>Name</label><input name='name' type='text' value='foo'><label for='job'>Job</label><textarea name='job' cols='50' rows='50'>bar</textarea><input type='submit' value='Text on button'></form>
```

### 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).
