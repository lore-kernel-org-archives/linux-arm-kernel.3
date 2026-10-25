Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB80606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wpbDtp0u;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AjX9clXf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=; b=wpbDtp0ujnTKB3
	VvI/jplMqk3oJkIawqdelua0dynw7hzYZOnjsK/xww58tNUR0AdZm2DGw8TsufNr46uRTdcGm24bc
	wzmKpdUybJ150EHxnBQGR7Tv3VdsM6uDqnFaWB/YBLGF4PwOt9oihvDspjEF/ctmcfWfWRSAj1sMk
	90MLRnMAgJAh5aqPBEbylPfX33KY1u+fd/vaah2beg3TQQH0aSx9sjJFYkhGvRCQf9Ww/KcERyJqk
	Pe5BuwFhmdy/YcJY6/NtfTrYkth9UDBSCuoR5mCFN+/nPoUBrUwr2s4tx3blgss65WB9CNhhwp4cw
	XctlFmNNp17ttbPhQ2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOG-00000000jj8-3nUj;
	Sun, 25 Oct 2026 05:03:28 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOB-00000000jgl-0dhw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:03:24 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3550c917fd3so3088259eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904602; x=1793509402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=AjX9clXfBSmXjQe3CM14k/a9FEhi8jNkTvsI3YV7mw251ZJH0rM6uUTNFneXWicPLf
         yRZCXksXEk9xHewqTlOI6XaiwfjY0WYtq0NYx8bssv/VhiJPmvyztjcHrFT/kJERe8t6
         loHGE7sSSsZIWY6ZYraTwA+Usoids8lC2L6Ha16eWr7Xqybj7fSNQGwfcfAAQfabfwML
         iTvqABrmjAW0ErposXKl8x9H22G8V69PPuVij3r3URo75z/C/j8LtQ7LgyzDJRZQyb1B
         XzSFjBYepleGZ4Kh6McIUQOIck6Wq2gb/kX20O+fwrK68Oio0/0+XEM42Sg0/3Wehjhy
         7MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904602; x=1793509402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=UGLSLyA0UeKwURrc+pGcQucEPDgAj+Rk4v2kGidA0O9qK6VYWFhHkcTeUUWODuV6ZQ
         Cp9lF2gsHPqwRXK69Dh29IWorEZ9riiV/axuyK2AVlWkT8laH07r3RIogTgN1w3zwKbX
         qI7zCx9rvQkZH0WuXo4Nt6pLCtYqT41Q8sSMT6O5gVQdQmvku8T3BEKAJhJrMsh/IznT
         8Gv4mLm8arimIm/0fsvJEwbYBcXvoPu39TLip3oai+WM9dSWvkGXBYIs/EFOhm8U2zhv
         XZKb8NZV0SeYuDBQgHS2fu3J/CW3b7L4hr8wvYHqOSvOy91TEo2mZ8jcQPLM/0+xBcKC
         /URQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq7paf88uEhwI79e+43PBlSC34f3L5Rzs2asvd3vRtHrsNZzXm/4Q6o2huvXZjGZRVyTY1hy6n/70vR+rliQJ+@lists.infradead.org
X-Gm-Message-State: AFq9FYLIbFZ9hPb2O1tDlYde/CvXlbrve+UbW33UoO8R7JMj/5MczA2g
	iiE82MBRLOgRZG1A6oAyTTqRxD35iNw9NIX0a1PzEtZA0Bc7cSgkC+hw
X-Gm-Gg: AYBFou270s1YbDxb8V+R/FGxT6PN3khKVF58P2+PXJtHeNmhYr+/eiOb5F+c7qapIuz
	LcM6KKhMwcuvln0+R9QzFqsrPda35i5E6bymU9uBZPxDPeQB4dsuQOt9UTizIHby7f5B60MDy75
	kIgvBOiC7Ag5ysIfQ+3g9oyxEKLgJenFx9eviciPSN1Cg9EVMEa4jJOG771F8LCIDM9SCvcJkUP
	44IiYwEqktxemT8W0n4j1ojvalqOINuR2Z2FbWNC0JFjfCHsZwZ8KH4YWMwM5Kt9ZDI4ZYn5ERQ
	owwAwKA+cjm7PBy2zKd0oDTo+u5A+662g2R8eMovjFVuSRWNv9h57PoPAbQnHEyPXFvk5i8C6ip
	U4KpG5Sal3PbAQ7xRp82QtVUQMFaKW1FCHjx9p4CgerDsVf9IepbynhISIxGeNtXv4D6+uHmpp0
	eToRwpDVRJL3XrGoOjPZ2CIqVcsCf2qoQU0wJfAgzQ3iEOt04mdewxqmV/O+1RLlC3QuJsbt+33
	05sVSo23rVGgYhrro4CbhGJs6/KHDN4p8/lG8/bwBWCQg7ucaecmm0TORGMep1QI2+8BCytSlqM
	oGJnRBOlsAoxkEiD6qrlLG8XrhNzv38gdgvsjXHnLPB+2aMFDcVv6Qmg6NC4LQZU
X-Received: by 2002:a05:7300:88:b0:367:3d68:8480 with SMTP id 5a478bee46e88-369e81ca340mr5718435eec.0.1792904601938;
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:13 -0700
Subject: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_220323_221219_96AFEE8E 
X-CRM114-Status: GOOD (  19.82  )
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

Convert the PMIC DVS GPIO configuration from a legacy lookup table to
software properties. We use the new 'dcdc_swnodes' field in 'struct
wm831x_pdata' to pass the software node to the regulator driver.
We keep the DVS configuration parameters (control source, startup
state) in the platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2264beef6dda..d0ec7697f366 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,6 +456,17 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_dcdc1_swnode = {
+	.name = "wm831x-buckv-dcdc1",
+	.properties = crag_dcdc1_properties,
+};
+
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
 static struct wm831x_buckv_pdata vddarm_pdata = {
 	.dvs_control_src = 1,
@@ -633,6 +644,9 @@ static struct wm831x_pdata crag_pmic_pdata = {
 		&vddint,  /* DCDC2 */
 		&vddmem,  /* DCDC3 */
 	},
+	.dcdc_swnodes = {
+		&crag_dcdc1_swnode,
+	},
 
 	.ldo = {
 		&vddsys,   /* LDO1 */
@@ -656,24 +670,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
 	{ I2C_BOARD_INFO("tca6408", 0x20),
@@ -931,7 +927,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.56.0.257.gf7497c7d27-goog


