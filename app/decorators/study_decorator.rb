module StudyDecorator
  def formatted_time
    "%d:%02d" % [hour, minute]
  end
end
