class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable,
    :invitable, :invite_for => 2.weeks, :validate_on_invite => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :type

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Check user type
  def role?(type)
    self.type == type.capitalize
  end

end
