module Elevador(
input BD1, BF1, BD2, BF2, BD3, BF3,clock, 
output reg sobe, desce);



reg [1:0] state_now, state_b4;

parameter Hold = 0,S1 = 1, S2 = 2, S3 = 3;

always@(*) begin
 	case(state_now)	
		S1: begin
			if(state_b4 == S2||state_b4 == S3) begin
				sobe = 0;
				desce = 1;
				end	
			else begin
				sobe = 0;
				desce = 0;
				end	
			end	
		S2: begin
			if(state_b4 == S1 || state_b4 == Hold)begin
				sobe = 1;
				desce = 0;
				end
			if(state_b4 == S3)begin
				sobe = 0;
				desce = 1;			
			    end
			 if(state_b4 == S2)begin
				sobe = 0;
				desce = 0;
				end
			end
		S3: begin
			if(state_b4 == S1 || state_b4 == S2 || state_b4 == Hold)begin
				sobe = 1;
				desce = 0;
				end
			else begin 
				sobe = 0;
				desce = 0;
				end
			end	
		endcase
	end

always@(*) begin
		case(state_now)
			
			Hold:begin
				if((BD1&&BF1&&BD2&&BF2&&BD3&&BF3) == 1)
				state_now = Hold;
				
				if(BD1 == 0 || BF1 == 0)begin
					state_now = S1;
					state_b4 = Hold;
				end
				if(BD2 == 0 || BF2 == 0)begin
					state_now = S2;
					state_b4 = Hold;
				end
				if(BD3 == 0 || BF3 == 0)begin
					state_now = S3;
					state_b4 = Hold;
				end
			end	
			S1: begin
				if(BD1 == 0 || BF1 == 0)begin
					state_now = S1;
					state_b4 = S1;
				end
				if(BD2 == 0 || BF2 == 0)begin
					state_now = S2;
					state_b4 = S1;
				end
				if(BD3 == 0 || BF3 == 0)begin
					state_now = S3;
					state_b4 = S1;
				end
			end	
			S2: begin
				if(BD1 == 0 || BF1 == 0)begin
					state_now = S1;
					state_b4 = S2;
				end
				if(BD2 == 0 || BF2 == 0)begin
					state_now = S2;
					state_b4 = S2;
				end
				if(BD3 == 0 || BF3 == 0)begin
					state_now = S3;
					state_b4 = S2;
				end
			end		
			S3: begin
				if(BD1 == 0 || BF1 == 0)begin
					state_now = S1;
					state_b4 = S3;
				end
				if(BD2 == 0 || BF2 == 0)begin
					state_now = S2;
					state_b4 = S3;
				end
				if(BD3 == 0 || BF3 == 0)begin
					state_now = S3;
					state_b4 = S3;
				end
			end				
	 endcase	
 end 
endmodule 
