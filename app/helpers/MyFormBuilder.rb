class MyFormBuilder < ActionView::Helpers::FormBuilder
    # Strip the containing div for labels associated with invalid fields:
    def label(method, text = nil, options = {}, &block)
      super(method, text, options, &block).gsub(%r{<div.*?>|<\/div>}, '').html_safe
    end
  end