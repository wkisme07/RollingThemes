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

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Remove HTML tag or just get the text
  def just_text(body)
    body.gsub(/<(.*?)>/, '')
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Formated date
  def posting_date(pdate)
    pdate.strftime("%d %B %Y")
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Formated time
  def comment_time(ctime)
    ctime.strftime('%Y-%m-%d %H:%m:%S')
  end
end
