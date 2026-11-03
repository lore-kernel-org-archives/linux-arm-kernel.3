Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6D606D81D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y8HGuBjN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glRyaozk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=55AdvbYjUSHpq0D3zdaJdVs8t2CEWwIW7MYZkBrdVp0=; b=y8HGuBjNwh3dd3
	PZE+G5id1AN9VxZh2lzxNORENEB/g7wxN4uUeP2TyGyb2wfv05c5PkKo8ac78PFi4BQp7ZlakJwAw
	ED6fcyHuRZEtpJcfKsYI8qHC1zC00KoYS01y5XQUdEZaKbmpMXcfa0rq8ivdz5B+oratDTmTKAvVM
	Od6iviBYeM7z9VLfFeoMakKMqvkMdnhSc3pMdWmkWdkuujp6q5UqdC1DohpnnfS584y1bSRLoPfub
	JFNqOBRPoqZTiKnSH3e6hBPoTjasMpEBH1i/YGqyiGVhi9GnO93clb1af1tXPuso4EDU138fDbUVt
	5XTq1rhGqd9SsPQLTa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEft-00000002a4x-2D3P;
	Tue, 03 Nov 2026 13:35:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEfo-00000002ZzE-0JT2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:35:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso29961065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712934; x=1794317734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55AdvbYjUSHpq0D3zdaJdVs8t2CEWwIW7MYZkBrdVp0=;
        b=glRyaozkhoK5eLUZeCEJicjMN6HbJFYN8sTp90FAJGO10LdvxnFdIB6QGisXNvLEew
         lxYmMJAEisf8wPJRo+VGN9Bn6GyyzAvbuYXkCJqs+VD9LtW72nQeqqGjQMyFak6vedK2
         lLxf5ciDI3RCfR+kg/ozERxyEZFOEnI16Zyqt9/HVSSHZ53FkAFGHuHWHstKflyryNkG
         9WofyxUwfxT/ZEs+FjXQqiVtRc7K9awttJJLRBXFqvqeuBHGpooee25sRilwWITyMLBQ
         iCvIjPmQgYPNsHV2QnvE1akGN1AP5JuvLyws9O+TaScs5p2OtfLTKSX09VD3P7ZrcbJU
         nHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712934; x=1794317734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=55AdvbYjUSHpq0D3zdaJdVs8t2CEWwIW7MYZkBrdVp0=;
        b=i3sn2fZYYIPUxhldgILiNkkYOWioqCrlmCA5WIyq0SL021BqU67Y+hkERHfr1ryTIN
         KcQ5Ceawcm34JJUygtmZKTfHAObHNtmuULjH0arX5xkT9bj7U4qpZAP7diPpjm/KC8qt
         pFCKmNuF7cr3OlKUzmoJMV7DHCtYsaFhLKFDqo4q0Dl4uFYEW3Eei6EWmNKKRClTV3pK
         MXL1jnkPiUGituLqhS2+rPsrwN/CTuc2z72HXzRh8nA+xl760BqJgtMvP4oOhelv2AnO
         70BHRwwz2KSp8JHaUkYG457A9BGPsBKD++bOFgOk+JecoNScx3y9cQlOBx0mrB7lG47L
         eVRw==
X-Forwarded-Encrypted: i=1; AKwUvByPEgqUTvw1wRvO6Hds05e0nift+n+buGqOugVe9bnt2IgqvnMDTI0FvbIyhCLxrAuPnCfW7aha2vd86hjVV8cs@lists.infradead.org
X-Gm-Message-State: APuU4Z/FupFjkhRYz5x0LvSwBpFuLkG49YYd0Af0+wWNdG8+d+xGYses
	vdT8ENyQnzooQfoxd8GCVs65VJC1+HzzJsJFxCQLSI89XhhThld2YuCT
X-Gm-Gg: AYBFou0ytuyPbdg1/+KeLFlWXJ2tLR7QP0YGBPoMVdjeIhdDfMNHCSGpiZM0kK4UX+J
	vHvCse3fErmWYaghKPRSRvZ/XM+E1g9OWqdlIpe2U+VoIQEb6E+c2cfxryYRFzxSQSDWfUd0Ivc
	oX9gwihSggz1Pf4GPXnZ9DSeGGVMoVxMYEcRmkmez32s2j86wCVuj2FcjUfRTZaWlX4RY7WHqS/
	Ylm3K6kQThZ1twtp0TJjKlVIkDFaFwymI9K4K2VABqU3xk3e2gy7z3Fxa49aBGBZVYSmtTFP2+8
	NhsCkOwOPIU5WWV+IRwlg4YcXlGyhkc5oOqfswydWmIzHsuek35PxRmbUaK8DKhmpOdA+P0YYGE
	h2z8U8DuN00ylxDktj6KwEnF9zWe421HSBHXl1IAZs7LgpBhXvGs49ykeVHOspW5/awUj1BFeVB
	wBe30t3WSbUvAky5hlvyUORNSrghhKGvgwqF81QX3M/oP8qDOEpN/tAObWrNYgGvECvaE3k7rj2
	Xc06eBJ1eYTel8kHb3ssvLIiMsOBHotStUFi53BirCPrhxexQbJVy0MCCpo3E6r10iJRBc8C2+l
	zjMG+hKIor7/ncm03psYSMs9St5Yoq0NaUhRzTD5Lznta8CJc71iTpR2SEdMnxkzR/SVCJju2zr
	GSO9/BieFDUcnWlbY4Ko3z70DisAdn12LgXK2BZAu80tRnyt1K4cD0squfA0FiiFXRkw8hOECbH
	6rV7vsmMwuk75S4D+Z8lC2zLSDLC3a2Lg5CU41x4UcIk62rj+0vZqzzg==
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr304126875e9.22.1793712933899;
        Tue, 03 Nov 2026 05:35:33 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:33 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/2] wifi: mt76: mt7925: add LED support for USB adapters
Date: Tue,  3 Nov 2026 14:35:28 +0100
Message-ID: <20261103133528.53197-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053536_448720_008B3FE7 
X-CRM114-Status: GOOD (  19.70  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT7925 USB adapters such as the NETGEAR A9000 have their status LED on
GPIO 8 of the chip. MediaTek's Windows driver asks the firmware to
switch it, but the firmware in linux-firmware does not act on that
request.

Drive the pin from the host instead. Set its level, then switch it from
its default function to a GPIO output through the CBTOP GPIO registers.
The register layout follows the coda headers in MediaTek's gen4m
driver. The LED of the A9000 is active low.

While the adapter is idle, the throughput trigger keeps requesting the
same state every second. Only write the registers when the state
changes, and forget the cached state whenever the firmware is loaded.

Link: https://github.com/morrownr/USB-WiFi/issues/731
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |  8 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 8c3049b66a85..3dfb4b2d997c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -187,6 +187,56 @@ static int mt7925_init_nan_cap(struct mt76_dev *mdev)
 	return 0;
 }
 
+static int mt7925_led_set_brightness(struct led_classdev *led_cdev,
+				     enum led_brightness brightness)
+{
+	struct mt76_phy *mphy = container_of(led_cdev, struct mt76_phy,
+					     leds.cdev);
+	struct mt792x_dev *dev = container_of(mphy->dev, struct mt792x_dev,
+					      mt76);
+	bool on = brightness != LED_OFF;
+	u8 pin = mphy->leds.pin;
+	u32 mask = BIT(pin % 32);
+
+	mt792x_mutex_acquire(dev);
+	if (dev->pm.suspended || dev->led_state == on)
+		goto out;
+
+	if (on ^ mphy->leds.al)
+		mt76_wr(dev, MT_CBTOP_GPIO_DOUT_SET(pin), mask);
+	else
+		mt76_wr(dev, MT_CBTOP_GPIO_DOUT_CLR(pin), mask);
+
+	/* the pin starts in another function, make it a GPIO output */
+	if (dev->led_state < 0) {
+		mt76_wr(dev, MT_CBTOP_GPIO_DIR_SET(pin), mask);
+		mt76_wr(dev, MT_CBTOP_GPIO_MODE_MOD(pin),
+			MT_CBTOP_GPIO_MODE_MOD_EN << ((pin % 8) * 4));
+	}
+
+	dev->led_state = on;
+out:
+	mt792x_mutex_release(dev);
+
+	return 0;
+}
+
+static void mt7925_init_led(struct mt792x_dev *dev)
+{
+	struct mt76_phy *mphy = &dev->mphy;
+
+	if (!IS_ENABLED(CONFIG_MT76_LEDS) || !mt76_is_usb(&dev->mt76) ||
+	    !is_mt7925(&dev->mt76))
+		return;
+
+	/* MediaTek's Windows driver uses GPIO 8 on MT7925 USB adapters */
+	mphy->leds.pin = 8;
+	/* the LED of the NETGEAR A9000 is active low */
+	mphy->leds.al = true;
+	mphy->leds.cdev.flags |= LED_HW_PLUGGABLE;
+	mphy->leds.cdev.brightness_set_blocking = mt7925_led_set_brightness;
+}
+
 static void mt7925_init_work(struct work_struct *work)
 {
 	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
@@ -208,6 +258,7 @@ static void mt7925_init_work(struct work_struct *work)
 	}
 
 	dev->mt76.init_wiphy = mt7925_init_nan_cap;
+	mt7925_init_led(dev);
 
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
 				   ARRAY_SIZE(mt76_rates));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 26cdb3f0a98a..91564a2c1d65 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1191,6 +1191,8 @@ int mt7925_run_firmware(struct mt792x_dev *dev)
 {
 	int err;
 
+	dev->led_state = -1;
+
 	err = mt792x_load_firmware(dev);
 	if (err)
 		return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index e040dff321dd..73bd8c58dd84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -91,6 +91,14 @@
 
 #define MT_WFSYS_SW_RST_B		0x7c000140
 
+#define MT_CBTOP_GPIO_BASE		0x70005000
+#define MT_CBTOP_GPIO(ofs)		(MT_CBTOP_GPIO_BASE + (ofs))
+#define MT_CBTOP_GPIO_DIR_SET(_n)	MT_CBTOP_GPIO(0x004 + ((_n) / 32) * 0x10)
+#define MT_CBTOP_GPIO_DOUT_SET(_n)	MT_CBTOP_GPIO(0x104 + ((_n) / 32) * 0x10)
+#define MT_CBTOP_GPIO_DOUT_CLR(_n)	MT_CBTOP_GPIO(0x108 + ((_n) / 32) * 0x10)
+#define MT_CBTOP_GPIO_MODE_MOD(_n)	MT_CBTOP_GPIO(0x30c + ((_n) / 8) * 0x10)
+#define MT_CBTOP_GPIO_MODE_MOD_EN	BIT(3)
+
 #define MT7925_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x370)
 #define MT7928_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x400)
 #define MT_WTBLON_TOP_WDUCR_GROUP	GENMASK(4, 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..73c23f509b99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -324,6 +324,8 @@ struct mt792x_dev {
 
 	u8 fw_debug;
 	u8 fw_features;
+	/* LED state last written to the GPIO, -1 if unknown */
+	s8 led_state;
 
 	struct mt76_connac_pm pm;
 	struct mt76_connac_coredump coredump;
-- 
2.54.0 (Apple Git-157)


