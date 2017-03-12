module YstweetsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name = 'index'
      confirm_ystweets_path
    elsif action_name == 'edit'
      ystweet_path
    end
  end
end
