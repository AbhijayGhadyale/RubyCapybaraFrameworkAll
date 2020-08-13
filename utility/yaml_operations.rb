require 'yaml'

class YamlOperations
  class << self
    @yaml_hash

    def load_yaml_file(file_path)
      begin
        @yaml_hash = YAML.load_file(file_path)
        $LOG.info "#{file_path} is loaded successfully"
      rescue Exception => e
        $LOG.error "#{file_path} is not getting loaded: #{e}"
        raise
      end
    end

    def get_parent(parent_text)
      begin
        @yaml_hash[parent_text]
        $LOG.info "#{parent_text} is accessed"
      rescue Exception => e
        $LOG.error "Not able to access #{parent_text}: #{e}"
        raise
      end
    end

    def get_child(parent_text, child_text)
      begin
        @yaml_hash[parent_text][child_text]
        $LOG.info "#{child_text} of #{parent_text} is accessed"
      rescue Exception => e
        $LOG.error "#{child_text} of #{parent_text} is not accessed: #{e}"
        raise
      end
    end

  end
end