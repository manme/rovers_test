require 'minitest/autorun'
require 'stringio'

Dir['./app/**/*.rb', './test/fixtures/**/*.rb'].each do |app|
  require app
end
