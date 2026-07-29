package main

import (
    "context"
    "log"
    "time"

    "google.golang.org/grpc"
    "google.golang.org/grpc/credentials/insecure"
    pb "go-gateway/proto"
)

func main() {
    conn, err := grpc.Dial("localhost:50051", grpc.WithTransportCredentials(insecure.NewCredentials()))
    if err != nil {
        log.Fatalf("Failed to connect: %v", err)
    }
    defer conn.Close()

    client := pb.NewCoreEngineServiceClient(conn)

    ctx, cancel := context.WithTimeout(context.Background(), time.Second*10)
    defer cancel()

    stream, err := client.StreamMetrics(ctx, &pb.EmptyRequest{})
    if err != nil {
        log.Fatalf("Error calling StreamMetrics: %v", err)
    }

    log.Println("🟢 Connected to Rust Core Engine from Go Gateway")

    for {
        metrics, err := stream.Recv()
        if err != nil {
            log.Printf("Stream finished or error: %v", err)
            break
        }
        log.Printf("📥 Received Metrics -> Status: %s | Load: %.2f%% | Temp: %.2f°C", 
            metrics.Status, metrics.SystemLoad, metrics.Temperature)
    }
}
