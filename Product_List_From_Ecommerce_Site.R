## Project - Extracting product list from an ecommerce site

#Installing packages
#install.packages("RSelenium")
#install.packages("XML")
#install.packages("rvest")
#install.packages("xlsx")

#Loading packages
library("rvest")
library("xlsx")
library("stringr")

#Reading in data
#I'm using the sitemap of the website to capture all the product listings
#Analyze the structure of the URLs to identify which ones correspond to a product
#There almost always will be a pattern to the URLs

product_data <- read_html("https://www.example.com/sitemap.xml")

product_name_list <- product_data %>% html_nodes("title") %>% html_text()
product_loc_list <- product_data %>% html_nodes("url > loc") %>% html_text()
product_loc_list <- product_loc_list[179:516]

df_productlist <- data.frame(product_name_list, product_loc_list, stringsAsFactors = F)

write.xlsx(x = df_productlist, file = "20201023_ProductList_V1.xlsx", sheetName = "Example.com", row.names = F)
