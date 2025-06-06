# Variables
$ApiUrl = "http://localhost:7071/api/VolatileFileHandler/triggers/When_a_HTTP_request_is_received/invoke?api-version=2022-05-01&sp=%2Ftriggers%2FWhen_a_HTTP_request_is_received%2Frun&sv=1.0&sig=fxY8DCQMNqa6L5g2lzIjV1cm790JiFV_H6DG64PhXe0"
#$FilePath = "C:\src\Logic-App-Agent-Loop\AiAgentPoc\AiAgentDemo\TestFiles\StandardSchema\Sample1.txt"
#$FilePath = "C:\src\Logic-App-Agent-Loop\AiAgentPoc\AiAgentDemo\TestFiles\MinimalSchema\MinimalSample1.txt"
#$FilePath = "C:\src\Logic-App-Agent-Loop\AiAgentPoc\AiAgentDemo\TestFiles\ExtendedSchema\ExtendedSample1.txt"
$FilePath = "C:\src\Logic-App-Agent-Loop\AiAgentPoc\AiAgentDemo\TestFiles\AggregatedSchema\AggregatedSample1.txt"
# Base64 encode the file
$EncodedContent = [Convert]::ToBase64String([IO.File]::ReadAllBytes($FilePath))

# Create the JSON payload
$JsonPayload = @{
    RawFileContent = $EncodedContent
} | ConvertTo-Json -Depth 1

# Make the POST request
Invoke-RestMethod -Uri $ApiUrl -Method Post -ContentType "application/json" -Body $JsonPayload