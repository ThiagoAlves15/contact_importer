class CsvImportContactsService
  require 'csv'

  def call(file, custom_headers)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    headers = csv.headers
    csv.each do |row|
      HardJob.perform_async('bob', 5)
      puts row['name']
    end
  end
end
