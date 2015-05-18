readConfirm = function(prompt = "Confirm? (Y/n)"){
  response = readline(paste(prompt, " "))
  substr(tolower(response), start = 1, stop = 1) == "y"
}