require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = %w(lib test)
  t.test_files = Dir['test/**/*_test.rb']
  t.verbose = true
end

task default: :test
