#!/usr/bin/env ruby

#Directory we want to alter the files in
path = "/Users/tburns/foo"

#Extensions of files we want to leave alone
excluded_extensions = [".pdf",".doc",".txt",".rtf"]

#Extension to be added to the files that need it
extension = ".appleworks"

excluded_extensions << extension

Dir.chdir(path)

Dir.glob("**/*") do |f|
  next if f == '.' or f == '..'
  
  if File.file?(f)
    unless excluded_extensions.include? File.extname(f)
      newname = f + extension
      File.rename(f, newname)
      puts "Renamed #{f} to #{newname}"
    end
  end
end
