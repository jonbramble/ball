module MealsEmailHelper

 def vegetarian(vege)
   html = ""
   if vege
   html += "Vegetarian Menu"
   else
   html += "Standard Menu"
   end
   return html.html_safe
  
 end

 def coffee(cof)
   html = ""
   if cof
   html += "Yes Please"
   else
   html += "No Thanks"
   end
   return html.html_safe
 end

 def allergies(allergies)
   html = ""
   if allergies.empty?
   html += "None"
   else
   html += allergies
   end
   return html.html_safe
 end

 def friends(friends)
   html = ""
   if friends.empty?
   html += "None selected"
   else
   html += friends
   end
   return html.html_safe
 end




end
