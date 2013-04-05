module Admin::UsersHelper
 def true_false_icon(status)
  if status
  return "<i class ='gen-enclosed foundicon-checkmark green'></i>".html_safe
  else
  return "<i class ='gen-enclosed foundicon-remove red'></i>".html_safe 
 end
 end
end
