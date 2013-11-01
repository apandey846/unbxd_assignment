require 'csv'
namespace :unbxd_assignment_tasks do
    desc "Import gac from csv file"
    task :import_csv_into_db => :environment do

      file = "movies-catalog.csv"
      puts "======Started importing the data from CSV file======"
      t1 = Time.now
      CSV.foreach(file, :headers => true, :encoding => 'windows-1251:utf-8') do |row|
        Product.create({
        :group_id => row[0],
        :product_id => row[1],
        :movieTile => row[2],
        :store => row[3],
        :category => row[4],
        :sub_category => row[5],
        :price => row[6],
        :shipping_duration => row[7]
        })
      end
      t2 = Time.now
      puts "=======Importing of data is done in #{t2-t1} seconds======="
    end
end