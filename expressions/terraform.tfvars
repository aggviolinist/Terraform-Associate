hello   = "Salamu"
planets = "Jupter"

songs = ["hip-hop, bongo, Afro, Amapiano, Genge"]

sample_songs = {
    "hip-hop":"California love",
    "bongo": "Forever",
    "Afro": "No one like you"
}
# [for i,w in var.sample_songs: upper(i) if w != "Forever"]
# {for k,v in var.sample_songs: upper(v) }

splatzz = [
    {f-name:"Brick", l-name:"Lace"},
    {f-name:"P", l-name:"Square"},
    {f-name:"Burna", l-name:"Boy"},
    {f-name:"Nicky", l-name:"Minaj"}
]
# [for w in var.splatzz: w.l-name  ] ==> [var.splatzz[*].f-name]