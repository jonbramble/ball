### Utility methods ###
module UserCreation
def create_visitor
 @visitor ||={ :name => "Tester", :email=> "atester@example.com", :password => "auserpass", :password_confirmation => "auserpass" }
end

def build_guest(name,email)
 @guest ||={ :name => name, :email=> email }
end

def create_user
 create_visitor
 #delete_user
 @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def create_admin
 create_visitor
 #delete_user
 @user = FactoryGirl.create(:user, email: @visitor[:email], admin: true, admin_only: true)
end

def sign_in
 fill_in "user_email", :with => @visitor[:email]
 fill_in "user_password", :with => @visitor[:password]
 click_button "Sign in"
end

def register_guest
 fill_in "user_email", :with => @guest[:email]
 fill_in "user_name", :with => @guest[:name]
 click_button "Add User"
end

end

World(UserCreation)

