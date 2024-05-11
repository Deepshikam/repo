module fifo #
(
parameter DEPTH = 16,
parameter DATA_WIDTH = 8
)
(
input clk,
input reset,
input push,
input pop,
input [DATA_WIDTH-1:0] data_in,
output reg [DATA_WIDTH-1:0] data_out,
output reg full,
output reg empty
);
reg [DATA_WIDTH-1:0] fifo[DEPTH-1:0];
reg [DATA_WIDTH-1:0] data_out_reg;
reg [4:0] head = 0;
reg [4:0] tail = 0;
reg [4:0] depth_count = 0;
always @(posedge clk or posedge reset) begin
if (reset) begin
head = 0;
tail = 0;
depth_count = 0;
full = 0;
empty = 1;
end else begin
if (push && !full) begin
fifo[head] = data_in;
head = head + 1;
depth_count = depth_count + 1;
if (head == tail) begin
full = 1;
end
empty = 0;
end
if (pop && !empty) begin
data_out_reg = fifo[tail];
tail = tail + 1;
depth_count = depth_count - 1;
if (tail == head) begin
empty = 1;
end
full = 0;
end
end
end
assign data_out = data_out_reg;
endmodule
