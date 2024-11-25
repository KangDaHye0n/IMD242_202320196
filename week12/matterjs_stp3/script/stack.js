const Engine = Matter.Engine,
  Composites = Matter.Composites,
  MouseConstraint = Matter.MouseConstraint,
  Mouse = Matter.Mouse,
  Composite = Matter.Composite,
  Bodies = Matter.Bodies;

// create engine
const engine = Engine.create(),
  world = engine.world;

// add bodies
//똑같은 개체를 여러 개 만들 때 사용
var stack = Composites.stack(
  200,
  606 - 25.25 - 5 * 40,
  10,
  5,
  0,
  0,
  function (x, y) {
    return Bodies.rectangle(x, y, 40, 40);
  }
);
Composite.add(world, [stack]);

let walls = [
  Bodies.rectangle(400, 0, 800, 50, { isStatic: true }),
  Bodies.rectangle(800, 300, 50, 600, { isStatic: true }),
  Bodies.rectangle(0, 300, 50, 600, { isStatic: true }),
  Bodies.rectangle(400, 606, 800, 50.5, { isStatic: true }),
];
Composite.add(world, [walls]);

// add mouse control
// var mouse = Mouse.create(render.canvas),
//   mouseConstraint = MouseConstraint.create(engine, {
//     mouse: mouse,
//     constraint: {
//       stiffness: 0.2,
//       render: {
//         visible: false,
//       },
//     },
//   });

// Composite.add(world, mouseConstraint);

function setup() {
  createCanvas(800, 600);
  background(255);
  console.log(stack);
}

function draw() {
  background(255);

  stack.bodies.forEach((aBody) => {
    beginShape();
    aBody.vertices.forEach((aVertex) => {
      vertex(aVertex.x, aVertex.y);
      //vertex = 점만 찍어줌
    });
    endShape(CLOSE);
    //1번점과 마지막 점을 연결해서 도형을 닫아줌
  });

  walls.forEach((eachWall) => {
    beginShape();
    eachWall.vertices.forEach((eachVertex) => {
      vertex(eachVertex.x, eachVertex.y);
    });
    endShape(CLOSE);
  });
}
