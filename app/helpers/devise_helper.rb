module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = ""

    messages.each do |m|
      html << <<-HTML
      <div data-alert class="alert-box alert radius">
        <span>#{m}</span>
        <a href="#" class="close">&times;</a>
      </div>
      HTML
    end

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end