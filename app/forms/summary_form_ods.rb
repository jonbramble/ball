class SummaryFormOds

   attr_accessor :spreadsheet
   @spreadsheet

  def initialize()
   @spreadsheet= ODF::Spreadsheet.new
  end

   def create_sheet(users, veg_count, guest_count, coffee_count)
       table = @spreadsheet.table 'Summary'
       labels = %w(Name Email Vegetarian Coffee Wine Allergies)

       headers = table.row 
       labels.each do |label| 
         headers.cell label
       end

       guestdata = table.row
       users.each do |user|
         guestdata.cell user.name
	 guestdata.cell user.email
         guestdata.cell user.meal.vegetarian
         guestdata.cell user.meal.coffee
         guestdata.cell user.meal.wine
	 guestdata.cell user.meal.allergies
       end

	totals = table.row
	totals.cell guest_count, :type => :float
        totals.cell {}
        totals.cell veg_count, :type => :float
        totals.cell coffee_count, :type => :float
	totals.cell {}
	totals.cell {}
 	
   end

   def write_file(filename)
	@spreadsheet.write_to filename
   end

end
