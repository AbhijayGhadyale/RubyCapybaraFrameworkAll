require 'rubyXL'

class ExcelOperations
  class << self

    @data_workbook
    @sheet

    def create_excel_file
      begin
        @data_workbook = RubyXL::Workbook.new
        $LOG.info "Excel is created in buffer"
      rescue Exception => e
        $LOG.error "Excel is not created in buffer: #{e}"
        raise
      end
    end

    def add_sheet(sheet_name)
      begin
        @data_workbook.add_worksheet(sheet_name)
        $LOG.info "#{sheet_name} is added in excel in buffer"
      rescue Exception => e
        $LOG.error "#{sheet_name} is not added in excel in buffer: #{e}"
        raise
      end
    end

    def get_sheet(sheet_name)
      begin
        @sheet = @data_workbook[sheet_name]
        $LOG.info "#{sheet_name} is selected in excel"
      rescue Exception => e
        $LOG.error "#{sheet_name} is not selected in excel: #{e}"
        raise
      end
    end

    def set_cell(row_num, col_num, data_text)
      begin
        @sheet.insert_cell(row_num, col_num, data_text)
        $LOG.info "#{data_text} is entered in selected sheet of excel"
      rescue Exception => e
        $LOG.error "#{data_text} is not entered in selected sheet of excel: #{e}"
        raise
      end
    end

    def save_excel(file_with_path)
      begin
        @data_workbook.write(file_with_path)
        $LOG.info "Excel in buffer saved as #{file_with_path}"
      rescue Exception => e
        $LOG.error "Excel in buffer not saved as #{file_with_path}: #{e}"
        raise
      end
    end


    def parse_excel(file_path)
      begin
        @data_workbook = RubyXL::Parser.parse(file_path)
        $LOG.info "#{file_path}  excel is opened "
      rescue Exception => e
        $LOG.error "#{file_path}  excel is not opened: #{e}"
        raise
      end
    end

    def get_cell(row_num, col_num)
      begin
        return @sheet.sheet_data[row_num][col_num].value
        #@sheet[row_num][col_num].value
        #@sheet.sheet_data[row_num][col_num].value
      rescue Exception => e
        $LOG.error "#{@sheet[row_num][col_num].value}  is not retrieved from cell #{row_num} ,#{col_num}: #{e}"
        raise
      end
    end

  end
end


# to read from excel file flow of methods
# 1) parse_excel(parameter is file name with path)
# 2) get_cell(parameters are cell row number and column number)

#to create excel file flow of methods
# 1) create_excel_file
# 2) add_sheet( parameter is sheet_name)  Note - when excel is created sheet1 is already present this will create another sheet with given name in excel
# 3) set_cell(parameters are cell row number,column number and data to enter in cell)
# 4) save_excel(parameter is file name with path ) This will save excel with given name in given path with sheet name and data

#to write to excel file flow of methods
# 1) parse_excel(parameter is file name with path)
# 2) set_cell(parameters are cell row number,column number and data to enter in cell)
