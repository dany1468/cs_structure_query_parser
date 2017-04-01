require 'rake/testtask'

desc 'Run test_unit based test'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = Dir["test/**/test_*.rb"]
  t.verbose = true
  t.warning = true
end

task default: :test

task :build do
  `tt src/cs_structured_query.treetop -f -o lib/cs_structured_query.rb`
end
