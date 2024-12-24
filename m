Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8392EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9GoekDoCU0xMxFyd9N4qiMFnHW9OjntIxlAzqCVuPI=; b=HVaXnRE4H447bGvtyph29vIPHJ
	oAwHkzHTDah0XffwCcqtxF4/MHY4/7VODTdff9Zz5/4Fqonu5/X9HNjWhZX+ADHX5FoVOOYU2BB20
	QauB0geDMklfkATRL33rXBM3eFM94a+l0buMdbmfbf1zhj/43V+qrYF4wkaexbrcPHhZJcs6PHony
	4Imptl6EhDM8Bt0ojZ5FVlAGKmasRS11ctkxDUICd25dAXbUEVxTmxX1FCsPFEaJ287s2ugF/BMr/
	+sq3qXtF9Kjg+N9ZXzEyauUjCXTFE2u4zxdwMpOAES4D8fhSRRh/z4qZK+YapyCMLS5KXNijcd5GW
	p4AeBvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5y3-0000000C980-3qgL;
	Tue, 24 Dec 2024 14:33:03 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5vi-0000000C8lJ-3vud;
	Tue, 24 Dec 2024 14:30:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa689a37dd4so672197066b.3;
        Tue, 24 Dec 2024 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735050637; x=1735655437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9GoekDoCU0xMxFyd9N4qiMFnHW9OjntIxlAzqCVuPI=;
        b=EdNwKROOuR54zOIvatz6ksdNYOq4JQ/AgdyhGXyszsM8o1qJJhUpq+fUF+iw4NXmer
         pz418McbAlee3wg4Ncd6ZpUhkXYOg2sgIier3eK8XagzlGQ2NV34cZP7ZD/KoXMbx4XL
         fWIn5pz0/oym+uM0FF8XNXj5YPQZs4Y73aANnHmB9pDUe1uIOcozsy4QvCut3jBwtEpz
         N/rf8j/OpJFNj9XMvm91ab1SE/0x/2IYqHS2466A+L7zjc+Vdgh1yVrQgiERrMHKLJO7
         CmR4wEK5L8nCXMhg+HHs/nemjLvAJDMfSRWf1xNVs+Rv2Dw/jQzB3PVoA2skJqoWH+vG
         uAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735050637; x=1735655437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9GoekDoCU0xMxFyd9N4qiMFnHW9OjntIxlAzqCVuPI=;
        b=SgAT5d5TCsIWCiSWB9gOnX9Dj2IdSrVjvje8zXaQRGK3XmnYMCvG5tOiTGgOv/sUJc
         iKApb/YOr8zWPrg9mL13qOLNVaVABq/DpFmEYoooXTnDwHWbdUuz072Lp4vqrEaz15Nr
         KwcNenbTCH8OYeLa/YLN6F3GrSAsiwVD4jA5I5US9/zeecbOCmh9odTJ3ioV6o5PGFg+
         hBU4qAJITOncUO7Rc8xzFznKeymBF3Hzy5mO4RxeVelIUHE0pvEO5jdzjy2yxht5jk3f
         OUNmIwMt2TeQsyPeUz6V1C716ZpVzynrbSuQZ6CY/lEJp/gno6Zu04MYJgigPHF6qBv/
         LhNA==
X-Forwarded-Encrypted: i=1; AJvYcCUdDD4R/pLf9RZhTYLgNAZl08YE9jynF2+Lzqxk0+CW88haAl8q2V55uzpnX3imuR0tBVL7k1fz/rXPZPsUM3xecw==@lists.infradead.org, AJvYcCXKJNca+EG+VtC09HZGACHDgmPpSQA8M/CJodWkUBwZktjalCRgP3ZXDXt1YB6X9EOo4erizY9vYW6I071z@lists.infradead.org
X-Gm-Message-State: AOJu0YzrToWzkT2Pxom4nPT2A4024xbjfN/a2TqqXmSZ22R5/QM5A4E+
	6mJMYgd1vnxPyY2ECyJOp+OMvHSsrEE5Mk9ncJt4vT46+QMOIw3B
X-Gm-Gg: ASbGnctwoLbim25YfD0029qy912S3eH3mjo49W0SPhfQnDIHthoDHuq11ZHxngPgjPn
	rRQXAEiwOabBaV6tXAW/W/queeKLQkuBhoDn154ah2rPzUmh+ropZ35CJAvnq//x3lt+LedN2Yz
	h9NC2TAVv/ylEGVpJv/mUI5Kmm0T6ckldJZvQSdOBX0LsJPzlLVrvECOSZOMXA2PHbM82lcRMAb
	FVocuJeR2gAvHtKRseQGP7RQve2Xb4wYTeUFoss4Xhwz/bCq5Cb5Zy/IheIla66uenCBWIF7dUp
	PWi4VV/JpqO5dImv/gT5CUKFoSrOyPdf4kyUbdiiEslSKDsgpALFKxCx3i5G/yEPKRbyj6qtuEk
	xV3210w0=
X-Google-Smtp-Source: AGHT+IGhElsQeCU3jdwWZkcauyJOHjacVPTPXhTENgcdJxCU29OOCPEQW7SqtJztuYY6P3IG+jd58g==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-aac33787557mr1286928066b.50.1735050636535;
        Tue, 24 Dec 2024 06:30:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a5d7-4700-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a5d7:4700::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0eae74e4sm658827166b.91.2024.12.24.06.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:30:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	gnstark@salutedevices.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] iio: adc: meson: fix voltage reference selection field name typo
Date: Tue, 24 Dec 2024 15:29:39 +0100
Message-ID: <20241224142941.97759-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
References: <20241224142941.97759-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063038_978267_CE89EB39 
X-CRM114-Status: GOOD (  12.56  )
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

The field should be called "vref_voltage", without a typo in the word
voltage. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2d475b43e717..4cfbb3482a2e 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -327,7 +327,7 @@ struct meson_sar_adc_param {
 	u8					vref_select;
 	u8					cmv_select;
 	u8					adc_eoc;
-	enum meson_sar_adc_vref_sel		vref_volatge;
+	enum meson_sar_adc_vref_sel		vref_voltage;
 };
 
 struct meson_sar_adc_data {
@@ -989,7 +989,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 		}
 
 		regval = FIELD_PREP(MESON_SAR_ADC_REG11_VREF_VOLTAGE,
-				    priv->param->vref_volatge);
+				    priv->param->vref_voltage);
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_VREF_VOLTAGE, regval);
 
@@ -1212,7 +1212,7 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 10,
 	.has_reg11 = true,
-	.vref_volatge = 1,
+	.vref_voltage = 1,
 	.cmv_select = 1,
 };
 
@@ -1224,7 +1224,7 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.vref_volatge = 1,
+	.vref_voltage = 1,
 	.cmv_select = 1,
 };
 
@@ -1236,7 +1236,7 @@ static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.vref_volatge = 1,
+	.vref_voltage = 1,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
 	.cmv_select = 1,
-- 
2.47.1


