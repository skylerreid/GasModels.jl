@testset "Direction of Compressors" begin
    @testset "Base Model" begin
        @info "Testing base model"
        result = solve_gf("../test/data/matgas/direction.m", CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf("../test/data/matgas/direction.m", DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf("../test/data/matgas/direction.m", WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf("../test/data/matgas/direction.m", LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf("../test/data/matgas/direction.m", LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
    end

    @testset "Compressor direction" begin
        @info "Testing compressor direction"

        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 0
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL

        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 1
        data["compressor"]["20"]["directionality"] = 0
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL

        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 0
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE

        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 1
        data["compressor"]["20"]["directionality"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 2
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 1
        data["compressor"]["20"]["directionality"] = 2
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 2
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        # reversing direction of compressor

        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 0
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 0
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 1
        data["compressor"]["20"]["directionality"] = 0
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 1
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 1
        data["compressor"]["20"]["directionality"] = 1
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 1
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 2
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        data["junction"]["22"]["p_min"] = 3000000
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 0
        data["compressor"]["20"]["directionality"] = 2
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = 1
        data["compressor"]["20"]["directionality"] = 2
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE


        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 2
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        data["junction"]["22"]["p_min"] = 3000000
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == LOCALLY_SOLVED || result["termination_status"] == OPTIMAL



        data = GasModels.parse_file("../test/data/matgas/direction.m"; skip_correct=true)
        data["compressor"]["20"]["flow_direction"] = -1
        data["compressor"]["20"]["directionality"] = 2
        data["compressor"]["20"]["fr_junction"] = 22
        data["compressor"]["20"]["to_junction"] = 1
        GasModels.correct_network_data!(data)
        result = solve_gf(data, CRDWPGasModel, misocp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, DWPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, WPGasModel, minlp_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRDWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
        result = solve_gf(data, LRWPGasModel, mip_solver)
        @test result["termination_status"] == INFEASIBLE || result["termination_status"] == LOCALLY_INFEASIBLE
    end
end
