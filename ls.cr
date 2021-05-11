require "colorize"

paths = Array(Path).new
Dir.new(ARGV.first? || ".").each { |file| paths << Path.new(file) }

paths.sort! { |a, b| (File.directory?(a) == File.directory?(b)) ? 1 : 0 }
paths.each { |file| puts File.directory?(file) ? (file.to_s + "/").colorize(:blue) : file.to_s }
