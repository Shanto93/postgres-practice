--Product table creation
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    current_stock INTEGER,
    price NUMERIC(10, 2)
);

--Input sample data into products table
INSERT INTO
    products (
        product_name,
        current_stock,
        price
    )
VALUES (
        'Wireless Bluetooth Earbuds',
        150,
        59.99
    ),
    (
        'Stainless Steel Water Bottle',
        200,
        24.95
    ),
    (
        'Organic Cotton T-Shirt',
        85,
        19.99
    ),
    (
        'Smartphone Stand Holder',
        120,
        12.49
    ),
    ('LED Desk Lamp', 65, 34.99),
    (
        'Yoga Mat (Non-Slip)',
        90,
        29.95
    ),
    (
        'Portable Phone Charger 10000mAh',
        110,
        39.99
    ),
    (
        'Ceramic Coffee Mug Set (4pc)',
        45,
        32.50
    ),
    (
        'Wireless Keyboard & Mouse Combo',
        75,
        49.99
    ),
    (
        'Memory Foam Pillow',
        60,
        45.00
    ),
    (
        'Reusable Shopping Bags (3pk)',
        180,
        14.99
    ),
    (
        'Digital Meat Thermometer',
        95,
        22.95
    ),
    (
        'Bamboo Cutting Board',
        70,
        28.75
    ),
    (
        'Noise Cancelling Headphones',
        40,
        129.99
    ),
    (
        'Glass Food Storage Containers (6pc)',
        55,
        37.25
    ),
    (
        'Adjustable Dumbbell Set',
        30,
        89.99
    ),
    (
        'Aromatherapy Diffuser',
        80,
        26.99
    ),
    (
        'Electric Toothbrush',
        100,
        54.95
    ),
    ('Laptop Backpack', 65, 42.50),
    (
        'Cast Iron Skillet',
        50,
        39.99
    ),
    (
        'Fitness Tracker Watch',
        95,
        79.99
    ),
    (
        'Insulated Lunch Box',
        110,
        21.99
    ),
    (
        'Wireless Charging Pad',
        125,
        29.99
    ),
    (
        'Essential Oil Set (6pc)',
        60,
        34.95
    ),
    (
        'Resistance Band Set (5pc)',
        140,
        19.95
    ),
    ('Air Fryer (5QT)', 35, 99.95),
    (
        'Himalayan Salt Lamp',
        75,
        24.99
    ),
    (
        'French Press Coffee Maker',
        65,
        32.50
    ),
    ('Gaming Mouse', 85, 49.99),
    (
        'Scented Soy Candles (3pk)',
        120,
        27.50
    );

SELECT * FROM products;

-- Order table creation
CREATE TABLE "order" (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50)
);

-- Input sample data into order table
INSERT INTO
    "order" (
        customer_id,
        order_date,
        status
    )
VALUES (
        101,
        '2024-01-15',
        'Completed'
    ),
    (
        102,
        '2024-01-18',
        'Completed'
    ),
    (
        103,
        '2024-01-22',
        'Cancelled'
    ),
    (
        104,
        '2024-01-25',
        'Completed'
    ),
    (105, '2024-01-30', 'Shipped'),
    (
        106,
        '2024-02-05',
        'Completed'
    ),
    (
        107,
        '2024-02-10',
        'Processing'
    ),
    (
        108,
        '2024-02-14',
        'Completed'
    ),
    (109, '2024-02-18', 'Shipped'),
    (
        110,
        '2024-02-22',
        'Cancelled'
    ),
    (
        111,
        '2024-03-01',
        'Completed'
    ),
    (
        112,
        '2024-03-05',
        'Processing'
    ),
    (
        113,
        '2024-03-10',
        'Completed'
    ),
    (114, '2024-03-15', 'Shipped'),
    (
        115,
        '2024-03-20',
        'Cancelled'
    ),
    (
        116,
        '2024-04-02',
        'Completed'
    ),
    (
        117,
        '2024-04-07',
        'Processing'
    ),
    (
        118,
        '2024-04-12',
        'Completed'
    ),
    (119, '2024-04-18', 'Shipped'),
    (
        120,
        '2024-04-22',
        'Completed'
    ),
    (
        121,
        '2024-05-01',
        'Processing'
    ),
    (
        122,
        '2024-05-05',
        'Completed'
    ),
    (123, '2024-05-10', 'Shipped'),
    (
        124,
        '2024-05-15',
        'Cancelled'
    ),
    (
        125,
        '2024-05-20',
        'Completed'
    ),
    (
        126,
        '2024-05-25',
        'Processing'
    ),
    (
        127,
        '2024-06-01',
        'Completed'
    ),
    (128, '2024-06-05', 'Shipped'),
    (
        129,
        '2024-06-10',
        'Completed'
    ),
    (
        130,
        '2024-06-15',
        'Processing'
    );

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES "order" (order_id) ON DELETE CASCADE,
    product_id INT REFERENCES products (product_id) ON DELETE CASCADE,
    quantity INTEGER
)

--Function to update stock after an order is placed
CREATE OR REPLACE FUNCTION update_stock_after_order()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE products
    SET current_stock = current_stock - NEW.quantity
    WHERE product_id = NEW.product_id;

END
$$

--Trigger to update stock after order insertion

CREATE OR REPLACE TRIGGER update_stock_after_order_trigger
BEFORE INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION update_stock_after_order();