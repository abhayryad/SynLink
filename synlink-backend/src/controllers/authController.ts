import { Request, Response } from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import pool from '../models/db';

const SALT_ROUNDS = 10;
const JWT_SECRET = process.env.JWT_SECRET || 'synlinkkey';

// REGISTER
export const register = async (req: Request, res: Response): Promise<any> => {
    //1. get username, email, password from request body
    //2. Insert the data into our db
    //3.return message user registered successfully
    const { username, email, password } = req.body;
    try {
        const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);
        const result = await pool.query(
            'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING *',
            [username, email, hashedPassword]
        );
        const user = result.rows[0];
        res.status(201).json({ user });
    } catch (error) {
        console.error('Error registering user:', error);
        res.status(500).json({ message: 'Failed to register user' });
    }
};
 
// LOGIN
export const login = async (req: Request, res: Response):Promise<any> => {
    //1. get email and password from request body
    //2. Check if user exists in db
    //3. Compare the password with the hashed password in db
    //4. If password matches, generate a JWT token and send it back to the user

    const { email, password } = req.body;
    try {
        const result = await pool.query(
            'SELECT * FROM users WHERE email = $1',
            [email]
        );
        const user = result.rows[0];
        if (!user) {
            return res.status(404).json({ message: 'User not found' });
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: 'Invalid credentials' });
        }

        // ✅ This should be outside the if-block that handles invalid credentials
        const token = jwt.sign({ id: user.id }, JWT_SECRET, { expiresIn: '10h' });
        res.status(200).json({ message: 'Login successful', token });

    } catch (error) {
        console.error('Error logging in user:', error);
        res.status(500).json({ message: 'Error logging in user' });
    }
};
