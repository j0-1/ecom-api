require 'csv'

class ImportCsv
  include ActiveModel::Model

  attr_accessor :filename

  validates :filename, presence: true

  def initialize(filename)
    @filename = filename
  end

  def import
    return false if invalid?

    begin
      import_file
      true
    rescue => e
      errors.add(:base, e.message)
      false
    end
  end

private

  def import_file
    fd = File.read(filename)
    CSV.parse(fd.gsub(/,\s+\"/, ',"'), headers: :first_row, header_converters: :symbol) do |row|
      add_row_to_database(row)
    end
  end

  def add_row_to_database(row)
    raise 'unimplemented add_row_to_database'
  end
end
