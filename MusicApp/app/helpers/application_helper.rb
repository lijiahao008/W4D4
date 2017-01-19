module ApplicationHelper
  include ERB::Util
  def auth_token
  "<input
    type='hidden'
    name='authenticity_token'
    value='#{form_authenticity_token}'>".html_safe
  end

  def ugly_lyrics(lyrics)
   ("<pre>" + lyrics.split("\n").map! do |line|
     "&#9835" + line.html_safe
   end.join("\n") + "</pre>").html_safe
  end
end
