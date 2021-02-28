NVidia SMI Exporter
---------------------
Another one nvidia-smi data exporter for Prometheus. Now with GPU UUIDs.

<img src="https://user-images.githubusercontent.com/418868/41509784-db9ee64a-7261-11e8-9bbb-556967876649.jpg" width="900">

```bash
curl localhost:9454/ping
OK
curl localhost:9454/metrics
nvidia_smi_clocks_current_graphics_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 1974000000
nvidia_smi_clocks_current_memory_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 5130000000
nvidia_smi_clocks_current_sm_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 1974000000
nvidia_smi_clocks_current_video_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 1771000000
nvidia_smi_clocks_max_graphics_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 1999000000
nvidia_smi_clocks_max_memory_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 5005000000
nvidia_smi_clocks_max_sm_hz{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 1999000000
nvidia_smi_fan_speed{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 0.63
nvidia_smi_memory_total_bytes{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 8513388544
nvidia_smi_memory_used_bytes{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 790626304
nvidia_smi_power_draw_watts{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 65.27
nvidia_smi_power_limit_watts{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 216.0
nvidia_smi_temperature_gpu_celsius{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 71
nvidia_smi_utilization_gpu{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 0.0
nvidia_smi_utilization_memory{uuid="842ab6f5-3678-470d-b573-701a545a8ec1"} 0.0
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


How to run
==========

Build image 
```bash
docker build --tag nvidia-smi-exporter .
```

Run container
```bash
docker run --rm --privileged -p 9454:9454 nvidia-smi-exporter
```

If case you don't want to use `--privileged` option you should use `--device` option to expose `/dev/nvidiactl` and `/dev/nvidia0`, `/dev/nvidia1`, etc (all GPU what you need to monitoring) into docker container

```bash
docker run --rm \
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

- `NVIDIA_SMI_EXPORTER_MODE` - source to processing - `xml` or `csv`, default: `xml`.
  For `NVIDIA_SMI_EXPORTER_MODE` == `csv`:

    - `NVIDIA_SMI_EXPORTER_QUERY` - comma-separated list of query parameters to nvidia-smi, default: `clocks.current.graphics,clocks.current.memory,clocks.current.sm,clocks.current.video,clocks.max.graphics,clocks.max.memory,clocks.max.sm,fan.speed,memory.total,memory.used,power.draw,power.limit,temperature.gpu,utilization.gpu,utilization.memory`
