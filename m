Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F32606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5ORuc3q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FWgU19J1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=; b=k5ORuc3qXa1TW8
	k1tHypjhPDK0Dj+W2Om4FbjyU9lR+W1dhU3arLY/OUEQn9OWpvRf9FkeI6uzhpT18iImo+KDfEKFc
	d+7xyzPIYzzZY4Z2KRsWmYnAMODIXlKu9S1Rhe4y18zlyZC4nwHZCWxRpKz3gTCF6etH01ma5UtyK
	7yDb4/yLIYqA9FjH8AdLcTagBBCl6ExehFroSMAbvRX2C6rgtsspL1xRA7qVV6YuIA5zlPnBVsrH8
	dCBoZIqKxbCm1LwEnVPfVH5KFHDuDQOU7Y6gk461aAn7WgaPHgOcKTn1rYgWRMrkUchqViiZ53qS/
	tinMNdb5I/g/ls+nSsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOH-00000000jjL-0Ub5;
	Sun, 25 Oct 2026 05:03:29 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOC-00000000jhE-334U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:03:25 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-35d0be18c71so3537026eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904604; x=1793509404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
        b=FWgU19J1UwRMmZH61MxRbI2T4pVgkUqybBc6LkH+I7mBxxOK+iaJNrKfQ5jwrKzgUu
         i6zJlsiGm3c+0joiR7wDqs0ASa/Q9T5/6NOL7wPZ/10kEflPXqSzgeoBs6IMl/+DXSc0
         Yk7UVqBAH+QiKlpfB2St7kaIsbyeMUJGIPgOATlcR3hAziZsGmKWrb1QYOt2k8l5wlbH
         BHnhJpaEorcvzEBQlM1AWRTIzBccqdhkPtFj00IVVM/JUAiLrV5dA/T+6GvPna/z7zHd
         nIZ1SJS6e1M5UqcW+fUsuxXmMla3aVqPHcnyRA28RaJmjEfdSZphMdT88QsdVYR3e5YT
         EBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904604; x=1793509404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
        b=gjIqwbkFRIjlCUdR/z+r6PyhlYWnF8ixI5EcZFCDXGydvUpEsRCxbO9l8QhFVyDC0V
         Fa54J2eamPBOWxsVsn0Cw8fn6V8TvxFoWPIODR9YejEHdYkftMpCNhsHi1lwwIJf79xy
         Jk/mRiFpzIHimznfitMAET6EgoFCjudaveHeCQzC9+yT5IHgGQo2fj0NLXIXA21ZD8h7
         yV2PE2uilFyNC/drX8hqjA/bUp9KgaRgK7fCHvrlGCEmob52edCGg0Zj7u9v9ZvjhCXU
         bb2XdAR1gKILBTCIz5DFOlzI/49kgBDB+IyRck2VWUDYMvGCMKp3ILT4qXMTEjukVMHI
         E+Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwC4UGakGC6eMSwCML9CXKdObGF0or7BqbFAvu8KxFkg22K1QswTBE62b4YRG/qHpFcoesB1E1J3WcLBuzdwFLM@lists.infradead.org
X-Gm-Message-State: AFq9FYKMdCnn3zGx0PFG3l+hvO4PrbQcAKL5Ot/79dcuN6vxHo/attfB
	wEzXToiAJRoYIp0ZKQvAI2DxTsnn9aTQnBHye/wa/72q5fmuii/2xtJm
X-Gm-Gg: AYBFou26m/P/qpwrj7fpaVWuyFqA/q3gZJHnzgAotd7++4Ay2Vt+AS10sQL1qPXaz6V
	rOL6Tyvo19bbOuRSHJ58xy/c8AztwOSc+ga6XYZ8JNUB3u5goHO6UFiv0vWjU+QgqOkhOzpPBRN
	zzHEVm00eyDNuKwpJwo7g68M3b8mf5s9QP+2o/l8pSiZLctaYCWCiP/v9AgB6wJFlxkw9Mvt1nC
	eZbdyNRJh6ifN7bJ2wZcfdxBdLksHC2BR4VsQfKAu1oV6qpaCgu9AMTl5zpltrYrl82caZA+tCd
	vaaTkbIfQlwf7hdF2/PdKpNSQxj5PsWW4ukQaAPnX4dqxLACHG9oY2mERhCgfQznuQD2jcuViQi
	Hg9p7AeZO0aVNxQf/wqlv5PKX6VMLt3oY2i0obo2oUYKZL2PuTZvHe4Ys5O6C4Y1TcQXE52d/2S
	v9+ncg2S1wua2Dqr/xR4/tvlXQwvtemleF6EyYlS/Sov8bSUbwU/h645goQu+jGtDfjUa/8wRVI
	oEpADMREPppOvfE7H0RT06vYoEPD6VRKvpbCdVInskpdtdXXrf9bCHHtp4uArGelBdlgxd4EjTO
	rAMitYZnpDv2P16txYMoBJoTIYbnq/OwnV5/6mXgSS8=
X-Received: by 2002:a05:7301:5808:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-369e866b781mr8368007eec.1.1792904603687;
        Sat, 24 Oct 2026 22:03:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:14 -0700
Subject: [PATCH v4 3/4] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-3-e21253295e68@gmail.com>
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
X-CRM114-CacheID: sfid-20261024_220324_777846_6D8559C7 
X-CRM114-Status: GOOD (  17.04  )
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

Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
Cragganmore 6410 board to use software nodes/properties. This allows
removing the crag_leds_table GPIO lookup table.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index d0ec7697f366..2855d6d32fa3 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -319,12 +319,17 @@ static const struct property_entry crag6410_mmgpio_props[] = {
 	{ }
 };
 
+static const struct software_node crag6410_mmgpio_node = {
+	.name		= "basic-mmio-gpio",
+	.properties	= crag6410_mmgpio_props,
+};
+
 static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
 	.res		= crag6410_mmgpio_resource,
 	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.properties	= crag6410_mmgpio_props,
+	.swnode		= &crag6410_mmgpio_node,
 };
 
 static struct platform_device speyside_device = {
@@ -835,61 +840,68 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 	.host_caps		= MMC_CAP_POWER_OFF_CARD,
 };
 
-static const struct gpio_led gpio_leds[] = {
-	{
-		.name = "d13:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d14:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d15:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d16:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d17:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d18:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d19:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d20:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
+static const struct software_node crag6410_leds_node = {
+	.name = "leds-gpio",
 };
 
-static struct gpiod_lookup_table crag_leds_table = {
-	.dev_id = "leds-gpio",
-	.table = {
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
-		{ },
-	},
-};
+#define CRAG6410_LED_NODE(_idx, _name)					\
+static const struct property_entry crag6410_led##_idx##_props[] = {	\
+	PROPERTY_ENTRY_STRING("label", _name),				\
+	PROPERTY_ENTRY_GPIO("gpios", &crag6410_mmgpio_node,		\
+			    _idx, GPIO_ACTIVE_LOW),			\
+	PROPERTY_ENTRY_STRING("default-state", "on"),			\
+	{ }								\
+};									\
+static const struct software_node crag6410_led##_idx##_node = {	\
+	.parent = &crag6410_leds_node,					\
+	.properties = crag6410_led##_idx##_props,			\
+}
 
-static const struct gpio_led_platform_data gpio_leds_pdata = {
-	.leds = gpio_leds,
-	.num_leds = ARRAY_SIZE(gpio_leds),
+CRAG6410_LED_NODE(0, "d13:green:");
+CRAG6410_LED_NODE(1, "d14:green:");
+CRAG6410_LED_NODE(2, "d15:green:");
+CRAG6410_LED_NODE(3, "d16:green:");
+CRAG6410_LED_NODE(4, "d17:green:");
+CRAG6410_LED_NODE(5, "d18:green:");
+CRAG6410_LED_NODE(6, "d19:green:");
+CRAG6410_LED_NODE(7, "d20:green:");
+
+static const struct software_node *crag6410_leds_swnodes[] = {
+	&crag6410_leds_node,
+	&crag6410_led0_node,
+	&crag6410_led1_node,
+	&crag6410_led2_node,
+	&crag6410_led3_node,
+	&crag6410_led4_node,
+	&crag6410_led5_node,
+	&crag6410_led6_node,
+	&crag6410_led7_node,
+	NULL
 };
 
+static void __init crag6410_setup_leds(void)
+{
+	struct platform_device_info leds_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_leds_swnodes);
+	if (err) {
+		pr_err("failed to register leds software nodes: %d\n", err);
+		return;
+	}
+
+	leds_info.fwnode = software_node_fwnode(&crag6410_leds_node);
+
+	pd = platform_device_register_full(&leds_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create leds-gpio device: %d\n", err);
+}
+
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
 static struct gpiod_lookup_table crag_spi0_gpiod_table = {
@@ -939,12 +951,11 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
-	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
-	gpio_led_register_device(-1, &gpio_leds_pdata);
+	crag6410_setup_leds();
 
 	regulator_has_full_constraints();
 

-- 
2.56.0.257.gf7497c7d27-goog


