# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "0xffffff"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["youpy"]
  s.date = "2012-04-10"
  s.description = "A Tool to Upload 0xffffff Images to Flickr"
  s.email = "youpy@buycheapviagraonlinenow.com"
  s.executables = ["0xffffff"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/0xffffff",
    "lib/0xffffff.rb",
    "spec/counter_spec.rb",
    "spec/runner_spec.rb",
    "spec/spec_helper.rb",
    "spec/uploader_spec.rb",
    "spec/util_spec.rb"
  ]
  s.homepage = "http://github.com/youpy/0xffffff"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A Tool to Upload Images"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chunky_png>, [">= 0"])
      s.add_runtime_dependency(%q<flickraw-cached>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
    else
      s.add_dependency(%q<chunky_png>, [">= 0"])
      s.add_dependency(%q<flickraw-cached>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    end
  else
    s.add_dependency(%q<chunky_png>, [">= 0"])
    s.add_dependency(%q<flickraw-cached>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
  end
end
