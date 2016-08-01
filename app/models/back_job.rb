class BackJob < ActiveRecord::Base

  validates :uri_str, presence: true

  def exceptions_clases
    self.exceptions.split(',').map { |exc| Kernel.const_get(exc) }
  end

end
