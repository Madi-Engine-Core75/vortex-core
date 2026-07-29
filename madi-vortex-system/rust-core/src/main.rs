use tonic::{transport::Server, Request, Response, Status};
use tokio::time::{sleep, Duration};
use telemetry::core_engine_service_server::{CoreEngineService, CoreEngineServiceServer};
use telemetry::{EngineMetrics, EmptyRequest};

pub mod telemetry {
    include!(concat!(env!("OUT_DIR"), "/telemetry.rs"));
}

#[derive(Default)]
pub struct EngineService {}

#[tonic::async_trait]
impl CoreEngineService for EngineService {
    type StreamMetricsStream = tokio_stream::wrappers::ReceiverStream<Result<EngineMetrics, Status>>;

    async fn stream_metrics(
        &self,
        _request: Request<EmptyRequest>,
    ) -> Result<Response<Self::StreamMetricsStream>, Status> {
        let (tx, rx) = tokio::sync::mpsc::channel(128);

        tokio::spawn(async move {
            let mut load = 12.4;
            let mut temp = 39.1;

            loop {
                load = (load + (fastrand::f64() * 2.0 - 1.0)).clamp(5.0, 95.0);
                temp = (temp + (fastrand::f64() * 0.4 - 0.2)).clamp(35.0, 75.0);

                let metrics = EngineMetrics {
                    status: "ONLINE".to_string(),
                    latency: 14.2,
                    system_load: load,
                    temperature: temp,
                    vortex_rpm: 3200.0,
                    vortex_clock: 4.8,
                    active_threads: 128,
                };

                if tx.send(Ok(metrics)).await.is_err() {
                    break;
                }
                sleep(Duration::from_millis(1200)).await;
            }
        });

        Ok(Response::new(tokio_stream::wrappers::ReceiverStream::new(rx)))
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let addr = "[::1]:50051".parse()?;
    let service = EngineService::default();

    println!("⚡ Rust Core Engine running on port 50051");
    Server::builder()
        .add_service(CoreEngineServiceServer::new(service))
        .serve(addr)
        .await?;

    Ok(())
}
