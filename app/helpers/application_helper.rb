module ApplicationHelper
  def signin_path(provider)
    redir_path = {origin: request.env['PATH_INFO']}.to_query
    "/auth/#{provider.to_s}?#{redir_path}"
  end

end
