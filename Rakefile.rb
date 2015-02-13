require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['HelloWorld.rb']
  t.verbose = true
end
