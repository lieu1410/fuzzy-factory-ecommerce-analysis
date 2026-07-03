DATA DICTIONARY

1. Bảng orders (Đơn hàng)
Lưu trữ thông tin tổng quát về các đơn hàng đã được đặt.
Trường (Field)	Mô tả (Description)
order_id	Mã định danh duy nhất cho mỗi đơn hàng (Khóa chính - PK).
INT
created_at	Thời điểm (timestamp) đơn hàng được đặt.
DATETIME
website_session_id	Mã phiên truy cập website tương ứng (Khóa ngoại - FK).
INT
user_id	Mã định danh duy nhất của người dùng mua hàng (Khóa ngoại - FK).
INT
primary_product_id	Mã sản phẩm chính trong đơn hàng nếu đây là một combo/gói sản phẩm (Khóa ngoại - FK).
INT
items_purchased	Số lượng sản phẩm có trong đơn hàng. INT
price_usd	Tổng giá trị đơn hàng tính bằng USD. FLOAT
cogs_usd	Tổng giá vốn hàng bán (Cost of Goods Sold) của đơn hàng bằng USD. FLOAT
________________________________________
2. Bảng order_items (Chi tiết sản phẩm trong đơn)
Lưu trữ thông tin chi tiết của từng sản phẩm cụ thể trong một đơn hàng.
Trường (Field)	Mô tả (Description)
order_item_id	Mã định danh duy nhất cho mỗi sản phẩm trong đơn (Khóa chính - PK). INT
created_at	Thời điểm sản phẩm được ghi nhận vào đơn hàng. DATETIME
order_id	Mã đơn hàng mà sản phẩm này thuộc về (Khóa ngoại - FK). INT
product_id	Mã định danh của sản phẩm (Khóa ngoại - FK). INT
is_primary_item	Cờ nhị phân; giá trị là 1 nếu đây là sản phẩm chính của đơn hàng đó. INT
price_usd	Giá bán của riêng sản phẩm đó bằng USD. FLOAT
cogs_usd	Giá vốn của riêng sản phẩm đó bằng USD. FLOAT
________________________________________
3. Bảng order_item_refunds (Hoàn tiền sản phẩm)
Theo dõi các giao dịch hoàn trả tiền cho khách hàng.
Trường (Field)	Mô tả (Description)
order_item_refund_id	Mã định danh duy nhất cho mỗi lượt hoàn tiền (Khóa chính - PK).
INT
created_at	Thời điểm lệnh hoàn tiền được thực hiện. DATETIME
order_item_id	Mã sản phẩm cụ thể được hoàn tiền (Khóa ngoại - FK). INT
order_id	Mã đơn hàng chứa sản phẩm được hoàn tiền (Khóa ngoại - FK). INT
refund_amount_usd	Số tiền được hoàn trả lại cho khách bằng USD. FOAT
________________________________________
4. Bảng products (Sản phẩm)
Danh mục các sản phẩm có trên hệ thống.
Trường (Field)	Mô tả (Description)
product_id	Mã định danh duy nhất cho sản phẩm (Khóa chính - PK).
INT
created_at	Thời điểm sản phẩm được ra mắt/đưa lên hệ thống.
DATETIME
product_name	Tên của sản phẩm.
VARCHAR
________________________________________
5. Bảng website_sessions (Phiên truy cập)
Lưu trữ dữ liệu về các lượt truy cập của người dùng vào website.
Trường (Field)	Mô tả (Description)
website_session_id	Mã định danh duy nhất cho mỗi phiên truy cập (Khóa chính - PK).
INT
created_at	Thời điểm phiên truy cập bắt đầu.
DATETIME
user_id	Mã định danh người dùng (Khóa ngoại - FK).
INT
is_repeat_session	Cờ nhị phân; là 1 nếu người dùng này đã từng truy cập trước đó (khách cũ).
BOOLEAN
utm_source	Nguồn lưu lượng truy cập (ví dụ: google, facebook, bings).
VARCHAR
utm_campaign	Tên chiến dịch marketing dẫn người dùng đến web.
VARCHAR
utm_content	Nội dung cụ thể của quảng cáo hoặc biến thể nội dung.
VARCHAR
device_type	Loại thiết bị người dùng sử dụng (mobile hoặc desktop).
VARCHAR
http_referer	URL của trang web trước đó dẫn người dùng tới đây.
VARCHAR
________________________________________
6. Bảng website_pageviews (Lượt xem trang)
Chi tiết từng trang mà người dùng đã xem trong một phiên truy cập.
Trường (Field)	Mô tả (Description)
website_pageview_id	Mã định danh duy nhất cho mỗi lượt xem trang (Khóa chính - PK).
INT
created_at	Thời điểm người dùng xem trang đó. DATETIME
website_session_id	Mã phiên truy cập mà lượt xem trang này thuộc về (Khóa ngoại - FK). INT
pageview_url	Đường dẫn (URL) của trang web đã được xem. VARCHAR
________________________________________
Ghi chú kỹ thuật:
●	PK (Primary Key): Khóa chính, dùng để phân biệt các dòng dữ liệu, không được trùng lặp.
●	FK (Foreign Key): Khóa ngoại, dùng để liên kết thông tin giữa các bảng với nhau.

