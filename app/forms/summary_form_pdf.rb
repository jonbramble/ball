class SummaryFormPdf < Prawn::Document
 
 def initialize(users, veg_count, guest_count, coffee_count)
   super()
   text "Astbury May Ball 2013"

   move_down 20

   #table = Array.new(users.count+1) { Array.new(6) }
   table = Array.new
   table <<  ["Name", "Email","Vegetarian", "Coffee", "Wine","Allergies"]

   users.each do |user| 
    table <<  [user.name, user.email, user.meal.vegetarian.to_s, user.meal.coffee.to_s, user.meal.wine.to_s, user.meal.allergies.to_s]
   end
   table << [guest_count.to_s,"",veg_count.to_s,coffee_count.to_s,"",""]
   t = make_table( table )
   t.draw
 end

end
