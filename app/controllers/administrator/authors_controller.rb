class Administrator::AuthorsController < Administrator::ApplicationController
  load_and_authorize_resource
end
