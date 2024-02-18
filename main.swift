//
//  main.swift
//  Euler2022
//
//  Created by Peter Marshall on 25/11/2022.
//

import Foundation

print("helloooo my peoples!")

// Q1
/*
var alpha = 2.0
var dt = 0.001
var start_time = 0.0
var end_time = 10.0
var R = 1.0
var time = start_time

while time <= end_time {
    R = R + alpha * dt
    time = time + dt
    print(R)
}
*/
/*
//Q2a

dt = 0.02

while time <= end_time {
    
    R = R + alpha * R * dt
    time = time + dt
    print(R)
}



//Q2b

R = 1.0
time = start_time
// dR = alpha * R * dt
dt = 0.02

while time <= end_time {
    alpha = cos(time)
    R = R + alpha * R * R * dt
    time = time + dt
    print(R)
}
 
 

// Q3



func dRdt(R: Double, t: Double) -> Double {
    alpha = cos(time)
    return alpha * R * R
}

time = start_time
R = 1.0
dt = 0.02

while time <= end_time {
    R = eulerStep(currentValueOfDependentVariable: R,
                  currentValueOfIndpendentVariable:  time,
                  incrementInIndpendentVariable: dt,
                  derivativeFunction: dRdt)
    time = time + dt
    print(R)
}
 
//Q4

time = start_time
var A = ComplexNumber(real: 1.0, imag: 0.0)

func dAdt(A: ComplexNumber, time: Double) -> ComplexNumber {
    let minusI = ComplexNumber(real: 0.0, imag: -1.0)
    return minusI * A
}

while time <= end_time {
    //A = A + (minusI * A).times(real: dt)
    A = eulerStep(currentValueOfDependentVariable: A,
                  currentValueOfIndpendentVariable: time,
                  incrementInIndpendentVariable: dt,
                  derivativeFunction: dAdt)
    let realA = A.real
    let imagA = A.imag
    time = time + dt
    print(realA)
}

Q5

 */
/*
var start_time = 0.0
var end_time = 20.0
var dt = 0.001
var time = start_time
var f1 = 1.0
var f2 = 0.0
var vector = DoubleVector(doubleVector: [f1, f2])


func dVdt(v: DoubleVector, time: Double) -> DoubleVector {
    return DoubleVector(doubleVector: [ v.doubleVector[1], -v.doubleVector[0] ])
}

time = 0.0
while time <= end_time {
    vector = eulerStep(currentValueOfDependentVariable: vector,
                  currentValueOfIndpendentVariable: time,
                  incrementInIndpendentVariable: dt,
                  derivativeFunction: dVdt)
    f1 = vector.doubleVector[0]
    f2 = vector.doubleVector[1]
    time = time + dt
    print(f2)
}
 */
 /*
//Q6

var start_time = 0.0
var end_time = 20.0
var dt = 0.001
var time = start_time

var f1 = 1.0
var f2 = 0.0
var vector = DoubleVector(doubleVector: [f1, f2])
var omegaNought = 20.0

func dVdt(v: DoubleVector, time: Double) -> DoubleVector {
    return DoubleVector(doubleVector: [ v.doubleVector[1], -omegaNought * omegaNought * v.doubleVector[0] ])
}

time = 0.0
while time <= end_time {
    vector = eulerStep(currentValueOfDependentVariable: vector,
                  currentValueOfIndpendentVariable: time,
                  incrementInIndpendentVariable: dt,
                  derivativeFunction: dVdt)
    f1 = vector.doubleVector[0]
    f2 = vector.doubleVector[1]
    time = time + dt
    print(f1)
}
*/
//Extra Example: Horizontal mass on spring with vertical pendulum hanging off.
// xDoubleDot = ((k/m) * x) - ((Mg/m) * theta)
// thetaDoubledot = (((m+M)*g/l) * theta) - ((k/(l*m)) * x)


var x = 1.0
var xDot = 0.0
var theta = 0.1
var thetaDot = 0.0

let g = -9.81
let l = 2.0
let m = 1.0   // orignal  1.0
let M = 2.0    // orignal 1.0 first change to 2.0
let k = -4.0  // orignal -2.0 second change to -4.0

var y = DoubleVector(doubleVector: [x, xDot, theta, thetaDot])

let end_time = 20.0
var time = 0.0
var deltaT = 0.01

func dydt(y: DoubleVector, time: Double) -> DoubleVector {
    let y_in = y.doubleVector
    var y_out = [0.0,0.0,0.0,0.0]
    y_out[0] = y_in[1]
    y_out[1] = ((k / m) * y_in[0]) - ((M * g / m) * y_in[2])
    y_out[2] = y_in[3]
    y_out[3] = (((m + M) * g / l) * y_in[2]) - ((k / (l * m)) * y_in[0])
    
    return DoubleVector(doubleVector: [y_out[0],y_out[1],y_out[2],y_out[3] ])
}

createFile(fileName: "example1",fileExtension: "dat",headings: "time theta theta dot x xdot")

while time <= end_time {
    y = eulerStep(currentValueOfDependentVariable: y,
                   currentValueOfIndpendentVariable: time,
                   incrementInIndpendentVariable: deltaT,
                   derivativeFunction: dydt)
    time = time + deltaT
    print(y.doubleVector[0])
    writeToFile(fileName: "example1",fileExtension: "dat",inputString: "\(time) \(y.doubleVector[0]) \(y.doubleVector[1]) \(y.doubleVector[2]) \(y.doubleVector[3])")
}




/*
print(derivativeOfFunction(function1: squareAFunction, function2: sin, at: Double.pi/2))
print(derivativeOfFunction(function: cos, at: Double.pi/2))
print(derivativeOfFunction(function: raiseANumberToAPower, at: 2, index: 3))
*/
