class Donacion < ApplicationRecord
  belongs_to :users

  def fundacion?
    role == 'fundacion'
  end
end
