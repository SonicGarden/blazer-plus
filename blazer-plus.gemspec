# frozen_string_literal: true

require_relative 'lib/blazer/plus/version'

Gem::Specification.new do |spec|
  spec.name = 'blazer-plus'
  spec.version = Blazer::Plus::VERSION
  spec.authors = ['aki77']
  spec.email = ['aki77@users.noreply.github.com']

  spec.summary = 'Feature extension for safely using Blazer'
  spec.description = 'Blazer Plus is a feature extension for the Blazer gem. It provides additional safety measures and enhancements to improve the user experience and security when using Blazer for database queries.'
  spec.homepage = 'https://github.com/SonicGarden/blazer-plus'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SonicGarden/blazer-plus/'
  spec.metadata['changelog_uri'] = 'https://github.com/SonicGarden/blazer-plus/releases'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'blazer'
  spec.add_dependency 'rails'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
