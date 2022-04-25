USER="admin"
PASSWORD="A6@Gvbwi\$hMNsv"
DATABASE="ivy_local"
    

echo "Configuring PostgreSQL User..."
sudo su - postgres -c "createuser $USER"
sudo -u postgres psql -c  "alter user $USER with encrypted password '$PASSWORD';"
echo "PSQL User: $USER configured."

echo "Configuring PostgreSQL Database..."
sudo su - postgres -c "createdb $DATABASE"
echo "Database $DATABASE created."
echo "Granting permissions to $USER... "
sudo -u postgres psql -c  "grant all privileges on database $DATABASE to $USER;" || exit
sudo -u postgres psql -c  "alter user $USER with superuser;" || exit
echo "Permissions granted. Database $DATABASE for $USER configured successfully."

echo "Local Dev database successfully created."