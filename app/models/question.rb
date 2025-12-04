class Question < ApplicationRecord
  belongs_to :quiz

  enum type: 
  {
    mcq: 0,
    true_false: 1,
    text: 2
  }
end
