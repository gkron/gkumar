class POMCommonSteps
  include PageObject
  include RSpec::Matchers
  include PageObject::PageFactory
  def read_data_from_excel(filename)
    book = Spreadsheet.open filename
    sheet = book.worksheet 0
    @data_row = Hash.new
    i=1
    sheet.each do |row|
      @data_row[i] =sheet.row(i).to_a
      i=i+1
    end
  end
end