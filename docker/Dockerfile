FROM python:3.11-alpine

# Install ffmpeg and bash
RUN apk add --no-cache ffmpeg bash

# Set working directory
WORKDIR /workspace

# Install python packages (utilizing pre-compiled wheels for Python 3.11)
RUN pip install --no-cache-dir \
    fastapi \
    uvicorn \
    pydantic \
    kubernetes

# Copy source code
COPY src/ /workspace/src/

# Expose FastAPI port
EXPOSE 8000

# Default entrypoint
ENTRYPOINT []
CMD ["uvicorn", "src.api.main:app", "--host", "0.0.0.0", "--port", "8000"]