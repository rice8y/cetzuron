#import "requirements.typ": *

#let fcnn(inputNodes, middleNodes, outputNodes, middleLayers: 3, label: true) = {
  let inputTop = 3/4 * (inputNodes - 1)
  let middleTop = 3/4 * (middleNodes - 1)
  let outputTop = 3/4 * (outputNodes - 1)
  let r = 0.5
  let margin = -0.5

  cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.5pt)

    //// draw nodes
    // input
    for i in range(1, inputNodes+1) {
      circle((0, inputTop - 1.5 * (i + 1)), radius: r)
    }
    // middle
    for i in range(1, middleLayers+1) {
      for j in range(1, middleNodes+1) {
        circle((3 * i, middleTop - 1.5 * (j + 1)), radius: r)
      }
    }
    // output
    for i in range(1, outputNodes+1) {
      circle((3 * middleLayers + 3, outputTop - 1.5 * (i + 1)), radius: r)
    }

    //// draw lines
    // input to middle
    for i in range(1, inputNodes+1) {
      for j in range(1, middleNodes+1) {
        line((0.5, inputTop - 1.5 * (i + 1)), (2.5, middleTop - 1.5 * (j + 1)))
      }
    }
    // middle to middle
    if middleLayers!=1 {
      for i in range(2, middleLayers+1) {
        for j in range(1, middleNodes+1) {
          for k in range(1, middleNodes+1) {
            line((3 * i - 2.5, middleTop - 1.5 * (j + 1)), (3 * i - 0.5, middleTop - 1.5 * (k + 1)))
          }
        }
      } 
    }
    // middle to output
    for i in range(1, middleNodes+1) {
      for j in range(1, outputNodes+1) {
        line((3 * middleLayers + 0.5, middleTop - 1.5 * (i + 1)), (3 * middleLayers + 2.5, outputTop - 1.5* (j + 1)))
      }
    }

    //// labels
    if label {
      content((0, inputTop + margin), text[Input Layer])
      if middleLayers==1 {
        content((3 * middleLayers / 2 + 1.5, middleTop + margin), text[Hidden Layer])
      } else {
        content((3 * middleLayers / 2 + 1.5, middleTop + margin), text[Hidden Layers (#middleLayers dim)])
      }
      content((3 * middleLayers + 3, outputTop + margin), text[Output Layer])
    }
  })
}
