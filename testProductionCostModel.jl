"""
This is a test Production Cost Model using PowerSystems.jl and PowerSimulations.jl.
The following test is based off the demonstration by Dr. Kate Doubleday of the Global 
Power Systems Transformation Consortium.

The walkthrough for the example can be found using this link: 
https://www.youtube.com/watch?v=84IQjMe_CPs&pp=ygUaa2F0ZSBkb3VibGVkYXkgbnJlbCBzaWVubmE%3D

The walkthrough has been modified using the documented example in PowerSimulations.jl:
https://nrel-sienna.github.io/PowerSimulations.jl/latest/tutorials/pcm_simulation/

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
solver = optimizer_with_attributes(HiGHS.Optimizer, "mip_rel_gap" => 0.5)
MathOptInterface.OptimizerWithAttributes(HiGHS.Optimizer, Pair{MathOptInterface.AbstractOptimizerAttribute, Any}[MathOptInterface.RawOptimizerAttribute("mip_rel_gap") => 0.5])
plotlyjs()


# Import System
sys_DA = build_system(PSISystems, "modified_RTS_GMLC_DA_sys") # Day Ahead System
sys_RT = build_system(PSISystems, "modified_RTS_GMLC_RT_sys") # Real Time System

# Defining unit committment for Day Ahead problem
"""
template_uc = template_unit_commitment()
set_device_model!(template_uc, ThermalStandard, ThermalStandardUnitCommitment)
set_device_model!(template_uc, HydroDispatch, HydroDispatchRunOfRiver)
"""