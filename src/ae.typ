#import "requirements.typ": *

#let ae(inputNodes, middleNodes, style: "short", label: true) = {
  let inputTop = 3/4 * (inputNodes - 1)
  let middleTop = 3/4 * (middleNodes - 1)
  let outputTop = 3/4 * (inputNodes - 1)
  let r = 0.5
  let margin = -0.5
  let diff = inputNodes - middleNodes
  let middleLayers = 2 * diff - 1
  let h(val) = {
    return (3 * val - 1) / 4
  }

  cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.5pt)

    if style=="short" {
      // draw nodes
      for i in range(1, middleNodes+1) {
        circle((0, h(middleNodes) - 0.5 - 1.5 * i), radius: r) 
      }
      for i in range(1, inputNodes+1) {
        circle((3, h(inputNodes) - 0.5 - 1.5 * i), radius: r)
        circle((-3, h(inputNodes) - 0.5 - 1.5 * i), radius: r)
      }

      // draw lines
      for i in range(1, middleNodes+1) {
        for j in range(1, inputNodes+1) {
          line((r, h(middleNodes) - 0.5 - 1.5 * i), (r + 2, h(inputNodes) - 0.5 - 1.5 * j))
          line((-r, h(middleNodes) - 0.5 - 1.5 * i), (-r - 2, h(inputNodes) - 0.5 - 1.5 * j))
        }
      }
    } else if style=="full" {
      // draw nodes
      for i in range(0, diff+1) {
        let nodes = i + middleNodes
        for j in range(1, nodes+1) {
          if i>0 {
            circle((3 * i, h(nodes) - 0.5 - 1.5 * j), radius: r)
            circle((-3 * i, h(nodes) - 0.5 - 1.5 * j), radius: r)
          } else {
            circle((0, h(nodes) - 0.5 - 1.5 * j), radius: r)
          }
        }
      }

        // draw lines
        let iter = diff - 1
        for i in range(0, iter+1) {
          let current = i + middleNodes
          let next = current + 1
          for j in range(1, current+1) {
            for k in range(1, next+1) {
              line((3 * i + r, h(current) - 0.5 - 1.5 * j), (3 * i + r + 2, h(next) - 0.5 - 1.5 * k))
              line((-3 * i - r, h(current) - 0.5 - 1.5 * j), (-3 * i - r - 2, h(next) - 0.5 - 1.5 * k))
            }
          }
        }
    }

    // labels
    if style=="short" {
      diff = 1
    }
    if label {
      content((-3 * diff, inputTop + margin), text[Input Layer])
      if style=="short" {
        content((0, middleTop + margin + 0.5), text[Hidden Layer])
      } else if style=="full" {
        if middleLayers==1 {
          content((0, middleTop + margin + 0.5), text[Hidden Layer])
        } else {
          content((0, middleTop + margin + 0.5), text[Hidden Layers (#middleLayers dim)])
        }
      }
      content((0, middleTop + margin), text[Bottleneck])
      content((3 * diff, outputTop + margin), text[Output Layer])
    }
  })
}
