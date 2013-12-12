# ISUCON3 ベンチとスコアの可視化

```bash
$ cat <<EOF >.bowerrc
{
    "directory": "vendor"
}
EOF
$ npm install bower -g
$ bower install d3 coffee-script --save
$ python -m http.server  8890 &
$ open index.html
```

```bash
$ tree
.
├── bower.json
├── index.html
├── isucon3.csv
├── main.coffee
└── vendor
```


