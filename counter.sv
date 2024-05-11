module counter(input clk, up_down, rst, output logic [3:0] count);
  
  always @(posedge clk)
    begin
      if(!rst) begin
        count <= 4'd0;
      end
      else 
        begin
          if(up_down)
            count = count +1'b1;
          else
            count = count - 1'b1;
        end
    end
endmodule
