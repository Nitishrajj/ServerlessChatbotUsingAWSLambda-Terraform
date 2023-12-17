import json
from webexteamssdk import WebexTeamsAPI
WEBEX_BOT_TOKEN = "Your_webex_access_token"

def lambda_handler(event, context):
    res = "hi"
    # TODO implement
    print("executing")
    api = WebexTeamsAPI(access_token=WEBEX_BOT_TOKEN)
    api.messages.create(toPersonEmail="your_mail_id.cisco",text = res)
    api.messages.create(roomId="your_space_ID",text = res)

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }