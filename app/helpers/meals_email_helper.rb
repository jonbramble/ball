module MealsEmailHelper

 def vegetarian(vege)
   html = ""
   if vege
   html += "Menu: Vegetarian Menu"
   else
   html += "Menu: Standard Menu"
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

end
