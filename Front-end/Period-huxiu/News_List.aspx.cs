﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_Period_huxiu_News_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int newsclassid = Convert.ToInt32(Request.QueryString["news_classid"]);
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                //绑定分类
                var newclass = from it in db.News_class select it;
                rptClass.DataSource = newclass.ToList();
                rptClass.DataBind();

                //绑定分类相关
                News_class news_class = db.News_class.SingleOrDefault(a => a.news_classid == newsclassid);
                lbClass1.Text = news_class.news_classname;
                lbClass2.Text = news_class.news_classname;

                //绑定热文3条
                var HotNews = from it in db.News where it.news_class==newsclassid orderby it.news_hot descending select it;
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 3;
                pds.DataSource = HotNews.ToList();
                lbTotal.Text = pds.PageCount.ToString();
                pds.CurrentPageIndex = 0;
                rptHotNews.DataSource = pds;
                rptHotNews.DataBind();

                //绑定资讯12条
                var news = from it in db.News orderby it.news_time descending select it;
                pds.AllowPaging = true;
                pds.PageSize = 12;
                pds.DataSource = news.ToList();
                lbTotals.Text = pds.PageCount.ToString();
                pds.CurrentPageIndex = 0;
                rptNews.DataSource = pds;
                rptNews.DataBind();

                //绑定专题
                var column = from it in db.Column where it.column_id != 1 orderby it.column_hot descending select it;
                pds.AllowPaging = true;
                pds.PageSize = 6;
                pds.DataSource = column.ToList();
                pds.CurrentPageIndex = 0;
                rptColumn.DataSource = pds;
                rptColumn.DataBind();

                //var query = biaoming.Where(c => c.名称 == 条件).Max(c => c.ManualID);
                //绑定专题前面的图片
                //var imgColumn = from it in db.Column where it.column_hot
            }
        }
    }

    //绑定热文
    int itemcount = 1;
    protected void rptHotNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbHotNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;


            Image image1 = (Image)e.Item.FindControl("imgUp");

            Image image2 = (Image)e.Item.FindControl("imgDown");

            label = (Label)e.Item.FindControl("lbItem");


            if (itemcount % 2 == 0)
            {
                image1.Visible = false;
                image2.Visible = true;
            }
            else
            {
                image1.Visible = true;
                image2.Visible = false;
            }
            itemcount++;
            //label.Text = itemcount.ToString();

        }
    }

    //换一换
    protected void lbtChange_Click(object sender, EventArgs e)
    {
        if (lbTotal.Text != lbNow.Text)
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) + 1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
        else
        {
            lbNow.Text = Convert.ToString(1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
    }

    void DataBindToRepeater(int currentPage)
    {
        int newsclassid = Convert.ToInt32(Request.QueryString["news_classid"]);
        using (var db = new HuXiuEntities())
        {
            var HotNews = from it in db.News where it.news_class==newsclassid orderby it.news_hot descending select it;

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 3;

            pds.DataSource = HotNews.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptHotNews.DataSource = pds;

            rptHotNews.DataBind();
        }

    }

    int counter = 0;
    protected void rptNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //设置文章长度
            Label label = (Label)e.Item.FindControl("lbNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

            //设置资讯css样式
            counter++;

        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (lbTotals.Text != lbNows.Text)
        {
            lbNows.Text = Convert.ToString(Convert.ToInt32(lbNows.Text) + 1);
            DataBindToRepeater(Convert.ToInt32(lbNows.Text));
        }
        else
            Response.Write("<script>alert('已在尾页！')</script>");
    }

    protected void btnLast_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt16(lbNows.Text) == 1)
            Response.Write("<script>alert('已在首页！')</script>");
        else
        {
            lbNows.Text = Convert.ToString(Convert.ToInt32(lbNows.Text) - 1);
            DataBindToRepeater(Convert.ToInt32(lbNows.Text));
        }
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        string number = txtPage.Text;
        if (number == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
        {
            int num = Convert.ToInt32(number);
            int max = Convert.ToInt32(lbTotals.Text);
            if (num < 1 || num > max)
                Response.Write("<script>alert('请正确输入数字！')</script>");
            else
            {
                DataBindToRepeater(num);
                lbNows.Text = number;
            }
        }
    }

    void DataBindToRepeater1(int currentPage)
    {
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News orderby it.news_time descending select it;

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 12;

            pds.DataSource = news.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptNews.DataSource = pds;

            rptNews.DataBind();
        }

    }

    int Csser = 0;

    protected void rptColumn_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //设置标题Css
            Label label = (Label)e.Item.FindControl("lbColumn");

            if (Csser == 0)
                label.CssClass = "subject-top-li";
            Csser++;
        }
    }
}