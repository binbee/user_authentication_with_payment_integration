Gem::Specification.new do |s|
s.name = "krgem"
s.version = '0.0.1'
s.date = Time.now.strftime("%Y-%d-%m")
s.authors = ["bineesh"]
s.email = ["bineesh@gmail.com"]
s.summary = "My very first"
s.description = "Simple Hello World"
#s.homepage = "http://github.com/maxivak/myfirst"
#s.files = ["lib/mygem3.rb"]
# or
s.files = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
end
