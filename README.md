Nvidia SMI Exporter
---------------------
Another one nvidia-smi data exporter for Prometheus.

<img src="https://user-images.githubusercontent.com/418868/41509784-db9ee64a-7261-11e8-9bbb-556967876649.jpg" width="900">

```bash
> curl localhost:9454/ping
OK

> curl localhost:9454/metrics
nvidia_smi_driver_version 460.27.04
nvidia_smi_cuda_version 11.2
nvidia_smi_attached_gpus 2
nvidia_smi_product_name{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} GeForce GTX 1080
nvidia_smi_product_brand{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} GeForce
nvidia_smi_display_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Enabled
nvidia_smi_display_active{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Disabled
nvidia_smi_persistence_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Enabled
nvidia_smi_mig_devices{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} None
nvidia_smi_accounting_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Disabled
nvidia_smi_accounting_mode_buffer_size{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 4000
nvidia_smi_uuid{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} GPU-683c6e09-3969-31a5-b7ca-cc88252b7fce
nvidia_smi_minor_number{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_vbios_version{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 86.04.60.00.B4
nvidia_smi_multigpu_board{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} No
nvidia_smi_board_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0x100
nvidia_smi_inforom_version_img_version{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} G001.0000.01.04
nvidia_smi_inforom_version_oem_object{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1.1
nvidia_smi_gpu_virtualization_mode_virtualization_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} None
nvidia_smi_pci_pci_bus{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 01
nvidia_smi_pci_pci_device{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 00
nvidia_smi_pci_pci_domain{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0000
nvidia_smi_pci_pci_device_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1B8010DE
nvidia_smi_pci_pci_bus_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 00000000:01:00.0
nvidia_smi_pci_pci_sub_system_id{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 37021458
nvidia_smi_pci_pci_gpu_link_info_pcie_gen_max_link_gen{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 3
nvidia_smi_pci_pci_gpu_link_info_pcie_gen_current_link_gen{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 3
nvidia_smi_pci_pci_gpu_link_info_link_widths_max_link_width{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 16x
nvidia_smi_pci_pci_gpu_link_info_link_widths_current_link_width{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1x
nvidia_smi_pci_replay_counter{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 65535
nvidia_smi_pci_replay_rollover_counter{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_pci_tx_util_bytes_per_second{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 11264000
nvidia_smi_pci_rx_util_bytes_per_second{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 31744000
nvidia_smi_fan_speed_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0.53
nvidia_smi_performance_state{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} P2
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_gpu_idle{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_applications_clocks_setting{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_sw_power_cap{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_hw_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_hw_thermal_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_hw_power_brake_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_sync_boost{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_sw_thermal_slowdown{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_clocks_throttle_reasons_clocks_throttle_reason_display_clocks_setting{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Not Active
nvidia_smi_fb_memory_usage_total_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 8510242816
nvidia_smi_fb_memory_usage_used_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 3040870400
nvidia_smi_fb_memory_usage_free_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5469372416
nvidia_smi_bar1_memory_usage_total_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 268435456
nvidia_smi_bar1_memory_usage_used_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5242880
nvidia_smi_bar1_memory_usage_free_bytes{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 263192576
nvidia_smi_compute_mode{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Default
nvidia_smi_utilization_gpu_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1.0
nvidia_smi_utilization_memory_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1.0
nvidia_smi_utilization_encoder_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0.0
nvidia_smi_utilization_decoder_util_ratio{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0.0
nvidia_smi_encoder_stats_session_count{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_encoder_stats_average_fps{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_encoder_stats_average_latency{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_fbc_stats_session_count{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_fbc_stats_average_fps{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_fbc_stats_average_latency{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 0
nvidia_smi_temperature_gpu_temp_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 67.0
nvidia_smi_temperature_gpu_temp_max_threshold_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 96.0
nvidia_smi_temperature_gpu_temp_slow_threshold_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 93.0
nvidia_smi_temperature_gpu_target_temperature_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 83.0
nvidia_smi_supported_gpu_target_temp_gpu_target_temp_min_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 60.0
nvidia_smi_supported_gpu_target_temp_gpu_target_temp_max_celsius{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 92.0
nvidia_smi_power_readings_power_state{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} P2
nvidia_smi_power_readings_power_management{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} Supported
nvidia_smi_power_readings_power_draw_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 211.86
nvidia_smi_power_readings_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 216.0
nvidia_smi_power_readings_default_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 200.0
nvidia_smi_power_readings_enforced_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 216.0
nvidia_smi_power_readings_min_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 100.0
nvidia_smi_power_readings_max_power_limit_watts{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 216.0
nvidia_smi_clocks_graphics_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1784000000.0
nvidia_smi_clocks_sm_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1784000000.0
nvidia_smi_clocks_mem_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5514000000.0
nvidia_smi_clocks_video_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1594000000.0
nvidia_smi_max_clocks_graphics_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1999000000.0
nvidia_smi_max_clocks_sm_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1999000000.0
nvidia_smi_max_clocks_mem_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 5005000000.0
nvidia_smi_max_clocks_video_clock_hz{uuid="683c6e09-3969-31a5-b7ca-cc88252b7fce"} 1708000000.0
```

Caveats
=======

In XML mode (see below) the exporter skips all implicit arrays like this:

```xml
<supported_clocks>
  <supported_mem_clock>
    <value>3504 MHz</value>
    <supported_graphics_clock>1721 MHz</supported_graphics_clock> <== will skip all supported_graphics_clock
    <supported_graphics_clock>1708 MHz</supported_graphics_clock>
    <supported_graphics_clock>1695 MHz</supported_graphics_clock>
    <supported_graphics_clock>1683 MHz</supported_graphics_clock>
    <supported_graphics_clock>1670 MHz</supported_graphics_clock>
    <supported_graphics_clock>1657 MHz</supported_graphics_clock>
    <supported_graphics_clock>1645 MHz</supported_graphics_clock>
    <supported_graphics_clock>1632 MHz</supported_graphics_clock>
```

Also, it skips all empty and "N/A" values (and their keys accordingly).


Run in Docker
=============

`nvidia-smi` requires using the same versions of packages (`libnvidia-compute-460` and `nvidia-utils-460`) inside the container and outside (on the host).

1) Get driver version on the host:

    ```shell
    > dpkg --list | grep nvidia-driver-460
    ii  nvidia-driver-460                    460.27.04-0ubuntu1                    amd64        NVIDIA driver metapackage
    ```

2) Build container with appropriate version of driver:

    ```shell
    > docker build . --tag nvidia-smi-exporter --build-arg NVIDIA_VERSION=460.27.04-0ubuntu1
    ```

3) Run with `--privileged` flag (not recommended due to security)
    ```shell
    > docker run --rm --privileged -p 9454:9454 nvidia-smi-exporter
    ```
   
    or enumerating (map inside container) all devices explicitly

    ```shell
    > docker run --rm \
      --device /dev/nvidiactl:/dev/nvidiactl \
      --device /dev/nvidia0:/dev/nvidia0 \
      --device /dev/nvidia1:/dev/nvidia1 \
      -p 9454:9454 nvidia-smi-exporter
    ```

## Runtime parameters

There are several environment variables to setting runtime parameters:

- `NVIDIA_SMI_EXPORTER_BINARY` - path to nvidia-smi executive binary, default: `$(which nvidia-smi)`

- `NVIDIA_SMI_EXPORTER_PORT` - a port where the server will be started, default: `9454`

- `NVIDIA_SMI_EXPORTER_HOST` - a host where the server will be started, default: `0.0.0.0`

- `NVIDIA_SMI_EXPORTER_NAME_PREFIX` - prefix for every parameter name in output, default: `nvidia_smi_`

- `NVIDIA_SMI_EXPORTER_SOURCE` - source to processing - `xml` or `csv`, default: `xml`.
  

When `NVIDIA_SMI_EXPORTER_SOURCE` == `csv`:

- `NVIDIA_SMI_EXPORTER_QUERY` - comma-separated list to query parameters from nvidia-smi, default: `clocks.current.graphics,clocks.current.memory,clocks.current.sm,clocks.current.video,clocks.max.graphics,clocks.max.memory,clocks.max.sm,fan.speed,memory.total,memory.used,power.draw,power.limit,temperature.gpu,utilization.gpu,utilization.memory`
