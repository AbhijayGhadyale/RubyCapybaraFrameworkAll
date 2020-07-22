require 'rubyXL'
class ExcelOperations
  class << self

    @data_workbook
    @sheet

    def create_excel_file
      @data_workbook = RubyXL::Workbook.new
    end

    def add_sheet(sheet_name)
      @data_workbook.add_worksheet(sheet_name)
    end

    def get_sheet(sheet_name)
      @sheet = @data_workbook[sheet_name]
    end

    def set_cell(row_num,col_num,data_text)
      @sheet.insert_cell(row_num,col_num,data_text)
      puts "write performed"
    end

    def save_excel(file_with_path)
      @data_workbook.write(file_with_path)
      puts "save performed"

    end


    def parse_excel(file_path)
      @data_workbook = RubyXL::Parser.parse(file_path)
    end

    def get_cell(row_num, col_num)
      @sheet[row_num][col_num].value
      #@sheet.sheet_data[1][0].value
    end

  end
end


# to read excel file flow of methods
# 1) parse_excel(parameter is file name with path)
# 2) get_cell(parameters are cell row number and column number)

#to create excel file flow of methods
# 1) create_excel_file
# 2) add_sheet( parameter is sheet_name)  Note - when excel is created sheet1 is already present this will create another sheet with given name in excel
# 3) set_cell(parameters are cell row number,column number and data to enter in cell)
# 4) save_excel(parameter is file name with path ) This will save excel with given name in given path with sheet name and data

#to write excel file flow of methods
# 1) parse_excel(parameter is file name with path)
# 2) set_cell(parameters are cell row number,column number and data to enter in cell)
