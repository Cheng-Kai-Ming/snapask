module ApiV0
  class Base < Grape::API
    before do
      unless request.headers["X-Api-Secret-Key"] == "secret"
        error! "forbidden", 403
      end
    end
  
    use ApiV0::Auth::Middleware
    include ApiV0::ExceptionHandlers
    helpers ::ApiV0::Helpers
    version 'v0', using: :path    
    mount Courses
    mount Ping
    mount Orders   
  
  end
end