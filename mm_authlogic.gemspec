Gem::Specification.new do |s|
  s.name = 'mm_authlogic'
  s.version = '0.0.1'
  s.author = 'Eric Anderson'
  s.email = 'eric@pixelwareinc.com'
  s.add_dependency 'mongo_mapper'
  s.add_dependency 'authlogic'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'bson_ext'
  s.files = Dir['lib/**/*.rb']
  s.extra_rdoc_files << 'README.rdoc'
  s.rdoc_options << '--main' << 'README.rdoc'
  s.summary = 'Use AuthLogic on MongoMapper models'
  s.description = <<-DESCRIPTION
    Use AuthLogic on MongoMapper models just like you do on ActiveRecord models
  DESCRIPTION
end
