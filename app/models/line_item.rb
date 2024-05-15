class LineItem < ApplicationRecord
    belongs_to :line_item_date

    validates :name, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_then: 0 }
    validates :unit_price, presence: true, numericality: { greater_than: 0 }

    delegate :quote, to: :line_item_date

    # everything but create
    broadcasts_to ->(line_item) { [ line_item.line_item_date, "line_items" ] }, inserts_by: :prepend
    # TODO: fix "undefined local variable or method 'quote'"
    # create doesn't work yet
    after_create_commit ->(line_item) { broadcast_prepend_later_to [ line_item.line_item_date, "line_items" ], locals: { line_item: line_item, quote: line_item.quote, line_item_date: line_item.line_item_date } }
    after_update_commit ->(line_item) { broadcast_replace_later_to [ line_item.line_item_date, "line_items" ], locals: { line_item: line_item, quote: line_item.quote, line_item_date: line_item.line_item_date } }
    
    def total_price
      quantity * unit_price
    end
end
