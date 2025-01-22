package DAO;

import Entity.New;
import Entity.NewsType;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BlogDao {

    private Connection connection;

    public BlogDao() {
        try {
            DBContext dbContext = new DBContext();
            connection = dbContext.connection;
        } catch (Exception ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<New> getNewestBlogs(int limit) {
        ArrayList<New> blogs = new ArrayList<>();

        try {
            String query = "SELECT TOP (?) * FROM News WHERE NewsType IN (1, 2) ORDER BY CreatedDate DESC";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, limit);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New();
                blog.setNewsID(resultSet.getInt("NewsID"));
                blog.setTitle(resultSet.getString("Title"));
                blog.setContent(resultSet.getString("Content"));
                blog.setNewsType(resultSet.getInt("NewsType"));
                blog.setCreatedBy(resultSet.getInt("CreatedBy"));
                blog.setModifiedBy(resultSet.getInt("ModifiedBy"));
                blog.setImage(resultSet.getString("Image"));
                blog.setVideo(resultSet.getString("Video"));
                blog.setCreateDate(resultSet.getDate("CreatedDate"));
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public ArrayList<New> get3RelateBlog(int cateId) {
        ArrayList<New> blogs = new ArrayList<>();

        try {
            String query = "SELECT TOP (3) * FROM News where NewsType = ? ORDER BY CreatedDate DESC";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cateId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New();
                blog.setNewsID(resultSet.getInt("NewsID"));
                blog.setTitle(resultSet.getString("Title"));
                blog.setContent(resultSet.getString("Content"));
                blog.setNewsType(resultSet.getInt("NewsType"));
                blog.setCreatedBy(resultSet.getInt("CreatedBy"));
                blog.setModifiedBy(resultSet.getInt("ModifiedBy"));
                blog.setImage(resultSet.getString("Image"));
                blog.setVideo(resultSet.getString("Video"));
                blog.setCreateDate(resultSet.getDate("CreatedDate"));
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public void addBlog(String Title, String Content, int NewsType, int CreatedBy, int ModifiedBy, String Image, String Video) {
        LocalDateTime now = LocalDateTime.now();
        try {
            String sql = "insert into News ([Title],[Content] ,[NewsType] ,[CreatedBy],[ModifiedBy] ,[Image] ,[Video],[CreatedDate] )\n"
                    + "values (?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Title);
            stm.setString(2, Content);
            stm.setInt(3, NewsType);
            stm.setInt(4, CreatedBy);
            stm.setInt(5, ModifiedBy);
            stm.setString(6, Image);
            stm.setString(7, Video);
            stm.setString(8, now.toString());
            stm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<NewsType> NewsType() {
        ArrayList<NewsType> list = new ArrayList<>();
        try {
            String sql = "    select * from NewsType ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                NewsType u = new NewsType(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }
     public ArrayList<NewsType> Information() {
        ArrayList<NewsType> list = new ArrayList<>();
        try {
            String sql = "    select * from NewsType where NewsTypeID IN (10)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                NewsType u = new NewsType(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }
      public ArrayList<NewsType> Customerservice() {
        ArrayList<NewsType> list = new ArrayList<>();
        try {
            String sql = "    select * from NewsType where NewsTypeID IN (11)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                NewsType u = new NewsType(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }
       public ArrayList<NewsType> Getintouch() {
        ArrayList<NewsType> list = new ArrayList<>();
        try {
            String sql = "    select * from NewsType where NewsTypeID IN (12)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                NewsType u = new NewsType(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }
        public ArrayList<NewsType> NewsTypeClient() {
        ArrayList<NewsType> list = new ArrayList<>();
        try {
            String sql = "    select * from NewsType where NewsTypeID IN (1,2)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                NewsType u = new NewsType(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<New> getListBlogsForAdmin() {
        ArrayList<New> blogs = new ArrayList<>();

        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate " +
                       "FROM News n, NewsType nt, Admin a " +
                       "WHERE n.NewsType = nt.NewsTypeID " +
                       "AND a.AdminID = n.CreatedBy " +
                       "AND n.NewsType IN (1, 2);";
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(5), resultSet.getDate(6), resultSet.getString(4), resultSet.getString(7), resultSet.getDate(8));
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blogs;
    }
     public ArrayList<New> getListBlogsForClient() {
        ArrayList<New> blogs = new ArrayList<>();

        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate " +
                "FROM News n, NewsType nt, Admin a " +
                "WHERE n.NewsType = nt.NewsTypeID " +
                "AND a.AdminID = n.CreatedBy " +
                "AND n.NewsType IN (1, 2);";
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(5), resultSet.getDate(6), resultSet.getString(4), resultSet.getString(7), resultSet.getDate(8));
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blogs;
    }
 public ArrayList<New> getListBlogsPagingByCate(String search, int index, String CateID) {
    ArrayList<New> blogs = new ArrayList<>();

    try {
        String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate " +
            "FROM News n " +
            "JOIN NewsType nt ON n.NewsType = nt.NewsTypeID " +
            "JOIN Admin a ON a.AdminID = n.CreatedBy " +
            "WHERE (n.Title LIKE '%" + search + "%' OR a.AdminName LIKE '%" + search + "%') " +
            "AND nt.NewsTypeID = ? " +
            "ORDER BY n.NewsID " +
            "OFFSET " + ((index - 1) * 9) + " ROWS FETCH NEXT 9 ROWS ONLY";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, CateID);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            New blog = new New(
                resultSet.getInt(1),
                resultSet.getString(2),
                resultSet.getString(3),
                resultSet.getString(5),
                resultSet.getDate(6),
                resultSet.getString(4),
                resultSet.getString(7),
                resultSet.getDate(8)
            );
            blogs.add(blog);
        }
    } catch (SQLException ex) {
        Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return blogs;
}
    public ArrayList<New> getListBlogsPaging(String search, int index) {
        ArrayList<New> blogs = new ArrayList<>();

        try {
            String query = "select n.NewsID,n.Title,n.Content,nt.NewsTypeName,a.AdminName,n.CreatedDate,n.Image,n.ModifiedDate \n"
                    + "from News n,NewsType nt,Admin a \n"
                    + "where n.NewsType = nt.NewsTypeID and a.AdminID = n.CreatedBy and(n.Title like '%" + search + "%'or a.AdminName like '%" + search + "%')\n"
                    + "order by n.NewsID " + " OFFSET " + ((index - 1) * 9) + " ROWS FETCH NEXT 9  ROWS ONLY";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(5), resultSet.getDate(6), resultSet.getString(4), resultSet.getString(7), resultSet.getDate(8));
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blogs;
    }
public int countListBlogsPagingByCate(String search, String CateID) {
    try {
        String query = "SELECT COUNT(*) " +
            "FROM News n " +
            "JOIN NewsType nt ON n.NewsType = nt.NewsTypeID " +
            "JOIN Admin a ON a.AdminID = n.CreatedBy " +
            "WHERE (n.Title LIKE '%" + search + "%' OR a.AdminName LIKE '%" + search + "%') " +
            "AND nt.NewsTypeID = ?";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, CateID);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt(1);
        }
    } catch (SQLException ex) {
        Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    

    return 0;
}
    public int countListBlogsPaging(String search) {
        try {
            String query = "select count(*) \n"
                    + "from News n,NewsType nt,Admin a \n"
                    + "where n.NewsType = nt.NewsTypeID and a.AdminID = n.CreatedBy and(n.Title like '%" + search + "%'or a.AdminName like '%" + search + "%')\n";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[News]\n"
                + "      WHERE News.NewsID = ?;";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, id);

            stm.executeUpdate();

        } catch (Exception ex) {
        }
    }

    public New getBlogByID(int id) {

        try {
            String query = "select n.NewsID,n.Title,n.Content,nt.NewsTypeName,a.AdminName,n.CreatedDate,n.Image,n.ModifiedDate, n.NewsType from News n,NewsType nt,Admin a where n.NewsType = nt.NewsTypeID and a.AdminID = n.CreatedBy and n.NewsID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New n = new New(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(5), resultSet.getDate(6), resultSet.getString(4), resultSet.getString(7), resultSet.getDate(8));
                n.setNewsType(resultSet.getInt("NewsType"));
                return n;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    public New getBlogByName(String title) {

        try {
            String query = "select n.NewsID,n.Title,n.Content,nt.NewsTypeName,a.AdminName,n.CreatedDate,n.Image,n.ModifiedDate, n.NewsType from News n,NewsType nt,Admin a where n.NewsType = nt.NewsTypeID and a.AdminID = n.CreatedBy and n.Title = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, title);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New n = new New(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(5), resultSet.getDate(6), resultSet.getString(4), resultSet.getString(7), resultSet.getDate(8));
                n.setNewsType(resultSet.getInt("NewsType"));
                return n;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void editBlog(String Title, String Content, int NewsType, int CreatedBy, int ModifiedBy, String Image, String Video, int id) {
        String sql = "UPDATE [dbo].[News]\n"
                + "   SET [Title] = ?\n"
                + "      ,[Content] = ?\n"
                + "      ,[NewsType] = ?\n"
                + "      ,[CreatedBy] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Video] = ?\n"
                + " WHERE [NewsID] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, Title);
            stm.setString(2, Content);
            stm.setInt(3, NewsType);
            stm.setInt(4, CreatedBy);
            stm.setInt(5, ModifiedBy);
            stm.setString(6, Image);
            stm.setString(7, Video);
            stm.setInt(8, id);
            stm.executeUpdate();

        } catch (Exception ex) {
        }
    }

    public ArrayList<New> getListBlogsForAdminByCate(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "select n.NewsID,n.Title,n.Content,nt.NewsTypeName,a.AdminName,n.CreatedDate,n.Image,n.ModifiedDate from News n,NewsType nt,Admin a where n.NewsType = nt.NewsTypeID and a.AdminID = n.CreatedBy and n.NewsType = ?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(5), resultSet.getDate(6), resultSet.getString(4), resultSet.getString(7), resultSet.getDate(8));
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blogs;
    }
    public ArrayList<New> getPhoneNumber(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }
    public ArrayList<New> getEmail(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }
     public ArrayList<New> getInformation(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }
      public ArrayList<New> GetCustomerService(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }
       public ArrayList<New> GetGetinTouch(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }
        public ArrayList<New> getBanner(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }
        public ArrayList<New> getHome(int cate_id) {
        ArrayList<New> blogs = new ArrayList<>();
        try {
            String query = "SELECT n.NewsID, n.Title, n.Content, nt.NewsTypeName, a.AdminName, n.CreatedDate, n.Image, n.ModifiedDate "
                    + "FROM News n, NewsType nt, Admin a "
                    + "WHERE n.NewsType = nt.NewsTypeID AND a.AdminID = n.CreatedBy AND nt.NewsTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cate_id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                New blog = new New(
                        resultSet.getInt("NewsID"),
                        resultSet.getString("Title"),
                        resultSet.getString("Content"),
                        resultSet.getString("AdminName"),
                        resultSet.getDate("CreatedDate"),
                        resultSet.getString("NewsTypeName"),
                        resultSet.getString("Image"),
                        resultSet.getDate("ModifiedDate")
                );
                blogs.add(blog);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }


}
