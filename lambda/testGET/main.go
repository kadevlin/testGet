package main

import (
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"log"

	"fmt"
)

// Handler function Using AWS Lambda Proxy Request
func Handler(request events.ALBTargetGroupRequest) (events.ALBTargetGroupResponse, error) {

	message := fmt.Sprintf(" { \"Message\" : \"Hello World \" } ")

	log.Printf(fmt.Sprintf("%v", request))

	log.Printf("In Lambda")

	return events.ALBTargetGroupResponse{
		Headers:    map[string]string{"content-type": `application/json`},
		Body:       message,
		StatusCode: 200,
	}, nil

}

func main() {
	lambda.Start(Handler)
}
