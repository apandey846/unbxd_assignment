if [ ! -f config/database.yml ];
then
   echo "'config/database.yml' file doesn't exists.";
   echo "Please setup this file for development database"
   exit 1;
fi

echo "Begin. Time is $(date)"
separator='-------------------------------------------------------------------------------------------'

echo "Executing $ RAILS_ENV=development bundle exec rake db:create (to create database) :"
RAILS_ENV=development bundle exec rake db:create
echo $separator

echo "Executing $ RAILS_ENV=development bundle exec rake db:schema:load (to load schema) :"
RAILS_ENV=development bundle exec rake db:schema:load
echo $separator

echo "Executing $ RAILS_ENV=development bundle exec rake unbxd_assignment_tasks:import_csv_into_db"
RAILS_ENV=development bundle exec rake unbxd_assignment_tasks:import_csv_into_db
echo $separator