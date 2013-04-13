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
end
