Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A23606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NLjZCYhB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KP5RlEy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EwHVDnWszJQ91WriRUxs2YdOfWEpY4IVRbcfMVvMvn8=; b=NLjZCYhBNXFhLU
	KvFP/5b2gtdZ8wQjN7RuxBZrUwepEEDcU7DBNy53m5GETkEE+LRrVbx/iwbP6UIbDx9QdD4FKih9B
	CH2bhiSEJ+BCBs0DUGR4lTKBbKgxdBOmxTvqISxsM9A4FOWViUSyO0bQUIG2XucrOm8Ki88Qa+G+A
	SYA1CV/LQ8IKtnmaLxROyUCsLd9VS3LDThxXAUkl5HOiNQuKOR4/fEgJ4SuhwhMKu1T4trgGFQz8v
	Aivdt5pOgQR1ZN8N7+9s6NqRJm1ANoOvpXcbf5ZeZIowizW3lZgY40Eoo50NIiJ7XZBobNCvaHIM+
	7Kpj4InSQpkMYjej2l1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqch-00000000keK-0h4C;
	Sun, 25 Oct 2026 05:18:23 +0000
Received: from mail-yx2-x09.google.com ([2607:f8b0:4864:41::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqcc-00000000kbd-3bS9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:18:20 +0000
Received: by mail-yx2-x09.google.com with SMTP id 956f58d0204a3-679b4ca950fso1216136d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905498; x=1793510298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwHVDnWszJQ91WriRUxs2YdOfWEpY4IVRbcfMVvMvn8=;
        b=KP5RlEy8r8wIB5bHWsDydNsTcy/fAzhRviH7HuQP22lXFNap02tSPXHcSnRJXungJE
         ooYxv58jGPJiXn3edJRL5x+KVomm/2GmuKiG4Ofgo5WugdAyWEB5la3NZLJ+0mU47MfG
         efOaWJty45eXj6R5Z275bzPqTgSyUNGYfxFsSCDo6RBu0+EgpdwHB3vc98Kj1aD9YUPo
         E29waLBYVCdehA2zkdh+gHrsIfW3EjE0Mcl66hIqI1MmzdGGtKVv3pHY4gsW9j0U+8Tr
         NumkYnhu7owuWDbhZHPlY3RmnHnTu3NaVRCSwM8lbPO88LOAAI1McfufXrxySYwpUVBQ
         ySNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905498; x=1793510298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwHVDnWszJQ91WriRUxs2YdOfWEpY4IVRbcfMVvMvn8=;
        b=TZsP+E6Cxgusk4VBf1E209wv7PoHc+4uZUsGbKQ8EjV6XPjJMW1zpbLQxckZkdGGYE
         WsYU8NBMHbSL+SPiUJmlPic/7zeA/wiOMmtArJAzsgx1dtDGhzu5JFYO+uGzcRrEDPUL
         68kzE4JxK4Jozu/oR8ozLDj84N/m1xNbuewNBELf3YDTlm0SI1k/O0VT2aA4JN5vj6Ad
         gE7L5WdO2z++1ZSNhiihs42A10DGRlzS7ra8zLP1ZzIzmJjLUsS2F0AfZN+X+pv3fZr1
         uCWWl5m30n+UvnW0k02N8+ItovdZl4d2/s1qRqD1POVtAm/lkZrnUv4S97I6o4bPSDM2
         +n1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7eatSDX9GmLSnPBlxj1u6Xv8UKEJcwM1DV4n9mdU3cFB1t+FUISj1kkSkJT8xhYXMhkcciGwmt6U5QWU246A6@lists.infradead.org
X-Gm-Message-State: AFq9FYIDxR79OMMGNdYW5dIalJ6U1N845nNdGWqIdgHUcIMbyk+t+CPg
	tdav6XYou0TaC3X2L+BjR1QApFRSGi85tWvqOENfhHnHmAPAGUVRF6Qq
X-Gm-Gg: AYBFou13if8p9GWFcPDlUUR+14sykv/CFQV65BOga65vN1lyJtSJOvdGqS9hbpkeVSa
	8JM4JcbpTMo8p4mfDiNUQAVi7c8bLiTHz/gqs+Jq7SBA/Dxw+4gdHUINWbedQy1qyzo38c1Igay
	jyEAObHa5bs877slJ10JTFDySfmGGqp6F+9tQgaIl2w9nYQAQoMmCZ+wR1tE3kn+ebi5N3g0dWD
	ryNyVIKGqY+2xN429d+6GwT21gAnPIqMXW2Pmpt9mq8AXSVzddm22NZKyexB8WXHDwa0aESCsD8
	5MzqwAELJ0G+mf29bEAdvMlqiwO8jlBlNipvkH7ciD7esMznH4MIWZm+FBzBpeVvL+pXUaw1iIL
	YtFT9UuWRQC1N2Az2bcqqNjWdxieHTdXKWWfHlvN9Cc8c/0OY5TtyulmisiPZ+bCMBpq+YYnMz5
	ADknbUThNFhgKgOvfOTEkMwu/NhUQZz+Sfg/WKyuahb9jg8vU5ClfUD+yJEbsFnBXoDpMTy4ofL
	qoSpTLCYZEoo2cR1AC+Yeo1ukk6GZ6wOMVxGNAeJc+BCw==
X-Received: by 2002:a05:690c:5c19:b0:8ab:4989:bcc3 with SMTP id 00721157ae682-8b166be0e0amr18546617b3.42.1792905497844;
        Sat, 24 Oct 2026 22:18:17 -0700 (PDT)
Received: from [192.168.1.91] ([2600:1702:894b:4a00::12])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d605sm16477797b3.5.2026.10.24.22.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:18:16 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 25 Oct 2026 00:18:09 -0500
Subject: [PATCH v5 2/2] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-2-5c3c7a5a1851@gmail.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
In-Reply-To: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792905489; l=16790;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=gOmx21VTlI75af2dFfmMResTJsUgn6W0Lsryo8w3kEc=;
 b=XqRd9Q9DkobmeDN28QEqOtBXFXN3aTtR+mhFVDlu6i7QVIiIdjCFoa+aBiR0QbC80GUDBVRd4
 XuyP8zay/L6D9Y/SnpM4PTzrX8tRWj7h78QP9OmY2ckAih4RwqaTUTF
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_221818_982218_E5BC6AC9 
X-CRM114-Status: GOOD (  35.85  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
built around this PMIC it is the only way to read the battery: the SoC's
AUXADC is wired to board thermistors and the charger ICs these boards use
have no ADC of their own.

Add a driver exposing the battery voltage and battery temperature
channels. Only those two are described, so a channel ID in the device tree
indexes the driver's channel array rather than the PMIC's channel number,
as mt6323-auxadc does. The ready bit lives in a channel's raw result
register, but the value comes from the chip's factory-calibrated copy.

The battery voltage is measured through ISENSE, because a board with a
switching charger in the power path leaves BATSNS on the charger's system
rail instead of on the pack. The thermistor only reads correctly with the
PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
settle. Both are switched back off afterwards.

Reads average sixteen conversions in software; the chip's sample
accumulator makes no measurable difference at any setting, so it is left
at one sample per conversion.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---

A new driver was created here, instead of modifying an existing driver such
as mt6323-auxadc or mt6359-auxadc, for the following reasons:

 - Both mt6323-auxadc and mt6359-auxadc select channels through a request
   register (1 bit per channel), while mt6397 uses a 4-bit numeric field
   CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).

 - For mt6323-auxadc, which is the closest I could find to the mt6397
   (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
   It uses CON22 for its request register, and reads the result value
   from the same register as the ready bit. We don't do that - the mt6397
   has a factory-calibrated value for each channel at 0x16 higher than the
   raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
   we have 1200 mV / 10 bits. We also have some per-channel preparation
   that we have to do before the burst, that the mt6323 doesn't have to
   do.

 - For mt6359-auxadc, it has a more generic framework for describing the
   AUXADC, but it assumes requests are channel-per-bit, and so we would
   have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.

 - We also have our own software sampling, which the vendor does too
   (Amazon Fire OS based on Linux 3.18). We'd have to have our own
   sampling callback to do it.
---
 MAINTAINERS                     |   1 +
 drivers/iio/adc/Kconfig         |  11 ++
 drivers/iio/adc/Makefile        |   1 +
 drivers/iio/adc/mt6397-auxadc.c | 394 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 407 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5417c02eb01..761db34f84a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16784,6 +16784,7 @@ MEDIATEK MT6397 PMIC AUXADC DRIVER
 M:	Ryan Brue <ryanbrue.dev@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
+F:	drivers/iio/adc/mt6397-auxadc.c
 F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
 
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f32f678f73fb..7686314bc91b 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1273,6 +1273,17 @@ config MEDIATEK_MT6370_ADC
 	  This driver can also be built as a module. If so, the module
 	  will be called "mt6370-adc".
 
+config MEDIATEK_MT6397_AUXADC
+	tristate "MediaTek MT6397 PMIC AUXADC driver"
+	depends on MFD_MT6397
+	help
+	  Say yes here to enable support for MediaTek MT6397 PMIC Auxiliary ADC.
+	  This driver provides the battery voltage and battery temperature
+	  channels used by the fuel gauge on boards built around this PMIC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called mt6397-auxadc.
+
 config MEDIATEK_MT6577_AUXADC
 	tristate "MediaTek AUXADC driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index fee580bdd3b2..d7bb4815df61 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_MEDIATEK_MT6323_AUXADC) += mt6323-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6359_AUXADC) += mt6359-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
 obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
+obj-$(CONFIG_MEDIATEK_MT6397_AUXADC) += mt6397-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
 obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
 obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-auxadc.c
new file mode 100644
index 000000000000..234022f15eba
--- /dev/null
+++ b/drivers/iio/adc/mt6397-auxadc.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MediaTek MT6397 PMIC AUXADC IIO driver
+ *
+ * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
+ *
+ * Based on drivers/iio/adc/mt6323-auxadc.c
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/iio/iio.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#include <linux/mfd/mt6397/core.h>
+
+#include <dt-bindings/iio/adc/mediatek,mt6397-auxadc.h>
+
+/* The ready bit is in the raw result register, the value in the trimmed one. */
+#define MT6397_AUXADC_ADC(n)			(0x0514 + 2 * (n))
+#define   MT6397_AUXADC_ADC_RDY			BIT(15)
+#define   MT6397_AUXADC_ADC_VAL			GENMASK(9, 0)
+/* The trimmed copy of ADC(n), which is ADC11 + n. */
+#define MT6397_AUXADC_ADC_TRIM(n)		(0x052a + 2 * (n))
+
+/* The thermistor needs the battery-detect bias and the input buffer on. */
+#define MT6397_AUXADC_CON0			0x0542
+#define   MT6397_AUXADC_CON0_BUF_PWD_B		BIT(1)
+#define   MT6397_AUXADC_CON0_BUF_PWD_ON		BIT(3)
+/* Samples accumulated per conversion; the chip's accumulator is left at one. */
+#define   MT6397_AUXADC_CON0_SPL_NUM		GENMASK(11, 7)
+#define MT6397_CHR_CON7				0x000e
+#define   MT6397_CHR_CON7_BATON_TDET_EN		BIT(2)
+
+#define MT6397_AUXADC_BATTEMP_SETTLE_US		(20 * USEC_PER_MSEC)
+
+#define MT6397_AUXADC_CON1			0x0544
+#define   MT6397_AUXADC_CON1_CHSEL		GENMASK(10, 7)
+#define   MT6397_AUXADC_CON1_START		BIT(0)
+
+/*
+ * CHR_CON16 and the two SOURCE_CH0 selects route either BATSNS or ISENSE onto
+ * the battery channel. Only ISENSE is used: with a switching charger in the
+ * power path BATSNS sits on the system rail rather than on the pack. All five
+ * ADCIN bits are written out because they are one enable per analog input
+ * and not a select field; the driver touches only the two it needs.
+ */
+#define MT6397_CHR_CON16			0x0020
+#define   MT6397_CHR_CON16_ADCIN_VCHR_EN	BIT(12)
+#define   MT6397_CHR_CON16_ADCIN_VSEN_EN	BIT(11)
+#define   MT6397_CHR_CON16_ADCIN_VBAT_EN	BIT(10)
+#define   MT6397_CHR_CON16_ADCIN_VSEN_EXT_BATON_EN	BIT(9)
+#define   MT6397_CHR_CON16_ADCIN_VSEN_MUX_EN	BIT(8)
+#define MT6397_AUXADC_CON14			0x055e
+#define   MT6397_AUXADC_CON14_CH0_NORM_SEL	BIT(2)
+#define   MT6397_AUXADC_CON14_CH0_LBAT_SEL	BIT(0)
+
+#define MT6397_AUXADC_ISENSE_SETTLE_US		(1 * USEC_PER_MSEC)
+
+/* Conversions averaged in software per read. */
+#define MT6397_AUXADC_SAMPLES			16
+
+/* Hardware limitation: the result is not ready for this long after START. */
+#define MT6397_AUXADC_START_US			30
+
+/* The battery channel is divided down by 4; the thermistor is not divided. */
+#define MT6397_AUXADC_ISENSE_DIVIDER		4
+
+/* The PMIC's channel numbers, as the CON1 select field takes them. */
+#define MT6397_AUXADC_HWCHAN_BATSNS		0
+#define MT6397_AUXADC_HWCHAN_BAT_TEMP		3
+
+struct mt6397_auxadc {
+	struct regmap *regmap;
+	/*
+	 * A read is a multi-register sequence: analog setup, then a channel
+	 * select and an edge-triggered start per conversion. Interleaving two
+	 * of them steals the select and tears down the setup, so a read holds
+	 * this for its whole burst.
+	 */
+	struct mutex lock;
+};
+
+/*
+ * A device tree channel ID indexes this array; .address holds the PMIC channel
+ * number. The thermistor reports as a voltage because that is all the PMIC
+ * measures: the divider across an NTC whose curve belongs to the board.
+ */
+static const struct iio_chan_spec mt6397_auxadc_channels[] = {
+	{
+		.type = IIO_VOLTAGE,
+		.indexed = 1,
+		.channel = MT6397_AUXADC_ISENSE,
+		.address = MT6397_AUXADC_HWCHAN_BATSNS,
+		.datasheet_name = "isense",
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+	}, {
+		.type = IIO_VOLTAGE,
+		.indexed = 1,
+		.channel = MT6397_AUXADC_BAT_TEMP,
+		.address = MT6397_AUXADC_HWCHAN_BAT_TEMP,
+		.datasheet_name = "bat_temp",
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
+	},
+};
+
+static int mt6397_auxadc_read_once(struct mt6397_auxadc *adc,
+				   const struct iio_chan_spec *chan, int *val)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_update_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_CHSEL,
+				 FIELD_PREP(MT6397_AUXADC_CON1_CHSEL, chan->address));
+	if (ret)
+		return ret;
+
+	/*
+	 * START is edge triggered: lower it before raising it again. No delay
+	 * is needed in between -- the ready bit survives the fall and is
+	 * cleared by the rise, before the next transaction on this bus can
+	 * observe it, so a ready bit seen by the poll can only be this
+	 * conversion's.
+	 */
+	ret = regmap_clear_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
+	if (ret)
+		return ret;
+
+	fsleep(MT6397_AUXADC_START_US);
+
+	ret = regmap_read_poll_timeout(map, MT6397_AUXADC_ADC(chan->address),
+				       reg, reg & MT6397_AUXADC_ADC_RDY,
+				       100, 100 * USEC_PER_MSEC);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(map, MT6397_AUXADC_ADC_TRIM(chan->address), &reg);
+	if (ret)
+		return ret;
+
+	*val = FIELD_GET(MT6397_AUXADC_ADC_VAL, reg);
+
+	return 0;
+}
+
+static int mt6397_auxadc_battemp_bias_on(struct mt6397_auxadc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
+			      MT6397_AUXADC_CON0_BUF_PWD_ON);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
+			      MT6397_AUXADC_CON0_BUF_PWD_B);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MT6397_CHR_CON7,
+			       MT6397_CHR_CON7_BATON_TDET_EN);
+}
+
+static void mt6397_auxadc_battemp_bias_off(struct mt6397_auxadc *adc)
+{
+	struct regmap *map = adc->regmap;
+
+	regmap_clear_bits(map, MT6397_CHR_CON7, MT6397_CHR_CON7_BATON_TDET_EN);
+	regmap_clear_bits(map, MT6397_AUXADC_CON0, MT6397_AUXADC_CON0_BUF_PWD_B);
+	regmap_clear_bits(map, MT6397_AUXADC_CON0, MT6397_AUXADC_CON0_BUF_PWD_ON);
+}
+
+static int mt6397_auxadc_isense_enable(struct mt6397_auxadc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	/*
+	 * Each ADCIN bit connects one input to the battery channel. BATSNS is
+	 * disconnected before ISENSE is connected, so that the two are never
+	 * connected at the same time.
+	 */
+	ret = regmap_clear_bits(map, MT6397_CHR_CON16, MT6397_CHR_CON16_ADCIN_VBAT_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MT6397_CHR_CON16, MT6397_CHR_CON16_ADCIN_VSEN_EN);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MT6397_AUXADC_CON14,
+			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
+			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
+}
+
+static void mt6397_auxadc_isense_disable(struct mt6397_auxadc *adc)
+{
+	struct regmap *map = adc->regmap;
+
+	regmap_clear_bits(map, MT6397_AUXADC_CON14,
+			  MT6397_AUXADC_CON14_CH0_NORM_SEL |
+			  MT6397_AUXADC_CON14_CH0_LBAT_SEL);
+	regmap_clear_bits(map, MT6397_CHR_CON16,
+			  MT6397_CHR_CON16_ADCIN_VSEN_EN |
+			  MT6397_CHR_CON16_ADCIN_VBAT_EN);
+}
+
+/*
+ * One burst on a channel that is already prepared: the caller owns the lock,
+ * the analog setup and the teardown.
+ */
+static int mt6397_auxadc_read_burst(struct mt6397_auxadc *adc,
+				    const struct iio_chan_spec *chan, int *val)
+{
+	unsigned int sum = 0;
+	int sample;
+	int ret;
+
+	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
+		ret = mt6397_auxadc_read_once(adc, chan, &sample);
+		if (ret)
+			return ret;
+
+		sum += sample;
+	}
+
+	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
+
+	return 0;
+}
+
+static void mt6397_auxadc_stop(struct mt6397_auxadc *adc)
+{
+	/* Lowering START leaves the converter unarmed between reads. */
+	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
+}
+
+static int mt6397_auxadc_isense_read(struct mt6397_auxadc *adc,
+				     const struct iio_chan_spec *chan, int *val)
+{
+	int ret;
+
+	ret = mt6397_auxadc_isense_enable(adc);
+	if (ret)
+		goto out_disable;
+
+	fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
+
+	ret = mt6397_auxadc_read_burst(adc, chan, val);
+
+out_disable:
+	mt6397_auxadc_stop(adc);
+	mt6397_auxadc_isense_disable(adc);
+
+	return ret;
+}
+
+static int mt6397_auxadc_battemp_read(struct mt6397_auxadc *adc,
+				      const struct iio_chan_spec *chan, int *val)
+{
+	int ret;
+
+	ret = mt6397_auxadc_battemp_bias_on(adc);
+	if (ret)
+		goto out_bias_off;
+
+	fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
+
+	ret = mt6397_auxadc_read_burst(adc, chan, val);
+
+out_bias_off:
+	mt6397_auxadc_stop(adc);
+	mt6397_auxadc_battemp_bias_off(adc);
+
+	return ret;
+}
+
+static int mt6397_auxadc_read_channel(struct iio_dev *indio_dev,
+				      const struct iio_chan_spec *chan,
+				      int *val)
+{
+	struct mt6397_auxadc *adc = iio_priv(indio_dev);
+
+	guard(mutex)(&adc->lock);
+
+	if (chan->channel == MT6397_AUXADC_ISENSE)
+		return mt6397_auxadc_isense_read(adc, chan, val);
+
+	return mt6397_auxadc_battemp_read(adc, chan, val);
+}
+
+static int mt6397_auxadc_read_raw(struct iio_dev *indio_dev,
+				  const struct iio_chan_spec *chan,
+				  int *val, int *val2, long mask)
+{
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = mt6397_auxadc_read_channel(indio_dev, chan, val);
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		/* 1200 mV full range with 10-bit resolution. */
+		if (chan->channel == MT6397_AUXADC_ISENSE)
+			*val = 1200 * MT6397_AUXADC_ISENSE_DIVIDER;
+		else
+			*val = 1200;
+
+		*val2 = 10;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info mt6397_auxadc_info = {
+	.read_raw = mt6397_auxadc_read_raw,
+};
+
+static int mt6397_auxadc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6397_chip *chip = dev_get_drvdata(dev->parent);
+	struct mt6397_auxadc *adc;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(indio_dev);
+	adc->regmap = chip->regmap;
+
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(adc->regmap, MT6397_AUXADC_CON0,
+				 MT6397_AUXADC_CON0_SPL_NUM,
+				 FIELD_PREP(MT6397_AUXADC_CON0_SPL_NUM, 1));
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize auxadc\n");
+
+	indio_dev->name = "mt6397-auxadc";
+	indio_dev->info = &mt6397_auxadc_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = mt6397_auxadc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mt6397_auxadc_channels);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id mt6397_auxadc_of_match[] = {
+	{ .compatible = "mediatek,mt6397-auxadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mt6397_auxadc_of_match);
+
+static struct platform_driver mt6397_auxadc_driver = {
+	.driver = {
+		.name = "mt6397-auxadc",
+		.of_match_table = mt6397_auxadc_of_match,
+	},
+	.probe = mt6397_auxadc_probe,
+};
+module_platform_driver(mt6397_auxadc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ryan Brue <ryanbrue.dev@gmail.com>");
+MODULE_DESCRIPTION("MediaTek MT6397 PMIC AUXADC Driver");

-- 
2.55.0


