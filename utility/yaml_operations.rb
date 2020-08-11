require 'yaml'

class YamlOperations
  class << self
    @yaml_hash



    def load_yaml_file(file_path)
    @yaml_hash = YAML.load_file(file_path)
    end

    def get_parent(parent_text)
      @yaml_hash[parent_text]
    end

    def get_child(parent_text,child_text)
      @yaml_hash[parent_text][child_text]
    end

  end
end