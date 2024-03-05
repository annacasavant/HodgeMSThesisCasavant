"""
This is a test Production Cost Model using PowerSystems.jl and PowerSimulations.jl.
The following test is based off the demonstration by Dr. Kate Doubleday of the Global 
Power Systems Transformation Consortium.

The example can be found using this link: https://www.youtube.com/watch?v=84IQjMe_CPs&pp=ygUaa2F0ZSBkb3VibGVkYXkgbnJlbCBzaWVubmE%3D

@author: Anna Casavant and Pradyumna Rao
"""
# Bringing in the import statements
using PowerSystems
using PowerSimulations
using PowerAnalytics
using PowerGraphics
using Logging
using Dates
using CSV
using DataFrames
using HiGHS
solver = optimizer_with_attributes(HiGHS.Optimizer)
plotlyjs()
