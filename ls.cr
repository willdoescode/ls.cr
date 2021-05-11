require "colorize"

paths = Array(Path).new

Dir.new(ARGV.first? || ".").each do |path|
  paths << Path.new(path)
end

dirs = paths.select { |file| File.directory?(file) }
files = paths.select { |file| !File.directory?(file) }

dirs.sort! { |a, b| a <=> b }
files.sort! { |a, b| a <=> b }

dirs.concat files

dirs.each { |file| puts File.directory?(file) ? (file.to_s + "/").colorize(:blue) : file.to_s }
