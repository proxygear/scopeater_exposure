class Post
  include Mongoid::Document

  def self.find
    puts "real post find called"
    new
  end

  def id
    "an_id"
  end

  def self.first *arg
    new
  end

  def self.where *void
    self
  end

  def self.asc *void
    self
  end

  def self.dsc *void
    self
  end

  def self.skip *void
    self
  end

  def self.limit *void
    self
  end
end

class Tag
  include Mongoid::Document

  def self.find *arg
    puts "real tag find called"
    new
  end

  def id
    "an_id"
  end

  def self.first
  end

  def self.where *void
    self
  end

  def self.asc *void
    self
  end

  def self.dsc *void
    self
  end

  def self.skip *void
    self
  end

  def self.limit *void
    self
  end
end