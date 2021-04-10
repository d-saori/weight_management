module DeviseHelper
  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    resource.errors.full_messages.each { |error_message|
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
        <button typr="button" class="close" data-dismiss="alert">
          <span class="sr-only">close</span>
        </button>
        #{error_message}
      </div>
      EOF
    }
    html.html_safe
  end
end