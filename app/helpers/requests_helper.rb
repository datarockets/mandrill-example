module RequestsHelper
  def is_active_request?(request)
    if @current_request.present? &&  @current_request.id == request.id
      "active"
    else
      ""
    end
  end
end
