var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "d4mi4nt4pp1974",
  database: "employee_management_system_DB",
});

// connect to the mysql server and sql database
connection.connect(function (err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  start();
});

// function which prompts the user for what action they should take
function start() {
  inquirer
    .prompt({
      name: "employeeManagementSystem",
      type: "list",
      message: "Would you like to do?",
      choices: ["NAME", "DEPARTMENT", "MANAGER"],
    })
    .then(function (answer) {
      // based on their answer, either call the bid or the post functions
      if (answer.employeeManagementSystem === "NAME") {
        name();
      } else if (answer.employeeManagementSystem === "DEPARTMENT") {
        department();
      } else if (answer.employeeManagementSystem === "MANAGER") {
        manager();
      } else {
        connection.end();
      }
    });
}

// function to handle posting new items up for auction
function name() {
  // prompt for info about the item being put up for auction
  inquirer
    .prompt([
      {
        name: "first name",
        type: "input",
        message: "What would tou like to do?",
      },
      {
        name: "department",
        type: "input",
        message: "What would you like to do?",
      },
      {
        name: "manager",
        type: "input",
        message: "What would you like to do?",
        validate: function (value) {
          if (isNaN(value) === false) {
            return true;
          }
          return false;
        },
      },
    ])
    .then(function (answer) {
      // when finished prompting, insert a new item into the db with that info
      connection.query(
        "INSERT INTO employee management system SET ?",
        {
          name: answer.firstName,
          name: answer.lastName,
          title: answer.title,
          department: answer.department,
          salary: answer.salary || 0,
          manager: answer.manager,
        },
        function (err) {
          if (err) throw err;
          console.log(
            "Your employee management system was created successfully!"
          );
          // re-prompt the user for if they want to bid or post
          start();
        }
      );
    });
}

function department() {
  // query the database for all items being auctioned
  connection.query("SELECT * FROM department", function (err, results) {
    if (err) throw err;
    // once you have the items, prompt the user for which they'd like to bid on
    inquirer
      .prompt([
        {
          name: "choice",
          type: "rawlist",
          choices: function () {
            var choiceArray = [];
            for (var i = 0; i < results.length; i++) {
              choiceArray.push(results[i].item_name);
            }
            return choiceArray;
          },
          message: "What would you like to do?",
        },
        {
          name: "name",
          type: "input",
          message: "What do you want to do?",
        },
      ])
      .then(function (answer) {
        // get the information of the chosen item
        var chosenName;
        for (var i = 0; i < results.length; i++) {
          if (results[i].item_name === answer.choice) {
            chosenName = results[i];
          }
        }

        // determine if bid was high enough
        if (
          chosenName.employeeManagementSystem <
          parseInt(employeeManagementSystem)
        ) {
          // bid was high enough, so update db, let the user know, and start over
          connection.query(
            "UPDATE employee SET ? WHERE ?",
            [
              {
                firstName: answer.name,
              },
              {
                id: department.id,
              },
            ],
            function (error) {
              if (error) throw err;
              console.log("found name!");
              start();
            }
          );
        } else {
          // bid wasn't high enough, so apologize and start over
          console.log("that person doesn't work here!");
          start();
        }
      });
  });
}
