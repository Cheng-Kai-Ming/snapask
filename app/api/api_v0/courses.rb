module ApiV0
  class Courses < Grape::API
    desc "Get all Courses"
    get "/courses" do
      courses = Course.all
      result = present courses, with: ApiV0::Entities::Course
      result = result.as_json
    end
  end
end