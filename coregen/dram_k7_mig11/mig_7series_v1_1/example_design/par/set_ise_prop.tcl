project new test.xise

project set "Device Family" "kintex7"

project set "Device" "xc7k325t"

project set "Package" "fbg900"

project set "Speed Grade" "-1"

project set "Synthesis Tool" "XST (VHDL/Verilog)"

project set "Simulator" "Modelsim-SE Mixed"

xfile add "../rtl/traffic_gen/afifo.v"
xfile add "../rtl/traffic_gen/cmd_gen.v"
xfile add "../rtl/traffic_gen/cmd_prbs_gen.v"
xfile add "../rtl/traffic_gen/data_prbs_gen.v"
xfile add "../rtl/traffic_gen/init_mem_pattern_ctr.v"
xfile add "../rtl/traffic_gen/memc_flow_vcontrol.v"
xfile add "../rtl/traffic_gen/memc_traffic_gen.v"
xfile add "../rtl/traffic_gen/rd_data_gen.v"
xfile add "../rtl/traffic_gen/read_data_path.v"
xfile add "../rtl/traffic_gen/read_posted_fifo.v"
xfile add "../rtl/traffic_gen/s7ven_data_gen.v"
xfile add "../rtl/traffic_gen/tg_prbs_gen.v"
xfile add "../rtl/traffic_gen/tg_status.v"
xfile add "../rtl/traffic_gen/traffic_gen_top.v"
xfile add "../rtl/traffic_gen/vio_init_pattern_bram.v"
xfile add "../rtl/traffic_gen/wr_data_gen.v"
xfile add "../rtl/traffic_gen/write_data_path.v"
xfile add "../rtl/example_top.v"
xfile add "../../user_design/rtl/clocking/clk_ibuf.v"
xfile add "../../user_design/rtl/clocking/infrastructure.v"
xfile add "../../user_design/rtl/clocking/iodelay_ctrl.v"
xfile add "../../user_design/rtl/controller/arb_mux.v"
xfile add "../../user_design/rtl/controller/arb_row_col.v"
xfile add "../../user_design/rtl/controller/arb_select.v"
xfile add "../../user_design/rtl/controller/bank_cntrl.v"
xfile add "../../user_design/rtl/controller/bank_common.v"
xfile add "../../user_design/rtl/controller/bank_compare.v"
xfile add "../../user_design/rtl/controller/bank_mach.v"
xfile add "../../user_design/rtl/controller/bank_queue.v"
xfile add "../../user_design/rtl/controller/bank_state.v"
xfile add "../../user_design/rtl/controller/col_mach.v"
xfile add "../../user_design/rtl/controller/mc.v"
xfile add "../../user_design/rtl/controller/rank_cntrl.v"
xfile add "../../user_design/rtl/controller/rank_common.v"
xfile add "../../user_design/rtl/controller/rank_mach.v"
xfile add "../../user_design/rtl/controller/round_robin_arb.v"
xfile add "../../user_design/rtl/ecc/ecc_buf.v"
xfile add "../../user_design/rtl/ecc/ecc_dec_fix.v"
xfile add "../../user_design/rtl/ecc/ecc_gen.v"
xfile add "../../user_design/rtl/ecc/ecc_merge_enc.v"
xfile add "../../user_design/rtl/ip_top/mem_intfc.v"
xfile add "../../user_design/rtl/ip_top/memc_ui_top_std.v"
xfile add "../../user_design/rtl/phy/byte_group_io.v"
xfile add "../../user_design/rtl/phy/byte_lane.v"
xfile add "../../user_design/rtl/phy/calib_top.v"
xfile add "../../user_design/rtl/phy/mc_phy.v"
xfile add "../../user_design/rtl/phy/mc_phy_wrapper.v"
xfile add "../../user_design/rtl/phy/phy_4lanes.v"
xfile add "../../user_design/rtl/phy/phy_dqs_found_cal.v"
xfile add "../../user_design/rtl/phy/phy_init.v"
xfile add "../../user_design/rtl/phy/phy_rdlvl.v"
xfile add "../../user_design/rtl/phy/phy_top.v"
xfile add "../../user_design/rtl/phy/phy_wrcal.v"
xfile add "../../user_design/rtl/phy/phy_wrlvl.v"
xfile add "../../user_design/rtl/phy/prbs_gen.v"
xfile add "../../user_design/rtl/ui/ui_cmd.v"
xfile add "../../user_design/rtl/ui/ui_rd_data.v"
xfile add "../../user_design/rtl/ui/ui_top.v"
xfile add "../../user_design/rtl/ui/ui_wr_data.v"
xfile add "../../user_design/rtl/mig_7series_v1_1.v"

xfile add "example_top.ucf"

project set "Library Search Order" "../synth/example_top.lso" -process "Synthesize - XST"

project close
