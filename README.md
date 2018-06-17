```bash
docker build --tag nvidia-smi-exporter .
docker run --rm \
    -p 9451:9451 \
    --mount type=bind,src="$(which nvidia-smi)",dst=/usr/bin/nvidia-smi \
    -e NVIDIA_SMI_EXPORTER_PORT=9451 \
    -e NVIDIA_SMI_EXPORTER_QUERY=memory.used,memory.total \
    -e NVIDIA_SMI_EXPORTER_BINARY=/usr/bin/nvidia-smi \
    --name nvidia-smi-exporter \
    nvidia-smi-exporter
```
