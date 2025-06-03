 /* 
 import express, { Request, Response } from "express";
import { json } from "body-parser";
import authRoutes from "./routes/authRoutes";

const app = express();
app.use(json());

app.use("/auth", authRoutes);

const PORT = process.env.PORT || 7000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
}); 
*/

import express, { Request, Response } from "express";
import cors from "cors";
import authRoutes from "./routes/authRoutes";
import conversationRoutes from "./routes/conversationsRoutes";// Ensure custom types are loaded

const app = express();

// Middleware
app.use(cors()); // Allow requests from different origins
app.use(express.json()); // Parse JSON bodies

// Routes
app.use("/auth", authRoutes);
app.use("/conversations", conversationRoutes);

// Optional root route for health check
app.get("/", (req: Request, res: Response) => {
  res.send("Welcome to the SynLink API");
});

// Parse port as number from environment
const PORT = Number(process.env.PORT) || 7000;

// Start the server on 0.0.0.0 for emulator access
app.listen(PORT, "0.0.0.0", () => {
  console.log(`✅ Server is running at http://0.0.0.0:${PORT}`);
});

