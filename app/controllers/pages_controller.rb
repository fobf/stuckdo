class PagesController < ApplicationController
  def home
    if current_user
      redirect_to tasks_url
    end
  end
  
  

  
  def about
  end
  
  def test
  end
  
end
