module ApplicationHelper
  def errors
    return "" if flash[:errors].nil? || flash[:errors].empty?
    errors_html = '<ul class="errors">'
    flash[:errors].each do |error|
      errors_html += "<li>#{h(error)}</li>"
    end
    (errors_html + '</ul>').html_safe
  end

  def auth_token
    auth_token_html = <<-HTML
      <input
        type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}"
      >
    HTML
    auth_token_html.html_safe
  end

  def delete_button(action:, name: "Delete", red: true)
    delete_button_html = <<-HTML
      <form class="inline" action="#{action}" method="post">
        #{auth_token}
        <input type="hidden" name="_method" value="delete">
        <input #{red ? 'class="red"' : ''} type="submit" value="#{name}">
      </form>
    HTML
    delete_button_html.html_safe
  end
end
