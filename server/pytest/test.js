var http = require('http');
var xmlWriter = require('xml-writer');
var mysql = require('mysql');
var url = require('url');

var pool = mysql.createPool({
	connectionLimit : 3,
	host : 'localhost',
	user : 'root',
	password : 'ruinpikapika123',
	database : 'service'
});

var makeXmlFile = function(xml,cate,loca,name,posx,posy,website,realaddr,phone,pic){
	xml.startElement('info');
	xml.writeElement('category',cate);
	xml.writeElement('loca',loca);
	xml.writeElement('name',name);
	xml.writeElement('posx',posx);
	xml.writeElement('posy',posy);
	xml.writeElement('website',website);
	xml.writeElement('realaddr',realaddr);
	xml.writeElement('phone',phone);
	xml.endElement();
};

var server = http.createServer(function (req, res)  {
	pool.getConnection(function (err,con){
		xw = new xmlWriter;
		xw.startDocument('1.0', 'UTF-8');
		xw.startElement('root');

		var url_parts = url.parse(req.url,true);
		console.log(url_parts.query);

		con.query('select * from LENDSERVICE where CATEGORY = "'+url_parts.query['category']+'" limit 40',function(err,rows){
			if(err) console.error("error : " + err);

			for (var i = 0; i < rows.length; i++) {
				makeXmlFile(xw,rows[i].CATEGORY,rows[i].LOCAL,rows[i].SVC_NM,rows[i].POSX,rows[i].POSY,rows[i].LENTSITE,rows[i].ADDRESS,rows[i].PHONE,"");
				console.log(rows[i].ID);
			};
			for ( var r in rows) {
				console.log(r);
				//makeXmlFile(xw,r["CATEGORY"],r["LOCAL"],r["SVC_NM"],r["POSX"],r["POSY"],r["LENTSITE"],r["ADDRESS"],r["PHONE"],"");
			}
			//console.log(rows);
			xw.endDocument();
			res.write(xw.toString());
			res.end();
		});
	});
	/*
	xw.startDocument('1.0', 'UTF-8');
	xw.startElement('root');
	makeXmlFile(xw,"category","lo","name","x:123 y=123","www.xx.com","jung","010","test")
	makeXmlFile(xw,"catetest","lo","name","x:123 y=123","www.xx.com","jung","010","test")
	makeXmlFile(xw,"cate","lo","name","x:123 y=123","www.xx.com","jung","010","test")
	makeXmlFile(xw,"cate","lo","name","x:123 y=123","www.xx.com","jung","010","test")
	xw.endDocument();
	
	res.write(xw.toString());
	res.end();
	*/
});
server.listen(8080);
