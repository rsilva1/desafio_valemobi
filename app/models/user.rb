class User < ActiveRecord::Base
	attr_accessor :login

	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:login]

	validates :username, presence: true, uniqueness: { case_sensitive: true }
	# Only allow letter, number, underscore and punctuation
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

	has_one :depot

	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions.to_hash).where(["username = :value OR email = :value", { :value => login.downcase }]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			where(conditions.to_hash).first
		end
	end
end
