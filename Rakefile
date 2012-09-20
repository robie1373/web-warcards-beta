#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :spec

Rake::TestTask.new do |t|
  t.libs.push '.'
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose    = true
end
