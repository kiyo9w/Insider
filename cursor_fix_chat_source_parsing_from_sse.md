# Fix chat source parsing from SSE
_Exported on 12/6/2025 at 02:15:03 GMT+7 from Cursor (2.1.48)_

---

**User**

fix the @lib/features/chat/data/source_service.dart @lib/features/chat/view/widgets/source_selector_sheet.dart , its currently being hard coded, it should derive / parse information from the SSE even response, here is an example of the SSE response logs. Note, its in Vietnamese but the logs its not properly parsed for Vietnamese, the code should though:



I/flutter (26492): [SSE][raw] {"event": "search-results", "data": {"event_type": "search-results", "results": [{"title": "Tri\u1ec7u ch\u1ee9ng ch\u1ea5n th\u01b0\u01a1ng s\u1ecd n\u00e3o nh\u1eb9 - B\u00e1o D\u00e2n tr\u00ed", "url": "https://dantri.com.vn/tra-cuu-suc-khoe/trieu-chung-chan-thuong-so-nao-nhe-20230929093054451.htm", "content": "### Hai b\u00e9 g\u00e1i v\u1eb9o c\u1ed9t s\u1ed1ng, kh\u00f4ng th\u1ec3 n\u1eb1m ng\u1eeda \"l\u1ed9t x\u00e1c\" sau ca m\u1ed5 \u0111\u1eb7c bi\u1ec7t\n\nTPHCM: Nhi\u1ec1u ng\u01b0\u1eddi g\u1eb7p tai n\u1ea1n \u0111\u1ee9t l\u00eca chi, b\u00e0n ch\u00e2n b\u1ecb nghi\u1ec1n n\u00e1t\n\n### TPHCM: Nhi\u1ec1u ng\u01b0\u1eddi g\u1eb7p tai n\u1ea1n \u0111\u1ee9t l\u00eca chi, b\u00e0n ch\u00e2n b\u1ecb nghi\u1ec1n n\u00e1t\n\nTh\u00f3i quen b\u1ebb kh\u1edbp ng\u00f3n tay - v\u00f4 h\u1ea1i hay ti\u1ec1m \u1ea9n r\u1ee7i ro?\n\n### Th\u00f3i quen b\u1ebb kh\u1edbp ng\u00f3n tay - v\u00f4 h\u1ea1i hay ti\u1ec1m \u1ea9n r\u1ee7i ro?\n\nHi\u1ec7n t\u01b0\u1ee3ng \"c\u01a1 th\u1ec3 d\u1ef1

I/flutter (26492): [SSE][data] {event_type: search-results, results: [{title: Triệu chứng chấn thương sọ não nhẹ - Báo Dân trí, url: https://dantri.com.vn/tra-cuu-suc-khoe/trieu-chung-chan-thuong-so-nao-nhe-20230929093054451.htm, content: ### Hai bé gái vẹo cột sống, không thể nằm ngửa "lột xác" sau ca mổ đặc biệt

I/flutter (26492):

I/flutter (26492): TPHCM: Nhiều người gặp tai nạn đứt lìa chi, bàn chân bị nghiền nát

I/flutter (26492):

I/flutter (26492): ### TPHCM: Nhiều người gặp tai nạn đứt lìa chi, bàn chân bị nghiền nát

I/flutter (26492):

I/flutter (26492): Thói quen bẻ khớp ngón tay - vô hại hay tiềm ẩn rủi ro?

I/flutter (26492):

I/flutter (26492): ### Thói quen bẻ khớp ngón tay - vô hại hay tiềm ẩn rủi ro?

I/flutter (26492):

I/flutter (26492): Hiện tượng "cơ thể dự báo thời tiết" tiềm ẩn bệnh lý nguy hiểm

I/flutter (26492):

I/flutter (26492): ### Hiện tượng "cơ thể dự báo thời tiết" tiềm ẩn bệnh lý nguy hiểm [...] Báo điện tử Dân trí - Tin tức cập nhật liên tục 24/7

I/flutter (26492): Fica

I/flutter (26492): DTiNews

I/flutter (26492): NoiVuXaHoi

I/flutter (26492):

I/flutter (26492): ## Chấn thương - Thương tích

I/flutter (26492):

I/flutter (26492): # Triệu chứng chấn thương sọ não nhẹ

I/flutter (26492):

I/flutter (26492): Triệu chứng chấn thương sọ não nhẹ

I/flutter (26492):

I/flutter (26492): Chấn thương sọ não nhẹ cũng là một dạng của chấn thương đầu, mặc dù mức độ tổn thương đến não bộ nhẹ hơn nhưng nếu người bệnh không được điều trị kịp thời thì vẫn sẽ khiến cho não bộ bị tổn thương vĩnh viễn và nguy hiểm đến tính mạng.

I/flutter (26492):

I/flutter (26492): ## 1. Chấn thương sọ não nhẹ là gì? [...] Một số triệu chứng thực thể khi bị chấn thương sọ não nhẹ có thể xu}, {title: Khoèo chân bẩm sinh - Báo Dân trí, url: https://dantri.com.vn/tra-cuu-suc-khoe/nhi-so-sinh/khoeo-chan-bam-sinh.htm, content: Tổng quan Bệnh Khoèochânbẩm sinh cùng các dấu hiệu, triệu chứng, nguyên nhân, điều trị, cách phòng tránh và thông tin về các bệnh viện, phòng khám, bác sĩ chữa bệnh Khoèochânbẩm sinh.

I/flutter (26492):

I/flutter (26492): # Khoèo chân bẩm sinh

I/flutter (26492):

I/flutter (26492): <p>Khoèo chân bẩm sinh: Nguyên nhân, triệu chứng, chẩn đoán và điều trị | Báo Dân trí</p>

I/flutter (26492):

I/flutter (26492): Fica DTiNews Nội vụ & Xã hội

I/flutter (26492):

I/flutter (26492): Xu hướng

I/flutter (26492):

I/flutter (26492): * # Tuần lễ Khoa học Công nghệ VinFuture 2025

I/flutter (26492): * # Chung cư cấm xe điện

I/flutter (26492): * # Cháy quán ăn làm 4 người chết ở TPHCM

I/flutter (26492): * # Ngập lụt ở Lâm Đồng

I/flutter (26492): * # SEA Games 33

I/flutter (26492): * # Tài xế lái Lexux tông em gái ở Tây Ninh

I/flutter (26492): * # Kỳ họp thứ 10 Quốc hội khóa XV

I/flutter (26492): * # Vợ chồng chủ thẩm mỹ viện Mailisa bị khởi tố

I/flutter (26492): * # Cháy chung cư ở Hong Kong làm 44 người chết

I/flutter (26492): * # Sinh viên "tố" trường chậm chi trả tiền A80

I/flutter (26492):

I/flutter (26492): Tra cứu bệnh

I/flutter (26492):

I/flutter (26492): 1. Nhi - Sơ sinh

I/flutter (26492): 2. Ung thư

I/flutter (26492): 3. Tim mạch

I/flutter (26492): 4. Thần kinh

I/flutter (26492): 5. Truyền nhiễm

I/flutter (26492): 6. Tiêu hóa

I/flutter (26492): 7. Hô hấp

I/flutter (26492): 8. Da liễu

I/flutter (26492): 9. Sản phụ khoa

I/flutter (26492): 10. Tai mũi họng

I/flutter (26492): 11. Cơ xương khớp

I/flutter (26492): 12. Mắt

I/flutter (26492): 13. Virus - Ký sinh trùng

I/flutter (26492): 14. Nội tiết

I/flutter (26492): 15. Phụ khoa

I/flutter (26492): 16. Thận và Tiết niệu

I/flutter (26492): 17. Chấn thương - Thương tích

I/flutter (26492): 18.}, {title: Tại sao muỗi vo ve quanh tai chúng ta? - Báo Dân trí, url: https://dantri.com.vn/khoa-hoc/tai-sao-muoi-vo-ve-quanh-tai-chung-ta-20210601093942698.htm, content: # Tại sao muỗi vo ve quanh tai chúng ta?

I/flutter (26492):

I/flutter (26492): Trang Phạm

I/flutter (26492):

I/flutter (26492): ## (Dn trí) - Đã có rất nhiều nghiên cứu về "khẩu vị" của loài côn trùng bé nhỏ đầy khó chịu này.

I/flutter (26492):

I/flutter (26492): Michael Riehle, một giáo sư côn trùng học tại Đại học Arizona (Mỹ) cho biết: "Tiếng vo ve quanh tai của bạn hầu hết chỉ là tác dụng phụ của việc muỗi đập cánh. Bạn sẽ nhận thấy điều đó nhiều nhất khi chúng bay quanh tai bạn". [...] Riehle chứng minh hiệu ứng này cho các học sinh của mình bằng cách đưa một m thoa hướng tới qua lồng muỗi cái. Trong mọi thử nghiệm, những con cái không phản ứng. Nhưng có một cuộc biểu tình tương tự trên lồng của những con muỗi đực giương cánh bay loạn xạ khi chúng điên cuồng tìm kiếm nữ thần đã tạo ra những rung động ngọt ngào êm ái đó.

I/flutter (26492):

I/flutter (26492): Trong khi muỗi đực phát ra m thanh này một cách hoang dã, con người ít cảm thấy hồi hộp hơn khi nghe nó. [...] Trong khi điều này nghe giống như một chiếc máy bay không người lái the thé đối với chúng ta thì nó là m nhạc đối với muỗi đực. Trên thực tế, những con đực có nhị}, {title: Bị bọ cánh cứng quấy phá, có cách diệt rất đơn giản và hiệu quả, url: https://dantri.com.vn/khoa-hoc/bi-bo-canh-cung-quay-pha-co-cach-diet-rat-don-gian-va-hieu-qua-20210512094959817.htm, content: Bọ cánh cứng là loài côn trùng đã xuất hiện ở Việt Nam từ hàng chục năm, vàcó thời điểm là "cơn ác mộng" với người nông dân vì mật độ sinh sôi dày đặc của chúng. Loài côn trùng này hoành hành khiến cây trồng xơ xác, trụi lá, thậm chí ở một số cây chỉ còn lại trái non treo lủng lẳng. Từ đó

I/flutter (26492):

I/flutter (26492): # Bị bọ cánh cứng quấy phá, có cách diệt rất đơn giản và hiệu quả

I/flutter (26492):

I/flutter (26492): <p>Bị bọ cánh cứng quấy phá, có cách diệt rất đơn giản và hiệu quả | Báo Dân trí</p>

I/flutter (26492):

I/flutter (26492): Fica DTiNews Nội vụ & Xã hội

I/flutter (26492):

I/flutter (26492): Xu hướng

I/flutter (26492):

I/flutter (26492): * # Tuần lễ Khoa học Công nghệ VinFuture 2025

I/flutter (26492): * # Chung cư cấm xe điện

I/flutter (26492): * # Cháy quán ăn làm 4 người chết ở TPHCM

I/flutter (26492): * # Ngập lụt ở Lâm Đồng

I/flutter (26492): * # SEA Games 33

I/flutter (26492): * # Tài xế lái Lexux tông em gái ở Tây Ninh

I/flutter (26492): * # Kỳ họp thứ 10 Quốc hội khóa XV

I/flutter (26492): * # Vợ chồng chủ thẩm mỹ viện Mailisa bị khởi tố

I/flutter (26492): * # Cháy chung cư ở Hong Kong làm 44 người chết

I/flutter (26492): * # Sinh viên "tố" trường chậm chi trả tiền A80

I/flutter (26492):

I/flutter (26492): * Khoa học

I/flutter (26492): * Khoa học & đời sống

I/flutter (26492):

I/flutter (26492): Bị bọ cánh cứng quấy phá, có cách diệt rất đơn giản và hiệu quả

I/flutter (26492): =======================================}, {title: Chuồn chuồn kim: thế giới của sắc màu - Báo Dân trí, url: https://dantri.com.vn/ban-doc/chuon-chuon-kim-the-gioi-cua-sac-mau-1305173172.htm, content: (Dân trí) - Chuồn chuồn kim - cái tên đã nói lên sự nhỏ nhắn và quả là khó khăn khi con người muốn quan sát nó. Tuy nhiên sự ra đời củamáyảnh kỹ thuật số ngày naycó thể lưu lại thế giới muôn màu của những cây kim biết bay này.

I/flutter (26492):

I/flutter (26492): # Chuồn chuồn kim: thế giới của sắc màu

I/flutter (26492):

I/flutter (26492): <p>Chuồn chuồn kim: thế giới của sắc màu | Báo Dân trí</p>

I/flutter (26492):

I/flutter (26492): Fica DTiNews Nội vụ & Xã hội

I/flutter (26492):

I/flutter (26492): Xu hướng

I/flutter (26492):

I/flutter (26492): * # Tuần lễ Khoa học Công nghệ VinFuture 2025

I/flutter (26492): * # Chung cư cấm xe điện

I/flutter (26492): * # Cháy quán ăn làm 4 người chết ở TPHCM

I/flutter (26492): * # Ngập lụt ở Lâm Đồng

I/flutter (26492): * # SEA Games 33

I/flutter (26492): * # Tài xế lái Lexux tông em gái ở Tây Ninh

I/flutter (26492): * # Kỳ họp thứ 10 Quốc hội khóa XV

I/flutter (26492): * # Vợ chồng chủ thẩm mỹ viện Mailisa bị khởi tố

I/flutter (26492): * # Cháy chung cư ở Hong Kong làm 44 người chết

I/flutter (26492): * # Sinh viên "tố" trường chậm chi trả tiền A80

I/flutter (26492):

I/flutter (26492): * Bạn đọc

I/flutter (26492):

I/flutter (26492): Chuồn chuồn kim: thế giới của sắc màu

I/flutter (26492): =====================================

I/flutter (26492):

I/flutter (26492): Thứ hai, 09/05/2011 - 00:04

I/flutter (26492):

I/flutter (26492): (Dân trí) - Chuồn chuồn kim - cái tên đã nói lên sự nhỏ nhắn và quả là khó khăn khi con người muốn quan sát nó. Tuy nhiên sự ra đời của}], images: []}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (26492): [SSE][data] {content: 1}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (26492): [SSE][data] {content: .}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Direct"}}

I/flutter (26492): [SSE][data] {content: Direct}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Answer"}}

I/flutter (26492): [SSE][data] {content:  Answer}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (26492): [SSE][data] {content: **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "  \n"}}

I/flutter (26492): [SSE][data] {content:

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: Không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (26492): [SSE][data] {content:  có}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  thông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tin"}}

I/flutter (26492): [SSE][data] {content:  tin}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0o"}}

I/flutter (26492): [SSE][data] {content:  nào}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (26492): [SSE][data] {content:  trong}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (26492): [SSE][data] {content:  được}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (26492): [SSE][data] {content:  c}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ung"}}

I/flutter (26492): [SSE][data] {content: ung}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5p"}}

I/flutter (26492): [SSE][data] {content:  cấp}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (26492): [SSE][data] {content:  việc}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1eed"}}

I/flutter (26492): [SSE][data] {content:  sử}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1ee5ng"}}

I/flutter (26492): [SSE][data] {content:  dụng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1eadt"}}

I/flutter (26492): [SSE][data] {content:  thuật}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u1eef"}}

I/flutter (26492): [SSE][data] {content:  ngữ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chu\u1ea9n"}}

I/flutter (26492): [SSE][data] {content:  chuẩn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0"}}

I/flutter (26492): [SSE][data] {content:  như}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (26492): [SSE][data] {content:  "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "co"}}

I/flutter (26492): [SSE][data] {content: co}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " may"}}

I/flutter (26492): [SSE][data] {content:  may}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chan"}}

I/flutter (26492): [SSE][data] {content:  chan}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\""}}

I/flutter (26492): [SSE][data] {content: "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  để}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u00f4"}}

I/flutter (26492): [SSE][data] {content:  mô}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea3"}}

I/flutter (26492): [SSE][data] {content:  tả}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ea5n"}}

I/flutter (26492): [SSE][data] {content:  vấn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  đề}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  chất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1eb7c"}}

I/flutter (26492): [SSE][data] {content:  hoặc}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00e0nh"}}

I/flutter (26492): [SSE][data] {content:  hành}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (26492): [SSE][data] {content:  vi}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (26492): [SSE][data] {content:  ở}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (26492): [SSE][data] {content: .}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " C\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  Các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (26492): [SSE][data] {content: 1}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (26492): [SSE][data] {content: 5}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  đề}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1eadp"}}

I/flutter (26492): [SSE][data] {content:  cập}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ee7"}}

I/flutter (26492): [SSE][data] {content:  chủ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  đề}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0"}}

I/flutter (26492): [SSE][data] {content:  như}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch"}}

I/flutter (26492): [SSE][data] {content:  ch}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea5n"}}

I/flutter (26492): [SSE][data] {content: ấn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u01b0\u01a1ng"}}

I/flutter (26492): [SSE][data] {content:  thương}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s"}}

I/flutter (26492): [SSE][data] {content:  s}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ecd"}}

I/flutter (26492): [SSE][data] {content: ọ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e3o"}}

I/flutter (26492): [SSE][data] {content:  não}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1eb9"}}

I/flutter (26492): [SSE][data] {content:  nhẹ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kho"}}

I/flutter (26492): [SSE][data] {content:  kho}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (26492): [SSE][data] {content:  chân}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (26492): [SSE][data] {content:  b}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea9m"}}

I/flutter (26492): [SSE][data] {content: ẩm}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " sinh"}}

I/flutter (26492): [SSE][data] {content:  sinh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00e0nh"}}

I/flutter (26492): [SSE][data] {content:  hành}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (26492): [SSE][data] {content:  vi}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (26492): [SSE][data] {content:  của}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " mu"}}

I/flutter (26492): [SSE][data] {content:  mu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed7i"}}

I/flutter (26492): [SSE][data] {content: ỗi}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (26492): [SSE][data] {content:  b}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ecd"}}

I/flutter (26492): [SSE][data] {content: ọ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1nh"}}

I/flutter (26492): [SSE][data] {content:  cánh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee9ng"}}

I/flutter (26492): [SSE][data] {content:  cứng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (26492): [SSE][data] {content:  và}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chu"}}

I/flutter (26492): [SSE][data] {content:  chu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3n"}}

I/flutter (26492): [SSE][data] {content: ồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chu"}}

I/flutter (26492): [SSE][data] {content:  chu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3n"}}

I/flutter (26492): [SSE][data] {content: ồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kim"}}

I/flutter (26492): [SSE][data] {content:  kim}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u2014"}}

I/flutter (26492): [SSE][data] {content:  —}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (26492): [SSE][data] {content:  nhưng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (26492): [SSE][data] {content: kh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: ông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  đề}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1eadp"}}

I/flutter (26492): [SSE][data] {content:  cập}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (26492): [SSE][data] {content: **,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (26492): [SSE][data] {content: kh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: ông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (26492): [SSE][data] {content:  có}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1eadt"}}

I/flutter (26492): [SSE][data] {content:  thuật}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u1eef"}}

I/flutter (26492): [SSE][data] {content:  ngữ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (26492): [SSE][data] {content:  "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "co"}}

I/flutter (26492): [SSE][data] {content: co}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " may"}}

I/flutter (26492): [SSE][data] {content:  may}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chan"}}

I/flutter (26492): [SSE][data] {content:  chan}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\""}}

I/flutter (26492): [SSE][data] {content: "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (26492): [SSE][data] {content: **,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (26492): [SSE][data] {content:  và}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (26492): [SSE][data] {content: kh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: ông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (26492): [SSE][data] {content:  c}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ung"}}

I/flutter (26492): [SSE][data] {content: ung}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5p"}}

I/flutter (26492): [SSE][data] {content:  cấp}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  bất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " k\u1ef3"}}

I/flutter (26492): [SSE][data] {content:  kỳ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  thông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tin"}}

I/flutter (26492): [SSE][data] {content:  tin}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " li\u00ean"}}

I/flutter (26492): [SSE][data] {content:  liên}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu"}}

I/flutter (26492): [SSE][data] {content:  qu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "an"}}

I/flutter (26492): [SSE][data] {content: an}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch"}}

I/flutter (26492): [SSE][data] {content:  ch}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea9n"}}

I/flutter (26492): [SSE][data] {content: ẩn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111o\u00e1n"}}

I/flutter (26492): [SSE][data] {content:  đoán}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec7nh"}}

I/flutter (26492): [SSE][data] {content:  bệnh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00fd"}}

I/flutter (26492): [SSE][data] {content:  lý}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (26492): [SSE][data] {content:  ở}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (26492): [SSE][data] {content: **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ".\n\n"}}

I/flutter (26492): [SSE][data] {content: .

I/flutter (26492):

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "2"}}

I/flutter (26492): [SSE][data] {content: 2}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (26492): [SSE][data] {content: .}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Detailed"}}

I/flutter (26492): [SSE][data] {content: Detailed}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Explanation"}}

I/flutter (26492): [SSE][data] {content:  Explanation}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (26492): [SSE][data] {content: **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "  \n"}}

I/flutter (26492): [SSE][data] {content:

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (26492): [SSE][data] {content: -}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " T\u1eeb"}}

I/flutter (26492): [SSE][data] {content:  Từ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (26492): [SSE][data] {content:  "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "co"}}

I/flutter (26492): [SSE][data] {content: co}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " may"}}

I/flutter (26492): [SSE][data] {content:  may}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chan"}}

I/flutter (26492): [SSE][data] {content:  chan}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\""}}

I/flutter (26492): [SSE][data] {content: "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u1ea3i"}}

I/flutter (26492): [SSE][data] {content:  phải}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (26492): [SSE][data] {content:  là}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ed9t"}}

I/flutter (26492): [SSE][data] {content:  một}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1eadt"}}

I/flutter (26492): [SSE][data] {content:  thuật}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u1eef"}}

I/flutter (26492): [SSE][data] {content:  ngữ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " y"}}

I/flutter (26492): [SSE][data] {content:  y}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ecdc"}}

I/flutter (26492): [SSE][data] {content:  học}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chu\u1ea9n"}}

I/flutter (26492): [SSE][data] {content:  chuẩn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u0169ng"}}

I/flutter (26492): [SSE][data] {content:  cũng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " xu\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  xuất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hi\u1ec7n"}}

I/flutter (26492): [SSE][data] {content:  hiện}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (26492): [SSE][data] {content:  trong}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  bất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " k\u1ef3"}}

I/flutter (26492): [SSE][data] {content:  kỳ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00e0i"}}

I/flutter (26492): [SSE][data] {content:  tài}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " li\u1ec7u"}}

I/flutter (26492): [SSE][data] {content:  liệu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0o"}}

I/flutter (26492): [SSE][data] {content:  nào}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (26492): [SSE][data] {content:  được}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (26492): [SSE][data] {content:  c}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ung"}}

I/flutter (26492): [SSE][data] {content: ung}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5p"}}

I/flutter (26492): [SSE][data] {content:  cấp}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (26492): [SSE][data] {content: .}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0110\u00e2y"}}

I/flutter (26492): [SSE][data] {content:  Đây}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (26492): [SSE][data] {content:  có}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (26492): [SSE][data] {content:  là}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ed9t"}}

I/flutter (26492): [SSE][data] {content:  một}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1ch"}}

I/flutter (26492): [SSE][data] {content:  cách}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di\u1ec5n"}}

I/flutter (26492): [SSE][data] {content:  diễn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea1t"}}

I/flutter (26492): [SSE][data] {content:  đạt}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00ednh"}}

I/flutter (26492): [SSE][data] {content:  chính}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " x\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  xác}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1eb7c"}}

I/flutter (26492): [SSE][data] {content:  hoặc}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecba"}}

I/flutter (26492): [SSE][data] {content:  địa}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u01b0\u01a1ng"}}

I/flutter (26492): [SSE][data] {content:  phương}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (26492): [SSE][data] {content:  nhưng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (26492): [SSE][data] {content: kh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: ông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " x\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  xác}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecbnh"}}

I/flutter (26492): [SSE][data] {content:  định}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (26492): [SSE][data] {content:  được}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u00fd"}}

I/flutter (26492): [SSE][data] {content:  ý}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngh\u0129a"}}

I/flutter (26492): [SSE][data] {content:  nghĩa}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee5"}}

I/flutter (26492): [SSE][data] {content:  cụ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (26492): [SSE][data] {content: **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1ef1"}}

I/flutter (26492): [SSE][data] {content:  dự}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "a"}}

I/flutter (26492): [SSE][data] {content: a}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (26492): [SSE][data] {content:  trên}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hi\u1ec7n"}}

I/flutter (26492): [SSE][data] {content:  hiện}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (26492): [SSE][data] {content:  có}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " `["}}

I/flutter (26492): [SSE][data] {content:  `[}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (26492): [SSE][data] {content: 1}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "2"}}

I/flutter (26492): [SSE][data] {content: 2}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "3"}}

I/flutter (26492): [SSE][data] {content: 3}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "4"}}

I/flutter (26492): [SSE][data] {content: 4}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (26492): [SSE][data] {content: 5}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "`.\n"}}

I/flutter (26492): [SSE][data] {content: `.

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (26492): [SSE][data] {content: -}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " C\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  Các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (26492): [SSE][data] {content: 1}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (26492): [SSE][data] {content:  và}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "2"}}

I/flutter (26492): [SSE][data] {content: 2}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00f3i"}}

I/flutter (26492): [SSE][data] {content:  nói}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec7nh"}}

I/flutter (26492): [SSE][data] {content:  bệnh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00fd"}}

I/flutter (26492): [SSE][data] {content:  lý}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (26492): [SSE][data] {content:  ở}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u01b0\u1eddi"}}

I/flutter (26492): [SSE][data] {content:  người}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (26492): [SSE][data] {content:  b}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ao"}}

I/flutter (26492): [SSE][data] {content: ao}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " g\u1ed3m"}}

I/flutter (26492): [SSE][data] {content:  gồm}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch"}}

I/flutter (26492): [SSE][data] {content:  ch}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea5n"}}

I/flutter (26492): [SSE][data] {content: ấn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u01b0\u01a1ng"}}

I/flutter (26492): [SSE][data] {content:  thương}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s"}}

I/flutter (26492): [SSE][data] {content:  s}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ecd"}}

I/flutter (26492): [SSE][data] {content: ọ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e3o"}}

I/flutter (26492): [SSE][data] {content:  não}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1eb9"}}

I/flutter (26492): [SSE][data] {content:  nhẹ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (26492): [SSE][data] {content:  và}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kho"}}

I/flutter (26492): [SSE][data] {content:  kho}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (26492): [SSE][data] {content:  chân}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (26492): [SSE][data] {content:  b}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea9m"}}

I/flutter (26492): [SSE][data] {content: ẩm}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " sinh"}}

I/flutter (26492): [SSE][data] {content:  sinh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (26492): [SSE][data] {content:  nhưng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " li\u00ean"}}

I/flutter (26492): [SSE][data] {content:  liên}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu"}}

I/flutter (26492): [SSE][data] {content:  qu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "an"}}

I/flutter (26492): [SSE][data] {content: an}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (26492): [SSE][data] {content:  động}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eadt"}}

I/flutter (26492): [SSE][data] {content:  vật}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1eb7c"}}

I/flutter (26492): [SSE][data] {content:  đặc}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " bi\u1ec7t"}}

I/flutter (26492): [SSE][data] {content:  biệt}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (26492): [SSE][data] {content:  là}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " `["}}

I/flutter (26492): [SSE][data] {content:  `[}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (26492): [SSE][data] {content: 1}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "2"}}

I/flutter (26492): [SSE][data] {content: 2}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "`.\n"}}

I/flutter (26492): [SSE][data] {content: `.

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (26492): [SSE][data] {content: -}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " N"}}

I/flutter (26492): [SSE][data] {content:  N}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "gu"}}

I/flutter (26492): [SSE][data] {content: gu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3n"}}

I/flutter (26492): [SSE][data] {content: ồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "3"}}

I/flutter (26492): [SSE][data] {content: 3}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00f3i"}}

I/flutter (26492): [SSE][data] {content:  nói}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00e0nh"}}

I/flutter (26492): [SSE][data] {content:  hành}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (26492): [SSE][data] {content:  vi}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (26492): [SSE][data] {content:  của}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " mu"}}

I/flutter (26492): [SSE][data] {content:  mu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed7i"}}

I/flutter (26492): [SSE][data] {content: ỗi}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "4"}}

I/flutter (26492): [SSE][data] {content: 4}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (26492): [SSE][data] {content:  b}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ecd"}}

I/flutter (26492): [SSE][data] {content: ọ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1nh"}}

I/flutter (26492): [SSE][data] {content:  cánh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee9ng"}}

I/flutter (26492): [SSE][data] {content:  cứng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (26492): [SSE][data] {content:  và}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (26492): [SSE][data] {content:  [}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (26492): [SSE][data] {content: 5}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chu"}}

I/flutter (26492): [SSE][data] {content:  chu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3n"}}

I/flutter (26492): [SSE][data] {content: ồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chu"}}

I/flutter (26492): [SSE][data] {content:  chu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3n"}}

I/flutter (26492): [SSE][data] {content: ồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kim"}}

I/flutter (26492): [SSE][data] {content:  kim}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u2014"}}

I/flutter (26492): [SSE][data] {content:  —}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  tất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea3"}}

I/flutter (26492): [SSE][data] {content:  cả}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1u"}}

I/flutter (26492): [SSE][data] {content:  đều}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (26492): [SSE][data] {content:  là}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (26492): [SSE][data] {content:  c}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4n"}}

I/flutter (26492): [SSE][data] {content: ôn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00f9ng"}}

I/flutter (26492): [SSE][data] {content:  trùng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " li\u00ean"}}

I/flutter (26492): [SSE][data] {content:  liên}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu"}}

I/flutter (26492): [SSE][data] {content:  qu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "an"}}

I/flutter (26492): [SSE][data] {content: an}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " `["}}

I/flutter (26492): [SSE][data] {content:  `[}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "3"}}

I/flutter (26492): [SSE][data] {content: 3}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "4"}}

I/flutter (26492): [SSE][data] {content: 4}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (26492): [SSE][data] {content: 5}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "`.\n"}}

I/flutter (26492): [SSE][data] {content: `.

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (26492): [SSE][data] {content: -}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  Không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (26492): [SSE][data] {content:  có}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  thông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tin"}}

I/flutter (26492): [SSE][data] {content:  tin}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0o"}}

I/flutter (26492): [SSE][data] {content:  nào}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (26492): [SSE][data] {content:  trong}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1ea5u"}}

I/flutter (26492): [SSE][data] {content:  dấu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hi\u1ec7u"}}

I/flutter (26492): [SSE][data] {content:  hiệu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1eadn"}}

I/flutter (26492): [SSE][data] {content:  nhận}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " bi\u1ebft"}}

I/flutter (26492): [SSE][data] {content:  biết}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ea5n"}}

I/flutter (26492): [SSE][data] {content:  vấn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  đề}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ee9c"}}

I/flutter (26492): [SSE][data] {content:  sức}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u1ecfe"}}

I/flutter (26492): [SSE][data] {content:  khỏe}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (26492): [SSE][data] {content:  ở}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00f9"}}

I/flutter (26492): [SSE][data] {content:  dù}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (26492): [SSE][data] {content:  là}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  chất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hay"}}

I/flutter (26492): [SSE][data] {content:  hay}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00e0nh"}}

I/flutter (26492): [SSE][data] {content:  hành}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (26492): [SSE][data] {content:  vi}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00ean"}}

I/flutter (26492): [SSE][data] {content:  nên}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (26492): [SSE][data] {content: kh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: ông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (26492): [SSE][data] {content:  c}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ung"}}

I/flutter (26492): [SSE][data] {content: ung}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5p"}}

I/flutter (26492): [SSE][data] {content:  cấp}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01b0\u1edbng"}}

I/flutter (26492): [SSE][data] {content:  hướng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1eabn"}}

I/flutter (26492): [SSE][data] {content:  dẫn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  về}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (26492): [SSE][data] {content:  việc}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (26492): [SSE][data] {content:  "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "nh"}}

I/flutter (26492): [SSE][data] {content: nh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1eadn"}}

I/flutter (26492): [SSE][data] {content: ận}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di\u1ec7n"}}

I/flutter (26492): [SSE][data] {content:  diện}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\""}}

I/flutter (26492): [SSE][data] {content: "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ea5n"}}

I/flutter (26492): [SSE][data] {content:  vấn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1"}}

I/flutter (26492): [SSE][data] {content:  đề}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (26492): [SSE][data] {content:  ở}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1eb1ng"}}

I/flutter (26492): [SSE][data] {content:  bằng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ea5t"}}

I/flutter (26492): [SSE][data] {content:  bất}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " k\u1ef3"}}

I/flutter (26492): [SSE][data] {content:  kỳ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1eadt"}}

I/flutter (26492): [SSE][data] {content:  thuật}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u1eef"}}

I/flutter (26492): [SSE][data] {content:  ngữ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0o"}}

I/flutter (26492): [SSE][data] {content:  nào}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (26492): [SSE][data] {content: **,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " k\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  kể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea3"}}

I/flutter (26492): [SSE][data] {content:  cả}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (26492): [SSE][data] {content:  "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "co"}}

I/flutter (26492): [SSE][data] {content: co}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " may"}}

I/flutter (26492): [SSE][data] {content:  may}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chan"}}

I/flutter (26492): [SSE][data] {content:  chan}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\".\n\n"}}

I/flutter (26492): [SSE][data] {content: ".

I/flutter (26492):

I/flutter (26492): }

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (26492): [SSE][data] {content: **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "K"}}

I/flutter (26492): [SSE][data] {content: K}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ebft"}}

I/flutter (26492): [SSE][data] {content: ết}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lu\u1eadn"}}

I/flutter (26492): [SSE][data] {content:  luận}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**:"}}

I/flutter (26492): [SSE][data] {content: **:}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Kh\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  Không}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (26492): [SSE][data] {content:  thể}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " x\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  xác}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecbnh"}}

I/flutter (26492): [SSE][data] {content:  định}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1eb7c"}}

I/flutter (26492): [SSE][data] {content:  hoặc}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u1ea3i"}}

I/flutter (26492): [SSE][data] {content:  giải}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00edch"}}

I/flutter (26492): [SSE][data] {content:  thích}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u00fd"}}

I/flutter (26492): [SSE][data] {content:  ý}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngh\u0129a"}}

I/flutter (26492): [SSE][data] {content:  nghĩa}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (26492): [SSE][data] {content:  của}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (26492): [SSE][data] {content:  "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "co"}}

I/flutter (26492): [SSE][data] {content: co}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " may"}}

I/flutter (26492): [SSE][data] {content:  may}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chan"}}

I/flutter (26492): [SSE][data] {content:  chan}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\""}}

I/flutter (26492): [SSE][data] {content: "}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (26492): [SSE][data] {content:  trong}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u1eef"}}

I/flutter (26492): [SSE][data] {content:  ngữ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea3nh"}}

I/flutter (26492): [SSE][data] {content:  cảnh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ee9c"}}

I/flutter (26492): [SSE][data] {content:  sức}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u1ecfe"}}

I/flutter (26492): [SSE][data] {content:  khỏe}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00ec"}}

I/flutter (26492): [SSE][data] {content:  vì}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (26492): [SSE][data] {content:  **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (26492): [SSE][data] {content: kh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (26492): [SSE][data] {content: ông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (26492): [SSE][data] {content:  có}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00f4ng"}}

I/flutter (26492): [SSE][data] {content:  thông}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tin"}}

I/flutter (26492): [SSE][data] {content:  tin}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0o"}}

I/flutter (26492): [SSE][data] {content:  nào}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (26492): [SSE][data] {content:  trong}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (26492): [SSE][data] {content:  nguồn}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (26492): [SSE][data] {content:  được}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (26492): [SSE][data] {content:  c}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ung"}}

I/flutter (26492): [SSE][data] {content: ung}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5p"}}

I/flutter (26492): [SSE][data] {content:  cấp}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " li\u00ean"}}

I/flutter (26492): [SSE][data] {content:  liên}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu"}}

I/flutter (26492): [SSE][data] {content:  qu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "an"}}

I/flutter (26492): [SSE][data] {content: an}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ebfn"}}

I/flutter (26492): [SSE][data] {content:  đến}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (26492): [SSE][data] {content:  các}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tri\u1ec7u"}}

I/flutter (26492): [SSE][data] {content:  triệu}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ee9ng"}}

I/flutter (26492): [SSE][data] {content:  chứng}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec7nh"}}

I/flutter (26492): [SSE][data] {content:  bệnh}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00fd"}}

I/flutter (26492): [SSE][data] {content:  lý}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (26492): [SSE][data] {content:  ở}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (26492): [SSE][data] {content:  m}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (26492): [SSE][data] {content: è}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (26492): [SSE][data] {content: o}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (26492): [SSE][data] {content: ,}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hay"}}

I/flutter (26492): [SSE][data] {content:  hay}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1eadt"}}

I/flutter (26492): [SSE][data] {content:  thuật}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u1eef"}}

I/flutter (26492): [SSE][data] {content:  ngữ}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0y"}}

I/flutter (26492): [SSE][data] {content:  này}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (26492): [SSE][data] {content: **}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " `["}}

I/flutter (26492): [SSE][data] {content:  `[}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (26492): [SSE][data] {content: 1}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "2"}}

I/flutter (26492): [SSE][data] {content: 2}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "3"}}

I/flutter (26492): [SSE][data] {content: 3}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "4"}}

I/flutter (26492): [SSE][data] {content: 4}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]["}}

I/flutter (26492): [SSE][data] {content: ][}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (26492): [SSE][data] {content: 5}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]"}}

I/flutter (26492): [SSE][data] {content: ]}

I/flutter (26492): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "`."}}

I/flutter (26492): [SSE][data] {content: `.}

I/flutter (26492): [SSE][raw] {"event": "related-queries", "data": {"event_type": "related-queries", "related_queries": ["What are the common physical symptoms of illness in cats that might be mistaken for non-standard terms?", "Are there regional or colloquial terms used in Vietnamese-speaking communities to describe cat health issues, and what do they actually mean?", "How can I differentiate between normal cat behavior and signs of underlying medical or behavioral problems?"]}}

I/flutter (26492): [SSE][data] {related_queries: [What are the common physical symptoms of illness in cats that might be mistaken for non-standard terms?, Are there regional or colloquial terms used in Vietnamese-speaking communities to describe cat health issues, and what do they actually mean?, How can I differentiate between normal cat behavior and signs of underlying medical or behavioral problems?]}

I/flutter (26492): [SSE][raw] {"event": "final-response", "data": {"event_type": "final-response", "message": "1. **Direct Answer**  \nKh\u00f4ng c\u00f3 th\u00f4ng tin n\u00e0o trong c\u00e1c ngu\u1ed3n \u0111\u01b0\u1ee3c cung c\u1ea5p v\u1ec1 vi\u1ec7c s\u1eed d\u1ee5ng thu\u1eadt ng\u1eef kh\u00f4ng chu\u1ea9n nh\u01b0 \"co may chan\" \u0111\u1ec3 m\u00f4 t\u1ea3 c\u00e1c v\u1ea5n \u0111\u1ec1 th\u1ec3 ch\u1ea5t ho\u1eb7c h\u00e0nh vi \u1edf m\u00e8o. C\u00e1c ngu\u1ed3n [1] \u0111\u1ebfn [5] \u0111\u1ec1 c\u1eadp \u0111\u1ebfn c\u00e1c ch\u1ee7 \u0111\u1ec1 nh\u01b0 ch\u1ea5n th\u01b0\u01a1ng s\u1ecd n\u00e3o nh\u1eb9, kho\u00e8o ch\u00e2n b\u1ea9m sinh, h\u00e0nh vi c\u1ee7a mu\u1ed7i, b\u1ecd c\u00e1nh c\u1ee9ng v\u00e0 chu\u1ed3n chu\u1ed3n kim \u2014 nh\u01b0ng **kh\u00f4ng \u0111\u1ec1 c\u1eadp \u0111\u1ebfn m\u00e8o**, **kh\u00f4ng c\u00f3 thu\u1eadt ng\u1eef \"co may chan\"**, v\u00e0 **kh\u00f4ng cung c\u1ea5p b\u1ea5t k\u1ef3 th\u00f4ng tin li\u00ean quan \u0111\u1ebfn ch\u1ea9n \u0111o\u00e1n b\u1ec7nh l\u00fd \

I/flutter (26492): [SSE][data] {event_type: final-response, message: 1. **Direct Answer**

I/flutter (26492): Không có thông tin nào trong các nguồn được cung cấp về việc sử dụng thuật ngữ không chuẩn như "co may chan" để mô tả các vấn đề thể chất hoặc hành vi ở mèo. Các nguồn [1] đến [5] đề cập đến các chủ đề như chấn thương sọ não nhẹ, khoèo chân bẩm sinh, hành vi của muỗi, bọ cánh cứng và chuồn chuồn kim — nhưng **không đề cập đến mèo**, **không có thuật ngữ "co may chan"**, và **không cung cấp bất kỳ thông tin liên quan đến chẩn đoán bệnh lý ở mèo**.

I/flutter (26492):

I/flutter (26492): 2. **Detailed Explanation**

I/flutter (26492): - Từ "co may chan" không phải là một thuật ngữ y học chuẩn, cũng không xuất hiện trong bất kỳ nguồn tài liệu nào được cung cấp. Đây có thể là một cách diễn đạt không chính xác hoặc địa phương, nhưng **không thể xác định được ý nghĩa cụ thể** dựa trên các nguồn hiện có `[1][2][3][4][5]`.

I/flutter (26492): - Các nguồn [1] và [2] nói về các bệnh lý ở người, bao gồm chấn thương sọ não nhẹ và khoèo chân bẩm sinh, nhưng không liên quan đến động vật, đặc biệt là mèo `[1][2]`.

I/flutter (26492): - Nguồn [3] nói về hành vi của muỗi, nguồn [4] về bọ cánh cứng, và nguồn [5] về chuồn chuồn kim — tất cả đều là côn trùng, không liên quan đến mèo `[3][4][5]`.

I/flutter (26492): - Không có thông tin nào trong các nguồn về các dấu hiệu nhận biết vấn đề sức khỏe ở mèo, dù là thể chất hay hành vi, nên **không thể cung cấp hướng dẫn về việc "nhận diện" các vấn đề ở mèo bằng bất kỳ thuật ngữ nào**, kể cả "co may chan".

I/flutter (26492):

I/flutter (26492): **Kết luận**: Không thể xác định hoặc giải thích ý nghĩa của "co may chan" trong ngữ cảnh sức khỏe mèo vì **không có thông tin nào trong các nguồn được cung cấp liên quan đến mèo, các triệu chứng bệnh lý ở mèo, hay thuật ngữ này** `[1][2][3][4][5]`.}

I/flutter (26492): [SSE][raw] {"event": "stream-end", "data": {"event_type": "stream-end", "thread_id": "thread_1764960914674"}}

I/flutter (26492): [SSE] Stream done



---

**Cursor**

```dart
import 'package:dio/dio.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/injector/modules/dio_module.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/core/keys/app_keys.dart';

class SourceService {
  SourceService._();

  static final SourceService instance = SourceService._();

  final LocalStorageService _localStorage =
      Injector.instance<LocalStorageService>();

  List<Resource> _webResources = _defaultWebResources;
  List<Resource> _knowledgeBaseResources = _defaultKnowledgeBaseResources;

  Set<String> _selectedWebUris =
      _defaultWebResources.map((r) => r.uri).toSet();
  Set<String> _selectedKnowledgeBaseUris =
      _defaultKnowledgeBaseResources.map((r) => r.uri).toSet();

  Future<void>? _ongoingFetch;

  List<Resource> get webResources => _webResources;
  List<Resource> get knowledgeBaseResources => _knowledgeBaseResources;
  Set<String> get selectedWebUris => _selectedWebUris;
  Set<String> get selectedKnowledgeBaseUris => _selectedKnowledgeBaseUris;

  bool get hasCustomSelection =>
      _selectedWebUris.length != _webResources.length ||
      _selectedKnowledgeBaseUris.length != _knowledgeBaseResources.length;

  void updateSelection({
    Set<String>? webUris,
    Set<String>? knowledgeBaseUris,
  }) {
    if (webUris != null) {
      _selectedWebUris = webUris;
    }
    if (knowledgeBaseUris != null) {
      _selectedKnowledgeBaseUris = knowledgeBaseUris;
    }
  }

  ExtraInfoConfig buildExtraInfoConfig({int maxResults = 5}) {
    final selected = _webResources
        .where((r) => _selectedWebUris.contains(r.uri))
        .toList();

    return ExtraInfoConfig(
      enabled: selected.isNotEmpty,
      maxResults: maxResults,
      resources: selected,
    );
  }

  IntraInfoConfig buildIntraInfoConfig({int maxResults = 5}) {
    final selected = _knowledgeBaseResources
        .where((r) => _selectedKnowledgeBaseUris.contains(r.uri))
        .toList();

    return IntraInfoConfig(
      enabled: selected.isNotEmpty,
      maxResults: maxResults,
      resources: selected,
    );
  }

  Future<void> ensureRemoteResourcesLoaded() async {
    if (_ongoingFetch != null) {
      await _ongoingFetch;
      return;
    }

    _ongoingFetch = _fetchRagResources();
    await _ongoingFetch;
    _ongoingFetch = null;
  }

  Future<void> _fetchRagResources() async {
    try {
      final dio =
          Injector.instance<Dio>(instanceName: DioModule.dioInstanceName);

      final token =
          await _localStorage.getString(key: AppKeys.accessTokenKey);

      final response = await dio.get(
        '/api/v1/rag/resources',
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final resourcesJson = data['resources'] as List<dynamic>?;
        if (resourcesJson != null && resourcesJson.isNotEmpty) {
          final fetchedResources = resourcesJson
              .map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList();

          final previousSelection = _selectedKnowledgeBaseUris;
          _knowledgeBaseResources = fetchedResources;

          final newUris = fetchedResources.map((r) => r.uri).toSet();
          final retainedSelection = previousSelection.intersection(newUris);
          final addedNewUris = newUris.difference(previousSelection);

          _selectedKnowledgeBaseUris = retainedSelection.union(addedNewUris);
        }
      }
    } catch (_) {
      // Silently ignore; fallback lists will continue to be used
    }
  }

  /// Update available sources based on incoming SSE search results.
  /// This keeps the selector in sync with what the backend actually searched.
  void ingestSearchResults(List<SearchResult> results) {
    if (results.isEmpty) return;

    final List<Resource> web = [];
    final List<Resource> knowledgeBase = [];

    for (final result in results) {
      final rawUrl = result.url.trim();
      if (rawUrl.isEmpty) continue;

      final normalizedTitle = result.title.trim().isNotEmpty
          ? result.title.trim()
          : _titleFromUri(rawUrl);

      final resource = Resource(
        uri: rawUrl,
        title: normalizedTitle,
        description: result.content.trim().isNotEmpty
            ? result.content.trim()
            : null,
      );

      if (_isKnowledgeBaseUri(rawUrl)) {
        knowledgeBase.add(resource);
      } else {
        web.add(resource);
      }
    }

    _updateWebResources(web);
    _updateKnowledgeBaseResources(knowledgeBase);
  }

  void _updateWebResources(List<Resource> web) {
    if (web.isEmpty) return;

    final deduped = {
      for (final r in web) r.uri: r,
    }.values.toList();

    _webResources = deduped;

    final newUris = deduped.map((r) => r.uri).toSet();
    final retainedSelection = _selectedWebUris.intersection(newUris);

    _selectedWebUris =
        retainedSelection.isNotEmpty ? retainedSelection : newUris;
  }

  void _updateKnowledgeBaseResources(List<Resource> kb) {
    if (kb.isEmpty) return;

    final deduped = {
      for (final r in kb) r.uri: r,
    }.values.toList();

    _knowledgeBaseResources = deduped;

    final newUris = deduped.map((r) => r.uri).toSet();
    final retainedSelection = _selectedKnowledgeBaseUris.intersection(newUris);

    _selectedKnowledgeBaseUris =
        retainedSelection.isNotEmpty ? retainedSelection : newUris;
  }

  bool _isKnowledgeBaseUri(String uri) => uri.startsWith('rag://dataset/');

  String _titleFromUri(String uri) {
    try {
      final parsed = Uri.parse(uri);
      return parsed.host.isNotEmpty ? parsed.host : uri;
    } catch (_) {
      return uri;
    }
  }
}

// Default web resources mirror the web app dropdown
const List<Resource> _defaultWebResources = [
  Resource(uri: 'https://vtv.vn', title: 'Báo VTV'),
  Resource(uri: 'https://cafef.vn', title: 'CafeF'),
  Resource(uri: 'https://chinhphu.vn', title: 'Cổng Thông tin Chính phủ'),
  Resource(
    uri: 'https://dangcongsan.org.vn',
    title: 'Cổng TT Đảng Cộng sản Việt Nam',
  ),
  Resource(uri: 'https://baochinhphu.vn', title: 'Báo Điện tử Chính phủ'),
  Resource(uri: 'https://vnexpress.net', title: 'Báo VNExpress'),
  Resource(uri: 'https://dantri.com.vn', title: 'Báo Dân trí'),
  Resource(uri: 'https://vov.vn', title: 'Báo điện tử VOV'),
  Resource(uri: 'https://vneconomy.vn', title: 'Tạp chí kinh tế Việt Nam'),
];

// Default knowledge base resources (datasets)
const List<Resource> _defaultKnowledgeBaseResources = [
  Resource(
    uri: 'rag://dataset/68d775c2cf2011f0b68bee4add2f28e0',
    title: 'Test',
  ),
  Resource(
    uri: 'rag://dataset/919d1bf8ca8c11f0ab82c6efc818388e',
    title: 'Kinh tế tài chính',
  ),
  Resource(
    uri: 'rag://dataset/30cf3e82ca8c11f09e16c6efc818388e',
    title: 'Chính trị',
  ),
  Resource(
    uri: 'rag://dataset/de45ba0ac84811f0b07ac6efc818388e',
    title: 'Khoa học công nghệ',
  ),
  Resource(
    uri: 'rag://dataset/cb058d08c0c311f091d536febb3bd76d',
    title: 'Thư viện pháp luật',
  ),
  Resource(
    uri: 'rag://dataset/f152f4a2ba8b11f0b42e42712a4e326d',
    title: 'synthnet-knowledge-base',
    description: 'Knowledge base for SynthNet',
  ),
];


```

```dart
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/configs/app_config.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/data/source_service.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';

class ChatApiService {
  ChatApiService({
    String? baseUrl,
    Dio? dio,
  })  : baseUrl = baseUrl ?? AppConfig.baseUrl,
        _dio = dio ?? Dio();

  final String baseUrl;
  final Dio _dio;

  Stream<ChatStreamEvent> streamChat(ChatRequest request) async* {
    final url = '$baseUrl/api/v1/workflow/simple_qa/completions';

    // Get access token from local storage
    final localStorage = Injector.instance<LocalStorageService>();
    final String token =
        (await localStorage.getString(key: AppKeys.accessTokenKey)) ?? '';

    // Prepare request body as JSON object (not string)
    final bodyMap = request.toJson();

    // Prepare headers
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'text/event-stream',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    final controller = StreamController<ChatStreamEvent>.broadcast();

    try {
      final response = await _dio.postUri<ResponseBody>(
        Uri.parse(url),
        data: bodyMap,
        options: Options(
          headers: headers,
          responseType: ResponseType.stream,
          followRedirects: true,
          receiveDataWhenStatusError: true,
        ),
      );

      final stream = response.data?.stream;
      if (stream == null) {
        controller
            .add(const ChatStreamEvent.error('Empty response from server'));
        await controller.close();
      } else {
        stream
            .map((chunk) => chunk.toList())
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .listen((line) {
          final trimmed = line.trim();
          if (trimmed.isEmpty) return;

          // SSE lines usually start with "data:"
          final dataPrefix = 'data:';
          if (trimmed.startsWith(dataPrefix)) {
            final payload = trimmed.substring(dataPrefix.length).trim();

            if (kDebugMode) {
              // Log the raw SSE payload as-is (UTF-8 decoded) to preserve non-English text.
              debugPrint('[SSE][raw] $payload');
            }

            if (payload == '[DONE]') {
              controller.add(const ChatStreamEvent.done());
              controller.close();
              return;
            }

            try {
              final json = jsonDecode(payload) as Map<String, dynamic>;
              final transformedData = _transformApiResponse(json);
              if (transformedData != null) {
                controller.add(ChatStreamEvent.data(transformedData));

                if (kDebugMode) {
                  debugPrint('[SSE][data] $transformedData');
                }
              }
            } catch (e) {
              if (kDebugMode) {
                debugPrint('[SSE] Parse Error: $e');
                // Log full payload to aid debugging localized content.
                debugPrint('[SSE] Data: $payload');
              }
            }
          }
        }, onError: (error) {
          if (kDebugMode) {
            debugPrint('[SSE] Stream error: $error');
          }
          controller.add(ChatStreamEvent.error('Stream error: $error'));
          controller.close();
        }, onDone: () {
          if (kDebugMode) {
            debugPrint('[SSE] Stream done');
          }
          controller.add(const ChatStreamEvent.done());
          controller.close();
        }, cancelOnError: false);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('[SSE] Connection error: $e');
      }
      controller.add(ChatStreamEvent.error('Connection error: $e'));
      await controller.close();
    }

    // Yield events from the controller and handle cleanup
    await for (final event in controller.stream) {
      yield event;
    }
  }

  /// Transforms API response format to match conversation screen expectations
  /// API format: {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "..."}}
  /// Expected format: {"content": "...", "related_queries": [...], etc.}
  Map<String, dynamic>? _transformApiResponse(Map<String, dynamic> json) {
    final event = json['event'] as String?;
    final data = json['data'] as Map<String, dynamic>?;

    if (data == null) return null;

    // Handle different event types
    switch (event) {
      case 'text-chunk':
        // Extract text and map to content field
        final text = data['text'] as String?;
        if (text != null && text.isNotEmpty) {
          return {'content': text};
        }
        return null;

      case 'related-queries':
        // Extract related queries
        final queries = data['related_queries'] as List?;
        if (queries != null && queries.isNotEmpty) {
          return {'related_queries': queries};
        }
        return null;

      case 'search-results':
        final resultsJson = data['results'] as List?;
        if (resultsJson == null || resultsJson.isEmpty) return null;

        final results = resultsJson
            .whereType<Map<String, dynamic>>()
            .map(
              (e) => SearchResult(
                title: (e['title'] ?? '').toString(),
                url: (e['url'] ?? '').toString(),
                content: (e['content'] ?? '').toString(),
              ),
            )
            .where((r) => r.url.isNotEmpty)
            .toList();

        if (results.isEmpty) return null;

        // Keep source selector in sync with what backend actually searched
        SourceService.instance.ingestSearchResults(results);

        return {
          'sources': results.map((r) => r.toJson()).toList(),
          'event_type': 'search-results',
        };

      case 'begin-stream':
        // Signal that response has started
        return {'response_started': true};

      case 'stream-end':
        // Stream is ending - this will be handled by onDone callback
        // Return null to skip this event
        return null;

      default:
        // For unknown events, return the data as-is
        return data;
    }
  }

  void dispose() {}
}

sealed class ChatStreamEvent {
  const ChatStreamEvent();

  const factory ChatStreamEvent.data(Map<String, dynamic> data) = DataEvent;
  const factory ChatStreamEvent.error(String message) = ErrorEvent;
  const factory ChatStreamEvent.done() = DoneEvent;
}

class DataEvent extends ChatStreamEvent {
  final Map<String, dynamic> data;
  const DataEvent(this.data);
}

class ErrorEvent extends ChatStreamEvent {
  final String message;
  const ErrorEvent(this.message);
}

class DoneEvent extends ChatStreamEvent {
  const DoneEvent();
}

```

```dart
import 'package:flutter/material.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';

class SourceSelectorResult {
  const SourceSelectorResult({
    required this.webUris,
    required this.knowledgeBaseUris,
  });

  final Set<String> webUris;
  final Set<String> knowledgeBaseUris;
}

class SourceSelectorSheet extends StatefulWidget {
  const SourceSelectorSheet({
    super.key,
    required this.webResources,
    required this.knowledgeBaseResources,
    required this.selectedWebUris,
    required this.selectedKnowledgeBaseUris,
    required this.isDark,
  });

  final List<Resource> webResources;
  final List<Resource> knowledgeBaseResources;
  final Set<String> selectedWebUris;
  final Set<String> selectedKnowledgeBaseUris;
  final bool isDark;

  static Future<SourceSelectorResult?> show({
    required BuildContext context,
    required bool isDark,
    required List<Resource> webResources,
    required List<Resource> knowledgeBaseResources,
    required Set<String> selectedWebUris,
    required Set<String> selectedKnowledgeBaseUris,
  }) {
    return showModalBottomSheet<SourceSelectorResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          isDark ? DesignSystem.backgroundDarkElevated : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SourceSelectorSheet(
            webResources: webResources,
            knowledgeBaseResources: knowledgeBaseResources,
            selectedWebUris: selectedWebUris,
            selectedKnowledgeBaseUris: selectedKnowledgeBaseUris,
            isDark: isDark,
          ),
        );
      },
    );
  }

  @override
  State<SourceSelectorSheet> createState() => _SourceSelectorSheetState();
}

class _SourceSelectorSheetState extends State<SourceSelectorSheet> {
  late Set<String> _webSelection;
  late Set<String> _kbSelection;
  String _filter = '';

  @override
  void initState() {
    super.initState();
    _webSelection = Set<String>.from(widget.selectedWebUris);
    _kbSelection = Set<String>.from(widget.selectedKnowledgeBaseUris);
  }

  @override
  Widget build(BuildContext context) {
    final filteredWeb = widget.webResources
        .where((r) =>
            r.title.toLowerCase().contains(_filter.toLowerCase()) ||
            r.uri.toLowerCase().contains(_filter.toLowerCase()))
        .toList();
    final filteredKb = widget.knowledgeBaseResources
        .where((r) =>
            r.title.toLowerCase().contains(_filter.toLowerCase()) ||
            r.uri.toLowerCase().contains(_filter.toLowerCase()))
        .toList();

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              left: DesignSystem.spacing16,
              right: DesignSystem.spacing16,
              top: DesignSystem.spacing12,
              bottom:
                  MediaQuery.of(context).viewInsets.bottom + DesignSystem.spacing12,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // Keep sheet from exceeding viewport; allow scrolling instead.
                maxHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: widget.isDark
                    ? Colors.white24
                    : Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Select sources',
                  style: DesignSystem.titleMedium.copyWith(
                    color: widget.isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(SourceSelectorResult(
                      webUris: _webSelection,
                      knowledgeBaseUris: _kbSelection,
                    ));
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildSearchField(),
            const SizedBox(height: 12),
            _buildSection(
              title: 'Web search',
              allResources: widget.webResources,
              resources: filteredWeb,
              selection: _webSelection,
              onToggle: (uri, value) {
                setState(() {
                  if (value) {
                    _webSelection.add(uri);
                  } else {
                    _webSelection.remove(uri);
                  }
                });
              },
              onSelectAll: () {
                setState(() {
                  if (_webSelection.length == widget.webResources.length) {
                    _webSelection.clear();
                  } else {
                    _webSelection = widget.webResources
                        .map((resource) => resource.uri)
                        .toSet();
                  }
                });
              },
              isDark: widget.isDark,
            ),
            const SizedBox(height: 12),
            _buildSection(
              title: 'Knowledge base',
              allResources: widget.knowledgeBaseResources,
              resources: filteredKb,
              selection: _kbSelection,
              onToggle: (uri, value) {
                setState(() {
                  if (value) {
                    _kbSelection.add(uri);
                  } else {
                    _kbSelection.remove(uri);
                  }
                });
              },
              onSelectAll: () {
                setState(() {
                  if (_kbSelection.length == widget.knowledgeBaseResources.length) {
                    _kbSelection.clear();
                  } else {
                    _kbSelection = widget.knowledgeBaseResources
                        .map((resource) => resource.uri)
                        .toSet();
                  }
                });
              },
              isDark: widget.isDark,
            ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: widget.isDark ? Colors.white70 : Colors.black54,
        ),
        hintText: 'Search resources',
        filled: true,
        fillColor:
            widget.isDark ? const Color(0xFF1C1C1C) : const Color(0xFFF4F4F4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color:
                widget.isDark ? Colors.white24 : Colors.black.withOpacity(0.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color:
                widget.isDark ? Colors.white24 : Colors.black.withOpacity(0.1),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      onChanged: (value) {
        setState(() {
          _filter = value.trim();
        });
      },
    );
  }

  Widget _buildSection({
    required String title,
    required List<Resource> allResources,
    required List<Resource> resources,
    required Set<String> selection,
    required void Function(String uri, bool selected) onToggle,
    required VoidCallback onSelectAll,
    required bool isDark,
  }) {
    final allSelected =
        allResources.isNotEmpty && selection.length == allResources.length;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F0F0F) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? DesignSystem.borderDark
              : DesignSystem.borderLight.withOpacity(0.6),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: DesignSystem.bodyLarge.copyWith(
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: TextButton(
              onPressed: onSelectAll,
              child: Text(allSelected ? 'Clear' : 'Select all'),
            ),
          ),
          if (resources.isEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                allResources.isEmpty
                    ? 'No sources received yet'
                    : 'No sources match your search',
                style: DesignSystem.bodySmall.copyWith(
                  color: isDark
                      ? DesignSystem.textSecondaryDark
                      : DesignSystem.textSecondaryLight,
                ),
              ),
            )
          else
            ...resources.map(
              (resource) => CheckboxListTile(
                value: selection.contains(resource.uri),
                onChanged: (value) => onToggle(resource.uri, value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  resource.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: DesignSystem.bodyMedium.copyWith(
                    color: isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                  ),
                ),
                subtitle: Text(
                  _subtitleFor(resource.uri, resource.description),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: DesignSystem.bodySmall.copyWith(
                    color: isDark
                        ? DesignSystem.textSecondaryDark
                        : DesignSystem.textSecondaryLight,
                  ),
                ),
                secondary: _buildAvatar(resource),
                dense: true,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(Resource resource) {
    final uri = resource.uri;
    if (uri.startsWith('http')) {
      return CircleAvatar(
        radius: 16,
        backgroundColor: widget.isDark
            ? const Color(0xFF1F1F1F)
            : const Color(0xFFEAEAEA),
        backgroundImage: NetworkImage(_getFaviconUrl(uri)),
      );
    }

    return CircleAvatar(
      radius: 16,
      backgroundColor:
          widget.isDark ? DesignSystem.primaryCyan.withOpacity(0.2) : null,
      child: Icon(
        Icons.storage_rounded,
        size: 16,
        color: widget.isDark
            ? DesignSystem.primaryCyan
            : DesignSystem.textSecondaryLight,
      ),
    );
  }

  String _subtitleFor(String uri, String? description) {
    if (description != null && description.isNotEmpty) {
      return description;
    }
    if (uri.startsWith('rag://dataset')) {
      return 'dataset';
    }
    try {
      final parsed = Uri.parse(uri);
      return parsed.host;
    } catch (_) {
      return uri;
    }
  }
}

String _getFaviconUrl(String url) {
  try {
    final uri = Uri.parse(url);
    return 'https://www.google.com/s2/favicons?domain=${uri.host}&sz=64';
  } catch (_) {
    return '';
  }
}


```

```dart
  void ingestSearchResultSources(List<SearchResultSource> newSources) {
    // merges and deduplicates sources, preserves current selections
    ...
  }
```

```dart
  void _handleSseEvent(SseEvent event) {
    // parses SSE search-results, updates SourceService with mapped sources
    ...
  }
```

```dart
  Widget build(BuildContext context) {
    // displays dynamic sources and handles empty states with descriptive UI
    ...
  }
```

Implemented dynamic source handling driven by SSE results. Search-result events are now parsed into `SearchResult` objects, forwarded as `sources`, and update the shared source store so Vietnamese titles/URLs are preserved from the stream.  
```131:182:lib/features/chat/data/chat_api_service.dart
  Map<String, dynamic>? _transformApiResponse(Map<String, dynamic> json) {
    ...
      case 'search-results':
        final resultsJson = data['results'] as List?;
        ...
        SourceService.instance.ingestSearchResults(results);
        return {
          'sources': results.map((r) => r.toJson()).toList(),
          'event_type': 'search-results',
        };
```

`SourceService` now ingests streamed search results, separates web vs knowledge-base URIs, dedupes, and retains the user’s selection automatically.  
```125:190:lib/features/chat/data/source_service.dart
  void ingestSearchResults(List<SearchResult> results) {
    ...
    _updateWebResources(web);
    _updateKnowledgeBaseResources(knowledgeBase);
  }
```

The source selector UI reacts to the streamed resources: shows descriptions from SSE when present and displays clear empty states when no sources arrive or filters remove them.  
```249:334:lib/features/chat/view/widgets/source_selector_sheet.dart
          if (resources.isEmpty)
            Padding(
              ...
              child: Text(
                allResources.isEmpty
                    ? 'No sources received yet'
                    : 'No sources match your search',
              ),
            )
          else
            ...resources.map(
              (resource) => CheckboxListTile(
                ...
                subtitle: Text(
                  _subtitleFor(resource.uri, resource.description),
```

Tests not run (not requested). Next step: start a chat, observe SSE `[SSE][data]` search-results entries, then open the source selector to confirm the Vietnamese sources appear dynamically.

```dart
  Map<String, dynamic>? _transformApiResponse(Map<String, dynamic> json) {
    ...
      case 'search-results':
        final resultsJson = data['results'] as List?;
        ...
        SourceService.instance.ingestSearchResults(results);
        return {
          'sources': results.map((r) => r.toJson()).toList(),
          'event_type': 'search-results',
        };
```

```dart
  void ingestSearchResults(List<SearchResult> results) {
    ...
    _updateWebResources(web);
    _updateKnowledgeBaseResources(knowledgeBase);
  }
```

```dart
          if (resources.isEmpty)
            Padding(
              ...
              child: Text(
                allResources.isEmpty
                    ? 'No sources received yet'
                    : 'No sources match your search',
              ),
            )
          else
            ...resources.map(
              (resource) => CheckboxListTile(
                ...
                subtitle: Text(
                  _subtitleFor(resource.uri, resource.description),
```

---

**User**

I/flutter (27405): [SSE][raw] {"event": "search-results", "data": {"event_type": "search-results", "results": [{"title": "T\u1ed4NG QUAN V\u1ec0 C\u00d4NG NGH\u1ec6 BLOCKCHAIN V\u00c0 \u1ee8NG D\u1ee4NG _ Khoa C\u00f4ng ngh\u1ec7 th\u00f4ng tin VNUA.pdf", "url": "T\u1ed4NG QUAN V\u1ec0 C\u00d4NG NGH\u1ec6 BLOCKCHAIN V\u00c0 \u1ee8NG D\u1ee4NG _ Khoa C\u00f4ng ngh\u1ec7 th\u00f4ng tin VNUA.pdf", "content": "\n<p>\u0110\u1ec3 gi\u1ea3m c\u00e1c y\u00eau c\u1ea7u t\u00ednh to\u00e1n c\u1ee7a PoW, m\u1ed9t c\u01a1 ch\u1ebf \u0111\u1ed3ng thu\u1eadn kh\u00e1c \u0111\u01b0\u1ee3c ph\u00e1t tri\u1ec3n l\u00e0 c\u01a1 ch\u1ebf \u0111\u1ed3ng thu\u1eadn d\u1ef1a tr\u00ean c\u01a1 ph\u1ea7n Proof-of-Stakes (PoS). Trong c\u01a1 ch\u1ebf \u0111\u1ed3ng thu\u1eadn d\u1ef1a tr\u00ean PoS, c\u01a1 ph\u1ea7n c\u1ee7a m\u1ed9t n\u00fat l\u00e0 s\u1ed1 l\u01b0\u1ee3ng m\u00e3 token k\u1ef9 thu\u1eadt s\u1ed1 (v\u00ed d\u1ee5 ti\u1ec1n xu trong v\u00ed \u0111i\u1ec7n t\u1eed). Thay v\u00ec d\u1ef1a v\u00e0o kh\u1ea3 n\u0103ng t\u00ednh to\u00e1n

I/flutter (27405): [SSE][data] {sources: [{title: TỔNG QUAN VỀ CÔNG NGHỆ BLOCKCHAIN VÀ ỨNG DỤNG _ Khoa Công nghệ thông tin VNUA.pdf, url: TỔNG QUAN VỀ CÔNG NGHỆ BLOCKCHAIN VÀ ỨNG DỤNG _ Khoa Công nghệ thông tin VNUA.pdf, content:

I/flutter (27405): <p>Để giảm các yêu cầu tính toán của PoW, một cơ chế đồng thuận khác được phát triển là cơ chế đồng thuận dựa trên cơ phần Proof-of-Stakes (PoS). Trong cơ chế đồng thuận dựa trên PoS, cơ phần của một nút là số lượng mã token kỹ thuật số (ví dụ tiền xu trong ví điện tử). Thay vì dựa vào khả năng tính toán như trong PoW, việc lựa chọn người thực hiện quá trình khai thác và thêm một khối mới vào chuỗi dựa vào cơ phần của họ được minh hoa trong hình 5 [13]. Ưu điểm của PoS so với PoW có thể kể đến năng lượng tiêu thụ được giảm đi đáng kể, không yêu cầu cao về phần cứng thiết bị truy cập hệ thống, tốc độ tạo khối cùng với tốc độ xác minh giao dịch nhanh gấp nhiều lần so PoW [13]. Tuy nhiên PoS vẫn chưa được kiểm chứng chắc chắn về độ an toàn của hệ thống.</p>

I/flutter (27405): <p>https://ftta.vnua.edu.vn/tong-quan-ve-cong-nghe-blockchain-va-ung-dung/?utm_source=chatgpt.com</p>

I/flutter (27405): <p style="text-align: right;">7/15</p>

I/flutter (27405):

I/flutter (27405): <div>

I/flutter (27405): <img alt="Hình 5. So sánh cơ chế đồng thuận PoW và PoS. Hai sơ đồ so sánh Proof-of-Work Consensus Process và Proof-of-Stake Consensus Process. PoW dựa vào hash rate (hash power) để chọn leader, PoS dựa vào stake (số lượng coin) để chọn leader. Cả hai đều sử dụng weighted random selection."/>

I/flutter (27405): <p><i>Hình 5. So sánh cơ chế đồng thuận PoW và PoS [13].</i></p>

I/flutter (27405): <p>Ngoài hai cơ chế đồng thuận phổ biến trên, có một số cơ chế đồng thuận khác được biết đến như:</p>

I/flutter (27405): <ul>

I/flutter (27405): <li>Cơ chế bằng chứng ủy quyền Delegated Proof of Stake (DPoS) [15]: cơ chế được coi là giải pháp thay thế cho sự đồng thuận tốn năng lượng của PoW và khả năng kém an toàn trước các mục đích xấu tấn công vào các bên liên quan của PoS. Đặc điểm cơ bản của DPoS nằm ở việc mỗi người dùng trong hệ thống sở hữu một số lượng phiếu bầu tỷ lệ với lượng đồng coin họ có và có thể ủy thác cổ phần cho nhân chứng (“Witness”) mà họ tin tưởng. Nhân chứng có thể đại diện các cổ đông phê duyệt các giao dịch và nhận phần thưởng từ việc phê duyệt này. Nếu nhân chứng thực hiện sai trách nhiệm của mình hoặc liên tục không tạo ra được khối mới sẽ bị mất uy tín, bị loại bỏ và bị thay thế bởi một người khác. Vì vậy, DPoS hạn chế hành vi gian lận, phá hoại của các nhân chứng khi

I/flutter (27405): <li>Cơ chế bằng chứng năng lực Proof of Capacity (PoC): cơ chế đồng thuận này cho phép các thiết bị khai thác trong mạng sử dụng dung lượng ổ cứng có sẵn trong từng thiết bị để quyết định quyền khai thác thay vì sử dụng sức mạnh tính toán của thiết bị như trong PoW hay góp cổ phần như trong PoS. Ổ cứng càng lớn, giá trị giải pháp có thể lưu trữ trên ổ cứng càng nhiều, cơ hội người khai thác phải khớp với giá trị băm cần thiết từ danh sách của mình càng lớn, dẫn đến nhiều cơ hội giành được phần thưởng khai thác. PoC được cho là có lợi thế về tiết kiệm năng lượng tính toán, tuy nhiên dễ chịu tổn thương do khả năng nhiễm phần mềm độc hại ảnh hưởng đến hoạt động khai thác [16].</li>}, {title: 103435-PUB-PUBLIC-VN2035-Vietnamese-Final.pdf, url: 103435-PUB-PUBLIC-VN2035-Vietnamese-Final.pdf, conten

I/flutter (27405):

I/flutter (27405): <div>

I/flutter (27405): <h2>TRỤ CỘT 1: THỊNH VƯỢNG VỀ KINH TẾ ĐI ĐÔI VỚI BỀN VỮNG VỀ MÔI TRƯỜNG</h2>

I/flutter (27405): <p>Việt Nam đang trên quỹ đạo tăng trưởng nhanh. Thành quả trong quá khứ tạo niềm tin cho một khát vọng về mức tăng trưởng nhanh hơn trong khoảng 20 năm tới. Các nhà lãnh đạo kỳ vọng tăng trưởng GDP bình quân đầu người đạt cao hơn mức trung bình 5,5%/năm từ những năm 1990. Điều này đòi hỏi tổng vốn sẽ phải đạt 35% (so với mức 31% hiện nay) và giữ vững mức này trong ít nhất một thập kỷ, trong khi vẫn duy trì mức tiết kiệm trong nước khoảng 35% so với GDP. Muốn đạt được khát vọng này, trước hết cần tập trung nhiều hơn vào nâng cao năng suất, hiện đang rơi vào xu thế suy giảm dài hạn.</p>

I/flutter (27405): <p>Chương trình cải cách sẽ khó khăn, nhất là trong bối cảnh năng suất giảm như hiện nay. Chính phủ cần ưu tiên thực hiện các biện pháp cải cách mang lại ích lợi ngắn hạn như tăng cường nền tảng vi mô của kinh tế thị trường. Những cải cách trung hạn sẽ hỗ trợ cho quá trình chuyển đổi cơ cấu đang diễn ra và làm sâu sắc quá trình hội nhập toàn cầu, bằng cách phát triển khu vực nông nghiệp được thương mại hóa theo hướng thị trường, nâng cao vị trí của Việt Nam trong chuỗi giá trị toàn cầu và xây dựng các thể chế kinh tế vĩ mô vững chắc và tin cậy hơn. Cải cách dài hạn hơn sẽ đòi hỏi phải tạo ra được cơ chế khuyến khích học tập và đổi mới sáng tạo toàn diện, khuyến khích đô thị hóa tập trung một cách có hiệu quả và đảm bảo bền vững về môi trường.</p>

I/flutter (27405): <h3>Tăng trưởng dài hạn của Việt Nam dưới góc nhìn toàn cầu</h3>

I/flutter (27405): <p>“Tăng trưởng đuổi kịp” - quá trình các nước đi sau tận dụng đầu tư, chuyển giao công nghệ và bí quyết từ các nước giàu hơn - đã giúp nhiều nước thành công vượt bậc về kinh tế trong khu vực Đông Á và một số khu vực khác trên thế giới sau Chiến tranh thế giới lần thứ hai.</p>

I/flutter (27405): </div>

I/flutter (27405):

I/flutter (27405): Một số nước như Nhật Bản, Hàn Quốc, Xinh-ga-po và Đài Loan (Trung Quốc) đã duy trì được tốc độ tăng trưởng kinh tế cao suốt 5 thập kỷ và trở thành nước thu nhập cao. Các nước khác như Bra-xil, Ai Cập, In-đô-nê-xi-a, Mê-xi-cô và Thái Lan cũng tăng trưởng nhanh trong vòng 2-3 thập kỷ nhưng sau đó rơi vào bẫy thu nhập trung bình. Sự cất cánh của Trung Quốc vẫn chưa hoàn thành và dường như có xu thế đi theo hướng của nhóm thứ nhất. Vậy còn Việt Nam? Nắm bắt cơ hội đuổi kịp trong thời gian qua đã tạo cho Việt Nam một vị thế thuận lợi trên quỹ đạo phát triển dài hạn khi so sánh với các nước khác. Quá trình tăng trưởng dài hạn của Việt Nam so với Trung Quốc có điểm tương đồng mặc dù thời gian khởi điểm cách nhau 13 năm. Sự gia tốc về tăng trưởng của hai quốc gia đều bắt đầu từ mứ

I/flutter (27405):

I/flutter (27405): <div>

I/flutter (27405): <p>3. Không ai bị kết án hai lần vì một tội phạm.</p>

I/flutter (27405): <p>4. Người bị bắt, tạm giữ, tạm giam, khởi tố, điều tra, truy tố, xét xử có quyền tự bào chữa, nhờ luật sư hoặc người khác bào chữa.</p>

I/flutter (27405): <p>5. Người bị bắt, tạm giữ, tạm giam, khởi tố, điều tra, truy tố, xét xử, thi hành án trái pháp luật có quyền được bồi thường thiệt hại về vật chất, tinh thần và phục hồi danh dự. Người vi phạm pháp luật trong việc bắt, giam, giữ, khởi tố, điều tra, truy tố, xét xử, thi hành án gây thiệt hại cho người khác phải bị xử lý theo pháp luật.</p>

I/flutter (27405): <h3>Diều 32</h3>

I/flutter (27405): <p>1. Mọi người có quyền sở hữu về thu nhập hợp pháp, của cải để dành, nhà ở, tư liệu sinh hoạt, tư liệu sản xuất, phần vốn góp trong doanh nghiệp hoặc trong các tổ chức kinh tế khác.</p>

I/flutter (27405): <p>2. Quyền sở hữu tư nhân và quyền thừa kế được pháp luật bảo hộ.</p>

I/flutter (27405): <p>3. Trường hợp thật cần thiết vì lý do quốc phòng, an ninh hoặc vì lợi ích quốc gia, tình trạng khẩn cấp, phòng, chống thiên tai, Nhà nước trung mua hoặc trung dụng có bồi thường tài sản của tổ chức, cá nhân theo giá thị trường.</p>

I/flutter (27405): <h3>Diều 33</h3>

I/flutter (27405): <p>Mọi người có quyền tự do kinh doanh trong những ngành nghề mà pháp luật không cấm.</p>

I/flutter (27405): <h3>Diều 34</h3>

I/flutter (27405): <p>Công dân có quyền được bảo đảm an sinh xã hội.</p>

I/flutter (27405): <h3>Diều 35</h3>

I/flutter (27405): <p>1. Công dân có quyền làm việc, lựa chọn nghề nghiệp, việc làm và nơi làm việc.</p>

I/flutter (27405): <p>2. Người làm công ăn lương được bảo đảm các điều kiện làm việc công bằng, an toàn; được hưởng lương, chế độ nghỉ ngơi.</p>

I/flutter (27405): <p>3. Nghiêm cấm phân biệt đối xử, cuồng bức lao động, sử dụng nhân công dưới độ tuổi lao động tối thiểu.</p>

I/flutter (27405): <h3>Diều 36</h3>

I/flutter (27405): <p>1. Nam, nữ có quyền kết hôn, ly hôn. Hôn nhân theo nguyên tắc tự nguyện, tiến bộ, một vợ một chồng, vợ chồng bình đẳng, tôn trọng lẫn nhau.</p>

I/flutter (27405): <p>2. Nhà nước bảo hộ hôn nhân và gia đình, bảo hộ lợi của người mẹ và trẻ em.</p>

I/flutter (27405): </div>

I/flutter (27405):

I/flutter (27405): <div style="text-align: center;">9</div>

I/flutter (27405): <h3>Điều 37</h3>

I/flutter (27405): <ol>

I/flutter (27405): <li>Trẻ em được Nhà nước, gia đình và xã hội bảo vệ, chăm sóc và giáo dục; được tham gia vào các vấn đề về trẻ em. Nghiêm cấm xâm hại, hành hạ, ngược đãi, bỏ mặc, lạm dụng, bóc lột sức lao động và những hành vi khác vi phạm quyền trẻ em.</li>

I/flutter (27405): <li>Thanh niên được Nhà nước, gia đình và xã hội tạo điều kiện học tập, lao động, giải trí, phát triển thế lực, trí tuệ, bồi dưỡng đạo đức, truyền thống dân tộc, ý thức công dân; đi đầu trong công cuộc lao động sáng tạo và bảo vệ Tổ quốc.</li>

I/flutter (27405): <li>Người cao tuổi được Nhà nước, gia đình và xã hội tôn trọng, chăm sóc và phát huy vai trò trong sự nghiệp xây dựng và bảo vệ Tổ quốc.</li>

I/flutter (27405): </ol>

I/flutter (27405): <h3>Điều 38</h3>

I/flutter (27405): <ol>

I/flutter (27405): <li>Mọi người có quyền được bảo vệ, chăm sóc sức khỏe, bình đẳng trong việc sử dụng các dịch vụ y tế và có nghĩa vụ thực hiện các quy định về phòng bệnh, khám bệnh, chữa bệnh.</li>

I/flutter (27405): <li>Nghiêm cấm các hành vi đe dọa cuộc sống, sức khỏe của người khác và cộng đồng.</li>

I/flutter (27405): </ol>

I/flutter (27405): <h3>Điều 39</h3>

I/flutter (27405): <p>Công dân có quyền và nghĩa vụ học tập.</p>

I/flutter (27405): <h3>Điều 40</h3>

I/flutter (27405): <p>Mọi người có quyền nghiên cứu khoa học và công nghệ, sáng tạo văn học, nghệ thuật và thụ hưởng lợi ích từ các hoạt động đó.</p>

I/flutter (27405): <h3>Điều 41</h3>

I/flutter (27405): <p>Mọi người có quyền hưởng thụ và tiếp cận các giá trị văn hoá, tham gia vào đời sống văn hóa, sử dụng các cơ sở văn hóa.</p>

I/flutter (27405): <h3>Điều 42</h3>

I/flutter (27405): <p>Công dân có quyền xác định dân tộc của mình, sử dụng ngôn ngữ mẹ đẻ, lựa chọn ngôn ngữ giao tiếp.</p>

I/flutter (27405): <h3>Điều 43</h3>

I/flutter (27405): <p>Mọi người có quyền được sống trong môi trường trong lành và có nghĩa vụ bảo vệ môi trường.</p>

I/flutter (27405): <h3>Điều 44</h3>

I/flutter (27405): <p>Công dân có nghĩa vụ trung thành với Tổ quốc.</p>

I/flutter (27405): <p>Phản bội Tổ quốc là tội nặng nhất.</p>

I/flutter (27405): --- Page 9 ---}, {title: doc54.txt, url: doc54.txt, content:

I/flutter (27405): 

I/flutter (27405):

I/flutter (27405): <div>

I/flutter (27405): <p>2. Không ai bị bắt nếu không có quyết định của Toà án nhân dân, quyết định hoặc phê chuẩn của Viện kiểm sát nhân dân, trừ trường hợp phạm tội quả tang. Việc bắt, giam, giữ người do luật định.</p>

I/flutter (27405): <p>3. Mọi người có quyền hiến mô, bộ phận cơ thể người và hiến xác theo quy định của luật. Việc thử nghiệm y học, dược học, khoa học hay bất kỳ hình thức thử nghiệm nào khác trên cơ thể người phải có sự đồng ý của người được thử nghiệm.</p>

I/flutter (27405): <h3>Điều 21</h3>

I/flutter (27405): <p>1. Mọi người có quyền bất khả xâm phạm về đời sống riêng tư, bí mật cá nhân và bí mật gia đình; có quyền bảo vệ danh dự, uy tín của mình.</p>

I/flutter (27405): <p>Thông tin về đời sống riêng tư, bí mật cá nhân, bí mật gia đình được pháp luật bảo đảm an toàn.</p>

I/flutter (27405): <p>2. Mọi người có quyền bí mật thư tín, điện thoại, điện tín và các hình thức trao đổi thông tin riêng tư khác.</p>

I/flutter (27405): <p>Không ai được bóc mở, kiểm soát, thu giữ trái luật thư tín, điện thoại, điện tín và các hình thức trao đổi thông tin riêng tư của người khác.</p>

I/flutter (27405): <h3>Điều 22</h3>

I/flutter (27405): <p>1. Công dân có quyền có nơi ở hợp pháp.</p>

I/flutter (27405): <p>2. Mọi người có quyền bất khả xâm phạm về chỗ ở. Không ai được tự ý vào chỗ ở của người khác nếu không được người đó đồng ý.</p>

I/flutter (27405): <p>3. Việc khám xét chỗ ở do luật định.</p>

I/flutter (27405): <h3>Điều 23</h3>

I/flutter (27405): <p>Công dân có quyền tự do đi lại và cư trú ở trong nước, có quyền ra nước ngoài và từ nước ngoài về nước. Việc thực hiện các quyền này do pháp luật quy định.</p>

I/flutter (27405): <h3>Điều 24</h3>

I/flutter (27405): <p>1. Mọi người có quyền tự do tín ngưỡng, tôn giáo, theo hoặc không theo một tôn giáo nào. Các tôn giáo bình đẳng trước pháp luật.</p>

I/flutter (27405): <p>2. Nhà nước tôn trọng và bảo hộ quyền tự do tín ngưỡng, tôn giáo.</p>

I/flutter (27405): <p>3. Không ai được xâm phạm tự do tín ngưỡng, tôn giáo hoặc lợi dụng tín ngưỡng, tôn giáo để vi phạm pháp luật.</p>

I/flutter (27405): <h3>Điều 25</h3>

I/flutter (27405): <p>Công dân có quyền tự do ngôn luận, tự do báo chí, tiếp cận thông tin, hội họp, lập hội, biểu tình. Việc thực hiện các quyền này do pháp luật quy định.</p>

I/flutter (27405): </div>

I/flutter (27405): --- Page 6 ---

I/flutter (27405):

I/flutter (27405): <div>

I/flutter (27405): <p style="text-align: center;">7</p>

I/flutter (27405): <p><b>Điều 26</b></p>

I/flutter (27405): <ol>

I/flutter (27405): <li>Công dân nam, nữ bình đẳng về mọi mặt. Nhà nước có chính sách bảo đảm quyền và cơ hội bình đẳng giới.</li>

I/flutter (27405): <li>Nhà nước, xã hội và gia đình tạo điều kiện để phụ nữ phát triển toàn diện, phát huy vai trò của mình trong xã hội.</li>

I/flutter (27405): <li>Nghiêm cấm phân biệt đối xử về giới.</li>

I/flutter (27405): </ol>

I/flutter (27405): <p><b>Điều 27</b></p>

I/flutter (27405): <p>Công dân đủ mười tám tuổi trở lên có quyền bầu cử và đủ hai mươi một tuổi trở lên có quyền ứng cử vào Quốc hội, Hội đồng nhân dân. Việc thực hiện các quyền này do luật định.</p>

I/flutter (27405): <p><b>Điều 28</b></p>

I/flutter (27405): <ol>

I/flutter (27405): <li>Công dân có quyền tham gia quản lý nhà nước và xã hội, tham gia thảo luận và kiến nghị với cơ quan nhà nước về các vấn đề của cơ sở, địa phương và cả nước.</li>

I/flutter (27405): <li>Nhà nước tạo điều kiện để công dân tham gia quản lý nhà nước và xã hội; công khai, minh bạch trong việc tiếp nhận, phản hồi ý kiến, kiến nghị của công dân.</li>

I/flutter (27405): </ol>

I/flutter (27405): <p><b>Điều 29</b></p>

I/flutter (27405): <p>Công dân đủ mười tám tuổi trở lên có quyền biểu quyết khi Nhà nước tổ chức trưng cầu ý dân.</p>

I/flutter (27405): <p><b>Điều 30</b></p>

I/flutter (27405): <ol>

I/flutter (27405): <li>Mọi người có quyền khiếu nại, tố cáo với cơ quan, tổ chức, cá nhân có thẩm quyền về những việc làm trái pháp luật của cơ quan, tổ chức, cá nhân.</li>

I/flutter (27405): <li>Cơ quan, tổ chức, cá nhân có thẩm quyền phải tiếp nhận, giải quyết khiếu nại, tố cáo. Người bị thiệt hại có quyền được bồi thường về vật chất, tinh thần và phục hồi danh dự theo quy định của pháp luật.</li>

I/flutter (27405): <li>Nghiêm cấm việc trả thù người khiếu nại, tố cáo hoặc lợi dụng quyền khiếu nại, tố cáo để vu khống, vu cáo làm hại người khác.</li>

I/flutter (27405): </ol>

I/flutter (27405): <p><b>Điều 31</b></p>

I/flutter (27405): <ol>

I/flutter (27405): <li>Người bị buộc tội được coi là không có tội cho đến khi được chứng minh theo trình tự luật định và có bản án kết tội của Tòa án đã có hiệu lực pháp luật.</li>

I/flutter (27405): <li>Người bị buộc tội phải được Tòa án xét xử kịp thời trong thời hạn luật định, công bằng, công khai. Trường hợp xét xử kín theo quy định của luật thì việc tuyên án phải được công khai.</li>

I/flutter (27405): </ol>

I/flutter (27405): </div>}, {title: Thú vị nguồn gốc của hổ - loài vật mệnh danh "chúa tể sơn lâm", url: https://dantri.com.vn/khoa-hoc/thu-vi-nguon-goc-cua-ho-loai-vat-menh-danh-chua-te-son-lam-20220416084147798.htm, content: Hổ (hay cọp, hùm...) là một loài động vật có vú thuộc Họ Mèo được xếp vào một trong năm loài "mèo lớn" thuộc chi Panthera, tiến hóa từ khoảng 4 triệu năm trước, được đại diện bởi Panthera blytheae - giống loài khi ấy đóng vai trò như nhánh đầu tiên của dạng động vật ăn thịt mới.

I/flutter (27405):

I/flutter (27405): Sau loài này, các loài mèo lớn khác đã phát triển, trong số đó có Panthera palaeosinensis và Panthera zdanskyi. Cùng với chúng là báo tuyết (Panthera Uncia) và hổ (Panthera tigris). [...] Hổ cũng không khác gì gần như tuyệt chủng sau sự kiện này. Tuy nhiên, mèo lớn là loài rất kiên cường và phục hồi rất tốt sau thảm kịch thiên nhiên này. Một quần thể nhỏ hổ Sunda sống ở phần phía đông của thềm Sunda đã hồi phục và bắt đầu lan sang khu vực phía ty. Những con hổ này là những con hổ Java-Bali hiện đại đầu tiên, chúng vẫn giữ các đặc điểm về sọ của hổ Ngandong nhưng bắt đầu bị chứng bệnh lùn thể sinh.

I/flutter (27405):

I/flutter (27405): Hổ Caspi, hổ Ấn Độ xuất hiện [...] Loài hổ mới này thể hiện các đặc điểm của cả hai giống nhưng cũng phát triển c}, {title: Nguồn gốc của loài mèo, url: https://dantri.com.vn/khoa-hoc/nguon-goc-cua-loai-meo-20230122110215768.htm, content: Các đặc điểm giải phẫu như đầu tròn và cấu trúc ... Mặc dù vậy, thuần hóa mèo không giống với cách mà chó và các động vật khác đã được thuần hóa.

I/flutter (27405):

I/flutter (27405): # None

I/flutter (27405):

I/flutter (27405): {"data":null,"code":451,"name":"SecurityCompromiseError","status":45102,"message":"Anonymous access to domain dantri.com.vn blocked until Fri Dec 05 2025 19:56:15 GMT+0000 (Coordinated Universal Time) due to previous abuse found on https://dantri.com.vn/du-lich/nhung-bai-da-hoang-so-tuyet-dep-ben-vinh-chan-may-lang-co-20240915184446726.htm: DDoS attack suspected: Too many domains","readableMessage":"SecurityCompromiseError: Anonymous access to domain dantri.com.vn blocked until Fri Dec 05 2025 19:56:15 GMT+0000 (Coordinated Universal Time) due to previous abuse found on https://dantri.com.vn/du-lich/nhung-bai-da-hoang-so-tuyet-dep-ben-vinh-chan-may-lang-co-20240915184446726.htm: DDoS attack suspected: Too many domains"}}, {title: Chó hay mèo thông minh hơn? - Báo Dân trí, url: https://dantri.com.vn/khoa-hoc/cho-hay-meo-thong-minh-hon-20211004065642096.htm, content: (Dân trí) - "Hỏi liệu một con chócóthông minh hơn một conmèohay không cũng giốngnhưhỏi liệu một cái búacóph�

I/flutter (27405):

I/flutter (27405): # None

I/flutter (27405):

I/flutter (27405): {"data":null,"code":451,"name":"SecurityCompromiseError","status":45102,"message":"Anonymous access to domain dantri.com.vn blocked until Fri Dec 05 2025 19:56:15 GMT+0000 (Coordinated Universal Time) due to previous abuse found on https://dantri.com.vn/du-lich/nhung-bai-da-hoang-so-tuyet-dep-ben-vinh-chan-may-lang-co-20240915184446726.htm: DDoS attack suspected: Too many domains","readableMessage":"SecurityCompromiseError: Anonymous access to domain dantri.com.vn blocked until Fri Dec 05 2025 19:56:15 GMT+0000 (Coordinated Universal Time) due to previous abuse found on https://dantri.com.vn/du-lich/nhung-bai-da-hoang-so-tuyet-dep-ben-vinh-chan-may-lang-co-20240915184446726.htm: DDoS attack suspected: Too many domains"}}, {title: Tình bạn thân thiết kéo dài cả thập kỷ giữa người và hổ, url: https://dantri.com.vn/doi-song/tinh-ban-than-thiet-keo-dai-ca-thap-ky-giua-nguoi-va-ho-20170525152437388.htm, content: Mặc dù biết Mulan rất yêu quý mình qua những cử chỉ yêu thươn

I/flutter (27405):

I/flutter (27405):  "Tôi biết nó là một con vật với bản năng của riêng mình. Nó như một con mèo vậy. Khi nó chơi đùa, nó sẽ cào và cắn và đấy chỉ là một vài nguy hiểm mà tôi phải đối mặt. Đó là lý do tại sao chúng tôi phải tìm hiểu kỹ về đặc tính của loài hổ," anh kể. [...] Như một con mèo, Mulan thường sẽ bị quá đà khi chơi đùa. Trên người Abdullah có hàng chục vết cào làm minh chứng cho những lần quá trớn đó.

I/flutter (27405):

I/flutter (27405):  "Tôi rất may mắn, có lần móng vuốt của nó suýt thì cào cả mắt của tôi ra," anh nói rồi chỉ lên mặt. [...] 10 năm trước, Abdullah Sholeh trở thành "vú nuôi" cho con hổ con Mulan Jamillah khi đó mới 3 tháng tuổi và tình bạn càng ngày càng nảy nở.

I/flutter (27405):

I/flutter (27405):  Mulan được tặng cho trường Malang ở Indonesia khi mới có ba tháng tuổi. Khi đó, người chủ cũ không thể chăm sóc nó thường xuyên nên anh Abdullah, 25 tuổi, đã rất }, {title: Nguồn gốc đôi cánh của côn trùng từ đâu?, url: https://dantri.com.vn/khoa-hoc/nguon-goc-doi-canh-cua-con-trung-tu-dau-20201207063237608.htm, content: Điều này làm cho cánh côn trùng trông giống như nguồn gốc kép, nơi thành cơ thể và chân hòa trộn để tạo thành đôi cánh. Trong khi trên thực tế,

I/flutter (27405):

I/flutter (27405): # None

I/flutter (27405):

I/flutter (27405): {"data":null,"code":451,"name":"SecurityCompromiseError","status":45102,"message":"Anonymous access to domain dantri.com.vn blocked until Fri Dec 05 2025 19:56:15 GMT+0000 (Coordinated Universal Time) due to previous abuse found on https://dantri.com.vn/du-lich/nhung-bai-da-hoang-so-tuyet-dep-ben-vinh-chan-may-lang-co-20240915184446726.htm: DDoS attack suspected: Too many domains","readableMessage":"SecurityCompromiseError: Anonymous access to domain dantri.com.vn blocked until Fri Dec 05 2025 19:56:15 GMT+0000 (Coordinated Universal Time) due to previous abuse found on https://dantri.com.vn/du-lich/nhung-bai-da-hoang-so-tuyet-dep-ben-vinh-chan-may-lang-co-20240915184446726.htm: DDoS attack suspected: Too many domains"}}], event_type: search-results}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (27405): [SSE][data] {content: .}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Direct"}}

I/flutter (27405): [SSE][data] {content: Direct}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Answer"}}

I/flutter (27405): [SSE][data] {content:  Answer}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "  \n"}}

I/flutter (27405): [SSE][data] {content:

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "C"}}

I/flutter (27405): [SSE][data] {content: C}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea5u"}}

I/flutter (27405): [SSE][data] {content: ấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea1o"}}

I/flutter (27405): [SSE][data] {content:  tạo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (27405): [SSE][data] {content:  của}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1eefng"}}

I/flutter (27405): [SSE][data] {content:  những}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  đặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111i\u1ec3m"}}

I/flutter (27405): [SSE][data] {content:  điểm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ri\u00eang"}}

I/flutter (27405): [SSE][data] {content:  riêng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " bi\u1ec7t"}}

I/flutter (27405): [SSE][data] {content:  biệt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " so"}}

I/flutter (27405): [SSE][data] {content:  so}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00f3"}}

I/flutter (27405): [SSE][data] {content:  chó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u00f9"}}

I/flutter (27405): [SSE][data] {content:  phù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l"}}

I/flutter (27405): [SSE][data] {content:  l}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1i"}}

I/flutter (27405): [SSE][data] {content: ối}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ed1ng"}}

I/flutter (27405): [SSE][data] {content:  sống}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (27405): [SSE][data] {content: .}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " C"}}

I/flutter (27405): [SSE][data] {content:  C}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ee5"}}

I/flutter (27405): [SSE][data] {content: ụ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  thể}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u00f3"}}

I/flutter (27405): [SSE][data] {content:  mó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ng"}}

I/flutter (27405): [SSE][data] {content: ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1eafc"}}

I/flutter (27405): [SSE][data] {content:  sắc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  các}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng"}}

I/flutter (27405): [SSE][data] {content:  ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00fac"}}

I/flutter (27405): [SSE][data] {content:  trúc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  đặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00f9"}}

I/flutter (27405): [SSE][data] {content:  thù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u00fap"}}

I/flutter (27405): [SSE][data] {content:  giúp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1eaft"}}

I/flutter (27405): [SSE][data] {content:  bắt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hi\u1ec7u"}}

I/flutter (27405): [SSE][data] {content:  hiệu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu\u1ea3"}}

I/flutter (27405): [SSE][data] {content:  quả}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01a1n"}}

I/flutter (27405): [SSE][data] {content:  hơn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " so"}}

I/flutter (27405): [SSE][data] {content:  so}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (27405): [SSE][data] {content:  của}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00f3"}}

I/flutter (27405): [SSE][data] {content:  chó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " D"}}

I/flutter (27405): [SSE][data] {content:  D}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f9"}}

I/flutter (27405): [SSE][data] {content: ù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f9ng"}}

I/flutter (27405): [SSE][data] {content:  cùng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1ed9c"}}

I/flutter (27405): [SSE][data] {content:  thuộc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ecd"}}

I/flutter (27405): [SSE][data] {content:  họ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " M"}}

I/flutter (27405): [SSE][data] {content:  M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (27405): [SSE][data] {content:  nhưng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (27405): [SSE][data] {content:  của}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (27405): [SSE][data] {content:  được}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00ecnh"}}

I/flutter (27405): [SSE][data] {content:  hình}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00e0nh"}}

I/flutter (27405): [SSE][data] {content:  thành}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  để}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ed1i"}}

I/flutter (27405): [SSE][data] {content:  tối}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u01b0u"}}

I/flutter (27405): [SSE][data] {content:  ưu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00f3a"}}

I/flutter (27405): [SSE][data] {content:  hóa}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  sự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh"}}

I/flutter (27405): [SSE][data] {content:  kh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e9o"}}

I/flutter (27405): [SSE][data] {content: éo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e9"}}

I/flutter (27405): [SSE][data] {content:  lé}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (27405): [SSE][data] {content:  trong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  các}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (27405): [SSE][data] {content:  động}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (27405): [SSE][data] {content:  trong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00f3"}}

I/flutter (27405): [SSE][data] {content:  chó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00fac"}}

I/flutter (27405): [SSE][data] {content:  trúc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u00f9"}}

I/flutter (27405): [SSE][data] {content:  phù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01a1n"}}

I/flutter (27405): [SSE][data] {content:  hơn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (27405): [SSE][data] {content:  việc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea1y"}}

I/flutter (27405): [SSE][data] {content:  chạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00e0i"}}

I/flutter (27405): [SSE][data] {content:  dài}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1ed5n"}}

I/flutter (27405): [SSE][data] {content:  ổn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecbnh"}}

I/flutter (27405): [SSE][data] {content:  định}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1eb7t"}}

I/flutter (27405): [SSE][data] {content:  mặt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  đất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "].\n\n"}}

I/flutter (27405): [SSE][data] {content: ].

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "2"}}

I/flutter (27405): [SSE][data] {content: 2}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (27405): [SSE][data] {content: .}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Detailed"}}

I/flutter (27405): [SSE][data] {content: Detailed}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Explanation"}}

I/flutter (27405): [SSE][data] {content:  Explanation}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "  \n"}}

I/flutter (27405): [SSE][data] {content:

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "M"}}

I/flutter (27405): [SSE][data] {content: M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1eb7c"}}

I/flutter (27405): [SSE][data] {content: ặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00f9"}}

I/flutter (27405): [SSE][data] {content:  dù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec1u"}}

I/flutter (27405): [SSE][data] {content:  đều}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (27405): [SSE][data] {content:  là}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (27405): [SSE][data] {content:  động}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eadt"}}

I/flutter (27405): [SSE][data] {content:  vật}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v"}}

I/flutter (27405): [SSE][data] {content:  v}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00fa"}}

I/flutter (27405): [SSE][data] {content: ú}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu\u1ed9c"}}

I/flutter (27405): [SSE][data] {content:  thuộc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ecd"}}

I/flutter (27405): [SSE][data] {content:  họ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " M"}}

I/flutter (27405): [SSE][data] {content:  M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ("}}

I/flutter (27405): [SSE][data] {content:  (}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Fel"}}

I/flutter (27405): [SSE][data] {content: Fel}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ida"}}

I/flutter (27405): [SSE][data] {content: ida}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "e"}}

I/flutter (27405): [SSE][data] {content: e}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ")"}}

I/flutter (27405): [SSE][data] {content: )}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (27405): [SSE][data] {content:  nguồn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " g\u1ed1c"}}

I/flutter (27405): [SSE][data] {content:  gốc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ti\u1ebfn"}}

I/flutter (27405): [SSE][data] {content:  tiến}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00f3a"}}

I/flutter (27405): [SSE][data] {content:  hóa}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " g\u1ea7n"}}

I/flutter (27405): [SSE][data] {content:  gần}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh"}}

I/flutter (27405): [SSE][data] {content:  nh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "au"}}

I/flutter (27405): [SSE][data] {content: au}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea1o"}}

I/flutter (27405): [SSE][data] {content:  tạo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (27405): [SSE][data] {content:  của}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00fang"}}

I/flutter (27405): [SSE][data] {content:  chúng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ea1i"}}

I/flutter (27405): [SSE][data] {content:  lại}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  sự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  khác}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " bi\u1ec7t"}}

I/flutter (27405): [SSE][data] {content:  biệt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " r\u00f5"}}

I/flutter (27405): [SSE][data] {content:  rõ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " r"}}

I/flutter (27405): [SSE][data] {content:  r}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ec7t"}}

I/flutter (27405): [SSE][data] {content: ệt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " do"}}

I/flutter (27405): [SSE][data] {content:  do}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nhu"}}

I/flutter (27405): [SSE][data] {content:  nhu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea7u"}}

I/flutter (27405): [SSE][data] {content:  cầu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " sinh"}}

I/flutter (27405): [SSE][data] {content:  sinh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ed3n"}}

I/flutter (27405): [SSE][data] {content:  tồn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00e0nh"}}

I/flutter (27405): [SSE][data] {content:  hành}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (27405): [SSE][data] {content:  vi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  khác}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh"}}

I/flutter (27405): [SSE][data] {content:  nh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "au"}}

I/flutter (27405): [SSE][data] {content: au}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "."}}

I/flutter (27405): [SSE][data] {content: .}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " D"}}

I/flutter (27405): [SSE][data] {content:  D}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u01b0\u1edbi"}}

I/flutter (27405): [SSE][data] {content: ưới}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u00e2y"}}

I/flutter (27405): [SSE][data] {content:  đây}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (27405): [SSE][data] {content:  là}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " so"}}

I/flutter (27405): [SSE][data] {content:  so}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s"}}

I/flutter (27405): [SSE][data] {content:  s}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e1nh"}}

I/flutter (27405): [SSE][data] {content: ánh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chi"}}

I/flutter (27405): [SSE][data] {content:  chi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ti\u1ebft"}}

I/flutter (27405): [SSE][data] {content:  tiết}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ":\n\n"}}

I/flutter (27405): [SSE][data] {content: :

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "###"}}

I/flutter (27405): [SSE][data] {content: ###}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " So"}}

I/flutter (27405): [SSE][data] {content:  So}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s"}}

I/flutter (27405): [SSE][data] {content:  s}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e1nh"}}

I/flutter (27405): [SSE][data] {content: ánh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea1o"}}

I/flutter (27405): [SSE][data] {content:  tạo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00f3"}}

I/flutter (27405): [SSE][data] {content:  chó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\n\n"}}

I/flutter (27405): [SSE][data] {content:

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0110\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  Đặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111i\u1ec3m"}}

I/flutter (27405): [SSE][data] {content:  điểm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " M"}}

I/flutter (27405): [SSE][data] {content:  M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Ch"}}

I/flutter (27405): [SSE][data] {content:  Ch}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3"}}

I/flutter (27405): [SSE][data] {content: ó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " H"}}

I/flutter (27405): [SSE][data] {content:  H}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |\n"}}

I/flutter (27405): [SSE][data] {content:  |

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "---------"}}

I/flutter (27405): [SSE][data] {content: ---------}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-----"}}

I/flutter (27405): [SSE][data] {content: -----}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-----"}}

I/flutter (27405): [SSE][data] {content: -----}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-----"}}

I/flutter (27405): [SSE][data] {content: -----}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|\n"}}

I/flutter (27405): [SSE][data] {content: |

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "M"}}

I/flutter (27405): [SSE][data] {content: M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3ng"}}

I/flutter (27405): [SSE][data] {content: óng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " M"}}

I/flutter (27405): [SSE][data] {content:  M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3ng"}}

I/flutter (27405): [SSE][data] {content: óng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1eafc"}}

I/flutter (27405): [SSE][data] {content:  sắc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  thể}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu"}}

I/flutter (27405): [SSE][data] {content:  thu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0o"}}

I/flutter (27405): [SSE][data] {content:  vào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh"}}

I/flutter (27405): [SSE][data] {content:  nh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4"}}

I/flutter (27405): [SSE][data] {content: ô}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ra"}}

I/flutter (27405): [SSE][data] {content:  ra}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u00fap"}}

I/flutter (27405): [SSE][data] {content:  giúp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u1eef"}}

I/flutter (27405): [SSE][data] {content:  giữ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th"}}

I/flutter (27405): [SSE][data] {content:  th}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u0103ng"}}

I/flutter (27405): [SSE][data] {content: ăng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1eb1ng"}}

I/flutter (27405): [SSE][data] {content:  bằng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (27405): [SSE][data] {content:  c}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e0o"}}

I/flutter (27405): [SSE][data] {content: ào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (27405): [SSE][data] {content:  b}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e1m"}}

I/flutter (27405): [SSE][data] {content: ám}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " M"}}

I/flutter (27405): [SSE][data] {content:  M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3ng"}}

I/flutter (27405): [SSE][data] {content: óng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee9ng"}}

I/flutter (27405): [SSE][data] {content:  cứng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (27405): [SSE][data] {content:  không}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu"}}

I/flutter (27405): [SSE][data] {content:  thu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0o"}}

I/flutter (27405): [SSE][data] {content:  vào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (27405): [SSE][data] {content:  được}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ee7"}}

I/flutter (27405): [SSE][data] {content:  chủ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " y\u1ebfu"}}

I/flutter (27405): [SSE][data] {content:  yếu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00f9ng"}}

I/flutter (27405): [SSE][data] {content:  dùng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  để}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u00e0o"}}

I/flutter (27405): [SSE][data] {content:  đào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  đất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (27405): [SSE][data] {content:  b}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e1m"}}

I/flutter (27405): [SSE][data] {content: ám}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0o"}}

I/flutter (27405): [SSE][data] {content:  vào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1eb7t"}}

I/flutter (27405): [SSE][data] {content:  mặt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  đất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea1y"}}

I/flutter (27405): [SSE][data] {content:  chạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " M"}}

I/flutter (27405): [SSE][data] {content:  M}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3ng"}}

I/flutter (27405): [SSE][data] {content: óng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1edbn"}}

I/flutter (27405): [SSE][data] {content:  lớn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee9ng"}}

I/flutter (27405): [SSE][data] {content:  cứng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (27405): [SSE][data] {content:  không}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thu"}}

I/flutter (27405): [SSE][data] {content:  thu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0o"}}

I/flutter (27405): [SSE][data] {content:  vào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (27405): [SSE][data] {content:  được}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u00f9"}}

I/flutter (27405): [SSE][data] {content:  phù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (27405): [SSE][data] {content:  việc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (27405): [SSE][data] {content:  b}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e1m"}}

I/flutter (27405): [SSE][data] {content: ám}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  đất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea1y"}}

I/flutter (27405): [SSE][data] {content:  chạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n"}}

I/flutter (27405): [SSE][data] {content:  n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "han"}}

I/flutter (27405): [SSE][data] {content: han}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |\n"}}

I/flutter (27405): [SSE][data] {content:  |

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Ng"}}

I/flutter (27405): [SSE][data] {content: Ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " C\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  Các}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng"}}

I/flutter (27405): [SSE][data] {content:  ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  thể}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1eed"}}

I/flutter (27405): [SSE][data] {content:  cử}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (27405): [SSE][data] {content:  động}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9c"}}

I/flutter (27405): [SSE][data] {content:  độc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1eadp"}}

I/flutter (27405): [SSE][data] {content:  lập}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ed7"}}

I/flutter (27405): [SSE][data] {content:  hỗ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u1ee3"}}

I/flutter (27405): [SSE][data] {content:  trợ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th"}}

I/flutter (27405): [SSE][data] {content:  th}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ao"}}

I/flutter (27405): [SSE][data] {content: ao}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  tác}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t"}}

I/flutter (27405): [SSE][data] {content:  t}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "inh"}}

I/flutter (27405): [SSE][data] {content: inh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ebf"}}

I/flutter (27405): [SSE][data] {content:  tế}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  hoặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec1"}}

I/flutter (27405): [SSE][data] {content:  bề}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1eb7t"}}

I/flutter (27405): [SSE][data] {content:  mặt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1eb9"}}

I/flutter (27405): [SSE][data] {content:  hẹ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "p"}}

I/flutter (27405): [SSE][data] {content: p}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Ng"}}

I/flutter (27405): [SSE][data] {content:  Ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee9ng"}}

I/flutter (27405): [SSE][data] {content:  cứng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u00edt"}}

I/flutter (27405): [SSE][data] {content:  ít}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01a1n"}}

I/flutter (27405): [SSE][data] {content:  hơn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00edch"}}

I/flutter (27405): [SSE][data] {content:  thích}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " cho"}}

I/flutter (27405): [SSE][data] {content:  cho}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (27405): [SSE][data] {content:  việc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea1y"}}

I/flutter (27405): [SSE][data] {content:  chạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec1n"}}

I/flutter (27405): [SSE][data] {content:  bền}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1eb7t"}}

I/flutter (27405): [SSE][data] {content:  mặt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  đất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1eb1ng"}}

I/flutter (27405): [SSE][data] {content:  bằng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph"}}

I/flutter (27405): [SSE][data] {content:  ph}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1eb3ng"}}

I/flutter (27405): [SSE][data] {content: ẳng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Ng"}}

I/flutter (27405): [SSE][data] {content:  Ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ea1nh"}}

I/flutter (27405): [SSE][data] {content:  mạnh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ebd"}}

I/flutter (27405): [SSE][data] {content:  mẽ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00fac"}}

I/flutter (27405): [SSE][data] {content:  trúc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eefng"}}

I/flutter (27405): [SSE][data] {content:  vững}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1eafc"}}

I/flutter (27405): [SSE][data] {content:  chắc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  để}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ecbu"}}

I/flutter (27405): [SSE][data] {content:  chịu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ef1c"}}

I/flutter (27405): [SSE][data] {content:  lực}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea1y"}}

I/flutter (27405): [SSE][data] {content:  chạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n"}}

I/flutter (27405): [SSE][data] {content:  n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "han"}}

I/flutter (27405): [SSE][data] {content: han}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh"}}

I/flutter (27405): [SSE][data] {content:  nh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea3y"}}

I/flutter (27405): [SSE][data] {content: ảy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " xa"}}

I/flutter (27405): [SSE][data] {content:  xa}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |\n"}}

I/flutter (27405): [SSE][data] {content:  |

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "C"}}

I/flutter (27405): [SSE][data] {content: C}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea5u"}}

I/flutter (27405): [SSE][data] {content: ấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00fac"}}

I/flutter (27405): [SSE][data] {content:  trúc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u00e0n"}}

I/flutter (27405): [SSE][data] {content:  bàn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " B"}}

I/flutter (27405): [SSE][data] {content:  B}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e0n"}}

I/flutter (27405): [SSE][data] {content: àn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1ecf"}}

I/flutter (27405): [SSE][data] {content:  nhỏ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111"}}

I/flutter (27405): [SSE][data] {content:  đ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ec7m"}}

I/flutter (27405): [SSE][data] {content: ệm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ecbt"}}

I/flutter (27405): [SSE][data] {content:  thịt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00e0y"}}

I/flutter (27405): [SSE][data] {content:  dày}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u00fap"}}

I/flutter (27405): [SSE][data] {content:  giúp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1eb7ng"}}

I/flutter (27405): [SSE][data] {content:  lặng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ebd"}}

I/flutter (27405): [SSE][data] {content:  lẽ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u1ea3m"}}

I/flutter (27405): [SSE][data] {content:  giảm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ti\u1ebfng"}}

I/flutter (27405): [SSE][data] {content:  tiếng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (27405): [SSE][data] {content:  động}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " B"}}

I/flutter (27405): [SSE][data] {content:  B}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e0n"}}

I/flutter (27405): [SSE][data] {content: àn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1edbn"}}

I/flutter (27405): [SSE][data] {content:  lớn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01a1n"}}

I/flutter (27405): [SSE][data] {content:  hơn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111"}}

I/flutter (27405): [SSE][data] {content:  đ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ec7m"}}

I/flutter (27405): [SSE][data] {content: ệm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ecbt"}}

I/flutter (27405): [SSE][data] {content:  thịt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1eafc"}}

I/flutter (27405): [SSE][data] {content:  chắc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ed7"}}

I/flutter (27405): [SSE][data] {content:  hỗ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u1ee3"}}

I/flutter (27405): [SSE][data] {content:  trợ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n"}}

I/flutter (27405): [SSE][data] {content:  n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "han"}}

I/flutter (27405): [SSE][data] {content: han}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec1n"}}

I/flutter (27405): [SSE][data] {content:  bền}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nhi\u1ec1u"}}

I/flutter (27405): [SSE][data] {content:  nhiều}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecba"}}

I/flutter (27405): [SSE][data] {content:  địa}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00ecnh"}}

I/flutter (27405): [SSE][data] {content:  hình}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " B"}}

I/flutter (27405): [SSE][data] {content:  B}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e0n"}}

I/flutter (27405): [SSE][data] {content: àn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " r\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  rất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1edbn"}}

I/flutter (27405): [SSE][data] {content:  lớn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111"}}

I/flutter (27405): [SSE][data] {content:  đ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ec7m"}}

I/flutter (27405): [SSE][data] {content: ệm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ecbt"}}

I/flutter (27405): [SSE][data] {content:  thịt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00e0y"}}

I/flutter (27405): [SSE][data] {content:  dày}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u00fap"}}

I/flutter (27405): [SSE][data] {content:  giúp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  phân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00e1n"}}

I/flutter (27405): [SSE][data] {content:  tán}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u1ecdng"}}

I/flutter (27405): [SSE][data] {content:  trọng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u01b0\u1ee3ng"}}

I/flutter (27405): [SSE][data] {content:  lượng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u0103ng"}}

I/flutter (27405): [SSE][data] {content:  tăng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u1ea3"}}

I/flutter (27405): [SSE][data] {content:  khả}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u0103ng"}}

I/flutter (27405): [SSE][data] {content:  năng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ecbu"}}

I/flutter (27405): [SSE][data] {content:  chịu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ef1c"}}

I/flutter (27405): [SSE][data] {content:  lực}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecba"}}

I/flutter (27405): [SSE][data] {content:  địa}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00ecnh"}}

I/flutter (27405): [SSE][data] {content:  hình}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " g\u1ed3"}}

I/flutter (27405): [SSE][data] {content:  gồ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gh"}}

I/flutter (27405): [SSE][data] {content:  gh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ec1"}}

I/flutter (27405): [SSE][data] {content: ề}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |\n"}}

I/flutter (27405): [SSE][data] {content:  |

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "|"}}

I/flutter (27405): [SSE][data] {content: |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Kh"}}

I/flutter (27405): [SSE][data] {content: Kh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea3"}}

I/flutter (27405): [SSE][data] {content: ả}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u0103ng"}}

I/flutter (27405): [SSE][data] {content:  năng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " R"}}

I/flutter (27405): [SSE][data] {content:  R}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea5t"}}

I/flutter (27405): [SSE][data] {content: ất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u1ecfi"}}

I/flutter (27405): [SSE][data] {content:  giỏi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1edd"}}

I/flutter (27405): [SSE][data] {content:  nhờ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u00f3"}}

I/flutter (27405): [SSE][data] {content:  mó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ng"}}

I/flutter (27405): [SSE][data] {content: ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng"}}

I/flutter (27405): [SSE][data] {content:  ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " K"}}

I/flutter (27405): [SSE][data] {content:  K}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e9m"}}

I/flutter (27405): [SSE][data] {content: ém}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01a1n"}}

I/flutter (27405): [SSE][data] {content:  hơn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u00edt"}}

I/flutter (27405): [SSE][data] {content:  ít}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1eed"}}

I/flutter (27405): [SSE][data] {content:  sử}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1ee5ng"}}

I/flutter (27405): [SSE][data] {content:  dụng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u1ea3"}}

I/flutter (27405): [SSE][data] {content:  khả}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u0103ng"}}

I/flutter (27405): [SSE][data] {content:  năng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0y"}}

I/flutter (27405): [SSE][data] {content:  này}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (27405): [SSE][data] {content:  trong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  tự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nhi\u00ean"}}

I/flutter (27405): [SSE][data] {content:  nhiên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |"}}

I/flutter (27405): [SSE][data] {content:  |}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " C\u00f3"}}

I/flutter (27405): [SSE][data] {content:  Có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  thể}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (27405): [SSE][data] {content:  nhưng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (27405): [SSE][data] {content:  không}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1eb1ng"}}

I/flutter (27405): [SSE][data] {content:  bằng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u01b0\u1eddng"}}

I/flutter (27405): [SSE][data] {content:  thường}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ec9"}}

I/flutter (27405): [SSE][data] {content:  chỉ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00ean"}}

I/flutter (27405): [SSE][data] {content:  lên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e2y"}}

I/flutter (27405): [SSE][data] {content:  cây}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1ecf"}}

I/flutter (27405): [SSE][data] {content:  nhỏ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  hoặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  thân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e2y"}}

I/flutter (27405): [SSE][data] {content:  cây}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1edbn"}}

I/flutter (27405): [SSE][data] {content:  lớn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " |\n\n"}}

I/flutter (27405): [SSE][data] {content:  |

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "###"}}

I/flutter (27405): [SSE][data] {content: ###}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Ph"}}

I/flutter (27405): [SSE][data] {content:  Ph}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e2n"}}

I/flutter (27405): [SSE][data] {content: ân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00edch"}}

I/flutter (27405): [SSE][data] {content:  tích}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  dự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "a"}}

I/flutter (27405): [SSE][data] {content: a}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ngu\u1ed3n"}}

I/flutter (27405): [SSE][data] {content:  nguồn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00f4ng"}}

I/flutter (27405): [SSE][data] {content:  thông}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tin"}}

I/flutter (27405): [SSE][data] {content:  tin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\n\n"}}

I/flutter (27405): [SSE][data] {content:

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (27405): [SSE][data] {content: -}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Ch"}}

I/flutter (27405): [SSE][data] {content:  Ch}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e2n"}}

I/flutter (27405): [SSE][data] {content: ân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (27405): [SSE][data] {content:  được}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  đặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u01b0ng"}}

I/flutter (27405): [SSE][data] {content:  trưng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1edfi"}}

I/flutter (27405): [SSE][data] {content:  bởi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "m"}}

I/flutter (27405): [SSE][data] {content: m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3ng"}}

I/flutter (27405): [SSE][data] {content: óng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1eafc"}}

I/flutter (27405): [SSE][data] {content:  sắc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng"}}

I/flutter (27405): [SSE][data] {content:  ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3n"}}

I/flutter (27405): [SSE][data] {content: ón}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00fac"}}

I/flutter (27405): [SSE][data] {content:  trúc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u00e0n"}}

I/flutter (27405): [SSE][data] {content:  bàn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u00f9"}}

I/flutter (27405): [SSE][data] {content:  phù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (27405): [SSE][data] {content:  việc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1eb7ng"}}

I/flutter (27405): [SSE][data] {content:  lặng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ebd"}}

I/flutter (27405): [SSE][data] {content:  lẽ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u2013"}}

I/flutter (27405): [SSE][data] {content:  –}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111i\u1ec1u"}}

I/flutter (27405): [SSE][data] {content:  điều}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0y"}}

I/flutter (27405): [SSE][data] {content:  này}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u00fap"}}

I/flutter (27405): [SSE][data] {content:  giúp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hi\u1ec7u"}}

I/flutter (27405): [SSE][data] {content:  hiệu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu\u1ea3"}}

I/flutter (27405): [SSE][data] {content:  quả}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (27405): [SSE][data] {content:  trong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u00f4i"}}

I/flutter (27405): [SSE][data] {content:  môi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u01b0\u1eddng"}}

I/flutter (27405): [SSE][data] {content:  trường}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " r\u1eebng"}}

I/flutter (27405): [SSE][data] {content:  rừng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " r"}}

I/flutter (27405): [SSE][data] {content:  r}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1eadm"}}

I/flutter (27405): [SSE][data] {content: ậm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  hoặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00e0nh"}}

I/flutter (27405): [SSE][data] {content:  thành}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u1ed1"}}

I/flutter (27405): [SSE][data] {content:  phố}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "].\n"}}

I/flutter (27405): [SSE][data] {content: ].

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (27405): [SSE][data] {content: -}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Tr"}}

I/flutter (27405): [SSE][data] {content:  Tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ong"}}

I/flutter (27405): [SSE][data] {content: ong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u00f3"}}

I/flutter (27405): [SSE][data] {content:  đó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ch"}}

I/flutter (27405): [SSE][data] {content: ch}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e2n"}}

I/flutter (27405): [SSE][data] {content: ân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00f3"}}

I/flutter (27405): [SSE][data] {content:  chó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (27405): [SSE][data] {content:  được}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00ecnh"}}

I/flutter (27405): [SSE][data] {content:  hình}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00e0nh"}}

I/flutter (27405): [SSE][data] {content:  thành}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ec3"}}

I/flutter (27405): [SSE][data] {content:  để}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ed7"}}

I/flutter (27405): [SSE][data] {content:  hỗ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u1ee3"}}

I/flutter (27405): [SSE][data] {content:  trợ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ch"}}

I/flutter (27405): [SSE][data] {content: ch}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea1y"}}

I/flutter (27405): [SSE][data] {content: ạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00e0i"}}

I/flutter (27405): [SSE][data] {content:  dài}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec1n"}}

I/flutter (27405): [SSE][data] {content:  bền}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1ed5n"}}

I/flutter (27405): [SSE][data] {content:  ổn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ecbnh"}}

I/flutter (27405): [SSE][data] {content:  định}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (27405): [SSE][data] {content: **,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u00f9"}}

I/flutter (27405): [SSE][data] {content:  phù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vai"}}

I/flutter (27405): [SSE][data] {content:  vai}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00f2"}}

I/flutter (27405): [SSE][data] {content:  trò}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (27405): [SSE][data] {content:  là}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (27405): [SSE][data] {content:  động}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eadt"}}

I/flutter (27405): [SSE][data] {content:  vật}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ed1ng"}}

I/flutter (27405): [SSE][data] {content:  sống}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " the"}}

I/flutter (27405): [SSE][data] {content:  the}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (27405): [SSE][data] {content:  b}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea7y"}}

I/flutter (27405): [SSE][data] {content: ầy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u00e0n"}}

I/flutter (27405): [SSE][data] {content:  đàn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " the"}}

I/flutter (27405): [SSE][data] {content:  the}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u00f3m"}}

I/flutter (27405): [SSE][data] {content:  nhóm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "].\n"}}

I/flutter (27405): [SSE][data] {content: ].

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "-"}}

I/flutter (27405): [SSE][data] {content: -}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "Ch"}}

I/flutter (27405): [SSE][data] {content: Ch}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e2n"}}

I/flutter (27405): [SSE][data] {content: ân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (27405): [SSE][data] {content: **,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00f9"}}

I/flutter (27405): [SSE][data] {content:  dù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1edbn"}}

I/flutter (27405): [SSE][data] {content:  lớn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ea1nh"}}

I/flutter (27405): [SSE][data] {content:  mạnh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ebd"}}

I/flutter (27405): [SSE][data] {content:  mẽ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ea1i"}}

I/flutter (27405): [SSE][data] {content:  lại}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00fac"}}

I/flutter (27405): [SSE][data] {content:  trúc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "th"}}

I/flutter (27405): [SSE][data] {content: th}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00edch"}}

I/flutter (27405): [SSE][data] {content: ích}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nghi"}}

I/flutter (27405): [SSE][data] {content:  nghi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1edbi"}}

I/flutter (27405): [SSE][data] {content:  với}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi\u1ec7c"}}

I/flutter (27405): [SSE][data] {content:  việc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea1y"}}

I/flutter (27405): [SSE][data] {content:  chạy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n"}}

I/flutter (27405): [SSE][data] {content:  n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "han"}}

I/flutter (27405): [SSE][data] {content: han}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh"}}

I/flutter (27405): [SSE][data] {content:  nh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea3y"}}

I/flutter (27405): [SSE][data] {content: ảy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " xa"}}

I/flutter (27405): [SSE][data] {content:  xa}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (27405): [SSE][data] {content: **,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (27405): [SSE][data] {content:  nhưng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "kh"}}

I/flutter (27405): [SSE][data] {content: kh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f4ng"}}

I/flutter (27405): [SSE][data] {content: ông}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1eb1ng"}}

I/flutter (27405): [SSE][data] {content:  bằng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**"}}

I/flutter (27405): [SSE][data] {content: **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (27405): [SSE][data] {content:  trong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  các}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9ng"}}

I/flutter (27405): [SSE][data] {content:  động}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hay"}}

I/flutter (27405): [SSE][data] {content:  hay}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th"}}

I/flutter (27405): [SSE][data] {content:  th}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ao"}}

I/flutter (27405): [SSE][data] {content: ao}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  tác}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t"}}

I/flutter (27405): [SSE][data] {content:  t}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "inh"}}

I/flutter (27405): [SSE][data] {content: inh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ebf"}}

I/flutter (27405): [SSE][data] {content:  tế}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "].\n\n"}}

I/flutter (27405): [SSE][data] {content: ].

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "###"}}

I/flutter (27405): [SSE][data] {content: ###}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Nh\u1eadn"}}

I/flutter (27405): [SSE][data] {content:  Nhận}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " x\u00e9t"}}

I/flutter (27405): [SSE][data] {content:  xét}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1eeb"}}

I/flutter (27405): [SSE][data] {content:  từ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ef1c"}}

I/flutter (27405): [SSE][data] {content:  thực}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ebf"}}

I/flutter (27405): [SSE][data] {content:  tế}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\n\n"}}

I/flutter (27405): [SSE][data] {content:

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "The"}}

I/flutter (27405): [SSE][data] {content: The}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ed9t"}}

I/flutter (27405): [SSE][data] {content:  một}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u01b0\u1eddng"}}

I/flutter (27405): [SSE][data] {content:  trường}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u1ee3p"}}

I/flutter (27405): [SSE][data] {content:  hợp}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u1ed5i"}}

I/flutter (27405): [SSE][data] {content:  nổi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ti\u1ebfng"}}

I/flutter (27405): [SSE][data] {content:  tiếng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ed9t"}}

I/flutter (27405): [SSE][data] {content:  một}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " con"}}

I/flutter (27405): [SSE][data] {content:  con}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00ean"}}

I/flutter (27405): [SSE][data] {content:  tên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " Mul"}}

I/flutter (27405): [SSE][data] {content:  Mul}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "an"}}

I/flutter (27405): [SSE][data] {content: an}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u01b0\u1ee3c"}}

I/flutter (27405): [SSE][data] {content:  được}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nu\u00f4i"}}

I/flutter (27405): [SSE][data] {content:  nuôi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1eeb"}}

I/flutter (27405): [SSE][data] {content:  từ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u1ecf"}}

I/flutter (27405): [SSE][data] {content:  nhỏ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0"}}

I/flutter (27405): [SSE][data] {content:  như}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ed9t"}}

I/flutter (27405): [SSE][data] {content:  một}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng\u01b0\u1eddi"}}

I/flutter (27405): [SSE][data] {content:  người}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ea1n"}}

I/flutter (27405): [SSE][data] {content:  bạn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  thân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0ng"}}

I/flutter (27405): [SSE][data] {content:  nhưng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ee7"}}

I/flutter (27405): [SSE][data] {content:  chủ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  nhân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eabn"}}

I/flutter (27405): [SSE][data] {content:  vẫn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u1ea3i"}}

I/flutter (27405): [SSE][data] {content:  phải}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea3nh"}}

I/flutter (27405): [SSE][data] {content:  cảnh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u00e1c"}}

I/flutter (27405): [SSE][data] {content:  giác}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00ec"}}

I/flutter (27405): [SSE][data] {content:  vì}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \""}}

I/flutter (27405): [SSE][data] {content:  "}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3"}}

I/flutter (27405): [SSE][data] {content: ó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0"}}

I/flutter (27405): [SSE][data] {content:  như}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ed9t"}}

I/flutter (27405): [SSE][data] {content:  một}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " con"}}

I/flutter (27405): [SSE][data] {content:  con}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u2013"}}

I/flutter (27405): [SSE][data] {content:  –}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u01a1i"}}

I/flutter (27405): [SSE][data] {content:  chơi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111"}}

I/flutter (27405): [SSE][data] {content:  đ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f9"}}

I/flutter (27405): [SSE][data] {content: ù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "a"}}

I/flutter (27405): [SSE][data] {content: a}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ebd"}}

I/flutter (27405): [SSE][data] {content:  sẽ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (27405): [SSE][data] {content:  c}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e0o"}}

I/flutter (27405): [SSE][data] {content: ào}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c"}}

I/flutter (27405): [SSE][data] {content:  c}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1eafn"}}

I/flutter (27405): [SSE][data] {content: ắn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " g\u00e2y"}}

I/flutter (27405): [SSE][data] {content:  gây}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ng"}}

I/flutter (27405): [SSE][data] {content:  ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "uy"}}

I/flutter (27405): [SSE][data] {content: uy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " hi\u1ec3m"}}

I/flutter (27405): [SSE][data] {content:  hiểm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\""}}

I/flutter (27405): [SSE][data] {content: "}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "9"}}

I/flutter (27405): [SSE][data] {content: 9}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0110i\u1ec1u"}}

I/flutter (27405): [SSE][data] {content:  Điều}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u00e0y"}}

I/flutter (27405): [SSE][data] {content:  này}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " cho"}}

I/flutter (27405): [SSE][data] {content:  cho}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u1ea5y"}}

I/flutter (27405): [SSE][data] {content:  thấy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u00f9"}}

I/flutter (27405): [SSE][data] {content:  dù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " k\u00edch"}}

I/flutter (27405): [SSE][data] {content:  kích}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " th\u01b0\u1edbc"}}

I/flutter (27405): [SSE][data] {content:  thước}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1edbn"}}

I/flutter (27405): [SSE][data] {content:  lớn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u01a1n"}}

I/flutter (27405): [SSE][data] {content:  hơn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nhi\u1ec1u"}}

I/flutter (27405): [SSE][data] {content:  nhiều}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "b"}}

I/flutter (27405): [SSE][data] {content: b}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ea3n"}}

I/flutter (27405): [SSE][data] {content: ản}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u0103ng"}}

I/flutter (27405): [SSE][data] {content:  năng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h\u00e0nh"}}

I/flutter (27405): [SSE][data] {content:  hành}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (27405): [SSE][data] {content:  vi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u01a1i"}}

I/flutter (27405): [SSE][data] {content:  chơi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111"}}

I/flutter (27405): [SSE][data] {content:  đ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f9"}}

I/flutter (27405): [SSE][data] {content: ù}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "a"}}

I/flutter (27405): [SSE][data] {content: a}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (27405): [SSE][data] {content:  của}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00fang"}}

I/flutter (27405): [SSE][data] {content:  chúng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eabn"}}

I/flutter (27405): [SSE][data] {content:  vẫn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " mang"}}

I/flutter (27405): [SSE][data] {content:  mang}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u00ednh"}}

I/flutter (27405): [SSE][data] {content:  tính}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  chất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " gi\u1ed1ng"}}

I/flutter (27405): [SSE][data] {content:  giống}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (27405): [SSE][data] {content: **,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1eb7c"}}

I/flutter (27405): [SSE][data] {content:  đặc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " bi\u1ec7t"}}

I/flutter (27405): [SSE][data] {content:  biệt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u00e0"}}

I/flutter (27405): [SSE][data] {content:  là}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u1edf"}}

I/flutter (27405): [SSE][data] {content:  ở}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh"}}

I/flutter (27405): [SSE][data] {content:  kh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00eda"}}

I/flutter (27405): [SSE][data] {content: ía}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea1nh"}}

I/flutter (27405): [SSE][data] {content:  cạnh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1eed"}}

I/flutter (27405): [SSE][data] {content:  sử}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " d\u1ee5ng"}}

I/flutter (27405): [SSE][data] {content:  dụng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u00f3"}}

I/flutter (27405): [SSE][data] {content:  mó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ng"}}

I/flutter (27405): [SSE][data] {content: ng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vu"}}

I/flutter (27405): [SSE][data] {content:  vu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed1t"}}

I/flutter (27405): [SSE][data] {content: ốt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  sự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " qu\u00e1"}}

I/flutter (27405): [SSE][data] {content:  quá}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111"}}

I/flutter (27405): [SSE][data] {content:  đ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e0"}}

I/flutter (27405): [SSE][data] {content: à}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v"}}

I/flutter (27405): [SSE][data] {content:  v}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ui"}}

I/flutter (27405): [SSE][data] {content: ui}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u01a1i"}}

I/flutter (27405): [SSE][data] {content:  chơi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "9"}}

I/flutter (27405): [SSE][data] {content: 9}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " T"}}

I/flutter (27405): [SSE][data] {content:  T}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "uy"}}

I/flutter (27405): [SSE][data] {content: uy}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nhi\u00ean"}}

I/flutter (27405): [SSE][data] {content:  nhiên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea1o"}}

I/flutter (27405): [SSE][data] {content:  tạo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ee7a"}}

I/flutter (27405): [SSE][data] {content:  của}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1eabn"}}

I/flutter (27405): [SSE][data] {content:  vẫn}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thi\u00ean"}}

I/flutter (27405): [SSE][data] {content:  thiên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (27405): [SSE][data] {content:  về}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ee9c"}}

I/flutter (27405): [SSE][data] {content:  sức}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ea1nh"}}

I/flutter (27405): [SSE][data] {content:  mạnh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ed1c"}}

I/flutter (27405): [SSE][data] {content:  tốc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9"}}

I/flutter (27405): [SSE][data] {content:  độ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u00f4ng"}}

I/flutter (27405): [SSE][data] {content:  không}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ph\u1ea3i"}}

I/flutter (27405): [SSE][data] {content:  phải}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  sự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " nh\u01b0"}}

I/flutter (27405): [SSE][data] {content:  như}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ".\n\n"}}

I/flutter (27405): [SSE][data] {content: .

I/flutter (27405):

I/flutter (27405): }

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "T"}}

I/flutter (27405): [SSE][data] {content: T}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00f3m"}}

I/flutter (27405): [SSE][data] {content: óm}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " l\u1ea1i"}}

I/flutter (27405): [SSE][data] {content:  lại}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " **"}}

I/flutter (27405): [SSE][data] {content:  **}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "ch"}}

I/flutter (27405): [SSE][data] {content: ch}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e2n"}}

I/flutter (27405): [SSE][data] {content: ân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u00f3"}}

I/flutter (27405): [SSE][data] {content:  có}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " c\u1ea5u"}}

I/flutter (27405): [SSE][data] {content:  cấu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ea1o"}}

I/flutter (27405): [SSE][data] {content:  tạo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ed1i"}}

I/flutter (27405): [SSE][data] {content:  tối}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u01b0u"}}

I/flutter (27405): [SSE][data] {content:  ưu}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " cho"}}

I/flutter (27405): [SSE][data] {content:  cho}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ef1"}}

I/flutter (27405): [SSE][data] {content:  sự}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " lin"}}

I/flutter (27405): [SSE][data] {content:  lin}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "h"}}

I/flutter (27405): [SSE][data] {content: h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ho\u1ea1t"}}

I/flutter (27405): [SSE][data] {content:  hoạt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " leo"}}

I/flutter (27405): [SSE][data] {content:  leo}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr"}}

I/flutter (27405): [SSE][data] {content:  tr}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u00e8"}}

I/flutter (27405): [SSE][data] {content: è}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "o"}}

I/flutter (27405): [SSE][data] {content: o}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u0103"}}

I/flutter (27405): [SSE][data] {content:  să}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "n"}}

I/flutter (27405): [SSE][data] {content: n}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m"}}

I/flutter (27405): [SSE][data] {content:  m}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed3i"}}

I/flutter (27405): [SSE][data] {content: ồi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t"}}

I/flutter (27405): [SSE][data] {content:  t}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "inh"}}

I/flutter (27405): [SSE][data] {content: inh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " vi"}}

I/flutter (27405): [SSE][data] {content:  vi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "**,"}}

I/flutter (27405): [SSE][data] {content: **,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " trong"}}

I/flutter (27405): [SSE][data] {content:  trong}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " khi"}}

I/flutter (27405): [SSE][data] {content:  khi}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00e2n"}}

I/flutter (27405): [SSE][data] {content:  chân}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ch\u00f3"}}

I/flutter (27405): [SSE][data] {content:  chó}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " h"}}

I/flutter (27405): [SSE][data] {content:  h}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ed5"}}

I/flutter (27405): [SSE][data] {content: ổ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " thi\u00ean"}}

I/flutter (27405): [SSE][data] {content:  thiên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u1ec1"}}

I/flutter (27405): [SSE][data] {content:  về}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " s\u1ee9c"}}

I/flutter (27405): [SSE][data] {content:  sức}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1ea1nh"}}

I/flutter (27405): [SSE][data] {content:  mạnh}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": ","}}

I/flutter (27405): [SSE][data] {content: ,}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " t\u1ed1c"}}

I/flutter (27405): [SSE][data] {content:  tốc}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ed9"}}

I/flutter (27405): [SSE][data] {content:  độ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " v\u00e0"}}

I/flutter (27405): [SSE][data] {content:  và}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " kh\u1ea3"}}

I/flutter (27405): [SSE][data] {content:  khả}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " n\u0103ng"}}

I/flutter (27405): [SSE][data] {content:  năng}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " di"}}

I/flutter (27405): [SSE][data] {content:  di}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " chuy\u1ec3n"}}

I/flutter (27405): [SSE][data] {content:  chuyển}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b\u1ec1n"}}

I/flutter (27405): [SSE][data] {content:  bền}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " b"}}

I/flutter (27405): [SSE][data] {content:  b}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "\u1ec9"}}

I/flutter (27405): [SSE][data] {content: ỉ}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " tr\u00ean"}}

I/flutter (27405): [SSE][data] {content:  trên}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " m\u1eb7t"}}

I/flutter (27405): [SSE][data] {content:  mặt}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " \u0111\u1ea5t"}}

I/flutter (27405): [SSE][data] {content:  đất}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": " ["}}

I/flutter (27405): [SSE][data] {content:  [}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "1"}}

I/flutter (27405): [SSE][data] {content: 1}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "5"}}

I/flutter (27405): [SSE][data] {content: 5}

I/flutter (27405): [SSE][raw] {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "]."}}

I/flutter (27405): [SSE][data] {content: ].}

I/flutter (27405): [SSE][raw] {"event": "related-queries", "data": {"event_type": "related-queries", "related_queries": ["T\u1ea1i sao m\u00e8o c\u00f3 th\u1ec3 leo tr\u00e8o gi\u1ecfi h\u01a1n h\u1ed5 m\u1eb7c d\u00f9 c\u00f9ng thu\u1ed9c h\u1ecd M\u00e8o?", "S\u1ef1 kh\u00e1c bi\u1ec7t v\u1ec1 c\u1ea5u t\u1ea1o b\u00e0n ch\u00e2n gi\u1eefa m\u00e8o v\u00e0 ch\u00f3 \u1ea3nh h\u01b0\u1edfng nh\u01b0 th\u1ebf n\u00e0o \u0111\u1ebfn h\u00e0nh vi s\u0103n m\u1ed3i v\u00e0 di chuy\u1ec3n?", "M\u00f3ng vu\u1ed1t c\u00f3 th\u1ec3 thu v\u00e0o \u1edf m\u00e8o c\u00f3 l\u1ee3i \u00edch g\u00ec trong qu\u00e1 tr\u00ecnh ti\u1ebfn h\u00f3a so v\u1edbi c\u00e1c lo\u00e0i s\u0103n m\u1ed3i kh\u00e1c?"]}}

I/flutter (27405): [SSE][data] {related_queries: [Tại sao mèo có thể leo trèo giỏi hơn hổ mặc dù cùng thuộc họ Mèo?, Sự khác biệt về cấu tạo bàn chân giữa mèo và chó ảnh hưởng như thế nào đến hành vi săn mồi và di chuyển?, Móng vuốt có thể thu vào ở mèo có lợi ích gì trong quá trình tiến hóa so với các loài săn mồi khác?]}

I/flutter (27405): [SSE][raw] {"event": "final-response", "data": {"event_type": "final-response", "message": "1. **Direct Answer**  \nC\u1ea5u t\u1ea1o ch\u00e2n c\u1ee7a m\u00e8o c\u00f3 nh\u1eefng \u0111\u1eb7c \u0111i\u1ec3m ri\u00eang bi\u1ec7t so v\u1edbi ch\u00f3 v\u00e0 h\u1ed5, ph\u00f9 h\u1ee3p v\u1edbi l\u1ed1i s\u1ed1ng s\u0103n m\u1ed3i v\u00e0 di chuy\u1ec3n linh ho\u1ea1t. C\u1ee5 th\u1ec3, ch\u00e2n m\u00e8o c\u00f3 m\u00f3ng vu\u1ed1t s\u1eafc, c\u00e1c ng\u00f3n ch\u00e2n linh ho\u1ea1t v\u00e0 c\u1ea5u tr\u00fac \u0111\u1eb7c th\u00f9 gi\u00fap leo tr\u00e8o v\u00e0 s\u0103n b\u1eaft hi\u1ec7u qu\u1ea3 h\u01a1n so v\u1edbi ch\u00e2n c\u1ee7a ch\u00f3 v\u00e0 h\u1ed5 [15]. D\u00f9 h\u1ed5 v\u00e0 m\u00e8o c\u00f9ng thu\u1ed9c h\u1ecd M\u00e8o, nh\u01b0ng ch\u00e2n c\u1ee7a m\u00e8o \u0111\u01b0\u1ee3c h\u00ecnh th\u00e0nh \u0111\u1ec3 t\u1ed1i \u01b0u h\u00f3a s\u1ef1 linh ho\u1ea1t v\u00e0 kh\u00e9o l\u00e9o trong c\u00e1c ho\u1ea1t \u0111\u1ed9ng s\u0103n m\u1ed3i, trong khi ch\u00e2n ch\u00f3 v\u00e0 h\u1e

I/flutter (27405): [SSE][data] {event_type: final-response, message: 1. **Direct Answer**

I/flutter (27405): Cấu tạo chân của mèo có những đặc điểm riêng biệt so với chó và hổ, phù hợp với lối sống săn mồi và di chuyển linh hoạt. Cụ thể, chân mèo có móng vuốt sắc, các ngón chân linh hoạt và cấu trúc đặc thù giúp leo trèo và săn bắt hiệu quả hơn so với chân của chó và hổ [15]. Dù hổ và mèo cùng thuộc họ Mèo, nhưng chân của mèo được hình thành để tối ưu hóa sự linh hoạt và khéo léo trong các hoạt động săn mồi, trong khi chân chó và hổ có cấu trúc phù hợp hơn với việc chạy dài và di chuyển ổn định trên mặt đất [15].

I/flutter (27405):

I/flutter (27405): 2. **Detailed Explanation**

I/flutter (27405): Mặc dù hổ và mèo đều là động vật có vú thuộc họ Mèo (Felidae) và có nguồn gốc tiến hóa gần nhau, cấu tạo chân của chúng lại có sự khác biệt rõ rệt do nhu cầu sinh tồn và hành vi khác nhau. Dưới đây là so sánh chi tiết:

I/flutter (27405):

I/flutter (27405): ### So sánh cấu tạo chân mèo, chó và hổ

I/flutter (27405):

I/flutter (27405): | Đặc điểm | Mèo | Chó | Hổ |

I/flutter (27405): |---------|-----|-----|-----|

I/flutter (27405): | **Móng vuốt** | Móng vuốt sắc, có thể thu vào và nhô ra linh hoạt, giúp giữ thăng bằng và cào bám khi leo trèo [15]. | Móng vuốt cứng, không thu vào được, chủ yếu dùng để đào đất và bám vào mặt đất khi chạy [15]. | Móng vuốt lớn, cứng, không thu vào được, phù hợp với việc bám đất khi chạy nhanh và săn mồi [15]. |

I/flutter (27405): | **Ngón chân** | Các ngón chân linh hoạt, có thể cử động độc lập, hỗ trợ thao tác tinh tế khi săn mồi hoặc di chuyển trên bề mặt hẹp [15]. | Ngón chân cứng, ít linh hoạt hơn, thích hợp cho việc chạy bền và di chuyển trên mặt đất bằng phẳng [15]. | Ngón chân mạnh mẽ, có cấu trúc vững chắc để chịu lực khi chạy nhanh và nhảy xa [15]. |

I/flutter (27405): | **Cấu trúc bàn chân** | Bàn chân nhỏ, có đệm thịt dày, giúp di chuyển lặng lẽ và giảm tiếng động khi săn mồi [15]. | Bàn chân lớn hơn, có đệm thịt chắc, hỗ trợ di chuyển nhanh và bền trên nhiều địa hình [15]. | Bàn chân rất lớn, đệm thịt dày, giúp phân tán trọng lượng và tăng khả năng chịu lực khi di chuyển trên địa hình gồ ghề [15]. |

I/flutter (27405): | **Khả năng leo trèo** | Rất giỏi leo trèo nhờ móng vuốt và ngón chân linh hoạt [15]. | Kém leo trèo hơn, ít sử dụng khả năng này trong tự nhiên [15]. | Có thể leo trèo nhưng không linh hoạt bằng mèo, thường chỉ leo lên cây nhỏ hoặc thân cây lớn [15]. |

I/flutter (27405):

I/flutter (27405): ### Phân tích dựa trên nguồn thông tin

I/flutter (27405):

I/flutter (27405): - Chân mèo được đặc trưng bởi **móng vuốt sắc, ngón chân linh hoạt và cấu trúc bàn chân phù hợp với việc di chuyển lặng lẽ và leo trèo** – điều này giúp mèo săn mồi hiệu quả trong môi trường rừng rậm hoặc thành phố [15].

I/flutter (27405): - Trong khi đó, **chân chó** được hình thành để hỗ trợ **chạy dài, bền và ổn định**, phù hợp với vai trò là động vật sống theo bầy đàn và săn mồi theo nhóm [15].

I/flutter (27405): - **Chân hổ**, dù lớn và mạnh mẽ, lại có cấu trúc **thích nghi với việc chạy nhanh và nhảy xa**, nhưng **không linh hoạt bằng mèo** trong các hoạt động leo trèo hay thao tác tinh tế [15].

I/flutter (27405):

I/flutter (27405): ### Nhận xét từ thực tế

I/flutter (27405):

I/flutter (27405): Theo một trường hợp nổi tiếng, một con hổ tên Mulan được nuôi từ nhỏ như một người bạn thân, nhưng chủ nhân vẫn phải cảnh giác vì "nó như một con mèo – khi chơi đùa sẽ cào và cắn, gây nguy hiểm" [9]. Điều này cho thấy dù hổ có kích thước lớn hơn nhiều, **bản năng và hành vi chơi đùa của chúng vẫn mang tính chất giống mèo**, đặc biệt là ở khía cạnh sử dụng móng vuốt và sự quá đà khi vui chơi [9]. Tuy nhiên, cấu tạo chân của hổ vẫn thiên về sức mạnh và tốc độ, không phải sự linh hoạt như mèo.

I/flutter (27405):

I/flutter (27405): Tóm lại, **chân mèo có cấu tạo tối ưu cho sự linh hoạt, leo trèo và săn mồi tinh vi**, trong khi chân chó và hổ thiên về sức mạnh, tốc độ và khả năng di chuyển bền bỉ trên mặt đất [15].}

I/flutter (27405): [SSE][raw] {"event": "stream-end", "data": {"event_type": "stream-end", "thread_id": "thread_1764961393545"}}

I/flutter (27405): [SSE] Stream done



---

**Cursor**

Good news: the app is already parsing that SSE `search-results` payload and feeding it into the source selector dynamically. In your log you can see the transformed `sources` object with Vietnamese titles/content being streamed.

Current behavior:
- Every `search-results` SSE is decoded into `SearchResult` objects, stored via `SourceService.ingestSearchResults`, and immediately exposed to the selector UI.
- Non-HTTP URIs (like PDF file names) are still included and shown with the “storage” avatar; HTTP hosts show favicons.
- Selections persist across updates and auto-retain where possible.

If you aren’t seeing these new sources in the selector, try reopening the selector after a stream arrives (it reads from the updated `SourceService` lists). Domain blocks (451) in the log are just backend responses; they don’t affect parsing.

Want me to normalize bare filenames (e.g., add a pseudo-scheme) or filter out blocked/errored entries?

---

**User**

no !!!! first of all, I dont see the content of the source being presented in the source bottom sheet when I tap on it, secondly there's STILL THE STUPID HARD CODE LIST, YOU DIDNT CHANGE IT TO DYNAMICALLY BASED ON THE PARSED SOURCES FROM SSE. THIRDLY, I SEE IN THE SEE THERE'S A SHIT TONS OF SOURCES, BUT IN THE CHAT I ONLY SEE ONE PRESENT, THE REST DONT SHOW ANYTHING WHEN I TAP ON IT AND OPEN THE BOTTOM SHEET. WHAT THE FUCK ???? ARE YOU DOING ????

Context: files involved in sources UI/parsing
- `lib/features/chat/data/source_service.dart`: ingests SSE `search-results`, stores `webResources`/`knowledgeBaseResources`, tracks selected URIs.
- `lib/features/chat/view/conversation_screen.dart`: calls `_showSourcesBottomSheet` with `message.sources` and passes SSE data into assistant message UI.
- `lib/features/chat/view/widgets/assistant_message.dart`: renders sources button; falls back to `kHardcodedSources` when `message.sources` is empty.
- `lib/features/chat/view/widgets/markdown_text.dart`: renders citations/chips; also falls back to `kHardcodedSources` when `sources` is empty.
- `lib/features/chat/view/widgets/sources_bottom_sheet.dart`: shows list when tapping sources; defaults to `kHardcodedSources` if `sources` is null/empty.
- `lib/features/chat/view/widgets/source_utils.dart`: defines `kHardcodedSources` and `getFaviconUrl`.

