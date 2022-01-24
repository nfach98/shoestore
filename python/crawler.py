import time
import uuid
from csv import DictWriter
from urllib.request import urlretrieve

from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException


def insert_category(name, id):
    fields = ['NAME', 'ID']
    new = {
        'NAME': name,
        'ID': id
    }
    with open('categories.csv', 'a', newline='') as f_object:
        dictwriter_object = DictWriter(f_object, fieldnames=fields)
        dictwriter_object.writerow(new)
        f_object.close()


def insert_shoes(id, title, sub, category, price, discount, desc):
    fields = ['ID', 'TITLE', 'SUB', 'ID_CATEGORY', 'PRICE', 'DISCOUNT', 'DESC']
    new = {
        'ID': id,
        'TITLE': title,
        'SUB': sub,
        'ID_CATEGORY': category,
        'PRICE': int(price.replace("Rp ", "").replace(",", "")),
        'DISCOUNT': int(discount),
        'DESC': desc
    }
    with open('shoes.csv', 'a', newline='') as f_object:
        dictwriter_object = DictWriter(f_object, fieldnames=fields)
        dictwriter_object.writerow(new)
        f_object.close()


def insert_colorway(id, id_shoes, style, name, image):
    fields = ['ID', 'ID_SHOES', 'STYLE', 'NAME', 'IMAGE']
    new = {
        'ID': id,
        'ID_SHOES': id_shoes,
        'STYLE': style,
        'NAME': name,
        'IMAGE': image
    }
    with open('colorways.csv', 'a', newline='') as f_object:
        dictwriter_object = DictWriter(f_object, fieldnames=fields)
        dictwriter_object.writerow(new)
        f_object.close()


def insert_size(id_shoes, name, colorway):
    fields = ['ID_SHOES', 'ID_COLORWAY', 'NAME']
    new = {
        'ID_SHOES': id_shoes,
        'ID_COLORWAY': colorway,
        'NAME': name,
    }
    with open('sizes.csv', 'a', newline='') as f_object:
        dictwriter_object = DictWriter(f_object, fieldnames=fields)
        dictwriter_object.writerow(new)
        f_object.close()


def insert_image(id_shoes, image, colorway):
    fields = ['ID_SHOES', 'IMAGE', 'COLORWAY']
    new = {
        'ID_SHOES': id_shoes,
        'IMAGE': image,
        'COLORWAY': colorway
    }
    with open('images.csv', 'a', newline='') as f_object:
        dictwriter_object = DictWriter(f_object, fieldnames=fields)
        dictwriter_object.writerow(new)
        f_object.close()


driver = webdriver.Firefox()
driver.get("https://www.nike.com/id/w/shoes-y7ok")

categories_div = driver.find_element_by_class_name("categories")
categories = categories_div.find_elements_by_tag_name("a")

exclude = [
    "Lifestyle",
    "Jordan",
    "Running",
    "Basketball",
    "Training & Gym",
    "Football",
    "Skateboarding",
    "Golf",
    "Tennis",
]

for category in categories:
    cat = category.text
    if cat not in exclude:
        link = category.get_attribute("href")
        driver.execute_script("window.open('');")
        driver.switch_to.window(driver.window_handles[1])
        driver.get(link)

        id_category = uuid.uuid4()

        insert_category(cat, id_category)

        section = driver.find_element_by_tag_name("section")
        height_before = str(section.size.get('height'))
        driver.execute_script("window.scrollTo(0, " + height_before + ");")
        time.sleep(5)
        height_after = str(section.size.get('height'))

        while height_before != height_after:
            height_before = str(section.size.get('height'))
            driver.execute_script("window.scrollTo(0, " + height_before + ");")
            time.sleep(5)
            height_after = str(section.size.get('height'))

        shoes_card = driver.find_elements_by_class_name("product-card__body")
        for card in shoes_card:
            shoes = card.find_element_by_tag_name("a")
            driver.execute_script("window.scrollTo(0, " + str(shoes.location['y']) + ");")

            link = shoes.get_attribute("href")
            driver.execute_script("window.open('');")
            driver.switch_to.window(driver.window_handles[2])
            driver.get(link)

            shoe_id = uuid.uuid4()

            try:
                info = driver.find_element_by_id("RightRail")
                title = info.find_element_by_id("pdp_product_title").text
                sub = info.find_element_by_tag_name("h2").text
                prices_div = info.find_elements_by_class_name("product-price")
                discount = 0
                if len(prices_div) > 1:
                    discount_div = info.find_element_by_class_name("css-z4ceff")
                    discount = discount_div.text.split(" ")[0].replace("%", "")
                price = prices_div[-1].text

                desc_div = info.find_element_by_class_name("description-preview")
                desc = desc_div.find_element_by_tag_name("p").text

                insert_shoes(shoe_id, title, sub, id_category, price, discount, desc)

                colorways = driver.find_elements_by_class_name("colorway-product-overlay")
                if len(colorways) > 0:
                    for col in colorways:
                        if col.get_attribute('href') != \
                                "https://www.nike.com/id/u/custom-nike-air-force-1-by-you-10000830/7289514420":
                            col.click()
                            time.sleep(3)

                            image_colorway = ''
                            id_colorway = uuid.uuid4()
                            color_name_li = driver.find_element_by_class_name("description-preview__color-description")
                            color_name = color_name_li.text.split(": ")[-1]
                            style_li = driver.find_element_by_class_name("description-preview__style-color")
                            style = style_li.text.split(": ")[-1]

                            try:
                                sizes_container = driver.find_element_by_xpath("//div[@class='mt2-sm css-12whm6j']")
                                sizes = sizes_container.find_elements_by_tag_name("div")
                                for s in sizes:
                                    status_size = s.find_element_by_tag_name("input")
                                    label_size = s.find_element_by_tag_name("label")
                                    if status_size.is_enabled():
                                        insert_size(shoe_id, label_size.text, id_colorway)
                            except:
                                pass

                            images = driver.find_elements_by_class_name("grid-image")
                            for index, image in enumerate(images):
                                pic = image.find_elements_by_tag_name("picture")
                                img = pic[-1].find_element_by_tag_name("img")
                                driver.execute_script("window.scrollTo(0, " + str(img.location['y']) + ");")
                                src = img.get_attribute('src')
                                image_name = "images/" + str(shoe_id) + "-" + color_name.replace("/", "_").replace(" ",
                                                                                                                   "") \
                                    .lower() + "-" + str(index) + ".png"
                                if index == 0:
                                    image_colorway = image_name

                                try:
                                    urlretrieve(src, image_name)
                                    insert_image(shoe_id, image_name, id_colorway)
                                except:
                                    pass

                            insert_colorway(id_colorway, shoe_id, style, color_name, image_colorway)

                else:
                    try:
                        sizes_container = driver.find_element_by_xpath("//div[@class='mt2-sm css-12whm6j']")
                        sizes = sizes_container.find_elements_by_tag_name("div")
                        for s in sizes:
                            status_size = s.find_element_by_tag_name("input")
                            label_size = s.find_element_by_tag_name("label")
                            if status_size.is_enabled():
                                insert_size(shoe_id, label_size.text, '-')
                    except:
                        pass

                    images = driver.find_elements_by_class_name("grid-image")
                    for index, image in enumerate(images):
                        pic = image.find_elements_by_tag_name("picture")
                        img = pic[-1].find_element_by_tag_name("img")
                        driver.execute_script("window.scrollTo(0, " + str(img.location['y']) + ");")
                        src = img.get_attribute('src')
                        image_name = "images/" + str(shoe_id) + "-" + str(index) + ".png"

                        try:
                            urlretrieve(src, image_name)
                            insert_image(shoe_id, image_name, '-')
                        except:
                            pass

            except:
                pass

            driver.close()
            driver.switch_to.window(driver.window_handles[1])

        driver.close()
        driver.switch_to.window(driver.window_handles[0])

driver.close()
