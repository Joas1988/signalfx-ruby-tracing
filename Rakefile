require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :spec

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*test.rb']
  t.verbose = false 
end
