class SummaryFormOds

  attr_accessor :spreadsheet, :users, :veg_count, :guest_count, :coffee_count

  def initialize(users, veg_count, guest_count, coffee_count)
   @spreadsheet = ODF::Spreadsheet.new
   @users = users
   @veg_count = veg_count
   @guest_count = guest_count
   @coffee_count = coffee_count
  end

   def create_sheet
       table = spreadsheet.table 'Summary'
       labels = %w(Name Email Vegetarian Coffee Wine Allergies Friends)

       headers = table.row 
       labels.each do |label| 
         headers.cell label
       end

	#need to make a new row
       guestdata = table.row
       users.each do |user|
         guestdata.cell user.name
	 guestdata.cell user.email
         guestdata.cell user.meal.vegetarian
         guestdata.cell user.meal.coffee
         guestdata.cell user.meal.wine
	 guestdata.cell user.meal.allergies
         guestdata.cell user.meal.friends
       end

	totals = table.row
	totals.cell guest_count, :type => :float
        totals.cell {}
        totals.cell veg_count, :type => :float
        totals.cell coffee_count, :type => :float
	totals.cell {}
	totals.cell {}
	totals.cell {}
 	
   end

   def write_file(filename)
	spreadsheet.write_to filename
   end

end
