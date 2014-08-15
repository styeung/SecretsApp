module ApplicationHelper
  def auth
    <<-HTML.html_safe
      <input type="hidden"
              name="authenticity_token"
              value="#{form_authenticity_token}">
    HTML
  end

  def which_toggle(out_id, in_id)
    return if out_id == in_id
    if Friendship.can_friend?(out_id, in_id)
      return "can-friend"
    else
      return "can-unfriend"
    end
  end
end
