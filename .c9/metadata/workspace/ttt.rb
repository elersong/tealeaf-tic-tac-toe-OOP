{"filter":false,"title":"ttt.rb","tooltip":"/ttt.rb","undoManager":{"mark":100,"position":100,"stack":[[{"group":"doc","deltas":[{"start":{"row":72,"column":12},"end":{"row":72,"column":13},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":10},"end":{"row":72,"column":13},"action":"remove","lines":["gam"]},{"start":{"row":72,"column":10},"end":{"row":72,"column":20},"action":"insert","lines":["game_plays"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":20},"end":{"row":72,"column":21},"action":"insert","lines":["."]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":21},"end":{"row":72,"column":22},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":22},"end":{"row":72,"column":23},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":23},"end":{"row":72,"column":24},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":24},"end":{"row":72,"column":25},"action":"insert","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":25},"end":{"row":72,"column":26},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":26},"end":{"row":72,"column":27},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":27},"end":{"row":72,"column":28},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":28},"end":{"row":72,"column":29},"action":"insert","lines":["?"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":29},"end":{"row":72,"column":31},"action":"insert","lines":["()"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":30},"end":{"row":72,"column":32},"action":"insert","lines":["\"\""]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":31},"end":{"row":72,"column":32},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":10},"end":{"row":72,"column":11},"action":"insert","lines":["!"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":6},"end":{"row":65,"column":7},"action":"remove","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":5},"end":{"row":65,"column":6},"action":"remove","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":4},"end":{"row":65,"column":5},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":3},"end":{"row":65,"column":4},"action":"remove","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":2},"end":{"row":65,"column":3},"action":"remove","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":1},"end":{"row":65,"column":2},"action":"remove","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":0},"end":{"row":65,"column":1},"action":"remove","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":64,"column":0},"end":{"row":65,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":0},"end":{"row":65,"column":2},"action":"remove","lines":["  "]},{"start":{"row":66,"column":0},"end":{"row":66,"column":2},"action":"remove","lines":["  "]},{"start":{"row":67,"column":0},"end":{"row":67,"column":2},"action":"remove","lines":["  "]},{"start":{"row":68,"column":0},"end":{"row":68,"column":2},"action":"remove","lines":["  "]},{"start":{"row":69,"column":0},"end":{"row":69,"column":2},"action":"remove","lines":["  "]},{"start":{"row":70,"column":0},"end":{"row":70,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":71,"column":0},"end":{"row":72,"column":2},"action":"remove","lines":["end until !game_plays.include?(\"n\")","  "]}]}],[{"group":"doc","deltas":[{"start":{"row":71,"column":0},"end":{"row":72,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":70,"column":3},"end":{"row":71,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":0},"end":{"row":18,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":0},"end":{"row":17,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":0},"end":{"row":37,"column":3},"action":"insert","lines":["# check that the input the user gave is valid. re-prompt repeatedly if not. return valid input","def collect_and_validate_input(msg, type)","  input = prompt msg","  ","  if valid?(input, type)","    return input.upcase","  else","    system(\"clear\")","    puts \"INVALID INPUT: Please try again\"","    input = collect_and_validate_input msg, type","  end","end","","# set the qualifications of valid input by category","def valid?(input, type)","  if type == :play","    !(input !~ /[RPSrps]/) && input.length == 1","  elsif type == :again","    !(input !~ /[YNyn]/)","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":41},"end":{"row":18,"column":42},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":42},"end":{"row":18,"column":43},"action":"insert","lines":["#"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":43},"end":{"row":18,"column":44},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":44},"end":{"row":18,"column":45},"action":"insert","lines":["<"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":45},"end":{"row":18,"column":46},"action":"insert","lines":["="]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":46},"end":{"row":18,"column":47},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":47},"end":{"row":18,"column":48},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":48},"end":{"row":18,"column":49},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":49},"end":{"row":18,"column":50},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":50},"end":{"row":18,"column":51},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":51},"end":{"row":18,"column":52},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":52},"end":{"row":18,"column":53},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":53},"end":{"row":18,"column":54},"action":"insert","lines":[","]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":54},"end":{"row":18,"column":55},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":55},"end":{"row":18,"column":56},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":56},"end":{"row":18,"column":57},"action":"insert","lines":["y"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":57},"end":{"row":18,"column":58},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":58},"end":{"row":18,"column":59},"action":"insert","lines":["b"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":59},"end":{"row":18,"column":60},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":60},"end":{"row":18,"column":61},"action":"insert","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":3},"end":{"row":28,"column":4},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":4},"end":{"row":28,"column":5},"action":"insert","lines":["#"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":5},"end":{"row":28,"column":6},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":6},"end":{"row":28,"column":7},"action":"insert","lines":["="]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":7},"end":{"row":28,"column":8},"action":"insert","lines":[">"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":8},"end":{"row":28,"column":9},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":9},"end":{"row":28,"column":10},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":10},"end":{"row":28,"column":11},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":11},"end":{"row":28,"column":12},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":12},"end":{"row":28,"column":13},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":13},"end":{"row":28,"column":14},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":28,"column":14},"end":{"row":28,"column":15},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":0},"end":{"row":17,"column":94},"action":"remove","lines":["# check that the input the user gave is valid. re-prompt repeatedly if not. return valid input"]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":0},"end":{"row":17,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":29,"column":0},"end":{"row":29,"column":51},"action":"remove","lines":["# set the qualifications of valid input by category"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":3},"end":{"row":36,"column":4},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":4},"end":{"row":36,"column":5},"action":"insert","lines":["#"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":5},"end":{"row":36,"column":6},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":6},"end":{"row":36,"column":7},"action":"insert","lines":["="]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":7},"end":{"row":36,"column":8},"action":"insert","lines":[">"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":8},"end":{"row":36,"column":9},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":9},"end":{"row":36,"column":10},"action":"insert","lines":["B"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":10},"end":{"row":36,"column":11},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":11},"end":{"row":36,"column":12},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":12},"end":{"row":36,"column":13},"action":"insert","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":13},"end":{"row":36,"column":14},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":14},"end":{"row":36,"column":15},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":36,"column":15},"end":{"row":36,"column":16},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":23},"end":{"row":30,"column":24},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":24},"end":{"row":30,"column":25},"action":"insert","lines":["#"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":25},"end":{"row":30,"column":26},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":26},"end":{"row":30,"column":27},"action":"insert","lines":["<"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":27},"end":{"row":30,"column":28},"action":"insert","lines":["="]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":28},"end":{"row":30,"column":29},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":29},"end":{"row":30,"column":30},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":30},"end":{"row":30,"column":31},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":31},"end":{"row":30,"column":32},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":32},"end":{"row":30,"column":33},"action":"insert","lines":["i"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":33},"end":{"row":30,"column":34},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":34},"end":{"row":30,"column":35},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":35},"end":{"row":30,"column":36},"action":"insert","lines":[","]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":36},"end":{"row":30,"column":37},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":37},"end":{"row":30,"column":38},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":38},"end":{"row":30,"column":39},"action":"insert","lines":["y"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":39},"end":{"row":30,"column":40},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":40},"end":{"row":30,"column":41},"action":"insert","lines":["b"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":41},"end":{"row":30,"column":42},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":42},"end":{"row":30,"column":43},"action":"insert","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":0},"end":{"row":36,"column":16},"action":"remove","lines":["def collect_and_validate_input(msg, type) # <= String, Symbol","  input = prompt msg","  ","  if valid?(input, type)","    return input.upcase","  else","    system(\"clear\")","    puts \"INVALID INPUT: Please try again\"","    input = collect_and_validate_input msg, type","  end","end # => String","","","def valid?(input, type) # <= String, Symbol","  if type == :play","    !(input !~ /[RPSrps]/) && input.length == 1","  elsif type == :again","    !(input !~ /[YNyn]/)","  end","end # => Boolean"]}]}],[{"group":"doc","deltas":[{"start":{"row":16,"column":0},"end":{"row":17,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":43},"end":{"row":16,"column":0},"action":"remove","lines":["",""]}]}]]},"ace":{"folds":[],"scrolltop":48,"scrollleft":0,"selection":{"start":{"row":15,"column":43},"end":{"row":15,"column":43},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":2,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1420056783705,"hash":"d3b81977af853b966aa0b12c46512e38b2188058"}