require "colorize"

paths = Dir.new(ARGV.fetch(0, ".")).map { |f| Path.new(f) }

paths.sort! { |a, b| (File.directory?(a) == File.directory?(b)) ? 1 : 0 }
paths.each { |file| puts File.directory?(file) ? (file.to_s + "/").colorize(:blue) : file.to_s }
