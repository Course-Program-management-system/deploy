client_branch=$1;
server_branch=$2;
app_name=$3 || copo2;
rm -rf _server;
git clone https://github.com/Course-Program-management-system/server.git _server -b $server_branch;
cd _server;
git clone https://github.com/Course-Program-management-system/client.git client -b $client_branch;
cd client;
rm -rf .git
cd ../;
heroku login;
heroku git:remote -a $app_name;
node deploy.js $3;
cd _server;
git add .
git commit -m "deploy"
git push -f heroku $server_branch:master;
