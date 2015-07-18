class Organization < ActiveRecord::Base

  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :advertisements
  has_many :companies, through: :donations
  has_one :advertisement

  validates :short_description, length: { maximum: 30 }  
  validates :description, length: { maximum: 500 }
  validates :name, presence: true
  


end
