Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZueSdxa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OgixHVJV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XvlUBd9t253/XOnBgnu6wcIP+Rj8CczN5W7bxz4QbhY=; b=xZueSdxa/nb1QN
	kG5F5zaZDmL8mDkT8cXAQJlsvUSmBwQbH7LKYpmRN9UhE2ru95RdZXURioz2ms8Z+sonyWlG0HvV7
	KC2cKcIcv+WbNWa9Vuy+6tp9nTX6oIKRTx4f3jlTUwrCj5uEu9kj6MnQm+TXtSy0nzZPGEVBCFUm3
	vmsSpn1yU4+pX8vFJ2TH1vAjc0iJucb8/9bV/eMTh3anOkM4uUsfVCBIYmniFkhLAaCR/CZ2QSQVO
	mvGqCjoosJF5F336oqXIVQNGfZif4CbTkmeYmsh8RhyS0g50JALgGV1MobbU1iMljS+fh78i8z0a3
	2la3zdLMLtUJi7cQEyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOH-00000000jjm-0ujg;
	Sun, 25 Oct 2026 05:03:29 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOE-00000000ji9-23fq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:03:27 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3956849eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904605; x=1793509405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvlUBd9t253/XOnBgnu6wcIP+Rj8CczN5W7bxz4QbhY=;
        b=OgixHVJVSMWdUE+O/59swSfTk9Xr1foXQUovMS07LlBTQGoxqXt2K3uX7CbhYaNTh5
         9I+gRr2CKdR0RFnlht2vtdoUMcQk+M0CUrcZuA82gftLDOjuK00tAQ3EmiDDL4ay6GZs
         uVuaL0XbIYfJZ84raPNDYZzxCBPASj6n5CvTmQyfNAtBngSEk/9uyAYnMZmpeZaInric
         XKV1fQLkv2nlMmy5bS6CnTikl+eGFHdPWRci/HTAdwwcXW2xgPWX+ZxPfrjrWyq/KQvo
         lGBE7JS3H7KQ/URY3b7sac9PyPA56DhGlb4R4w0fnnjjyTae2OJbDkTV5JnV2m1uPYMA
         g+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904605; x=1793509405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvlUBd9t253/XOnBgnu6wcIP+Rj8CczN5W7bxz4QbhY=;
        b=YEkpwmcrhnPlYRZx9Whm4rXy4Ki3UCleVIevLTfjodURnIMMmhds9xWtQewMO1KZVQ
         WFl1WkFWal7ZMj2JjyODeYuEiUG/At9tdwl73fE+0nSEoBWSlxzZHKmYdnK2oaeFVq0m
         OuSgr78cS9Mw5VMCVwC90Tw+vx3K/JChucAEAYds/w2Ld2TFR4BzEwVNoJvpn9n3InAe
         qoYUBa5YZIWZMPZvxm4LH/iW97G+57S9hefircSM52g6h4PKcAQxWquONytH4WNSV8AG
         67Vo550xa4wuDAdqJx4/ARK7lC9QzcqUxcWDyRT4svUxw6cxeROPtTmkn9Z/mDPxWBXq
         wyKQ==
X-Forwarded-Encrypted: i=1; AKwUvByik5HT9/riOd5uO6KdMcFGYmLP5eOVLT0h2qe0K8ZOa+gDy0qfuQ35S7HJdrzxlhvrxHd+yqxBLfh0vh7bOOf9@lists.infradead.org
X-Gm-Message-State: AFq9FYJCTSQGWD2H63Oc3MPZB67az4+lO7kc+2qW52VJOIYiQ4Nbstnq
	u4raMpJlS9EFuRhBJokAvi3C+npl+KlFv1fyuJLjFk5kgwYM5SLT1/Sv
X-Gm-Gg: AYBFou2Fp1JmqCJPbacsHqur+WqovjWhI7T4S/HH2j13ug+OldVjHGRnFEvqYDoDAjT
	Z7Pe0YYjy26WkJ1jbAP6ik+OZ8Fg6bvFi6Zp394EA0YGPIM/Ly3Iei7kNqDKUHw/L+JZ5Gk6xGb
	utM7hoco/vGE3JfL/2B1lP4bGUmVieTkoqMU5rJCKpB4EZXwhji3AdxhIJImHgxmRZ2pcMQj1hQ
	zH0KkxbNNIVke9U/nJk8Jx/zZe+JnPyWYlIOrHj4s5Ld36wKmGcid+XxWWzI/IDtW1+Wnb0GYmz
	u/Y9zGag0XtO1QiPk2ZgT0Bogfhg6mwNxvY29LmOz/ItrVd94l1jm0L62fwcaq+8AeKcDclg7cp
	QoN1c4qC5AdJ86Ik+HdC746I53FQXPNFc4H/bUQI6A4tOtHFpaQP+adhqn25djI7JAGQch3z7lc
	aU0ml4vnzWRigJzqQYLJlDqx3OKe37CSW90m1bo4/vGqgbvypn/uDkKluOTDH8xE8MPT/kKmibw
	8t2Fbe09c40efLDVLKTtfS4JA+TxetV7mZCabkoT9vY5+pgGDUKK5L7lPT+vuRyrBbdUhxL+cIV
	+fz02dsvOfBBZEWybrT68t26v2z4+AX/mDAmhkDCWDY=
X-Received: by 2002:a05:7301:e0c1:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-369e865e4e6mr5016953eec.38.1792904605444;
        Sat, 24 Oct 2026 22:03:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:15 -0700
Subject: [PATCH v4 4/4] ARM: s3c: crag6410: convert WM1250 and SPI0 GPIO
 lookup tables to property entries
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-4-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_220326_552412_BD6AA002 
X-CRM114-Status: GOOD (  19.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Static property entries support defining GPIOs and are more similar to
device tree properties and are not prone to losing link between device
and a lookup table because of changes in device name. Convert the board
to use them for WM1250 and SPI0 devices.

This also fixes issue with recent conversion to GPIO descriptors
where GPIO lookup tables were specifying incorrect GPIO chip name
("GPIO<N>" vs "GP<N>").

Fixes: 10a366f36e2a ("ASoC: wm1250-ev1: Convert to GPIO descriptors")
Fixes: a45cf3cc72dd ("spi: s3c64xx: Convert to use GPIO descriptors")
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/devs.c          | 35 -----------------
 arch/arm/mach-s3c/devs.h          |  1 -
 arch/arm/mach-s3c/mach-crag6410.c | 83 ++++++++++++++++++++++++++++-----------
 3 files changed, 59 insertions(+), 60 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 35b98a9a9237..7c8dc29b994b 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -335,38 +335,3 @@ void __init dwc2_hsotg_set_platdata(struct dwc2_hsotg_plat *pd)
 		npd->phy_exit = s3c_usb_phy_exit;
 }
 #endif /* CONFIG_S3C_DEV_USB_HSOTG */
-
-#ifdef CONFIG_S3C64XX_DEV_SPI0
-static struct resource s3c64xx_spi0_resource[] = {
-	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
-	[1] = DEFINE_RES_IRQ(IRQ_SPI0),
-};
-
-struct platform_device s3c64xx_device_spi0 = {
-	.name		= "s3c6410-spi",
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(s3c64xx_spi0_resource),
-	.resource	= s3c64xx_spi0_resource,
-	.dev = {
-		.dma_mask		= &samsung_device_dma_mask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	},
-};
-
-void __init s3c64xx_spi0_set_platdata(int src_clk_nr, int num_cs)
-{
-	struct s3c64xx_spi_info pd;
-
-	/* Reject invalid configuration */
-	if (!num_cs || src_clk_nr < 0) {
-		pr_err("%s: Invalid SPI configuration\n", __func__);
-		return;
-	}
-
-	pd.num_cs = num_cs;
-	pd.src_clk_nr = src_clk_nr;
-	pd.cfg_gpio = s3c64xx_spi0_cfg_gpio;
-
-	s3c_set_platdata(&pd, sizeof(pd), &s3c64xx_device_spi0);
-}
-#endif /* CONFIG_S3C64XX_DEV_SPI0 */
diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 2737990063b1..90a86ade3570 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -27,7 +27,6 @@ extern struct platform_device *s3c24xx_uart_src[];
 
 extern struct platform_device s3c64xx_device_iis0;
 extern struct platform_device s3c64xx_device_iis1;
-extern struct platform_device s3c64xx_device_spi0;
 
 extern struct platform_device s3c_device_fb;
 extern struct platform_device s3c_device_hsmmc0;
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2855d6d32fa3..330e8cf12ddc 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -443,7 +443,6 @@ static struct platform_device *crag6410_devs0[] __initdata = {
 
 static struct platform_device *crag6410_devs1[] __initdata = {
 	&crag6410_dm9k_device,
-	&s3c64xx_device_spi0,
 	&crag6410_lcd_powerdev,
 	&crag6410_backlight_device,
 	&speyside_device,
@@ -777,17 +776,22 @@ static struct wm831x_pdata glenfarclas_pmic_pdata = {
 	.disable_touch = true,
 };
 
-static struct gpiod_lookup_table crag_wm1250_ev1_gpiod_table = {
-	/* The WM1250-EV1 is device 0027 on I2C bus 1 */
-	.dev_id = "1-0027",
-	.table = {
-		GPIO_LOOKUP("GPION", 12, "clk-ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 12, "clk-sel0", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 13, "clk-sel1", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 14, "osr", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 8, "master", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry crag_wm1250_ev1_properties[] = {
+	PROPERTY_ENTRY_GPIO("clk-ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("clk-sel0-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("clk-sel1-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 13, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("osr-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 14, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("master-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 8, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_wm1250_ev1_swnode = {
+	.properties = crag_wm1250_ev1_properties,
 };
 
 static struct i2c_board_info i2c_devs1[] = {
@@ -800,7 +804,8 @@ static struct i2c_board_info i2c_devs1[] = {
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x24) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x25) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x26) },
-	{ I2C_BOARD_INFO("wm1250-ev1", 0x27), },
+	{ I2C_BOARD_INFO("wm1250-ev1", 0x27),
+	  .swnode = &crag_wm1250_ev1_swnode, },
 };
 
 static struct s3c2410_platform_i2c i2c1_pdata = {
@@ -904,15 +909,48 @@ static void __init crag6410_setup_leds(void)
 
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
-static struct gpiod_lookup_table crag_spi0_gpiod_table = {
-	.dev_id = "s3c6410-spi.0",
-	.table = {
-		GPIO_LOOKUP_IDX("GPIOC", 3, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("GPION", 5, "cs", 1, GPIO_ACTIVE_LOW),
-		{ },
-	},
+static const struct software_node_ref_args crag6410_spi0_gpio_refs[] = {
+	SOFTWARE_NODE_REFERENCE(SAMSUNG_GPIO_NODE('C'), 3, GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(SAMSUNG_GPIO_NODE('N'), 5, GPIO_ACTIVE_LOW),
+};
+
+static const struct property_entry crag6410_spi0_properties[] __initconst = {
+	PROPERTY_ENTRY_REF_ARRAY("cs-gpios", crag6410_spi0_gpio_refs),
+	{ }
+};
+
+static const struct resource crag6410_spi0_resource[] __initconst = {
+	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
+	[1] = DEFINE_RES_IRQ(IRQ_SPI0),
+};
+
+static const struct s3c64xx_spi_info crag6410_spi0_platform_data __initconst = {
+	.num_cs = 2,
+	.cfg_gpio = s3c64xx_spi0_cfg_gpio,
 };
 
+static const struct platform_device_info crag6410_spi0_info __initconst = {
+	.name		= "s3c6410-spi",
+	.id		= 0,
+	.res		= crag6410_spi0_resource,
+	.num_res	= ARRAY_SIZE(crag6410_spi0_resource),
+	.data		= &crag6410_spi0_platform_data,
+	.size_data	= sizeof(crag6410_spi0_platform_data),
+	.dma_mask	= DMA_BIT_MASK(32),
+	.properties	= crag6410_spi0_properties,
+};
+
+static void __init crag6410_setup_spi0(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&crag6410_spi0_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create spi0 device: %d\n", err);
+}
+
 static void __init crag6410_machine_init(void)
 {
 	/* Open drain IRQs need pullups */
@@ -941,18 +979,15 @@ static void __init crag6410_machine_init(void)
 
 	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
-	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
-	gpiod_add_lookup_table(&crag_spi0_gpiod_table);
-	s3c64xx_spi0_set_platdata(0, 2);
-
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
+	crag6410_setup_spi0();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 	crag6410_setup_leds();

-- 
2.56.0.257.gf7497c7d27-goog


