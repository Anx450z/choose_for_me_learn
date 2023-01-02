module TopicsHelper

  def topic_type(type)
    "Topic::#{type.singularize.titleize}"
  end
  
end
