class LineItemDate < ApplicationRecord
  has_many :line_items, dependent: :destroy

  belongs_to :quote

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  broadcasts_to ->(line_item_date) { [ line_item_date.quote, "line_item_dates" ] }, inserts_by: :prepend
  after_create_commit -> { broadcast_prepend_later_to [ self.quote, "line_item_dates" ], locals: { line_item_date: self, quote: self.quote } }
  after_update_commit -> { broadcast_replace_later_to [ self.quote, "line_item_dates" ], locals: { line_item_date: self, quote: self.quote } }

  def previous_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end