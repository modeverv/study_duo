#/usr/bin/env ruby
require 'pp'
require 'json'

require 'bundler'
Bundler.require
#require 'audioinfo'

# duoファイル
duo = {}
h = open "duo.txt" , "r"
h.each_line {|line|
  _a = line.split("\t")
  _a[1] =~ /^([0-9]+)\.(.*)/
  _num  = $1
  _japanese = $2
  _english = _a[0]
  duo[_num.to_i] = {:en => _english,:jp => _japanese }
}
h.close

pp duo

json = JSON[duo]
pp json

open "./html/js/duo.js", "w" do |io|
  io.write "var duo = "
  io.write JSON[duo]
  io.write ';'
end

exit
require 'mp3info'
# files
files = Dir.glob('/private/var/Movie/Music/**/*.m4a')
#files = Dir.glob('audio/*.mp3')
pp files
files.each do |file|
  AudioInfo.open(file) do |info|
    #pp info.to_h
    # info[""] = ""
  end
  
  Mp3Info.open(file) do |info|
    #pp info.tag.title
    #pp info.tags
    # info[""] = ""
  end

  info = ID3Lib::Tag.new(file)
  #pp info.lyrics
  #pp info.album
  #tag.update!

  info = MP4Info.open(file)
  #pp info.send :ALB
  pp info.send :GNRE
end



__END__
gem “mp4info”, :git => “git://github.com/arbarlow/ruby-mp4info.git”, :require => “mp4info”
gem 'ruby-audioinfo'

AudioInfo.open("audio_file.one_of_supported_extensions") do |info|
  info.artist   # or info["artist"]
  info.title    # or info["title"]
  info.length   # playing time of the file
  info.bitrate  # average bitrate
  info.to_h     # { "artist" => "artist", "title" => "title", etc... }
end

fileよんで歌詞を一つ書き込んでみて
infoを出してみて確認して
書き込んでみる

  info = ID3Lib::Tag.new(file)
  pp info.lyrics
  pp info.lyrics = 
