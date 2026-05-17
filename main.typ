// COMM200 Persuasive Speech Presentation
// Topic: The republic sold as democracy proves to be oligarchy
// Compile with: typst compile presentation/main.typ presentation/res-publica-democracy.pdf

#set page(
  width: 16in,
  height: 9in,
  margin: 0pt,
)

#set text(
  font: "Liberation Sans",
  size: 21pt,
  lang: "en",
  fill: rgb("#151a1f"),
)

#set par(spacing: 0.64em)

#let coal = rgb("#0e1318")
#let ink = rgb("#151a1f")
#let slate = rgb("#26323d")
#let navy = rgb("#152235")
#let ivory = rgb("#f4f1ea")
#let bone = rgb("#e8e1d6")
#let line-soft = rgb("#c9c0b3")
#let muted = rgb("#6d7377")
#let amber = rgb("#9a7b45")
#let red = rgb("#743332")
#let green = rgb("#3f5b4f")
#let white = rgb("#fbfaf6")

#let safe-x = 0.82in
#let safe-y = 0.62in
#let content-w = 14.36in

#let footer(source: none, dark: false) = {
  if source != none {
    place(
      bottom + left,
      dx: safe-x,
      dy: -0.32in,
      text(
        size: 8.8pt,
        fill: if dark { white.transparentize(36%) } else { muted },
      )[Source: #source],
    )
  }
}

#let hair(width: 0.9in, color: amber) = rect(width: width, height: 1.2pt, fill: color)

#let kicker(body, dark: false, color: amber) = text(
  size: 10.2pt,
  weight: "bold",
  fill: if dark { color.lighten(20%) } else { color },
  tracking: 0pt,
)[#upper(body)]

#let display(body, dark: false, size: 50pt, serif: false) = text(
  font: if serif { "Liberation Serif" } else { "Liberation Sans" },
  size: size,
  weight: "bold",
  fill: if dark { white } else { ink },
)[#body]

#let lead(body, dark: false, size: 24pt) = text(
  size: size,
  fill: if dark { white.transparentize(10%) } else { rgb("#30383f") },
)[#body]

#let copy(body, dark: false, size: 18.4pt) = text(
  size: size,
  fill: if dark { white.transparentize(24%) } else { rgb("#3b434a") },
)[#body]

#let small(body, dark: false) = text(
  size: 11.6pt,
  fill: if dark { white.transparentize(38%) } else { muted },
)[#body]

#let canvas(fill: ivory, body, source: none, dark: false) = rect(
  width: 100%,
  height: 100%,
  fill: fill,
  inset: (x: safe-x, y: safe-y),
)[
  #body
  #footer(source: source, dark: dark)
]

#let noir(body, source: none) = canvas(fill: coal, source: source, dark: true)[#body]

#let image-title(path, body, source: none, align-pos: left + bottom, width: 8.7in) = rect(
  width: 100%,
  height: 100%,
  inset: 0pt,
)[
  #image(path, width: 100%, height: 100%, fit: "cover")
  #place(top + left, rect(width: 100%, height: 100%, fill: coal.transparentize(24%)))
  #place(
    align-pos,
    dx: safe-x,
    dy: -safe-y,
    block(width: width)[#body],
  )
  #footer(source: source, dark: true)
]

#let section(k, title, sub: none, accent: amber, dark: true, source: none) = {
  if dark {
    noir(source: source)[
      #v(1.24in)
      #block(width: 10.8in)[
        #kicker(k, dark: true, color: accent)
        #v(0.16in)
        #display(title, dark: true, size: 54pt, serif: true)
        #v(0.04in)
        #hair(width: 1.24in, color: accent)
        #if sub != none {
          v(0.34in)
          lead(sub, dark: true, size: 24pt)
        }
      ]
    ]
  } else {
    canvas[
      #v(1.24in)
      #block(width: 10.8in)[
        #kicker(k, color: accent)
        #v(0.16in)
        #display(title, size: 54pt, serif: true)
        #v(0.04in)
        #hair(width: 1.24in, color: accent)
        #if sub != none {
          v(0.34in)
          lead(sub, size: 24pt)
        }
      ]
    ]
  }
}

#let item(body, accent: amber, dark: false) = grid(
  columns: (0.2in, 1fr),
  gutter: 0.14in,
  align: top,
  block[
    #v(0.105in)
    #rect(width: 0.1in, height: 1.15pt, fill: accent)
  ],
  copy(body, dark: dark, size: 18.7pt),
)

#let list(items, accent: amber, dark: false, gap: 0.18in) = stack(
  dir: ttb,
  spacing: gap,
  ..items.map(it => item(it, accent: accent, dark: dark)),
)

#let photo(path, height: 5.75in, radius: 0pt) = rect(
  width: 100%,
  height: height,
  radius: radius,
  fill: bone,
  inset: 0pt,
)[#image(path, width: 100%, height: 100%, fit: "cover")]

#let editorial-split(k, title, left, right, source: none, accent: amber) = canvas(source: source)[
  #grid(
    columns: (4.75in, 1fr),
    gutter: 0.78in,
    align: top,
    [
      #v(0.28in)
      #kicker(k, color: accent)
      #v(0.16in)
      #display(title, size: 39pt, serif: true)
      #v(0.02in)
      #hair(width: 0.86in, color: accent)
      #v(0.34in)
      #left
    ],
    [
      #v(0.72in)
      #right
    ],
  )
]

#let stat-block(num, label, accent: red, dark: false) = block(width: 100%)[
  #text(size: 72pt, weight: "bold", fill: accent)[#num]
  #v(-0.18in)
  #hair(width: 0.72in, color: accent)
  #v(0.2in)
  #copy(label, dark: dark, size: 18.5pt)
]

#let compare(title, items, accent) = block(width: 100%)[
  #text(size: 24pt, weight: "bold", fill: accent)[#title]
  #v(0.04in)
  #hair(width: 0.66in, color: accent)
  #v(0.26in)
  #list(items, accent: accent, gap: 0.16in)
]

#let sep = pagebreak()

// Slide 1
#image-title("assets/parliament.jpg", source: "Wikimedia Commons, A.Savin, CC BY-SA 3.0")[
  #kicker("COMM200 Persuasive Speech", dark: true)
  #v(0.18in)
  #display([Republic Is Not Democracy], dark: true, size: 58pt, serif: true)
  #v(0.22in)
  #lead([Voting without citizen power is oligarchy.], dark: true, size: 27pt)
  #v(0.54in)
  #small([A system can keep the democratic costume while stripping citizens of command.], dark: true)
]

#sep

// Slide 2
#section(
  [The Core Deception],
  [A ballot is not sovereignty.],
  sub: [Elections can crown decision-makers while citizens lose command over law, agenda, and accountability.],
  source: [Freedom House, 2025],
)

#sep

// Slide 3
#editorial-split(
  [Argument 1],
  [Voting Is Not Rule],
  [
    #list((
      [Res publica claims the public interest.],
      [Officeholders decide what that interest means.],
      [Citizens choose a governing class, then vanish from power.],
      [No agenda power means no sovereignty.],
    ))
    #v(0.48in)
    #small([Aristotle / Rousseau / Dahl])
  ],
  [
    #photo("assets/citizen-assembly.jpg", height: 5.62in)
  ],
)

#sep

// Slide 4
#noir[
  #grid(
    columns: (5.15in, 1fr),
    gutter: 0.84in,
    align: horizon,
    [
      #kicker([Argument 2], dark: true, color: red)
      #v(0.16in)
      #display([Representation Replaces the Citizen], dark: true, size: 43pt, serif: true)
      #v(0.08in)
      #hair(width: 0.94in, color: red.lighten(12%))
      #v(0.32in)
      #lead([First we vote. Then power leaves us.], dark: true, size: 24pt)
    ],
    [
      #v(0.56in)
      #block(width: 100%)[
        #text(size: 15pt, fill: white.transparentize(34%))[CLAIMED SOURCE]
        #v(0.18in)
        #text(size: 31pt, weight: "bold", fill: white)[Citizens]
        #v(0.44in)
        #rect(width: 100%, height: 1pt, fill: white.transparentize(78%))
        #v(0.44in)
        #text(size: 15pt, fill: red.lighten(22%))[FILTER OF POWER]
        #v(0.18in)
        #text(size: 31pt, weight: "bold", fill: red.lighten(16%))[Parties]
        #v(0.44in)
        #rect(width: 100%, height: 1pt, fill: white.transparentize(78%))
        #v(0.44in)
        #text(size: 15pt, fill: red.lighten(22%))[REAL COMMAND]
        #v(0.18in)
        #text(size: 31pt, weight: "bold", fill: red.lighten(16%))[Parliament]
        #v(0.3in)
        #copy([Policy is drawn after the people have already been reduced to approval.], dark: true, size: 17.5pt)
      ]
    ],
  )
]

#sep

// Slide 5
#editorial-split(
  [Argument 3],
  [Rule by Networks, Not Citizens],
  [
    #lead([Oligarchy does not need a mask forever. It needs access, money, and gatekeepers.], size: 24pt)
    #v(0.38in)
    #list((
      [Party machines decide who enters.],
      [Economic power buys influence.],
      [Media visibility manufactures attention.],
      [Appointments protect the system.],
    ), accent: red)
  ],
  [
    #v(0.02in)
    #text(size: 21pt, weight: "bold", fill: red)[Scored cleaner than Greece]
    #v(0.06in)
    #hair(width: 0.72in, color: red)
    #v(0.25in)
    #grid(
      columns: (1fr, 0.72in),
      gutter: 0.18in,
      row-gutter: 0.15in,
      text(size: 25pt, weight: "bold", fill: ink)[Rwanda],
      text(size: 25pt, weight: "bold", fill: red)[58],
      text(size: 25pt, weight: "bold", fill: ink)[Qatar],
      text(size: 25pt, weight: "bold", fill: red)[58],
      text(size: 25pt, weight: "bold", fill: ink)[Saudi Arabia],
      text(size: 25pt, weight: "bold", fill: red)[57],
      text(size: 25pt, weight: "bold", fill: ink)[Oman],
      text(size: 25pt, weight: "bold", fill: red)[52],
      text(size: 25pt, weight: "bold", fill: ink)[Malaysia],
      text(size: 25pt, weight: "bold", fill: red)[52],
      text(size: 25pt, weight: "bold", fill: ink)[Greece],
      text(size: 25pt, weight: "bold", fill: red)[50],
    )
    #v(0.34in)
    #rect(width: 100%, height: 1pt, fill: line-soft)
    #v(0.36in)
    #copy([Access becomes the hidden constitution: who enters, who is heard, who is protected, and who is abandoned.], size: 21pt)
  ],
  source: [Transparency International, 2026],
  accent: red,
)

#sep

// Slide 6
#noir(source: "Reporters Without Borders, 2026")[
  #grid(
    columns: (5.2in, 1fr),
    gutter: 0.78in,
    align: horizon,
    [
      #kicker([Legitimacy Crisis], dark: true, color: red)
      #v(0.16in)
      #display([Citizens Cannot Rule in the Dark], dark: true, size: 43pt, serif: true)
      #v(0.08in)
      #hair(width: 0.94in, color: red.lighten(14%))
      #v(0.3in)
      #lead([When surveillance, pressure, and silence expand, sovereignty becomes theater.], dark: true, size: 23.5pt)
    ],
    [
      #v(0.64in)
      #stat-block([86/180], [Press freedom rank / Greece], accent: red.lighten(16%), dark: true)
      #v(0.54in)
      #rect(width: 100%, height: 1pt, fill: white.transparentize(78%))
      #v(0.36in)
      #list((
        [Press pressure],
        [Wiretapping scandal],
        [SLAPP intimidation],
        [Managed visibility],
      ), accent: red.lighten(16%), dark: true, gap: 0.14in)
    ],
  )
]

#sep

// Slide 7
#section(
  [Satisfaction],
  [Return Power to the Citizen Body],
  sub: [Referendum. Initiative. Recall. Audit. Justice. The people must hold constitutional authority.],
  accent: green,
  dark: false,
)

#sep

// Slide 8
#canvas[
  #v(0.26in)
  #kicker([Two Political Orders], color: amber)
  #v(0.16in)
  #display([Oligarchy or Democracy], size: 43pt, serif: true)
  #v(0.42in)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.9in,
    [
      #compare([Republic as Oligarchy], (
        [Voting without command],
        [Party delegates],
        [Elite networks],
        [Hidden bargains],
        [Citizens without power],
      ), red)
    ],
    [
      #compare([Democracy of Citizens], (
        [The citizen body rules],
        [Policy before persons],
        [Recall of officials],
        [Public audit],
        [Justice under citizen control],
      ), green)
    ],
  )
]

#sep

// Slide 9
#editorial-split(
  [Action],
  [Stop Asking to Be Represented],
  [
    #list((
      [Name it: oligarchic republic.],
      [Demand binding referenda.],
      [Demand popular lawmaking.],
      [Demand recallable officials.],
      [Demand public audit.],
    ), accent: green)
    #v(0.42in)
    #lead([Representation is not democracy. Power to the people is.], size: 24pt)
  ],
  [
    #photo("assets/civic-checklist.jpg", height: 5.62in)
  ],
  accent: green,
)

#sep

// Slide 10
#canvas[
  #grid(
    columns: (4.35in, 1fr),
    gutter: 0.82in,
    align: top,
    [
      #v(0.24in)
      #kicker([Sources], color: amber)
      #v(0.16in)
      #display([References], size: 43pt, serif: true)
      #v(0.04in)
      #hair(width: 0.86in)
      #v(0.32in)
      #copy([Works cited for the speech's historical, theoretical, and political claims.], size: 18.4pt)
    ],
    [
      #v(0.82in)
      #set text(size: 12.1pt, fill: rgb("#30383f"))
      #let ref-group(label, body) = block(width: 100%)[
        #text(size: 9.4pt, weight: "bold", fill: amber, tracking: 0pt)[#upper(label)]
        #v(0.08in)
        #body
      ]
      #let ref(body) = block(width: 100%)[#body]

      #ref-group([Democratic Theory])[
        #ref[Aristotle. (1998). _Politics_. Hackett Publishing.]
        #ref[Dahl, R. A. (1971). _Polyarchy_. Yale University Press.]
        #ref[Rousseau, J.-J. (2002). _The social contract_. Yale University Press.]
      ]
      #v(0.22in)
      #ref-group([Institutional Evidence])[
        #ref[Freedom House. (2025). _Greece: Freedom in the World 2025_.]
        #ref[Reporters Without Borders. (2026). _Greece_.]
        #ref[Transparency International. (2026). _Corruption Perceptions Index 2025_.]
      ]
      #v(0.22in)
      #ref-group([Contemporary Argument])[
        #ref[Kalenteridis, S. (2026). _This Is Greece's Only Way Out: A Democratic Party_. YouTube transcript.]
        #ref[Stathis, T. (2026, April 28). _The res publica instead of democracy proves to be oligarchy_. SLpress.gr.]
      ]
    ],
  )
]
