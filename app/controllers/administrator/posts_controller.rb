class Administrator::PostsController < Administrator::ApplicationController
  load_and_authorize_resource
end
