class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @prayer  = current_user.prayers.build
      @prayer_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
