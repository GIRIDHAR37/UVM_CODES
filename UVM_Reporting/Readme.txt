Deep Description of the UVM Reporting Example
The code you shared is a Universal Verification Methodology (UVM) simulation in SystemVerilog, focusing on reporting messages using different verbosity levels. Here's a deeper explanation of the code and its working principles, followed by a discussion of its pros, cons, and applications.

EDA_Playground Link : https://www.edaplayground.com/x/T5cC

1. Code Structure Overview:
UVM Package Inclusion and Import:

verilog
Copy code
`include "uvm_pkg.sv"
import uvm_pkg::*;
The UVM package is included, and all UVM elements are imported with import uvm_pkg::*;. This is essential for using UVM macros, classes, and reporting mechanisms.

Class rpt:

verilog
Copy code
class rpt extends uvm_component;
    `uvm_component_utils(rpt)
The class rpt is defined, extending uvm_component, making it a standard UVM component capable of participating in UVM reporting, simulation control, and interconnectivity with other UVM components. The macro \uvm_component_utils(rpt)` is used to register the class with the UVM factory, enabling UVM's factory-based instantiation and configuration system.

Constructor (new):

verilog
Copy code
function new(string name="", uvm_component parent);
    super.new(name, parent);
endfunction
The constructor initializes the rpt component by calling the parent class (uvm_component) constructor using super.new(name, parent). This is required to give the component its UVM identity and link it to a parent, if applicable.

Task run:

verilog
Copy code
task run();
The run task in UVM components is executed automatically after the build phase during simulation. Here, the task generates several UVM report messages at different verbosity levels.

Report Message Example:

verilog
Copy code
uvm_report_info(get_full_name(), "info message : verbo level - UVM_NONE", UVM_NONE);
This line generates an informational message using the uvm_report_info function. The arguments include the name of the component (retrieved using get_full_name()), the message string, and the verbosity level (in this case, UVM_NONE). Each report message is logged with its associated verbosity level, which determines whether it will be displayed based on the component's verbosity setting.

Custom Verbosity Level (150):

verilog
Copy code
uvm_report_info(get_full_name(), "info message : verbo level - 150", 150);
This uses a custom verbosity level (150), which is between UVM_LOW (100) and UVM_MEDIUM (200). UVM allows custom verbosity values, offering flexibility for tailored message reporting.

Top Module:

verilog
Copy code
module top;
rpt rpt1;
rpt rpt2;
rpt rpt3;
rpt rpt4;
rpt rpt5;
rpt rpt6;
In the top module, six instances of the rpt class are created. Each instance is assigned a different verbosity level using:

verilog
Copy code
rpt1.set_report_verbosity_level(UVM_MEDIUM);
rpt2.set_report_verbosity_level(UVM_LOW);
rpt3.set_report_verbosity_level(UVM_NONE);
rpt4.set_report_verbosity_level(UVM_DEBUG);
rpt5.set_report_verbosity_level(UVM_FULL);
rpt6.set_report_verbosity_level(UVM_HIGH);
The verbosity setting controls the amount of information displayed during simulation. Higher verbosity levels (UVM_DEBUG, UVM_FULL) will display more detailed messages, while lower verbosity levels (UVM_LOW, UVM_NONE) will display fewer messages.

2. Pros of This UVM Reporting Approach:
Scalability: By allowing custom verbosity levels, the UVM reporting system is highly scalable. Different teams can use specific verbosity levels based on project complexity and simulation needs.
Flexibility: You can configure each component individually with different verbosity settings, tailoring the simulation output to your current debugging needs without flooding the log with unnecessary information.
Structured Output: UVM's built-in reporting system generates messages with clear structure, including simulation time, severity, and the originating component, making it easier to trace and debug issues.
Standardization: Using the UVM reporting system ensures that your testbench adheres to industry standards, promoting consistency across different projects and verification environments.
Customizability: The ability to define custom verbosity levels (e.g., 150 in your example) gives developers more control over what type of messages are displayed without being restricted to predefined UVM levels.
3. Cons of This UVM Reporting Approach:
Verbosity Overload: If you set the verbosity too high (like UVM_DEBUG), the simulation logs can quickly become overloaded with messages, making it difficult to find relevant information. Developers need to carefully choose the appropriate verbosity levels.
Performance Impact: High verbosity settings can slow down the simulation because of the overhead of generating, processing, and storing large numbers of messages.
Hard to Manage: Managing a large number of components, each with different verbosity levels, can become complex in larger systems, especially when debugging specific issues across multiple instances.
Potential for Confusion: Custom verbosity levels, like 150, can cause confusion if not well-documented, as they do not correspond directly to the predefined UVM levels. This may lead to inconsistent or hard-to-understand logs for others working on the project.
4. Applications of UVM Reporting and Verbosity:
Debugging: UVM verbosity settings are primarily used during simulation debugging. By controlling the verbosity level, engineers can get detailed information when debugging complex issues and suppress unnecessary information when the testbench is functioning well.
Regression Testing: In automated regression testing, verbosity settings can help identify failures without overloading logs. For example, critical information like errors and warnings are always logged, while detailed info or debug messages are turned off unless needed.
Performance Monitoring: UVM reports can be used to monitor the performance of specific components. By tracking specific messages or events during simulation, engineers can identify performance bottlenecks or optimize certain paths.
Documentation of Simulation Behavior: UVM report messages help in documenting the behavior of the testbench during simulation. This can be useful when writing verification plans or reports for stakeholders.
Prototyping and Early Development: During early testbench development, setting a higher verbosity level (like UVM_FULL or UVM_DEBUG) helps developers understand the internals of the system and verify if each component is behaving as expected.
Conclusion:
This UVM reporting example demonstrates how verbosity levels control the flow of information during simulation. While it provides powerful mechanisms to manage simulation outputs, users must be mindful of verbosity settings to avoid overwhelming logs and slowing down the verification process. By strategically choosing verbosity levels and understanding the trade-offs, verification engineers can effectively monitor and debug their testbenches.

UVM (Universal Verification Methodology) code that demonstrates the usage of UVM report messages with different verbosity levels. Let me break it down:

1. include "uvm_pkg.sv"
This line includes the UVM package. The UVM package contains all the necessary UVM classes and macros.

2. import uvm_pkg::*;
This imports all the symbols (classes, functions, tasks, macros) from the UVM package so that they can be used in this file.

3. class rpt extends uvm_component;
This defines a UVM component class named rpt. A uvm_component is a fundamental building block in UVM for testbench components.

4. \uvm_component_utils(rpt)`
This is a UVM macro that registers the class rpt with the UVM factory, enabling it to be created dynamically through the factory.

5. function new(string name="", uvm_component parent);
This is the constructor function for the rpt class. It takes a name and a parent component as arguments and passes them to the base class (uvm_component) constructor using super.new(name, parent).

6. task run();
The run task is an essential UVM task that executes when the component is started. In this case, it contains several UVM reporting commands for demonstration.

7. uvm_report_info and uvm_report_warning/uvm_report_error
These UVM functions print messages during the simulation. Each message has a verbosity level associated with it, which controls whether it will be printed based on the current verbosity setting of the component.

uvm_report_info(): Used to print information messages.
uvm_report_warning(): Prints a warning message.
uvm_report_error(): Prints an error message.
The parameters used are:

get_full_name(): This returns the hierarchical name of the component.
Message string: The second argument is the message that will be printed.
Verbosity level: The third argument is the verbosity level for the message. UVM defines levels like UVM_NONE, UVM_LOW, UVM_MEDIUM, etc., but a numeric value (like 150) can also be used.
__FILE__ and __LINE__: These macros specify the file and line number where the report is generated. This is useful for debugging.
8. module top;
This is the top-level module for the testbench. It instantiates three rpt objects (rpt1, rpt2, and rpt3).

9. initial begin
In the initial block, three instances of the rpt class are created with different names: rpt1, rpt2, and rpt3. The new function is called to instantiate them.

10. rpt1.set_report_verbosity_level(UVM_MEDIUM);
This sets the verbosity level for each component:

rpt1 is set to UVM_MEDIUM.
rpt2 is set to UVM_LOW.
rpt3 is set to UVM_NONE.
This means rpt1 will print messages with UVM_MEDIUM verbosity or lower, rpt2 will print messages with UVM_LOW verbosity or lower, and rpt3 will only print messages with UVM_NONE verbosity.

11. run_test();
This is a standard UVM command that triggers the execution of the UVM test.

Message Reporting Breakdown:
UVM_NONE: No output.
UVM_LOW: Low verbosity messages will be displayed (typically for errors and important information).
UVM_MEDIUM: More detailed messages will be displayed, including additional debug information.
Summary:
This code demonstrates how UVM reporting works. The rpt component prints different levels of messages, and the verbosity level controls what gets displayed. The three rpt instances (rpt1, rpt2, rpt3) are configured with different verbosity levels to show how verbosity filtering affects which messages are printed.

You said:
but 150 is equal to which verbosity
ChatGPT said:
ChatGPT
In UVM, verbosity levels are pre-defined as enumerated constants with specific integer values. Here's a list of common UVM verbosity levels and their associated integer values:

UVM_NONE = 0
UVM_LOW = 100
UVM_MEDIUM = 200
UVM_HIGH = 300
UVM_FULL = 400
UVM_DEBUG = 500
In your code, you used 150 as a custom verbosity level. It doesn't directly match one of the predefined verbosity levels but falls between UVM_LOW (100) and UVM_MEDIUM (200). This means that messages with verbosity 150 will be shown if the component's verbosity is set to 150 or higher (i.e., UVM_MEDIUM or above).

For example:

If a component's verbosity level is set to UVM_LOW, it will display messages with verbosity up to 100.
If the verbosity is set to UVM_MEDIUM, it will display messages with verbosity up to 200, which includes messages with the custom verbosity level of 150.
In this case, verbosity level 150 would act like a "mid-level" between UVM_LOW and UVM_MEDIUM.