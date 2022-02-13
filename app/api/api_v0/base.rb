module ApiV0
  class Base < Grape::API
    version 'v0', using: :path
    use ApiV0::Auth::Middleware
    mount Courses
    include ApiV0::ExceptionHandlers
    helpers ::ApiV0::Helpers
  end
end