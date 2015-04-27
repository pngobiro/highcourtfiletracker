# -*- encoding: utf-8 -*-
# stub: nested_scaffold 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nested_scaffold"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Akira Matsuda"]
  s.date = "2010-12-12"
  s.description = "Nested scaffold generator for Rails 3.2"
  s.email = "ronnie@dio.jp"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/amatsuda/nested_scaffold"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.3.0"
  s.summary = "Nested scaffold generator for Rails 3.2"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.2.2"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2.2"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2.2"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
