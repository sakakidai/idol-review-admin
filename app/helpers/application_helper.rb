module ApplicationHelper
  def javascript_path
    case action_name
    when 'create'
      filename = 'new'
    when 'update'
      filename = 'edit'
    else
      filename = action_name
    end
    path = "#{controller_path}/#{filename}.js"
  end

  def javascript_file_exist?(path)
    manifest = File.open('public/packs/manifest.json') do |file|
     JSON.load(file)
    end
    manifest.key?(path)
  end
end
