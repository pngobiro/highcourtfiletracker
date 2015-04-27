# -*- encoding: utf-8 -*-
# stub: audited-activerecord 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "audited-activerecord"
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brandon Keepers", "Kenneth Kalmer", "Daniel Morrison", "Brian Ryckbost", "Steve Richert", "Ryan Glover"]
  s.date = "2012-09-25"
  s.description = "Log all changes to your ActiveRecord models"
  s.email = "info@collectiveidea.com"
  s.homepage = "https://github.com/collectiveidea/audited"
  s.rubygems_version = "2.3.0"
  s.summary = "Log all changes to your ActiveRecord models"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<audited>, ["= 3.0.0"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0"])
    else
      s.add_dependency(%q<audited>, ["= 3.0.0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<audited>, ["= 3.0.0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0"])
  end
end
