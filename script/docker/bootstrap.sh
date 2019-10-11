docker-compose build
docker run -dit --name tamura.ryo_Pixel2Mesh --gpus all -v "workspace:/home/tamura.ryo/workspace" -p 50045:22 Pixel2Mesh