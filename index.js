// [ Dependencies ]
var express = require('express');           // Routing
var cors    = require('cors');              // Getting around cross domain restrictions
var fs      = require('fs');                // File system access
var path    = require('path');              // File Path parsing
var knex    = require("knex");              // SQL query builder
var bcrypt  = require("bcrypt-nodejs");     // Password hashing

// [ Config file with db credentials ]
var config  = require("./config.json");     // Config file with database username and password
//var database_manager = require("./database_manager");

// [ Start server ]
console.log("Starting server...");

// [ The Knex query builder instance ]
var db = knex(config);

// [ Create the express app ]
var app = express();

// [ Middleware to get the request body ]
app.use (function(req, res, next) {
    // [ Skip json check for uploads ]
    if(req.path == "/upload" 
       || req.path == "/uploadDirectory"){
        next();
        return;
    }

    var json='';
    req.setEncoding('utf8');
    req.on('data', function(chunk) { 
       json += chunk;
    });

    req.on('end', function() {    
        console.log(json);
        if(json == ""){
            next();
        }else{
            try{
                // [ If valid json, set req.body ]
                var data = JSON.parse(json);
                if(isPlainObj(data)){
                    req.body = data;
                    next();
                }else{
                    // [ Tell user json was naughty ]
                    res.end(error("Not a valid JSON object", errors.ONLY_JSON_OBJECTS));
                }
                
            }catch(e){
                // [ Tell user json was naughty ]
                res.end(error("Malformed json", errors.MALFORMED_JSON));
            }            
        }        
    });
});

// [ Middleware to authenticate user ]
app.use (function(req, res, next) {
    if(req.path == "/token" || req.path == "/token/"){
        // User doesn't need to be authenticated to ask for token, anyone is allowed to do that
        
        next();
        return;
    }
    
    // [ Make sure token is valid ]
    var token = req.headers["x-token"];
    if(!token || token == ""){
        res.end(JSON.stringify({success:false}));
        return;
    }
    
    // [ Check db for token record that matches ]
    db("Token")
        .leftJoin("User","Token.userId","User.id")
        .select("User.id","User.username")
        .where("token",token)
        .where("revoked",0)
        .then(function(row){
            if(row.length == 1){
                req.user = {
                     username:row[0].username
                    ,id:row[0].id
                }
                next();
                return;
            }
        
            res.end(error("No matching token in database"));
        });
    
});

app.post("/ability",function(req,res){
    console.log("Git new ability request:");
    console.log(req.body);
});

// [ Listen for requests ]
(function(port){
    app.listen(port, function () {
        console.log('Web server listening on port ' + port + '...');
//        database_manager.test();
    });    
})(1337);