import mongoose from 'mongoose';

const connectDB = async () => {
  try {
    const connectionOptions = {
      // ssl: true,
      // sslValidate: false,
      // sslCA: `Your_Amazon_DocumentDB_CertificateAuthority(CA)`,
      useNewUrlParser: true,
      useUnifiedTopology: true,
    };

    const mongoURI = process.env.MONGO_URI
    await mongoose.connect(mongoURI, connectionOptions);

    console.log(`MongoDB Connected to AWS DocumentDB`);
  } catch (error) {
    console.error(`Error: ${error}`);
    process.exit(1);
  }
};

export default connectDB;