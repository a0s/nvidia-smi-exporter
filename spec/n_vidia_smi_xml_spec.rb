RSpec.describe NVidiaSMI_XML do
  subject { described_class.new(binary_path: nil, name_prefix: 'rspec_') }

  context 'nvidia-smi-3.xml' do
    let(:result) do
      <<~EOS
        rspec_driver_version 460.27.04
        rspec_cuda_version 11.2
        rspec_attached_gpus 2
        rspec_product_name{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} GeForce GTX 1080
        rspec_product_name{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} GeForce GTX 1080
        rspec_product_brand{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} GeForce
        rspec_product_brand{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} GeForce
        rspec_display_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Enabled
        rspec_display_mode{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Disabled
        rspec_display_active{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Disabled
        rspec_display_active{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Disabled
        rspec_persistence_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Enabled
        rspec_persistence_mode{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Enabled
        rspec_mig_devices{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} None
        rspec_mig_devices{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} None
        rspec_accounting_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Disabled
        rspec_accounting_mode{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Disabled
        rspec_accounting_mode_buffer_size{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 4000
        rspec_accounting_mode_buffer_size{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 4000
        rspec_uuid{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} GPU-683c6e09-3969-31a5-b7ca-cc88252b7fce
        rspec_uuid{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} GPU-90e3dab0-b59d-8bf6-d909-d4fab8d2f29b
        rspec_minor_number{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_minor_number{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1
        rspec_vbios_version{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 86.04.60.00.B4
        rspec_vbios_version{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 86.04.60.00.BD
        rspec_multigpu_board{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} No
        rspec_multigpu_board{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} No
        rspec_board_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0x100
        rspec_board_id{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0x300
        rspec_inforom_version_img_version{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} G001.0000.01.04
        rspec_inforom_version_img_version{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} G001.0000.01.04
        rspec_inforom_version_oem_object{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1.1
        rspec_inforom_version_oem_object{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1.1
        rspec_gpu_virtualization_mode_virtualization_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} None
        rspec_gpu_virtualization_mode_virtualization_mode{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} None
        rspec_pci_pci_bus{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 01
        rspec_pci_pci_bus{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 03
        rspec_pci_pci_device{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 00
        rspec_pci_pci_device{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 00
        rspec_pci_pci_domain{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0000
        rspec_pci_pci_domain{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0000
        rspec_pci_pci_device_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1B8010DE
        rspec_pci_pci_device_id{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1B8010DE
        rspec_pci_pci_bus_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 00000000:01:00.0
        rspec_pci_pci_bus_id{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 00000000:03:00.0
        rspec_pci_pci_sub_system_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 37021458
        rspec_pci_pci_sub_system_id{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 37171458
        rspec_pci_pci_gpu_link_info_pcie_gen_max_link_gen{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 3
        rspec_pci_pci_gpu_link_info_pcie_gen_max_link_gen{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 3
        rspec_pci_pci_gpu_link_info_pcie_gen_current_link_gen{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 3
        rspec_pci_pci_gpu_link_info_pcie_gen_current_link_gen{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 3
        rspec_pci_pci_gpu_link_info_link_widths_max_link_width{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 16x
        rspec_pci_pci_gpu_link_info_link_widths_max_link_width{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 16x
        rspec_pci_pci_gpu_link_info_link_widths_current_link_width{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1x
        rspec_pci_pci_gpu_link_info_link_widths_current_link_width{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1x
        rspec_pci_replay_counter{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 65535
        rspec_pci_replay_counter{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 552
        rspec_pci_replay_rollover_counter{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_pci_replay_rollover_counter{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_pci_tx_util_bytes_per_second{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 11264000
        rspec_pci_tx_util_bytes_per_second{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 11264000
        rspec_pci_rx_util_bytes_per_second{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 31744000
        rspec_pci_rx_util_bytes_per_second{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 31744000
        rspec_fan_speed_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0.53
        rspec_fan_speed_ratio{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0.58
        rspec_performance_state{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} P2
        rspec_performance_state{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} P2
        rspec_clocks_throttle_reasons_clocks_throttle_reason_gpu_idle{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_gpu_idle{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_applications_clocks_setting{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_applications_clocks_setting{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sw_power_cap{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sw_power_cap{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_slowdown{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_thermal_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_thermal_slowdown{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_power_brake_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_power_brake_slowdown{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sync_boost{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sync_boost{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sw_thermal_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sw_thermal_slowdown{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_display_clocks_setting{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_display_clocks_setting{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Not Active
        rspec_fb_memory_usage_total_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 8510242816
        rspec_fb_memory_usage_total_bytes{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 8513388544
        rspec_fb_memory_usage_used_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 3040870400
        rspec_fb_memory_usage_used_bytes{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 3033530368
        rspec_fb_memory_usage_free_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5469372416
        rspec_fb_memory_usage_free_bytes{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 5479858176
        rspec_bar1_memory_usage_total_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 268435456
        rspec_bar1_memory_usage_total_bytes{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 268435456
        rspec_bar1_memory_usage_used_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5242880
        rspec_bar1_memory_usage_used_bytes{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 5242880
        rspec_bar1_memory_usage_free_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 263192576
        rspec_bar1_memory_usage_free_bytes{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 263192576
        rspec_compute_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Default
        rspec_compute_mode{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Default
        rspec_utilization_gpu_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1.0
        rspec_utilization_gpu_util_ratio{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1.0
        rspec_utilization_memory_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1.0
        rspec_utilization_memory_util_ratio{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1.0
        rspec_utilization_encoder_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0.0
        rspec_utilization_encoder_util_ratio{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0.0
        rspec_utilization_decoder_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0.0
        rspec_utilization_decoder_util_ratio{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0.0
        rspec_encoder_stats_session_count{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_encoder_stats_session_count{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_encoder_stats_average_fps{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_encoder_stats_average_fps{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_encoder_stats_average_latency{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_encoder_stats_average_latency{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_fbc_stats_session_count{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_fbc_stats_session_count{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_fbc_stats_average_fps{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_fbc_stats_average_fps{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_fbc_stats_average_latency{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
        rspec_fbc_stats_average_latency{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 0
        rspec_temperature_gpu_temp_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 67.0
        rspec_temperature_gpu_temp_celsius{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 70.0
        rspec_temperature_gpu_temp_max_threshold_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 96.0
        rspec_temperature_gpu_temp_max_threshold_celsius{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 96.0
        rspec_temperature_gpu_temp_slow_threshold_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 93.0
        rspec_temperature_gpu_temp_slow_threshold_celsius{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 93.0
        rspec_temperature_gpu_target_temperature_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 83.0
        rspec_temperature_gpu_target_temperature_celsius{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 83.0
        rspec_supported_gpu_target_temp_gpu_target_temp_min_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 60.0
        rspec_supported_gpu_target_temp_gpu_target_temp_min_celsius{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 60.0
        rspec_supported_gpu_target_temp_gpu_target_temp_max_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 92.0
        rspec_supported_gpu_target_temp_gpu_target_temp_max_celsius{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 92.0
        rspec_power_readings_power_state{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} P2
        rspec_power_readings_power_state{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} P2
        rspec_power_readings_power_management{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Supported
        rspec_power_readings_power_management{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} Supported
        rspec_power_readings_power_draw_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 211.86
        rspec_power_readings_power_draw_watts{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 211.06
        rspec_power_readings_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 216.0
        rspec_power_readings_power_limit_watts{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 216.0
        rspec_power_readings_default_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 200.0
        rspec_power_readings_default_power_limit_watts{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 200.0
        rspec_power_readings_enforced_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 216.0
        rspec_power_readings_enforced_power_limit_watts{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 216.0
        rspec_power_readings_min_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 100.0
        rspec_power_readings_min_power_limit_watts{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 100.0
        rspec_power_readings_max_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 216.0
        rspec_power_readings_max_power_limit_watts{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 216.0
        rspec_clocks_graphics_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1784000000.0
        rspec_clocks_graphics_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1657000000.0
        rspec_clocks_sm_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1784000000.0
        rspec_clocks_sm_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1657000000.0
        rspec_clocks_mem_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5514000000.0
        rspec_clocks_mem_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 5514000000.0
        rspec_clocks_video_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1594000000.0
        rspec_clocks_video_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1480000000.0
        rspec_max_clocks_graphics_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1999000000.0
        rspec_max_clocks_graphics_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1936000000.0
        rspec_max_clocks_sm_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1999000000.0
        rspec_max_clocks_sm_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1936000000.0
        rspec_max_clocks_mem_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5005000000.0
        rspec_max_clocks_mem_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 5005000000.0
        rspec_max_clocks_video_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1708000000.0
        rspec_max_clocks_video_clock_hz{uuid="90e3dab0-b59d-8bf6-d909-d4fab8d2f29b"} 1708000000.0
      EOS
    end

    it do
      hash = subject.parse(fixture_load('nvidia-smi-3.xml'))
      expect(subject.format_prometheus(hash)).to eq(result)
    end
  end

  context 'nvidia-smi-4.xml' do
    let(:result) do
      <<~EOS
        rspec_driver_version 418.56
        rspec_cuda_version 10.1
        rspec_attached_gpus 1
        rspec_product_name{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Quadro P2000
        rspec_product_brand{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Quadro
        rspec_display_mode{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Disabled
        rspec_display_active{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Disabled
        rspec_persistence_mode{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Disabled
        rspec_accounting_mode{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Disabled
        rspec_accounting_mode_buffer_size{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 4000
        rspec_serial{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0324217004816
        rspec_uuid{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} GPU-1ffe36ef-ac55-60ad-f9cf-623871e7736d
        rspec_minor_number{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_vbios_version{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 86.06.3F.00.0D
        rspec_multigpu_board{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} No
        rspec_board_id{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0x400
        rspec_gpu_part_number{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 900-5G410-1700-000
        rspec_inforom_version_img_version{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} G410.0502.00.02
        rspec_inforom_version_oem_object{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1.1
        rspec_gpu_virtualization_mode_virtualization_mode{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} None
        rspec_pci_pci_bus{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 04
        rspec_pci_pci_device{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 00
        rspec_pci_pci_domain{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0000
        rspec_pci_pci_device_id{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1C3010DE
        rspec_pci_pci_bus_id{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 00000000:04:00.0
        rspec_pci_pci_sub_system_id{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 11B310DE
        rspec_pci_pci_gpu_link_info_pcie_gen_max_link_gen{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 3
        rspec_pci_pci_gpu_link_info_pcie_gen_current_link_gen{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 3
        rspec_pci_pci_gpu_link_info_link_widths_max_link_width{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 16x
        rspec_pci_pci_gpu_link_info_link_widths_current_link_width{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 16x
        rspec_pci_replay_counter{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_pci_replay_rollover_counter{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_pci_tx_util_bytes_per_second{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_pci_rx_util_bytes_per_second{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_fan_speed_ratio{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0.61
        rspec_performance_state{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} P0
        rspec_clocks_throttle_reasons_clocks_throttle_reason_gpu_idle{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_applications_clocks_setting{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sw_power_cap{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_slowdown{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_thermal_slowdown{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_hw_power_brake_slowdown{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sync_boost{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_sw_thermal_slowdown{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_clocks_throttle_reasons_clocks_throttle_reason_display_clocks_setting{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Not Active
        rspec_fb_memory_usage_total_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 5304745984
        rspec_fb_memory_usage_used_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 334495744
        rspec_fb_memory_usage_free_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 4970250240
        rspec_bar1_memory_usage_total_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 268435456
        rspec_bar1_memory_usage_used_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 2097152
        rspec_bar1_memory_usage_free_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 266338304
        rspec_compute_mode{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Default
        rspec_utilization_gpu_util_ratio{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0.0
        rspec_utilization_memory_util_ratio{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0.0
        rspec_utilization_encoder_util_ratio{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0.0
        rspec_utilization_decoder_util_ratio{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0.0
        rspec_encoder_stats_session_count{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_encoder_stats_average_fps{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_encoder_stats_average_latency{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_fbc_stats_session_count{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_fbc_stats_average_fps{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_fbc_stats_average_latency{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 0
        rspec_temperature_gpu_temp_celsius{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 62.0
        rspec_temperature_gpu_temp_max_threshold_celsius{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 104.0
        rspec_temperature_gpu_temp_slow_threshold_celsius{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 101.0
        rspec_power_readings_power_state{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} P0
        rspec_power_readings_power_management{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} Supported
        rspec_power_readings_power_draw_watts{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 20.32
        rspec_power_readings_power_limit_watts{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 75.0
        rspec_power_readings_default_power_limit_watts{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 75.0
        rspec_power_readings_enforced_power_limit_watts{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 75.0
        rspec_power_readings_min_power_limit_watts{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 75.0
        rspec_power_readings_max_power_limit_watts{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 75.0
        rspec_clocks_graphics_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1215000000.0
        rspec_clocks_sm_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1215000000.0
        rspec_clocks_mem_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 3499000000.0
        rspec_clocks_video_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1101000000.0
        rspec_applications_clocks_graphics_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1075000000.0
        rspec_applications_clocks_mem_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 3504000000.0
        rspec_default_applications_clocks_graphics_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1075000000.0
        rspec_default_applications_clocks_mem_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 3504000000.0
        rspec_max_clocks_graphics_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1721000000.0
        rspec_max_clocks_sm_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1721000000.0
        rspec_max_clocks_mem_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 3504000000.0
        rspec_max_clocks_video_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1556000000.0
        rspec_max_customer_boost_clocks_graphics_clock_hz{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 1721000000.0
        rspec_processes_process_info_pid{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 7134
        rspec_processes_process_info_type{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} C
        rspec_processes_process_info_process_name{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} /usr/lib/plexmediaserver/Plex Transcoder
        rspec_processes_process_info_used_memory_bytes{uuid="1ffe36ef-ac55-60ad-f9cf-623871e7736d"} 324009984
      EOS
    end

    it do
      hash = subject.parse(fixture_load('nvidia-smi-4.xml'))
      expect(subject.format_prometheus(hash)).to eq(result)
    end
  end
end
