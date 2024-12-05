
CREATE TABLE address_book
(
  address_book_no        int          NOT NULL COMMENT '주소번호',
  address_book_name      varchar(30)  NOT NULL COMMENT '배송지명',
  address_book_info      varchar(100) NOT NULL COMMENT '주소',
  address_book_phone     varchar(30)  NOT NULL COMMENT '휴대폰번호',
  address_book_top       CHAR(1)      NOT NULL DEFAULT Y COMMENT '기본주소록',
  address_book_create_at timestamp    NOT NULL DEFAULT now() COMMENT '등록일',
  address_book_create_id varchar(20)  NULL     COMMENT '등록id',
  address_book_create_ip varchar(30)  NULL     COMMENT '등록ip',
  address_book_update_at timestamp    NULL     COMMENT '수정일',
  address_book_update_id varchar(20)  NULL     COMMENT '수정id',
  address_book_update_ip varchar(30)  NULL     COMMENT '수정ip',
  user_no                int          NOT NULL COMMENT '회원번호',
  PRIMARY KEY (address_book_no)
) COMMENT '주소록';

CREATE TABLE cart
(
  cart_no        int         NOT NULL COMMENT '장바구니번호',
  cart_create_at timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  cart_create_id varchar(20) NULL     COMMENT '등록id',
  cart_create_ip varchar(30) NULL     COMMENT '등록ip',
  cart_update_at timestamp   NULL     COMMENT '수정일',
  cart_update_id varchar(20) NULL     COMMENT '수정id',
  cart_update_ip varchar(30) NULL     COMMENT '수정ip',
  user_no        int         NOT NULL COMMENT '회원번호',
  product_no     int         NOT NULL COMMENT '상품번호',
  guest_no       int         NOT NULL COMMENT '비회원번호',
  PRIMARY KEY (cart_no)
) COMMENT '장바구니';

CREATE TABLE category
(
  category_no         int         NOT NULL AUTO_INCREMENT COMMENT '카테고리번호',
  category_name       varchar(30) NOT NULL COMMENT '이름',
  category_created_at timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  category_create_id  varchar(20) NULL     COMMENT '등록id',
  category_create_ip  varchar(30) NULL     COMMENT '등록ip',
  category_update_at  timestamp   NULL     COMMENT '수정일',
  category_update_id  varchar(20) NULL     COMMENT '수정id',
  category_update_ip  varchar(30) NULL     COMMENT '수정ip',
  PRIMARY KEY (category_no)
) COMMENT '카테고리';

CREATE TABLE contact
(
  contact_no        int         NOT NULL COMMENT '문의번호',
  contact_title     text        NOT NULL COMMENT '제목',
  contact_content   text        NOT NULL COMMENT '내용',
  contact_status    char(1)     NOT NULL DEFAULT 'E' COMMENT '상태 : 'E' 'D'',
  contact_type      varchar(10) NOT NULL COMMENT '문의 유형 : 주문, 배송, 상품, 기타',
  contact_password  varchar(30) NOT NULL COMMENT '비밀번호',
  contact_comment   text        NULL     COMMENT '답변내용',
  contact_agree     char(1)     NULL     DEFAULT Y COMMENT '개인정보동의',
  contact_create_at timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  contact_create_id varchar(20) NULL     COMMENT '등록id',
  contact_create_ip varchar(30) NULL     COMMENT '등록ip',
  contact_update_at timestamp   NULL     COMMENT '수정일',
  contact_update_id varchar(20) NULL     COMMENT '수정id',
  contact_update_ip varchar(30) NULL     COMMENT '수정ip',
  user_no           int         NOT NULL COMMENT '회원번호',
  guest_no          int         NOT NULL COMMENT '비회원번호',
  product_no        int         NULL     COMMENT '상품번호',
  PRIMARY KEY (contact_no)
) COMMENT '문의하기';

CREATE TABLE contact_alarm
(
  contact_alarm_no         int         NOT NULL COMMENT '관리자알림번호',
  contact_alarm_contact_no int         NULL     COMMENT '알림대상번호',
  contact_alarm_is_read    char(1)     NULL     COMMENT '알림읽음여부',
  contact_alarm_date       timestamp   NOT NULL DEFAULT now() COMMENT '알림일',
  contact_alarm_create_at  timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  contact_alarm_create_id  varchar(20) NULL     COMMENT '등록id',
  contact_alarm_create_ip  varchar(30) NULL     COMMENT '등록ip',
  contact_alarm_update_at  timestamp   NULL     COMMENT '수정일',
  contact_alarm_update_id  varchar(20) NULL     COMMENT '수정id',
  contact_alarm_update_ip  varchar(30) NULL     COMMENT '수정ip',
  user_no                  int         NOT NULL COMMENT '회원번호',
  contact_no               int         NOT NULL COMMENT '문의번호'
) COMMENT '관리자알림';

CREATE TABLE contact_attachment
(
  contact_attachment_no        int          NOT NULL COMMENT '문의첨부파일번호',
  contact_attachment_name      varchar(100) NOT NULL COMMENT '파일이름',
  contact_attachment_new_name  varchar(100) NULL     COMMENT '파일새이름',
  contact_attachment_path      varchar(100) NULL     COMMENT '경로',
  contact_attachment_size      int          NULL     COMMENT '크기',
  contact_attachment_create_at timestamp    NOT NULL DEFAULT now() COMMENT '등록일',
  contact_attachment_create_id varchar(20)  NULL     COMMENT '등록id',
  contact_attachment_create_ip varchar(30)  NULL     COMMENT '등록ip',
  contact_attachment_update_at timestamp    NULL     COMMENT '수정일',
  contact_attachment_update_id varchar(20)  NULL     COMMENT '수정id',
  contact_attachment_update_ip varchar(30)  NULL     COMMENT '수정ip',
  contact_no                   int          NOT NULL COMMENT '문의번호',
  PRIMARY KEY (contact_attachment_no)
) COMMENT '문의 첨부파일';

CREATE TABLE guest
(
  guest_no         int         NOT NULL AUTO_INCREMENT COMMENT '비회원번호',
  guest_email      varchar(50) NOT NULL COMMENT '이메일',
  guest_phone      varchar(30) NOT NULL COMMENT '휴대폰번호',
  guest_ordered_at timestamp   NOT NULL DEFAULT now() COMMENT '주문일',
  guest_create_at  timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  guest_create_id  varchar(20) NULL     COMMENT '등록id',
  guest_create_ip  varchar(30) NULL     COMMENT '등록ip',
  guest_update_at  timestamp   NULL     COMMENT '수정일',
  guest_update_id  varchar(20) NULL     COMMENT '수정id',
  guest_update_ip  varchar(30) NULL     COMMENT '수정ip',
  PRIMARY KEY (guest_no)
) COMMENT '비회원';

CREATE TABLE notice_board
(
  notice_board_no         int         NOT NULL COMMENT '공지사항 번호',
  notice_board_title      text        NOT NULL COMMENT '제목',
  notice_board_content    text        NOT NULL COMMENT '내용',
  notice_board_status     char(1)     NOT NULL DEFAULT 'E' COMMENT '상태 : 'E' 'D'',
  notice_board_created_at timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  notice_board_create_id  varchar(20) NULL     COMMENT '등록id',
  notice_board_create_ip  varchar(30) NULL     COMMENT '등록ip',
  notice_board_update_at  timestamp   NULL     COMMENT '수정일',
  notice_board_update_id  varchar(20) NULL     COMMENT '수정id',
  notice_board_update_ip  varchar(30) NULL     COMMENT '수정ip',
  user_no                 int         NOT NULL COMMENT '회원번호',
  PRIMARY KEY (notice_board_no)
) COMMENT '공지사항';

CREATE TABLE order
(
  order_no                       int          NOT NULL AUTO_INCREMENT COMMENT '주문번호',
  order_date                     timestamp    NOT NULL DEFAULT now() COMMENT '주문일',
  order_status                   char(1)      NOT NULL DEFAULT 'O' COMMENT '주문상태 : 'O' 'R' 'C'',
  order_address                  varchar(100) NOT NULL COMMENT '주소',
  order_name                     varchar(30)  NOT NULL COMMENT '주문자명',
  order_phone                    varchar(30)  NOT NULL COMMENT '주문자휴대폰번호',
  order_shipping_date            timestamp    NOT NULL DEFAULT now() COMMENT '배송일',
  order_shipping_delivery_date   varchar(10)  NOT NULL COMMENT '예상배송일',
  order_shipping_status          varchar(10)  NOT NULL DEFAULT 'P' COMMENT '배송상태 : 'P' 'T' 'D'',
  order_shipping_tracking_number varchar(30)  NOT NULL COMMENT '송장번호',
  order_create_at                timestamp    NOT NULL DEFAULT now() COMMENT '등록일',
  order_create_id                varchar(20)  NULL     COMMENT '등록id',
  order_create_ip                varchar(30)  NULL     COMMENT '등록ip',
  order_update_at                timestamp    NULL     COMMENT '수정일',
  order_update_id                varchar(20)  NULL     COMMENT '수정id',
  order_update_ip                varchar(30)  NULL     COMMENT '수정ip',
  user_no                        int          NOT NULL COMMENT '회원번호',
  guest_no                       int          NOT NULL COMMENT '비회원번호',
  payment_no                     int          NOT NULL COMMENT '결제번호',
  PRIMARY KEY (order_no)
) COMMENT '주문';

CREATE TABLE order_detail
(
  order_detail_no          int         NOT NULL COMMENT '주문상번호',
  order_detail_quantity    INT         NOT NULL DEFAULT 1 COMMENT '주문수량',
  order_detail_unit_price  decimal     NOT NULL DEFAULT 0 COMMENT '단가',
  order_detail_total_price decimal     NOT NULL DEFAULT 0 COMMENT '주문총금액',
  order_detail_create_at   timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  order_detail_create_id   varchar(20) NULL     COMMENT '등록id',
  order_detail_create_ip   varchar(30) NULL     COMMENT '등록ip',
  order_detail_update_at   timestamp   NULL     COMMENT '수정일',
  order_detail_update_id   varchar(20) NULL     COMMENT '수정id',
  order_detail_update_ip   varchar(30) NULL     COMMENT '수정ip',
  order_no                 int         NOT NULL COMMENT '주문번호',
  product_no               int         NOT NULL COMMENT '상품번호',
  PRIMARY KEY (order_detail_no)
) COMMENT '주문상세';

CREATE TABLE payment
(
  payment_no            int         NOT NULL AUTO_INCREMENT COMMENT '결제번호',
  payment_price         decimal     NOT NULL DEFAULT 0 COMMENT '결제금액',
  payment_refund_price  decimal     NOT NULL DEFAULT 0 COMMENT '환불금액',
  payment_balance_price decimal     NULL     COMMENT '잔여금액',
  payment_service_fee   decimal     NULL     COMMENT '서비스 이용 수수료',
  payment_date          timestamp   NOT NULL DEFAULT now() COMMENT '결제일',
  payment_refund_date   timestamp   NOT NULL DEFAULT now() COMMENT '환불일',
  payment_status        char(1)     NULL     DEFAULT 'C' COMMENT '결제상태 : 'C' 'W'',
  payment_refund_status char(1)     NULL     DEFAULT 'W' COMMENT '환불상태 : 'C' 'W'',
  payment_method        varchar(10) NOT NULL COMMENT '결제 수단 : 카드, 현금',
  payment_create_at     timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  payment_create_id     varchar(20) NULL     COMMENT '등록id',
  payment_create_ip     varchar(30) NULL     COMMENT '등록ip',
  payment_update_at     timestamp   NULL     COMMENT '수정일',
  payment_update_id     varchar(20) NULL     COMMENT '수정id',
  payment_update_ip     varchar(30) NULL     COMMENT '수정ip',
  user_no               int         NOT NULL COMMENT '회원번호',
  guest_no              int         NOT NULL COMMENT '비회원번호',
  PRIMARY KEY (payment_no)
) COMMENT '결제';

CREATE TABLE product
(
  product_no                 int         NOT NULL AUTO_INCREMENT COMMENT '상품번호',
  product_name               varchar(50) NOT NULL COMMENT '상품명',
  product_description        text        NOT NULL COMMENT '상품소개',
  product_author             varchar(20) NOT NULL COMMENT '저자',
  product_author_description text        NULL     COMMENT '저자 소개',
  product_price              decimal     NOT NULL DEFAULT 0 COMMENT '가격',
  product_isbn               varchar(30) NOT NULL COMMENT '국제표준도서번호',
  product_page               int         NOT NULL COMMENT '쪽수',
  product_stock              int         NOT NULL DEFAULT 0 COMMENT '재고',
  product_status             char(1)     NOT NULL DEFAULT 'E' COMMENT '상태 : 'E' 'D'',
  product_created_at         timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  product_create_id          varchar(20) NULL     COMMENT '등록id',
  product_create_ip          varchar(30) NULL     COMMENT '등록ip',
  product_update_at          timestamp   NULL     COMMENT '수정일',
  product_update_id          varchar(20) NULL     COMMENT '수정id',
  product_update_ip          varchar(30) NULL     COMMENT '수정ip',
  category_no                int         NOT NULL COMMENT '카테고리번호',
  PRIMARY KEY (product_no)
) COMMENT '상품';

CREATE TABLE product_attachment
(
  product_attachment_no         int          NOT NULL AUTO_INCREMENT COMMENT '상품첨부파일번호',
  product_attachment_name       varchar(100) NOT NULL COMMENT '파일이름',
  product_attachment_new_name   varchar(100) NULL     COMMENT '파일새이름',
  product_attachment_path       varchar(100) NULL     COMMENT '경로',
  product_attachment_size       int          NULL     COMMENT '크기',
  product_attachment_created_at timestamp    NOT NULL DEFAULT now() COMMENT '등록일',
  product_attachment_create_id  varchar(20)  NULL     COMMENT '등록id',
  product_attachment_create_ip  varchar(30)  NULL     COMMENT '등록ip',
  product_attachment_update_at  timestamp    NULL     COMMENT '수정일',
  product_attachment_update_id  varchar(20)  NULL     COMMENT '수정id',
  product_attachment_update_ip  varchar(30)  NULL     COMMENT '수정ip',
  product_no                    int          NOT NULL COMMENT '상품번호',
  PRIMARY KEY (product_attachment_no)
) COMMENT '상품첨부파일';

CREATE TABLE product_history
(
  product_history_no          int       NOT NULL AUTO_INCREMENT,
  product_history_change_date timestamp NULL    ,
  product_history_id                    NULL    ,
  product_history_ip                    NULL    ,
  PRIMARY KEY (product_history_no)
) COMMENT '상품이력';

CREATE TABLE review
(
  review_no              int         NOT NULL COMMENT '리뷰번호',
  review_content         text        NOT NULL COMMENT '내용',
  review_status          char(1)     NOT NULL DEFAULT 'E' COMMENT '상태 : 'E' 'D'',
  review_star_starrating int         NOT NULL DEFAULT 0 COMMENT '별점',
  review_create_at       timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  review_create_id       varchar(20) NULL     COMMENT '등록id',
  review_create_ip       varchar(30) NULL     COMMENT '등록ip',
  review_update_at       timestamp   NULL     COMMENT '수정일',
  review_update_id       varchar(20) NULL     COMMENT '수정id',
  review_update_ip       varchar(30) NULL     COMMENT '수정ip',
  product_no             int         NOT NULL COMMENT '상품번호',
  user_no                int         NOT NULL COMMENT '회원번호',
  PRIMARY KEY (review_no)
) COMMENT '리뷰';

CREATE TABLE review_attachment
(
  review_attachment_no         int          NOT NULL COMMENT '리뷰첨부파일번호',
  review_attachment_name       varchar(100) NOT NULL COMMENT '파일이름',
  review_attachment_new_name   varchar(100) NULL     COMMENT '파일새이름',
  review_attachment_path       varchar(100) NULL     COMMENT '경로',
  review_attachment_size       int          NULL     COMMENT '크기',
  review_attachment_created_at timestamp    NOT NULL DEFAULT now() COMMENT '등록일',
  review_attachment_create_id  varchar(20)  NULL     COMMENT '등록id',
  review_attachment_create_ip  varchar(30)  NULL     COMMENT '등록ip',
  review_attachment_update_at  timestamp    NULL     COMMENT '수정일',
  review_attachment_update_id  varchar(20)  NULL     COMMENT '수정id',
  review_attachment_update_ip  varchar(30)  NULL     COMMENT '수정ip',
  review_no                    int          NOT NULL COMMENT '리뷰번호',
  PRIMARY KEY (review_attachment_no)
) COMMENT '리뷰 첨부파일';

CREATE TABLE user
(
  user_no         int         NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  user_id         varchar(20) NOT NULL COMMENT '아이디',
  user_password   varchar(50) NOT NULL COMMENT '비밀번호',
  user_name       varchar(30) NOT NULL COMMENT '이름',
  user_phone      varchar(30) NOT NULL COMMENT '휴대폰번호',
  user_emil       varchar(50) NULL     COMMENT '이메일',
  user_note       TEXT        NULL     COMMENT '기타사항',
  user_status     char(1)     NOT NULL DEFAULT 'E' COMMENT '상태 : 'E' 'D'',
  user_type       char(1)     NOT NULL DEFAULT 'U' COMMENT '회원구분 : 'U' 'A'',
  user_created_at timestamp   NOT NULL DEFAULT now() COMMENT '회원가입일',
  user_create_id  varchar(20) NULL     COMMENT '등록id',
  user_create_ip  varchar(30) NULL     COMMENT '등록ip',
  user_update_at  timestamp   NULL     COMMENT '수정일',
  user_update_id  varchar(20) NULL     COMMENT '수정id',
  user_update_ip  varchar(30) NULL     COMMENT '수정ip',
  PRIMARY KEY (user_no)
) COMMENT '회원';

CREATE TABLE user_history
(
  user_history_no          int       NOT NULL AUTO_INCREMENT,
  user_history_change_date timestamp NULL    ,
  user_history_id                    NULL    ,
  user_history_ip                    NULL    ,
  PRIMARY KEY (user_history_no)
) COMMENT '유저 이력';

CREATE TABLE wishlist
(
  wishlist_no         int         NOT NULL COMMENT '위시리스트 번호',
  wishlist_status     char(1)     NOT NULL DEFAULT 'E' COMMENT '상태 : 'E' 'D'',
  wishlist_created_at timestamp   NOT NULL DEFAULT now() COMMENT '등록일',
  wishlist_create_id  varchar(20) NULL     COMMENT '등록id',
  wishlist_create_ip  varchar(30) NULL     COMMENT '등록ip',
  wishlist_update_at  timestamp   NULL     COMMENT '수정일',
  wishlist_update_id  varchar(20) NULL     COMMENT '수정id',
  wishlist_update_ip  varchar(30) NULL     COMMENT '수정ip',
  user_no             int         NOT NULL COMMENT '회원번호',
  product_no          int         NOT NULL COMMENT '상품번호',
  PRIMARY KEY (wishlist_no)
) COMMENT '위시리스트';

ALTER TABLE order
  ADD CONSTRAINT FK_user_TO_order
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE product
  ADD CONSTRAINT FK_category_TO_product
    FOREIGN KEY (category_no)
    REFERENCES category (category_no);

ALTER TABLE product_attachment
  ADD CONSTRAINT FK_product_TO_product_attachment
    FOREIGN KEY (product_no)
    REFERENCES product (product_no);

ALTER TABLE payment
  ADD CONSTRAINT FK_user_TO_payment
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE cart
  ADD CONSTRAINT FK_user_TO_cart
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE cart
  ADD CONSTRAINT FK_product_TO_cart
    FOREIGN KEY (product_no)
    REFERENCES product (product_no);

ALTER TABLE wishlist
  ADD CONSTRAINT FK_user_TO_wishlist
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE wishlist
  ADD CONSTRAINT FK_product_TO_wishlist
    FOREIGN KEY (product_no)
    REFERENCES product (product_no);

ALTER TABLE cart
  ADD CONSTRAINT FK_guest_TO_cart
    FOREIGN KEY (guest_no)
    REFERENCES guest (guest_no);

ALTER TABLE payment
  ADD CONSTRAINT FK_guest_TO_payment
    FOREIGN KEY (guest_no)
    REFERENCES guest (guest_no);

ALTER TABLE order
  ADD CONSTRAINT FK_guest_TO_order
    FOREIGN KEY (guest_no)
    REFERENCES guest (guest_no);

ALTER TABLE address_book
  ADD CONSTRAINT FK_user_TO_address_book
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE order
  ADD CONSTRAINT FK_payment_TO_order
    FOREIGN KEY (payment_no)
    REFERENCES payment (payment_no);

ALTER TABLE contact_alarm
  ADD CONSTRAINT FK_user_TO_contact_alarm
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE review
  ADD CONSTRAINT FK_product_TO_review
    FOREIGN KEY (product_no)
    REFERENCES product (product_no);

ALTER TABLE review_attachment
  ADD CONSTRAINT FK_review_TO_review_attachment
    FOREIGN KEY (review_no)
    REFERENCES review (review_no);

ALTER TABLE review
  ADD CONSTRAINT FK_user_TO_review
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE contact
  ADD CONSTRAINT FK_user_TO_contact
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE contact_alarm
  ADD CONSTRAINT FK_contact_TO_contact_alarm
    FOREIGN KEY (contact_no)
    REFERENCES contact (contact_no);

ALTER TABLE notice_board
  ADD CONSTRAINT FK_user_TO_notice_board
    FOREIGN KEY (user_no)
    REFERENCES user (user_no);

ALTER TABLE contact
  ADD CONSTRAINT FK_guest_TO_contact
    FOREIGN KEY (guest_no)
    REFERENCES guest (guest_no);

ALTER TABLE order_detail
  ADD CONSTRAINT FK_order_TO_order_detail
    FOREIGN KEY (order_no)
    REFERENCES order (order_no);

ALTER TABLE order_detail
  ADD CONSTRAINT FK_product_TO_order_detail
    FOREIGN KEY (product_no)
    REFERENCES product (product_no);

ALTER TABLE contact_attachment
  ADD CONSTRAINT FK_contact_TO_contact_attachment
    FOREIGN KEY (contact_no)
    REFERENCES contact (contact_no);

ALTER TABLE contact
  ADD CONSTRAINT FK_product_TO_contact
    FOREIGN KEY (product_no)
    REFERENCES product (product_no);
