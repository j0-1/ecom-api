module Helpers
  def mock_file(filename)
    full_path = Rails.root.join("spec/mock_files/#{filename}")
    if File.exist?(full_path)
      full_path
    end
  end
end
