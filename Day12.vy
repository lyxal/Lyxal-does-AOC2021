# THIS IS PURELY PROOF OF CONCEPT
# IT'S JUST A QUICK AND CHEAP NODE PARSER
# IT DOESN'T ACTUALLY SOLVE THE CHALLENGES

\-/ D 'h `start` ≠ nt `end` ≠ ∧; →connections
'h `start` =; vt →starts
't `end` =; vt →ends

⟨⟩ →nodes # Node format: ⟨Cave|adjoining caves⟩
←connections (conn|
  ←nodes vh ←conn h ḟ: u≠[ # If the current connection is already in the known caves
    →pos # Store the position to append to
    ←nodes : ←pos i ÷ ←conn t + " ←pos $ Ȧ →nodes # and add it to that "nodes" known connectors
    # but now, we have to add the cave to the connectors of the cave it connects to
      ←nodes vh ←conn t ḟ: u≠[
        →pos
        ←nodes : ←pos i ÷ ←conn h + " ←pos $ Ȧ →nodes
      |
        _ ←nodes ←conn Ṙw J →nodes
      ]
  | # Otherwise, fresh.
    _ ←nodes ←conn w J →nodes
    ←nodes vh ←conn t ḟ: u≠[
        →pos
        ←nodes : ←pos i ÷ ←conn h + " ←pos $ Ȧ →nodes
      |
        _ ←nodes ←conn Ṙw J →nodes
      ]
  ]
)

`Nodes: ` ₴ ←nodes ,

