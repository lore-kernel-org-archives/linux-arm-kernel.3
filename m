Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A307C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3PGsxzvr5pYDG64U4cbt7QQR2dVwmU3hq+h46iagFg=; b=w2FMdX7nBcLWBABtiOp487tEzo
	Bfct462kxPuNzCQPxHuQrwMKV/3nSTuRcuQXCqPl+H0eoh9lF5yXwU2IBSlVUYjhFcEhq+RqB2nbi
	75B+BYIhRUHCvd4YIb9Hp/TuikPdmGNDTd1dMc485povv0CuJwcFhe9jwrltLHpimYC4+XaGjbhEV
	7M/BmK1DctN1fLOvRvFmL3rjdX2+lmOoffL46oakww2DmLoj5HtCb3evI/ZYUeiW2yT/IQuEBOeZA
	EqjVROg27OCmjfmFercCiOpM5123+R1JAen3BpghUQrQhVKNbGJho6tipxeJYw+KPvqAdFW12NffG
	XGDZ9nzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fZd-0000000Dy4J-14B9;
	Wed, 02 Sep 2026 07:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fZc-0000000Dy48-0WLv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 07:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i3PGsxzvr5pYDG64U4cbt7QQR2dVwmU3hq+h46iagFg=; b=TABrAxc6J4wmiMlcdUuHme89sJ
	6H9B+y9TQccH6Y+jPWabkZfrVmlKgbfQeBhU7StEEUOiZmle7M+TOWjPJCZCkAw/FIEoFnClg5ijN
	Zy60wPN0Ex1mGNVi3Wx/j5bqeReKhA6aZzWZ8EXgdTZjzobZoUNxBNcynoSI38sFQWisj3hUnYcRr
	0y2XgZF+4Dg6aIUJSFgy0Rae0DV9GSpj8QbZdY26IWyI+eUViEnyGGJT3HgvWhFv63aWmHzsV+nTG
	LXuZeOojkoTB2OJby0eKzthISi1opPOjLLrVTekUCEggWH6u6j4vwJA12Jx/PtnwkdjW6z6+E/ZOf
	PX4/Xc+w==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1fZY-0000000Bhef-3lIb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:39:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso794802f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334791; x=1788939591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3PGsxzvr5pYDG64U4cbt7QQR2dVwmU3hq+h46iagFg=;
        b=BDKgHqtPmsYAiYActY8afNoNPZ/2YSu3KZ7xelyGYSqlhOlitiaPG62rD8k/iIMhJN
         iQ6OZrXMnKLcp8TAbMjCUv4VGo+guxzrsAcm0hHPxdKOs71Cns7F8y1wI/JAxoy6/C3E
         itCH7qWXpbWdkJlKB5TKU3886v/eVgPgVWD6KkVs4tdnhoK94NIlFKRcx9g27fax3sTl
         xw33/05ybbfIx/PiHTdVqD9I5bfcy2C5sUr74QItRsHrLxuGPawA54Z7X7ycQGw6Cn1q
         UVXBL4icnAFRpwriM1Zxek5H7QGI1+dPbqHog65b+MIDKT0FJJPVk0ujNv65FIbmD1NP
         y5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334791; x=1788939591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3PGsxzvr5pYDG64U4cbt7QQR2dVwmU3hq+h46iagFg=;
        b=Y+aKk7lp7BWgM8Q/nv1aJYs9s7hRkHYFE6hmNz6EL3aGYOrZLf3FVxSuuk6l25g7GK
         9cFhQnlkfFB8l9igs2Gq1hG3FPako4I/u0BS0q7m8s6VTleeWc8ir+HDEKaQDQoANTo4
         uWLvxA8JaniPoqfQS30mqDTypjSlNJHxiCFB9IUQtNehVV1IIKVDeoPZ3j0UiYfo5ZcP
         ZbovMzCzEhjWBr8LhNIYgZ+K32tjt/PJtBpLNoVmZnqQmAz4o4t3zCY9uUvOBwCp5tjt
         rI+mZqvLuTRz6v8J5LCsvxnNvOfgSuXRrOKu/2wTRmv6fa62hx3UvkR7fm6bkPEPU3P6
         OLQg==
X-Forwarded-Encrypted: i=1; AKwUvBzLpAvlGkoWmei2+X+7ChVaPc2Js6tFKdEgYDCzqTXn5jkRetKA0ZGCXcjEOBvZoVdzO0vkS4idXhPy5xl8CZop@lists.infradead.org
X-Gm-Message-State: AFuF++mkvs3mdGMcGW5ZwaSITUzH5sha7ipJpzE22wBevdKlh2AMs1ty
	JqW9BJbeIlEB1UFt8EFTBJVi7sgcLRzrBuY9gCn2OW04yx34jeBg0PCV
X-Gm-Gg: AYBFou34d56OLZ4YJ2ArL0N2hs2zk0wOWnh7ISdjNOLajaV3zUOVZmG2Qfr1Eh+OmCX
	wjoUUn7CL5Tvk5A+sR9hCbqSqAcjAlGX60C6DAJh2HjW+BkGtRR6SI/o1JF8SYETl6/6VAnwggP
	n8G58hMU4yYx85ouDCcLoGqCQKjE6wUhvz9XQ8s61CQEUaGZLjpGDtKjJwOMzQbyMDgbhRC1/CQ
	dpBqRxxzd1SIp15Vi/M0pFgNVBtrg8Bt5c23tmFqtyQc/Xe4HGxV8pRTc7rU1WdOkmP0XZurxqJ
	4BsS54EGiundAIxHai21LcT+tYNAuh/prrJvUl7D4FkNLB19Y4ubiusN50xSLdl1k02xbvyH1Bd
	E4DqF3S0BNfDvDGpwhZeCF2liFZOZH0KD5SSi+kbHi8oI/fHX3jYIX7X5zM9apkRVY4s/3US/2p
	J6zV23l4sgg0ur54FNvdhtkVMX4iCRJfPMH4TKLT46s1X3OCBv8kOxTR3EHOlLgArsQA==
X-Received: by 2002:a05:6000:4910:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48488df9e0dmr4742560f8f.4.1788334790310;
        Wed, 02 Sep 2026 00:39:50 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:49 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  2 Sep 2026 09:39:46 +0200
Message-ID: <20260902073946.3709080-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902073946.3709080-1-mehmet.fide@gmail.com>
References: <20260902073946.3709080-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_083953_214605_8A0FD41B 
X-CRM114-Status: GOOD (  20.29  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers sets the direction through pinctrl but has no get_direction
callback, so every gpiod_get_direction() call trips the WARN in gpiolib
and the direction gpiolib reports is whatever it assumed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Keep the direction of such a chip in the existing shadow: the direction
setters update sdir under the chip lock, and get_direction() is the
shadow-reading path already used for unreadable direction registers.
That keeps the callback usable in atomic context, which it has to be:
gpiochip_lock_as_irq() calls it for !can_sleep chips from
gpiochip_irq_domain_activate(), under the irq descriptor lock.

The pad's actual state is read once, in process context, when a line is
requested: gpiolib calls request() right before get_direction() for a
new line, so the shadow is seeded from PIN_CONFIG_OUTPUT_ENABLE there and
the line reports what the pin controller says. Lines pinctrl cannot
answer for keep the input default, which is what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - keep the direction in the chip's shadow and reuse the shadow-reading
   get_direction(); seed the shadow from pinctrl in request(), because
   gpiochip_lock_as_irq() calls get_direction() under the irq descriptor
   lock for !can_sleep chips (Sashiko)
 - lines pinctrl cannot answer for keep the input default, no error
   returned to gpiochip_lock_as_irq() (Sashiko)
 - drop the claim about the initial direction scan, it runs before the
   pin ranges exist (Sashiko)
 drivers/gpio/gpio-mmio.c | 65 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)
 drivers/gpio/gpio-mmio.c | 63 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..84bf8cc7a0c7 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -372,7 +373,17 @@ static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 
 static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return gpio_mmio_dir_return(gc, gpio, false);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
+	ret = gpio_mmio_dir_return(gc, gpio, false);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -384,9 +395,19 @@ static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				    int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
 	gc->set(gc, gpio, val);
 
-	return gpio_mmio_dir_return(gc, gpio, true);
+	ret = gpio_mmio_dir_return(gc, gpio, true);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -601,20 +622,54 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+		}
 	}
 
 	return 0;
 }
 
+/*
+ * Without direction registers the direction lives in the pin controller,
+ * so seed the shadow from there when a line is requested.
+ */
+static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
+					    unsigned int gpio)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long config;
+
+	if (!IS_ENABLED(CONFIG_PINCTRL) || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (pinctrl_gpio_get_config(gc, gpio, &config))
+		return;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	if (config)
+		chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+	else
+		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+}
+
 static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
 
 	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	if (chip->pinctrl)
-		return gpiochip_generic_request(gc, gpio_pin);
+	if (chip->pinctrl) {
+		ret = gpiochip_generic_request(gc, gpio_pin);
+		if (ret)
+			return ret;
+		gpio_mmio_seed_dir_from_pinctrl(gc, gpio_pin);
+	}
 
 	return 0;
 }
-- 
2.54.0


