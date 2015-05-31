class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

# attr_accessor :login

  	def active_for_authentication?
	  super && admin_approval
	end

	has_many :kimms, :dependent => :destroy


# 	def self.find_for_database_authentication(warden_conditions)
# binding.pry
#       conditions = warden_conditions.dup
#       if login = conditions.delete(:email)
      	
#         where(conditions).where(["lower(email) = :value", { :value => login.downcase }]).first
#       else

#         #where(conditions.to_h).first
#       end
#     end
	
end
