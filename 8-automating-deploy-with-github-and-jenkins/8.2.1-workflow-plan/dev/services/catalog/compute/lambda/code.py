import json
import urllib.parse
import boto3
import datetime
from datetime import datetime

dynamodb = boto3.client('dynamodb')

def lambda_handler(event, context):
    # Get the object from the event and show its content type
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')

    data = dynamodb.put_item(
        TableName='catalog',
        Item={
            'ImageId': {
              'S': bucket + '/' + key
            },
            'LastUpdatedTime': {
              'S': datetime.utcnow().isoformat()
            }
        }
      )

    response = {
          'statusCode': 200,
          'body': 'successfully created item!',
          'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
          },
      }

    return response
