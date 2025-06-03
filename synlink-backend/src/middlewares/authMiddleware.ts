import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

export const verifyToken = (req: Request, res: Response, next: NextFunction): void => {
  const token = req.headers.authorization?.split(' ')[1]; // Fix here
  
  if (!token) {
    res.status(403).json({ error: 'No token provided' });
    return;
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET || 'synlinkkey');
    req.user = decoded as { id: string }; // This works if you added the extended type
    next();
  } catch (e) {
    res.status(401).json({ error: 'Invalid token' });
  }
};
 