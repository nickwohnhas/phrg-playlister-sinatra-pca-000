# frozen_string_literal: true

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.all.each do |genre|
      if genre.slug == slug
        return genre
      end
    end
  end
end