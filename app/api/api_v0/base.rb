module ApiV0
  class Base < Grape::API
    before do
      unless request.headers["X-Api-Secret-Key"] == "secret"
        error! "forbidden", 403
      end
    end
    
    version 'v0', using: :path    
    mount Courses
    mount Ping
    mount Orders   

    use ApiV0::Auth::Middleware
    include ApiV0::ExceptionHandlers
    helpers ::ApiV0::Helpers
    
  
  end
end