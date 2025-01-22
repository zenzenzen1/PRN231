/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FilePDF;

import Entity.Guarantee;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author vinh1
 */
public class CreateFilePDF {

    public CreateFilePDF() {
    }

    public boolean createPDF(Guarantee info) throws FileNotFoundException, IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate currentDate = LocalDate.parse(info.getStartDate(), formatter);
        LocalDate newDate = currentDate.plusWeeks(1);
        String newDateString = newDate.format(formatter);
        // Đường dẫn tới thư mục để lưu file PDF
        String folderPath = "D:\\SWP391_LapTop\\";
        // Tên file PDF
        String fileName = info.getGuaranteeID()+".pdf";
        // Đường dẫn đầy đủ tới file PDF
        String filePath = folderPath + fileName;
        // Tạo thư mục nếu không tồn tại
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // Tạo đối tượng Document
        Document document = new Document(PageSize.A4);
        try {
            // Thiết lập PdfWriter để ghi dữ liệu vào file PDF
            PdfWriter.getInstance(document, new FileOutputStream(filePath));

            // Mở Document
            document.open();
            // Lấy kích thước trang PDF
            float maxWidth = document.getPageSize().getWidth();
            float maxHeight = document.getPageSize().getHeight();

            BaseFont ShortBaby = BaseFont.createFont("D:\\SWP391_LapTop\\web\\fonts\\Font-viet-hoa-Iciel-Novecento\\Font việt hóa Iciel Novecento\\iCielNovecentosans-Normal.otf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            // Thêm nội dung vào Document
            BaseFont fontawesome = BaseFont.createFont("D:\\SWP391_LapTop\\web\\fonts\\fontawesome-webfont.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            BaseFont times_new_roman_ngang_dam = BaseFont.createFont("D:\\SWP391_LapTop\\web\\fonts\\font-times-new-roman\\font-times-new-roman\\font-times-new-roman.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            BaseFont times_new_roman_binhthuong = BaseFont.createFont("D:\\SWP391_LapTop\\web\\fonts\\font-times-new-roman\\font-times-new-roman\\SVN-Times New Roman.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

            Font fontTitle = new Font(times_new_roman_binhthuong, 17, Font.BOLD);
            Font fontShortBaby = new Font(ShortBaby, 32, Font.NORMAL, BaseColor.RED);
            Font fontThongBao = new Font(fontawesome, 12, Font.NORMAL);
            Font font_times_new_roman = new Font(times_new_roman_ngang_dam, 40, Font.NORMAL);
            Font fontThongTin = new Font(times_new_roman_binhthuong, 15, Font.NORMAL);
            document.add(new Paragraph("Group2com", fontShortBaby));
            document.add(new Paragraph("          PHIẾU BẢO HÀNH", font_times_new_roman));
            document.add(new Paragraph("Thông tin khách hàng", fontTitle));
            document.add(new Paragraph("Họ vào tên khách hàng: " + info.getUserName(), fontThongTin));
            document.add(new Paragraph("Email: " + info.getEmail() + "                               Số điện thoại: " + info.getPhone(), fontThongTin));
            document.add(new Paragraph("Địa chỉ: " + info.getAddress(), fontThongTin));
            document.add(new Paragraph("Thông tin bảo hành", fontTitle));
            document.add(new Paragraph("Tên sản phẩm bảo hành: " + info.getProductName(), fontThongTin));
            document.add(new Paragraph("Ngày bắt đầu bảo hành: " + info.getStartDate(), fontThongTin));
            document.add(new Paragraph("Ngày dự tính kết thúc bảo hành: " + newDateString, fontThongTin));
            document.add(new Paragraph("Tên người tạo bảo hành: " + info.getAdminName(), fontThongTin));
            document.add(new Paragraph("Ảnh mô tả lỗi: ", fontThongTin));
            if (info.getImg() != null&&!info.getImg().isEmpty()) {
                Image image = Image.getInstance("D:\\SWP391_LapTop\\web\\imageGuarantee\\" + info.getImg());
                if (image.getWidth() > maxWidth * 2 / 3 || image.getHeight() > maxHeight / 4) {
                    image.scaleToFit(maxWidth / 2, maxHeight / 4);
                }
                document.add(image);
            }else{
                document.add(new Paragraph("Không có ảnh  ", fontThongTin));
            }
            if (info.getDes_Error() != null&&!info.getDes_Error().isEmpty()) {
                document.add(new Paragraph("Mô tả lỗi: " + info.getDes_Error(), fontThongTin));
            }else{
                document.add(new Paragraph("Mô tả lỗi: Không có" , fontThongTin));
            }
            
            document.newPage();
            Font fontDanhMuc = new Font(times_new_roman_binhthuong, 15, Font.BOLD);
            Font fontThongTinBaoHanh = new Font(times_new_roman_binhthuong, 10, Font.NORMAL);
            document.add(new Paragraph("Trung tâm bảo hành Group2com ", fontThongBao));
            document.add(new Paragraph("I.CHÍNH SÁCH BẢO HÀNH CHUNG", fontDanhMuc));
            document.add(new Paragraph("- Thời gian bảo hành sản phẩm trung bình 07 ngày làm việc (Không tính thứ 07, chủ nhật và ngày lễ). Sản phẩm bảo hành xong trước 07 ngày Group2com sẽ báo cho khách hàng, muộn hơn 07 ngày Group2com sẽ báo cho khách hàng thời gian cụ thể.\n"
                    + "\n"
                    + "- Trong thời gian bảo hành Group2com sẽ cho khách hàng mượn sản phẩm tương ứng để dùng trong thời gian chờ bảo hành (nếu có)\n"
                    + "\n"
                    + "- Trong trường hợp sản phẩm Quý khách gửi không còn hàng, Group2com sẽ đổi trả sản phẩm tương đương hoặc nhập lại theo giá thỏa thuận.\n"
                    + "- Nhận kiểm tra xác định lỗi miễn phí cho khách hàng không mua tại Group2com", fontThongTinBaoHanh));
            document.add(new Paragraph("II.ĐIỀU KIỆN BẢO HÀNH", fontDanhMuc));
            document.add(new Paragraph("Tất cả các sản phẩm do Group2com bán ra đều tuân thủ điều kiện bảo hành của Hãng sản xuất, Nhà cung cấp. Các trường hợp sau đây bị coi là vi phạm điều kiện bảo hành và không được bảo hành:\n"
                    + "\n"
                    + "1. Sản phẩm bị tiêu hao trong quá trình sử dụng. (hộp mực, cụm trống từ, băng mực, đầu kim, đầu in phun, quạt, các loại cáp, nắn dòng, công tắc nguồn…)\n"
                    + "\n"
                    + "2. Sản phẩm hết thời hạn bảo hành (thời hạn bảo hành sản phẩm được thể hiện trên phiếu xuất kho kiêm bảo hành của Group2com…).\n"
                    + "\n"
                    + "3. Không có tem bảo hành của Group2com, Nhà phân phối, Hãng sản xuất; hoặc có nhưng tem bảo hành đó không hợp lệ (bị rách, bị tẩy xóa, sửa chữa, mờ không đọc được, bong/ tróc…).\n"
                    + "\n"
                    + "4. Số serial, mã vạch, thông số kỹ thuật trên sản phẩm không hợp lệ (bị mờ không đọc được, bị cạo, bị sửa, bị rách, bị bong/ tróc, bị thay đổi).\n"
                    + "\n"
                    + "5. Sản phẩm bị lỗi do thiên tai (lũ lụt, hỏa hoạn, nguồn điện không bình thường, sai điện áp quy định…).\n"
                    + "\n"
                    + "6. Sản phẩm bị lỗi do người sử dụng:\n"
                    + "• Sản phẩm bị biến dạng vật lý như trầy, xước, lồi, lõm, móp, méo, nứt, vỡ do bị rơi, bị va đập, do vận chuyển/ lắp đặt sai quy cách\n"
                    + "• Sản phẩm bị mốc, hoen rỉ, ẩm ướt, chất lỏng xâm nhập, ố vàng, mờ chữ, viết chữ không tẩy được…\n"
                    + "\n"
                    + "7. Sản phẩm hư hỏng do chuột, bọ hoặc côn trùng xâm nhập.\n"
                    + "\n"
                    + "8. Sản phẩm bị tháo dỡ, sửa chữa bởi các cá nhân hoặc kỹ thuật viên không được sự ủy quyền của Group2com.\n"
                    + "\n"
                    + "9. Không bảo hành phần mềm không có bản quyền và dữ liệu của khách hàng có trong máy hoặc sản phẩm", fontThongTinBaoHanh));
            document.add(new Paragraph("III.TRUNG TÂM BẢO HÀNH GROUP2COM", fontDanhMuc));
            document.add(new Paragraph("Địa chỉ: Đất Thổ Cư Hòa Lạc, Km29 Đường Cao Tốc 08, Thạch Hoà, Thạch Thất, Hà Nội 10000\n"
                    + "Khu vực phục vụ: Thạch Hoà và các khu vực lân cận\n"
                    + "Các giờ: \n"
                    + "Đã đóng cửa ⋅ Mở lúc 7:00", fontThongTinBaoHanh));

// Đóng Document
            document.close();
            System.out.println("File PDF đã được tạo thành công và lưu tại: " + filePath);
        } catch (DocumentException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
