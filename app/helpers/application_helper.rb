module ApplicationHelper
  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Show form error messages
  def error_messages(object)
    html = ""
    if object && !object.errors.blank?
      html << "<ul class='form-error'>"
      object.errors.full_messages.each do |error|
        html << "\t<li>#{error}</li>\n"
      end
      html << "</ul>"
    end
    html
  end

end
