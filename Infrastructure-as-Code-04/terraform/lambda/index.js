// index.js - AWS SDK v3 presigner
const { S3Client, GetObjectCommand } = require("@aws-sdk/client-s3");
const { getSignedUrl } = require("@aws-sdk/s3-request-presigner");

const region = process.env.AWS_REGION || "ap-south-1";
const BUCKET = process.env.MEDIA_BUCKET;
const s3 = new S3Client({ region });

exports.handler = async (event) => {
  console.log("Event:", JSON.stringify(event));
  try {
    const qs = event.queryStringParameters || {};
    const key = qs.key;
    if (!key) {
      return { statusCode: 400, body: JSON.stringify({ error: "Missing key parameter" }) };
    }
    if (!BUCKET) {
      return { statusCode: 500, body: JSON.stringify({ error: "MEDIA_BUCKET not configured" }) };
    }

    const cmd = new GetObjectCommand({ Bucket: BUCKET, Key: key });
    const url = await getSignedUrl(s3, cmd, { expiresIn: 300 }); // 5 minutes
    return {
      statusCode: 200,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ url })
    };
  } catch (err) {
    console.error("Error:", err);
    return { statusCode: 500, body: JSON.stringify({ error: "Internal Server Error", detail: String(err) }) };
  }
};
