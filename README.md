qmail Cookbook
==============

This cookbook makes installing qmail.

Requirements
------------

#### packages
- `cent os`
- `ruby > 2.0.0`
- `bundler`
- `virtualbox`
- `vagrant`

Attributes
----------

#### qmail::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['qmail']['domain']</tt></td>
    <td>String</td>
    <td>recieve host name and domain name. <br>use by qmail-send</td>
    <td><tt>mail.example.com</tt></td>
  </tr>
  <tr>
    <td><tt>['qmail']['user']</tt></td>
    <td>String</td>
    <td>qmail use user</td>
    <td><tt></tt></td>
  </tr>
</table>

Usage
-----
#### qmail::default, qmail::tcpserver

if you want only use qmail Just include `qmail::default` and `qmail::tcpserver` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[qmail::default]",
    "recipe[qmail::tcpserver]"
  ]
}
```

#### qmail::maildir

if you want use maildir for any users, Just include `qmail::maildir` and `set node['qmail']['user']` in your node's `run_list`:

```json
{
  "qmail": { "user": ['hoge', 'foo'] } ,
  "run_list": [
    "recipe[qmail::maildir]"
  ]
}
```


#### sample email

Set up local node

```bash
# up to local server
$ vagrant up

# start qmail as background process
$ sudo qmail start

# send email
$ sudo echo to: vagrant@mail.example.com | /var/qmail/bin/qmail-inject

# check sended mail
$ sudo cat /var/qmail/alias/Mailbox

# alias ( use for mailing list )
$ vi $HOME/.qmail
&hoge@gmail.com
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

License MIT


