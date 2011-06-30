class Schedule < RedisStorage::Model
  def self.attrs
    [ :id, :content, :long_course, :date, :created_at ]
  end
  attr_accessor *attrs
  validates :long_course, :inclusion => {:in => [true,false]}

  def long_course=(v)
    if !!v == v
      @long_course = v
    else
      @long_course = (v == "true")
    end
  end
  def date=(v)
    if v.class == Date
      @date = v
    else
      @date = Date.parse(v) unless v.nil?
    end
  end
  def created_at=(v)
    if v.class == Time
      @created_at = v
    else
      @created_at = Time.parse(v) unless v.nil?
    end
  end
end
