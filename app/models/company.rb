class Company < ApplicationRecord
  has_rich_text :description

  validates :email,
        format: { with: /.+@getmainstreet\.com\z/,
                  message: "We currently accept only getmainstreet.com email domains" },
        if: -> { email_changed? && email? }
end
