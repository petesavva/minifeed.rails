class HomeController < ApplicationController
  def home
    skip_policy_scope
    redirect_to entries_path
  end
end
