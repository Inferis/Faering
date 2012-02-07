require 'rake'
require "fileutils"

task :default => [:test]

desc "Runs unit tests"
task :test do
  ENV['GHUNIT_CLI']="1"
  puts `xcodebuild -target Tests -configuration Debug -sdk iphonesimulator build`
end

desc "Cleans the build folder"
task :clean do
  `rm -rf TouchPoint/build/*`
end

desc "Generate Localizations"
task :localize do
  %w(en nl).each do |locale|
    puts "Generating #{locale}.lproj"
    puts "./gstrings #{locale}"
    puts `./gstrings #{locale}`
  end
end

desc "Mogenerate subclasses"
task :mogenerate do
  output = `mogenerator -m Faering/Models/Faering.xcdatamodeld/Faering.xcdatamodel -O Faering/Models`
  puts "I mogenerated: #{output}"
end

desc "Reset Xcode's autocompletion"
task :reset_xcode do
  home_folder = File.expand_path("~")
  Dir.glob("#{home_folder}/Library/Developer/Xcode/DerivedData/SplitTheTab*").each do |folder_path|
    puts "Deleting #{folder_path}"
    FileUtils.remove_dir(folder_path, true)
  end
end

desc "Build emacs TAGS file"
task :generate_tags do
  `etags -R */**/**`
end