module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(/#[\p{L}\d]+/) { |word| link_to word, tag_path(word.delete('#').downcase) }.html_safe
  end
end
