const express = require("express");
const app = express();
const port = 3000;
app.set("view engine", "ejs");
app.set("views", "./views");
app.use(express.static("public"));

var mysql = require("mysql");
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "asmnodejs",
});

// route
app.get("/", (req, res) => {
  let sql = "select id, tenLoai, thuTu, anHien from loai";
  let sqlSp =
    "select id , tenSp, moTa, urlHinh, capNhat, idLoai, anHien, solanxem, hot, gia from sp"; //
  db.query(sql, (err, listLoai) => {
    if (err) throw err;
    db.query(sqlSp, (err, listSp) => {
      if (err) throw err;
      res.render("index", { loaiSp: listLoai, listSp: listSp });
    });
  });
});

app.get("/chitietsp/:spId", (req, res) => {
  let id = req.params.spId;
  let sql = `select * from sp`;
  let sqlSp = `select * from sach where id = ${id}`;
  db.query(sql, (err, listLoai) => {
    db.query(sqlSp, (err, listSp) => {
      if (err) throw err;
      res.render("chitietsp", { loaiSp: listLoai, listSp: listSp });
    });
  });
});

// Quản lý sp
app.get("admin", (req, res) => {
  res.render("admin/home");
});
app.get("admin/spThem", (req, res) => {
  res.render("admin/sp_them");
});
app.post("admin/spThem", (req, res) => {
  const file = req.file;
  let t = req.body.tenSp;
  let m = req.body.moTa;
  let u = file.urlHinh;
  let c = req.body.capNhat;
  let l = req.body.idLoai;
  let a = req.body.anHien;
  let s = req.body.solanxem;
  let h = req.body.hot;
  let g = req.body.gia;
  sach = {
    tenSp: t,
    moTa: m,
    urlHinh: u,
    capNhat: c,
    idLoai: l,
    anHien: a,
    solanxem: s,
    hot: h,
    gia: g,
  };
  db.query("insert into sp SET ?", sp, function (err, data) {
    if (err) throw err;
    res.redirect("/admin");
  });
});

app.listen(port, () => {
  console.log(`Ứng dụng đang chạy ở Port: ${port}`);
});
