# README

# Job app

Job application app : candidate can apply to jobs and employers can post jobs, and see applicants names.


### Installation

Job app requires Ruby `2.6.3`,  Rails `5.2.3` and postgres

##### gems

```sh
$ cd fountail
$ bundle install
```

#####  Database

Create database and run migration

```sh
$ rake db:create
$ rake db:migrate
```
username: `hanna`
password: `hanna`

#####  Rails server

```sh
$ rails s
```


### Deployment

In order to deploy the application I used:
- Google cloud (Compute Engine)
- Nginx
- Google domain (domain name hannamiaou.com (subdomain fountain.hannamiaou.com) -> propagation ongoing)
- Puma

In order to make everything working together, I spinned a compute instance allowing HTTP and HTTPS traffic.
I installed all requirements (ruby/rails/postgres/gems..) on it then I installed nginx
I configured nginx to listen on port `:80` and forward to the `url:port` that puma serves
You can check the result on [http://35.194.13.59/](http://35.194.13.59/) (hopefully on [fountain.hannamiaou.com](fountain.hannamiaou.com) when the DNS propagation will be done.)


### Improvements

 - Write Tests
 - Use SSL in order to listen on port `:443` and use `https`
 - Improve styles 
