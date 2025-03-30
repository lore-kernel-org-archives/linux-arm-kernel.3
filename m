Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB91C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTtCuTCHRBbsTSs+mYW7dl44DX61rt/HwjLokD2yAew=; b=FKv5VsdHyO9ftp/LW1nrSu1JVF
	JnNlgk4YhZaUBKbyvkXfWn9DB6Km/CvJy51/0YdYhsGKIIsfAy8jm6BFwToLXc0vpwgxD0MLf0STv
	VU2fnkPgjsPd9WsUqJXsM2ThpNGlT4oLb2fTEtHu5P3/8RTiMkkW9nYhOKCFqAkxMSmcrvDxEr7nu
	WiZnEGK+hjujHaeXAEyZ2f1CkvVFPqhJNKTobbXyHOlCj/kzVC1dtvoQvUs8ILfyS9PKF03Rs9Czk
	trlyVYWibvgsm+GB3E1maqR9Amct+WinfP6/4ynutrx+0Ce9rXRK3gI26AsXgewSoF+4GOcpnnCFc
	FDP3Y2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typqd-0000000G5hP-2X5i;
	Sun, 30 Mar 2025 10:24:59 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typla-0000000G5Fg-1ZCJ;
	Sun, 30 Mar 2025 10:19:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso563485266b.3;
        Sun, 30 Mar 2025 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743329984; x=1743934784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTtCuTCHRBbsTSs+mYW7dl44DX61rt/HwjLokD2yAew=;
        b=JtsVMIWcZVPEbA2FPIx2H9hHJDUMdMXsFEIq5atMPBcQO3jImdrU/WKcQHakQyQmV1
         DzK8QLHTl1CUcHgtuRtJtaNaR5apsI37l9N2mV4L8Xy1DSH3S4Q8Cu7uCtpZuNZD6U5t
         hU2QME/e7GKsaSsicDe6kpl7gUxPHAVzn1r2+gqPlsZeVh5tF5q1TRQTgkxzGPRVK7uD
         8ZaPYO8SqwuW0cNi0JIacF1AwW1w9VDYsXUGBGleLlqEoERxRoG6roaBVMGvE3ub0G3p
         6bjjWWojcB67xKrhNiCvq4OhF9vY25yswMZCrixV+9935ewkg1XNM8HOeYFLv9e8xZ2H
         yjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329984; x=1743934784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTtCuTCHRBbsTSs+mYW7dl44DX61rt/HwjLokD2yAew=;
        b=kMoodn852ZxssCCeGnPiQh5/K5rgAahnPNy5TI+LgEJh6V8kVVLJlQi1QHjaxWAo8b
         rAl/N9RU1J9SOvxkwBixn90eWg/6W7hCWlza3FqFPxssdARa4zTT4fcYJnASCCSa4/Vn
         paIKbanlTb+1NVbec9XhTJCTTd8U1t8FLJms//EVrk6fgFxK2fe9GlRB49CavEqITnSt
         Tl9vBrEx3kOTQX79LlbqLRICYK19FmlFHEkhM09AitJucTjxio6ZRI5R11lf5EywiU2C
         rcrziFGEIxAl9EnjpCK+bWpRiXuzqDLVEbRxacJ4AxJLKohSkoziNJnUfxYwEaZZVtyS
         m9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCU29D8VutEYvdgFBJ6hVb0XlTKXYeiug5Uo6H4wAvB+iY2jiN7ny9z1Obcs+SB8OFb6cxziieqlg/xTLe1WOjZY@lists.infradead.org
X-Gm-Message-State: AOJu0YwA+1jJXTkbsplUK2mVn9o4rDAKHfDJaEtUxKnnx0PZEW6ixcgz
	gTi6UAo2bx8J3a04yPOZBG3DTiWNxVBowyaXhX6FIoaBVCA4ckKfH929KA==
X-Gm-Gg: ASbGncsUoD27muq+ftitDKINH0lFOqxB1Q3ap51+FOmOmMPcMiS3V7D/vxJQ91+m4VX
	MZhkcmFI0hb1eXN5/eHEJwQ5TLZ9tmgdRqJgtkR1hvVGdEUQmo3ZaQFVb2drEErwNx883JMbFca
	KhQsMHfemdhty3tu50rM5yl55/tU88oaAGXwUmhMI/hXthGV2IsXsN2ZV376GDKG+mQQFhDZMFA
	GVhWVouOXIHD+Shl3WsUyUZI5l/D0ncy8PB4B4d9OBdsu1cZ4408hSiPFNQyFdiw0kYfvWigx5t
	Pr3Hr03eZx7VuIjOp8ck5qqG0P0reEt57T1t0V2mVS7VDisBAY9OUWSO46/M3Oz+80oAprF5G76
	2PW45PazXy3iB0lLUQKUkNCTw6R/TJkTkXq6EMm48MjToKzVHWQQET1D5Pp4Qcc7yFMa4KA==
X-Google-Smtp-Source: AGHT+IGbom6ukdfm1Iae2/0wZaGQ/AxkHgAV9hqGJorFouonhgJiQTWGpJGqy61Bekd5gx/oqeH0eA==
X-Received: by 2002:a17:907:720e:b0:abf:7a26:c47e with SMTP id a640c23a62f3a-ac738b61ec5mr447216566b.43.1743329984174;
        Sun, 30 Mar 2025 03:19:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac71922bb65sm459288866b.34.2025.03.30.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:19:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/2] iio: adc: meson: add support for the GXLX SoC
Date: Sun, 30 Mar 2025 12:19:22 +0200
Message-ID: <20250330101922.1942169-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
References: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_031946_416451_307F1903 
X-CRM114-Status: GOOD (  18.70  )
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

The SARADC IP on the GXLX SoC itself is identical to the one found on
GXL SoCs. However, GXLX SoCs require poking the first three bits in the
MESON_SAR_ADC_REG12 register to get the three MPLL clocks (used as clock
generators for the audio frequencies) to work.

The reason why there are MPLL clock bits in the ADC register space is
entirely unknown and it seems that nobody is able to comment on this.
So clearly mark this as a workaround and add a warning so users are
notified that this workaround can change (once we know what these bits
actually do).

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 997def4a4d2f..c0f2a2ef0c68 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -160,6 +160,11 @@
 	#define MESON_SAR_ADC_REG11_EOC				BIT(1)
 	#define MESON_SAR_ADC_REG11_VREF_SEL			BIT(0)
 
+#define MESON_SAR_ADC_REG12					0x30
+	#define MESON_SAR_ADC_REG12_MPLL0_UNKNOWN		BIT(0)
+	#define MESON_SAR_ADC_REG12_MPLL1_UNKNOWN		BIT(1)
+	#define MESON_SAR_ADC_REG12_MPLL2_UNKNOWN		BIT(2)
+
 #define MESON_SAR_ADC_REG13					0x34
 	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
 
@@ -326,6 +331,7 @@ struct meson_sar_adc_param {
 	u8					cmv_select;
 	u8					adc_eoc;
 	enum meson_sar_adc_vref_sel		vref_voltage;
+	bool					enable_mpll_clock_workaround;
 };
 
 struct meson_sar_adc_data {
@@ -995,6 +1001,15 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 				    priv->param->cmv_select);
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
+
+		if (priv->param->enable_mpll_clock_workaround) {
+			dev_warn(dev,
+				 "Enabling unknown bits to make the MPLL clocks work. This may change so always update dtbs and kernel together\n");
+			regmap_write(priv->regmap, MESON_SAR_ADC_REG12,
+				     MESON_SAR_ADC_REG12_MPLL0_UNKNOWN |
+				     MESON_SAR_ADC_REG12_MPLL1_UNKNOWN |
+				     MESON_SAR_ADC_REG12_MPLL2_UNKNOWN);
+		}
 	}
 
 	ret = clk_set_parent(priv->adc_sel_clk, priv->clkin);
@@ -1219,6 +1234,17 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.cmv_select = 1,
 };
 
+static const struct meson_sar_adc_param meson_sar_adc_gxlx_param = {
+	.has_bl30_integration = true,
+	.clock_rate = 1200000,
+	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
+	.resolution = 12,
+	.disable_ring_counter = 1,
+	.vref_voltage = 1,
+	.cmv_select = true,
+	.enable_mpll_clock_workaround = true,
+};
+
 static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.has_bl30_integration = true,
 	.clock_rate = 1200000,
@@ -1267,6 +1293,11 @@ static const struct meson_sar_adc_data meson_sar_adc_gxl_data = {
 	.name = "meson-gxl-saradc",
 };
 
+static const struct meson_sar_adc_data meson_sar_adc_gxlx_data = {
+	.param = &meson_sar_adc_gxlx_param,
+	.name = "meson-gxlx-saradc",
+};
+
 static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
 	.param = &meson_sar_adc_gxl_param,
 	.name = "meson-gxm-saradc",
@@ -1298,6 +1329,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
 	}, {
 		.compatible = "amlogic,meson-gxl-saradc",
 		.data = &meson_sar_adc_gxl_data,
+	}, {
+		.compatible = "amlogic,meson-gxlx-saradc",
+		.data = &meson_sar_adc_gxlx_data,
 	}, {
 		.compatible = "amlogic,meson-gxm-saradc",
 		.data = &meson_sar_adc_gxm_data,
-- 
2.49.0


