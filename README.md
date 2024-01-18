### How to Run Rails Backend

1. Make sure ruby and rails are all installed.
use

`ruby -v`
`rails -v`

to check.

2. Then clone this repository to local computer. In the directory, use

`bundle install`

to install all dependencies.

3. Create database and migrate schema using

`rails db:create`
`rails db:migrate`

4. Run this application on **http://localhost:3001** using

`rails s -p 3001`

5. If the page shows 
> {status: "hello world!"}
then the backend is successfully launched.