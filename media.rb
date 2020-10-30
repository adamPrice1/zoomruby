module AcceptsComments
  def comments
    if @comments
      @comments
    else
      @comments = []
    end
  end

  def add_comment(comment)
    comments << comment
  end
end

class Clip

  attr_reader :comments

  def initialize
    @comments = []
  end

  def play
    puts "Playing #{object_id}..."
  end
end

class Video < Clip
  include AcceptsComments
  attr_accessor :resolution
end

class Song < Clip
  include AcceptsComments
  attr_accessor :beats_per_minute
end

video = Video.new
video.add_comment("cool slomo effect")
video.add_comment("Weird Ending")
song = Song.new
song.add_comment("Awesome beat.")

p video.comments, song.comments

class Photo
  include AcceptsComments
  def show
    puts "displaying #{object_id}..."
  end
end

photo = Photo.new
photo.add_comment("Beautiful colors")

p photo.comments
photo.show
