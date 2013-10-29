qmail Cookbook
==============

This cookbook makes installing qmail.

Requirements
------------

#### packages
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
</table>

Usage
-----
#### qmail::default

Set up local node

```bash
$ vagrant up
```

if you want only use qmail Just include `qmail` in your node's `run_list`:

```json
{
  "qmail": { "domain": "mail.example.com" } ,
  "run_list": [
    "recipe[qmail]"
  ]
}
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
Authors: TODO: List authors
