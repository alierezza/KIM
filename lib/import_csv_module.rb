module ImportCsvModule
require 'csv'

  def import_csv_kabupaten
    csv_file_path=Rails.root.join('lib','assets','kabupaten.csv')
    CSV.foreach(csv_file_path, headers: true) do |row|
      p = Kabupaten.create({
        :nama => row[0]
      })
      p.save
    end

  end
end