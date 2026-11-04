Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F68606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uxp3bjPs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v7hXgl+d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HHeTP5N2ktsLISpPHAP/KIrZhGMfCA2o06QoNXCSwig=; b=uxp3bjPsJA4oR1
	Kn59LzVoF+q5tQGw5HF806aYvMYLLS7YqT9Yq/D86gkICYpPNMhtU3BHLjVvAuwPr/UIpunsgf7Uf
	sbm0bw35/wRg6amtioxFMwjfcBb/eHg+MQdH1GxGk7hLeOFzGsEe9YniCVBfLtd0u6LUyQdQwfg5z
	oP+7Fp4FFVVsqoLvRzj77WZsXUQAP0f/apckuJ/DmaEn1ZMJzif66a35zgRrqyiHfar1wgfj6hBYZ
	jTDYFuX9yquwW07DZhOPqPPePxjv1H0b0jqpB5k5NX2CgrbZ//7KVKylEa2HxsDJ8l/icc+7mYMsj
	zFlmkGIdA5jd02udU4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOX2W-00000004qCX-1NT0;
	Wed, 04 Nov 2026 09:12:16 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOX2T-00000004qBd-1DTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:12:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so206228a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 01:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783533; x=1794388333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHeTP5N2ktsLISpPHAP/KIrZhGMfCA2o06QoNXCSwig=;
        b=v7hXgl+dsUreZ9flqXaOcyEWKxwLT7hEbqaNErCxPDuue3tAHRrdRvfVfFJoKLZ9vv
         10KA8NjG4f0Q8jUDCRZVVlW+GnCZEJeMaUxcwITcGfs0WFM2jWp7kwJKc7NwetO7d/KG
         Mr9b1RflIijETre9XkoMQy4CU5KOvOwJ3Sh8ZBjK6wQpf6EqUOb49lbtEFgmUNlko2DS
         BdQTm27RxjkqJueanLRdIrneBS8QWwmgaaWPXdQ/mWb82PALOa7nAmqlEoiBlu6THcvm
         x1T0fUsYJ2q89PjcUFPCCcaVQGVwYhIYfEH55QHp8Gia2yWudEnvK/uDNmc17MZG/aV7
         wxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783533; x=1794388333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHeTP5N2ktsLISpPHAP/KIrZhGMfCA2o06QoNXCSwig=;
        b=NDxGLdH1UesrFnAujAk44eNNB7632GP3q2SDLu08a5hBHwnzJyjMXZCQtsYFRzYXgl
         s9UplrzMwHGLuTww+B73t3qXV3E2Fw5vPwyhA2Nkmisem60j3rNqEZUk04dmtBREGTmJ
         NZp9KCOIYoUEYiWZDbKOrT6QlI7XeJoT5n/1QXbtqXzkmPEM7r3vkghNDMYXI6wy2Cbv
         Y3GfwciLcHsU9w8w/KlqcDoCYRUiRx+FgO3JJkYCVoz5rlwQHMZx4TObVeSVh4/3uHod
         2TWvnAptJXUrL0G8oGaI0lx4+/XFfU4WtF9kMRmrOPz9keDeoC1pFxHx8ZkxeJ7fxEAp
         WKgA==
X-Forwarded-Encrypted: i=1; AKwUvBxlZ2lspp3QDgkjy7+VuQm8MEQeZxT7j+KpbSRlTxQEJZcGQWl0gcM2xK7GYtyzb0dFFR/197hDzPQZX+rSyb6+@lists.infradead.org
X-Gm-Message-State: APuU4Z/So/f3lQ9MtjfxpFH+rR7UKjxEOQb5jlLGym8hO3CBx7wjINvY
	3BPVPBMoRYW37ehlLYl1pKvfLGwIKgKi0krtw9hUmjMR2tWD+dr1leME
X-Gm-Gg: AYBFou2PUMCnBgS35/IWa36Y63Sn/ditY5/WGlLZlNE5Nz63wMwVT4XCbUXF2I80Qwi
	jsLpwir75Tc3xNLZHi1v7aazdCOcCAiEugdjKyLeXU+qqc2HrIsz0BAWSB8Vjf7EmY2Cq/kKoVk
	DiA43pzKE0aYQjX45N4iK3e81HzqAtIVTAS71bUAeZaQ9MzuwC2h7Ov64+RAbgNTgQw7T2Ta/0P
	ir8CQPwrC4QZwHpevn7/rzK8E8FomTw3zVIgwsbpvBDd5ZMxnLn7bFYK3WbpDCmPp/6I7gJyInY
	MWLf8Qfb9yBfGT6wt3mP+nnPxwuScZYy7qCVkDTKFPOMyaU+jAZgOYMj2mEIhwvftLuyLhX8Gei
	/0TrfdYKnsczKoQ3pRuYNBy00G6mpDgKqWmffSGwucH3DEXJRsSHQccN1UyR6HiLgzycdlpbBnr
	1keOvTy2zSd6TuL2jSpx0PScFVZCW48QnGdwiqjFThJfTIWS/WI2Ijvkg0koyOccFRuN0bTMmq0
	5MPxcGjFcldLRcGjssQgMjh5tMbOj0nokfPn4e2XiM9AP74XGYH4OHs1ZG3h5RvFfpQZ3p2uBm+
	49h0t6PzorDn8tBJ3INInKPGSbve2gL66W4yUbcsvza9d46dKJ7HTuSx3jV+5qf9L4phO00Zn3n
	Z3yxaT/mP/kBrngY=
X-Received: by 2002:a17:90b:560e:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3ae8957d04bmr13588942a91.7.1793783532518;
        Wed, 04 Nov 2026 01:12:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3167257a91.0.2026.11.04.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:12:11 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Wed,  4 Nov 2026 17:11:36 +0800
Message-Id: <20261104091136.151269-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104091136.151269-1-cwweng.linux@gmail.com>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_011213_386250_56027F45 
X-CRM114-Status: GOOD (  27.95  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add an IIO driver for the Enhanced Analog-to-Digital Converter found on
Nuvoton MA35D1 SoCs.

Support single-ended and fixed differential input pairs, direct
conversion, and triggered buffered capture using sample module 0.

The hardware supports multiple sample modules, but this initial driver
uses sample module 0 only and therefore supports one active voltage
channel per buffered scan.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/iio/adc/Kconfig       |  14 +
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/ma35d1_eadc.c | 912 ++++++++++++++++++++++++++++++++++
 3 files changed, 927 insertions(+)
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a802d8ee4dd9..6868b67d852f 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1032,6 +1032,20 @@ config LTC2497
 	  To compile this driver as a module, choose M here: the module will be
 	  called ltc2497.
 
+config MA35D1_EADC
+	tristate "Nuvoton MA35D1 EADC driver"
+	depends on ARCH_MA35 || COMPILE_TEST
+	depends on HAS_IOMEM
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
+	select REGMAP_MMIO
+	help
+	  Say yes here to build support for the Nuvoton MA35D1
+	  Enhanced Analog to Digital Converter.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called ma35d1_eadc.
+
 config MAX1027
 	tristate "Maxim max1027 ADC driver"
 	depends on SPI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 9e82c21dbd37..a478fef5d0b7 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_LTC2471) += ltc2471.o
 obj-$(CONFIG_LTC2485) += ltc2485.o
 obj-$(CONFIG_LTC2496) += ltc2496.o ltc2497-core.o
 obj-$(CONFIG_LTC2497) += ltc2497.o ltc2497-core.o
+obj-$(CONFIG_MA35D1_EADC) += ma35d1_eadc.o
 obj-$(CONFIG_MAX1027) += max1027.o
 obj-$(CONFIG_MAX11100) += max11100.o
 obj-$(CONFIG_MAX1118) += max1118.o
diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
new file mode 100644
index 000000000000..b45ad3ef5264
--- /dev/null
+++ b/drivers/iio/adc/ma35d1_eadc.c
@@ -0,0 +1,912 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton MA35D1 EADC driver
+ *
+ * Copyright (c) 2026 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
+
+#define MA35D1_EADC_DAT(n)		(0x000 + (n) * 0x004)
+#define MA35D1_EADC_CTL			0x050
+#define MA35D1_EADC_SWTRG		0x054
+#define MA35D1_EADC_SCTL(n)		(0x080 + (n) * 0x004)
+#define MA35D1_EADC_INTSRC0		0x0d0
+#define MA35D1_EADC_CMP(n)		(0x0e0 + (n) * 0x004)
+#define MA35D1_EADC_STATUS2		0x0f8
+#define MA35D1_EADC_SELSMP0		0x140
+#define MA35D1_EADC_REFADJCTL		0x150
+
+#define MA35D1_EADC_CTL_ADCEN		BIT(0)
+#define MA35D1_EADC_CTL_EADCRST		BIT(1)
+#define MA35D1_EADC_CTL_ADCIEN0		BIT(2)
+#define MA35D1_EADC_CTL_ADCIEN_MASK	GENMASK(5, 2)
+#define MA35D1_EADC_CTL_DIFFEN		BIT(8)
+#define MA35D1_EADC_CTL_DMOF		BIT(9)
+#define MA35D1_EADC_CTL_VREFSEL_MASK	GENMASK(11, 10)
+#define MA35D1_EADC_CTL_VREFSEL_1V6	FIELD_PREP(MA35D1_EADC_CTL_VREFSEL_MASK, 0)
+
+#define MA35D1_EADC_SCTL_CHSEL_MASK	GENMASK(3, 0)
+#define MA35D1_EADC_SCTL_TRGSEL_MASK	GENMASK(21, 16)
+#define MA35D1_EADC_SCTL_INTPOS		BIT(22)
+
+#define MA35D1_EADC_RESOLUTION		12
+#define MA35D1_EADC_DIFF_SCALE_BITS	(MA35D1_EADC_RESOLUTION - 1)
+
+#define MA35D1_EADC_DAT_RESULT_12BIT	GENMASK(MA35D1_EADC_RESOLUTION - 1, 0)
+#define MA35D1_EADC_DAT_OV		BIT(16)
+#define MA35D1_EADC_DAT_VALID		BIT(17)
+
+#define MA35D1_EADC_INTSRC0_MASK		GENMASK(8, 0)
+#define MA35D1_EADC_INTSRC0_SPLIEN0	BIT(0)
+#define MA35D1_EADC_STATUS2_ADIF0	BIT(0)
+#define MA35D1_EADC_CMP_EADCMPIE	BIT(1)
+#define MA35D1_EADC_REFADJCTL_PDREF	BIT(0)
+#define MA35D1_EADC_SELSMP0_SMPT0_MASK	GENMASK(1, 0)
+#define MA35D1_EADC_SELSMP_LONG		FIELD_PREP(MA35D1_EADC_SELSMP0_SMPT0_MASK, 3)
+
+#define MA35D1_EADC_MAX_EXT_CHANNELS	8
+#define MA35D1_EADC_NUM_DIFF_PAIRS	4
+#define MA35D1_EADC_NUM_SAMPLE_MODULES	9
+#define MA35D1_EADC_NUM_CMP		4
+#define MA35D1_EADC_INTERNAL_VREF_mV	1600
+#define MA35D1_EADC_TIMEOUT		msecs_to_jiffies(1000)
+#define MA35D1_EADC_RESET_DELAY_US	10
+#define MA35D1_EADC_REF_STABLE_US	(1 * USEC_PER_MSEC)
+
+struct ma35d1_adc {
+	struct regmap *regmap;
+	struct clk *clk;
+	struct reset_control *rst;
+	struct completion completion;
+	/* Protect conversion state and register accesses from PM transitions. */
+	struct mutex lock;
+	const struct iio_chan_spec *scan_chan;
+	unsigned int vref_mV;
+	int irq;
+	bool clk_enabled;
+	bool external_vref;
+	bool suspended;
+};
+
+static const struct regmap_config ma35d1_adc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MA35D1_EADC_REFADJCTL,
+};
+
+static int ma35d1_adc_disable_irq(struct ma35d1_adc *adc)
+{
+	return regmap_clear_bits(adc->regmap, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0);
+}
+
+static int ma35d1_adc_setup_reference(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	/*
+	 * MA35D1 TRM EADC reference control: PDREF selects the external VREF
+	 * pin. With the internal reference selected, VREFSEL = 0 selects 1.6 V.
+	 */
+	if (adc->external_vref) {
+		ret = regmap_set_bits(map, MA35D1_EADC_REFADJCTL,
+				      MA35D1_EADC_REFADJCTL_PDREF);
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_clear_bits(map, MA35D1_EADC_REFADJCTL,
+					MA35D1_EADC_REFADJCTL_PDREF);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(map, MA35D1_EADC_CTL,
+					 MA35D1_EADC_CTL_VREFSEL_MASK,
+					 MA35D1_EADC_CTL_VREFSEL_1V6);
+		if (ret)
+			return ret;
+	}
+
+	fsleep(MA35D1_EADC_REF_STABLE_US);
+
+	return 0;
+}
+
+static int ma35d1_adc_reset_control(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_EADCRST);
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(map, MA35D1_EADC_CTL, val,
+					!(val & MA35D1_EADC_CTL_EADCRST),
+					1, 1 * USEC_PER_MSEC);
+}
+
+static int ma35d1_adc_hw_init(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * EADCRST resets the control circuits but preserves register values.
+	 * Quiesce interrupt sources first so firmware configuration cannot
+	 * generate an interrupt while Linux takes ownership of the block.
+	 */
+	ret = regmap_clear_bits(map, MA35D1_EADC_CTL,
+				MA35D1_EADC_CTL_ADCIEN_MASK);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MA35D1_EADC_NUM_CMP; i++) {
+		ret = regmap_clear_bits(map, MA35D1_EADC_CMP(i),
+					MA35D1_EADC_CMP_EADCMPIE);
+		if (ret)
+			return ret;
+	}
+
+	ret = ma35d1_adc_reset_control(adc);
+	if (ret)
+		return ret;
+
+	/* Drop trigger and interrupt routing inherited from firmware. */
+	ret = regmap_update_bits(map, MA35D1_EADC_INTSRC0,
+				 MA35D1_EADC_INTSRC0_MASK, 0);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MA35D1_EADC_NUM_SAMPLE_MODULES; i++) {
+		ret = regmap_clear_bits(map, MA35D1_EADC_SCTL(i),
+					MA35D1_EADC_SCTL_TRGSEL_MASK);
+		if (ret)
+			return ret;
+	}
+
+	ret = ma35d1_adc_setup_reference(adc);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(map, MA35D1_EADC_SELSMP0,
+				 MA35D1_EADC_SELSMP0_SMPT0_MASK,
+				 MA35D1_EADC_SELSMP_LONG);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(map, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+}
+
+static int ma35d1_adc_hw_disable(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	return regmap_clear_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+}
+
+static void ma35d1_adc_hw_disable_action(void *data)
+{
+	struct ma35d1_adc *adc = data;
+
+	if (adc->clk_enabled)
+		ma35d1_adc_hw_disable(adc);
+}
+
+static int ma35d1_adc_reset(struct ma35d1_adc *adc)
+{
+	int ret;
+
+	if (!adc->rst)
+		return 0;
+
+	ret = reset_control_assert(adc->rst);
+	if (ret)
+		return ret;
+
+	fsleep(MA35D1_EADC_RESET_DELAY_US);
+
+	return reset_control_deassert(adc->rst);
+}
+
+static int ma35d1_adc_config_channel(struct ma35d1_adc *adc,
+				     const struct iio_chan_spec *chan)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int mask;
+	int ret;
+
+	mask = MA35D1_EADC_CTL_DIFFEN | MA35D1_EADC_CTL_DMOF;
+	ret = regmap_assign_bits(map, MA35D1_EADC_CTL, mask, chan->differential);
+	if (ret)
+		return ret;
+
+	/*
+	 * INTPOS = 0 generates ADIF0 at end of conversion. TRGSEL = 0 disables
+	 * the hardware trigger; conversions are started through SWTRG0.
+	 */
+	mask = MA35D1_EADC_SCTL_CHSEL_MASK |
+	       MA35D1_EADC_SCTL_TRGSEL_MASK |
+	       MA35D1_EADC_SCTL_INTPOS;
+	ret = regmap_update_bits(map, MA35D1_EADC_SCTL(0), mask,
+				 FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK,
+					    chan->channel));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(map, MA35D1_EADC_INTSRC0,
+				  MA35D1_EADC_INTSRC0_MASK,
+				  MA35D1_EADC_INTSRC0_SPLIEN0);
+}
+
+static void ma35d1_adc_abort_conversion(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	struct device *dev = regmap_get_device(map);
+	int ret;
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		dev_err(dev, "failed to disable ADC interrupt: %d\n", ret);
+
+	/*
+	 * Reset the EADC control circuits to terminate a conversion which may
+	 * still be in progress. EADCRST is cleared automatically by hardware
+	 * when the reset completes and the EADC register values are preserved.
+	 */
+	ret = ma35d1_adc_reset_control(adc);
+	if (ret)
+		dev_err(dev, "failed to reset timed out conversion: %d\n", ret);
+
+	/* Drain an interrupt which may already have been latched by the GIC. */
+	synchronize_irq(adc->irq);
+
+	ret = regmap_write(map, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		dev_err(dev, "failed to clear ADC interrupt status: %d\n", ret);
+}
+
+static int ma35d1_adc_read_conversion(struct ma35d1_adc *adc,
+				      const struct iio_chan_spec *chan, u16 *raw)
+{
+	struct regmap *map = adc->regmap;
+	unsigned int val;
+	long timeout;
+	int ret;
+
+	reinit_completion(&adc->completion);
+
+	ret = regmap_write(map, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_config_channel(adc, chan);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(map, MA35D1_EADC_SWTRG, BIT(0));
+	if (ret)
+		goto disable_irq;
+
+	timeout = wait_for_completion_timeout(&adc->completion,
+					      MA35D1_EADC_TIMEOUT);
+	if (!timeout) {
+		ma35d1_adc_abort_conversion(adc);
+		return -ETIMEDOUT;
+	}
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(map, MA35D1_EADC_DAT(0), &val);
+	if (ret)
+		return ret;
+
+	if (!(val & MA35D1_EADC_DAT_VALID))
+		return -EIO;
+
+	if (val & MA35D1_EADC_DAT_OV)
+		return -EOVERFLOW;
+
+	*raw = FIELD_GET(MA35D1_EADC_DAT_RESULT_12BIT, val);
+
+	return 0;
+
+disable_irq:
+	ma35d1_adc_disable_irq(adc);
+
+	return ret;
+}
+
+static irqreturn_t ma35d1_adc_isr(int irq, void *data)
+{
+	struct iio_dev *indio_dev = data;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	struct regmap *map = adc->regmap;
+	unsigned int status;
+	int ret;
+
+	ret = regmap_read(map, MA35D1_EADC_STATUS2, &status);
+	if (ret)
+		return IRQ_NONE;
+
+	if (!(status & MA35D1_EADC_STATUS2_ADIF0))
+		return IRQ_NONE;
+
+	ret = regmap_write(map, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF0);
+	if (ret)
+		dev_err_ratelimited(regmap_get_device(map),
+				    "failed to clear ADC interrupt status: %d\n", ret);
+
+	complete(&adc->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_adc_sign_extend(u16 raw)
+{
+	return sign_extend32(raw, MA35D1_EADC_DIFF_SCALE_BITS);
+}
+
+static int ma35d1_adc_read_raw(struct iio_dev *indio_dev,
+			       const struct iio_chan_spec *chan,
+			       int *val, int *val2, long mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	u16 raw;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW: {
+		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
+			return -EBUSY;
+
+		guard(mutex)(&adc->lock);
+
+		if (adc->suspended)
+			return -EBUSY;
+
+		ret = ma35d1_adc_read_conversion(adc, chan, &raw);
+		if (ret)
+			return ret;
+
+		if (chan->differential)
+			*val = ma35d1_adc_sign_extend(raw);
+		else
+			*val = raw;
+
+		return IIO_VAL_INT;
+	}
+	case IIO_CHAN_INFO_SCALE:
+		*val = adc->vref_mV;
+		/* Differential mode has a VREF / 2048 LSB; single-ended uses /4096. */
+		*val2 = chan->differential ? MA35D1_EADC_DIFF_SCALE_BITS :
+					       MA35D1_EADC_RESOLUTION;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ma35d1_adc_update_scan_mode(struct iio_dev *indio_dev,
+				       const unsigned long *scan_mask)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int bit;
+
+	adc->scan_chan = NULL;
+	iio_for_each_active_channel(indio_dev, bit) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[bit];
+
+		if (chan->type != IIO_VOLTAGE)
+			return -EINVAL;
+
+		adc->scan_chan = chan;
+	}
+
+	if (!adc->scan_chan)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ma35d1_adc_buffer_postenable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+
+	guard(mutex)(&adc->lock);
+
+	if (adc->suspended)
+		return -EBUSY;
+
+	if (!adc->scan_chan)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ma35d1_adc_buffer_predisable(struct iio_dev *indio_dev)
+{
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		return ret;
+
+	synchronize_irq(adc->irq);
+
+	return regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+			    MA35D1_EADC_STATUS2_ADIF0);
+}
+
+static void ma35d1_adc_trigger_capture(struct iio_poll_func *pf)
+{
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	struct {
+		u16 channel;
+		aligned_s64 timestamp;
+	} scan = { };
+	u16 raw;
+	int ret;
+
+	guard(mutex)(&adc->lock);
+
+	if (adc->suspended || !adc->scan_chan)
+		return;
+
+	ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &raw);
+	if (ret)
+		return;
+
+	scan.channel = raw;
+	iio_push_to_buffers_with_ts(indio_dev, &scan, sizeof(scan), pf->timestamp);
+}
+
+static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+
+	ma35d1_adc_trigger_capture(pf);
+	iio_trigger_notify_done(pf->indio_dev->trig);
+
+	return IRQ_HANDLED;
+}
+
+static const struct iio_buffer_setup_ops ma35d1_adc_buffer_ops = {
+	.postenable = ma35d1_adc_buffer_postenable,
+	.predisable = ma35d1_adc_buffer_predisable,
+	.validate_scan_mask = iio_validate_scan_mask_onehot,
+};
+
+static int ma35d1_adc_fwnode_xlate(struct iio_dev *indio_dev,
+				   const struct fwnode_reference_args *iiospec)
+{
+	if (iiospec->nargs != 1)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < indio_dev->num_channels; i++) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[i];
+
+		if (chan->type == IIO_VOLTAGE &&
+		    chan->address == iiospec->args[0])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static const struct iio_info ma35d1_adc_info = {
+	.read_raw = ma35d1_adc_read_raw,
+	.update_scan_mode = ma35d1_adc_update_scan_mode,
+	.fwnode_xlate = ma35d1_adc_fwnode_xlate,
+};
+
+static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
+				     struct device *dev)
+{
+	DECLARE_BITMAP(used_single_inputs, MA35D1_EADC_MAX_EXT_CHANNELS);
+	DECLARE_BITMAP(used_diff_pairs, MA35D1_EADC_NUM_DIFF_PAIRS);
+	DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
+	struct iio_chan_spec *channels;
+	unsigned int scan_index;
+	int num_channels;
+	int ret;
+
+	bitmap_zero(used_single_inputs, MA35D1_EADC_MAX_EXT_CHANNELS);
+	bitmap_zero(used_diff_pairs, MA35D1_EADC_NUM_DIFF_PAIRS);
+	bitmap_zero(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
+
+	num_channels = device_get_child_node_count(dev);
+	if (!num_channels)
+		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
+
+	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
+		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
+
+	channels = devm_kcalloc(dev, size_add(num_channels, 1),
+				sizeof(*channels), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	scan_index = 0;
+	device_for_each_child_node_scoped(dev, child) {
+		bool has_diff, has_single;
+		u32 reg, vinp, vinn;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "missing channel reg property\n");
+
+		if (reg >= MA35D1_EADC_MAX_EXT_CHANNELS)
+			return dev_err_probe(dev, -ENOSPC,
+					     "invalid ADC channel index %u\n", reg);
+
+		if (test_and_set_bit(reg, used_regs))
+			return dev_err_probe(dev, -EEXIST,
+					     "duplicate ADC channel index %u\n", reg);
+
+		has_single = fwnode_property_present(child, "single-channel");
+		has_diff = fwnode_property_present(child, "diff-channels");
+		if (has_single && has_diff)
+			return dev_err_probe(dev, -EINVAL,
+					     "channel %u has conflicting input properties\n",
+					     reg);
+
+		if (has_diff) {
+			u32 inputs[2];
+
+			ret = fwnode_property_read_u32_array(child, "diff-channels",
+							     inputs, ARRAY_SIZE(inputs));
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid diff-channels for index %u\n",
+						     reg);
+
+			vinp = inputs[0];
+			vinn = inputs[1];
+			if (vinp >= 4 || vinn != vinp + 4)
+				return dev_err_probe(dev, -ECHRNG,
+						     "invalid differential inputs %u-%u\n",
+						     vinp, vinn);
+
+			if (test_and_set_bit(vinp, used_diff_pairs))
+				return dev_err_probe(dev, -EEXIST,
+						     "duplicate differential inputs %u-%u\n",
+						     vinp, vinn);
+
+			channels[scan_index] = (struct iio_chan_spec) {
+				.type = IIO_VOLTAGE,
+				.indexed = 1,
+				.differential = 1,
+				.channel = vinp,
+				.channel2 = vinn,
+				.address = reg,
+				.scan_index = scan_index,
+				.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+						      BIT(IIO_CHAN_INFO_SCALE),
+				.scan_type = {
+					.format = IIO_SCAN_FORMAT_SIGNED_INT,
+					.realbits = MA35D1_EADC_RESOLUTION,
+					.storagebits = 16,
+					.endianness = IIO_CPU,
+				},
+			};
+		} else {
+			if (has_single) {
+				ret = fwnode_property_read_u32(child, "single-channel",
+							       &vinp);
+				if (ret)
+					return dev_err_probe(dev, ret,
+							     "invalid single-channel for index %u\n",
+							     reg);
+			} else {
+				vinp = reg;
+			}
+
+			if (vinp >= MA35D1_EADC_MAX_EXT_CHANNELS)
+				return dev_err_probe(dev, -ECHRNG,
+						     "invalid ADC input %u\n", vinp);
+
+			if (test_and_set_bit(vinp, used_single_inputs))
+				return dev_err_probe(dev, -EEXIST,
+						     "duplicate ADC input %u\n", vinp);
+
+			channels[scan_index] = (struct iio_chan_spec) {
+				.type = IIO_VOLTAGE,
+				.indexed = 1,
+				.channel = vinp,
+				.address = reg,
+				.scan_index = scan_index,
+				.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+						      BIT(IIO_CHAN_INFO_SCALE),
+				.scan_type = {
+					.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+					.realbits = MA35D1_EADC_RESOLUTION,
+					.storagebits = 16,
+					.endianness = IIO_CPU,
+				},
+			};
+		}
+
+		scan_index++;
+	}
+
+	channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
+
+	indio_dev->channels = channels;
+	indio_dev->num_channels = scan_index + 1;
+
+	return 0;
+}
+
+static int ma35d1_adc_init_vref(struct ma35d1_adc *adc, struct device *dev)
+{
+	int ret;
+
+	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
+	if (ret == -ENODEV) {
+		adc->vref_mV = MA35D1_EADC_INTERNAL_VREF_mV;
+		return 0;
+	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get VREF supply\n");
+
+	if (!ret)
+		return dev_err_probe(dev, -EINVAL, "invalid VREF voltage\n");
+
+	adc->external_vref = true;
+	adc->vref_mV = ret / (MICRO / MILLI);
+
+	return 0;
+}
+
+static void ma35d1_adc_clk_disable_action(void *data)
+{
+	struct ma35d1_adc *adc = data;
+
+	if (!adc->clk_enabled)
+		return;
+
+	clk_disable_unprepare(adc->clk);
+	adc->clk_enabled = false;
+}
+
+static int ma35d1_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iio_dev *indio_dev;
+	struct ma35d1_adc *adc;
+	void __iomem *regs;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	adc = iio_priv(indio_dev);
+	init_completion(&adc->completion);
+
+	ret = devm_mutex_init(dev, &adc->lock);
+	if (ret)
+		return ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "failed to map registers\n");
+
+	adc->regmap = devm_regmap_init_mmio(dev, regs, &ma35d1_adc_regmap_config);
+	if (IS_ERR(adc->regmap))
+		return dev_err_probe(dev, PTR_ERR(adc->regmap),
+				     "failed to initialize regmap\n");
+
+	adc->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk),
+				     "failed to get ADC clock\n");
+
+	ret = clk_prepare_enable(adc->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable ADC clock\n");
+
+	adc->clk_enabled = true;
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_clk_disable_action, adc);
+	if (ret)
+		return ret;
+
+	adc->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(adc->rst))
+		return dev_err_probe(dev, PTR_ERR(adc->rst),
+				     "failed to get reset control\n");
+
+	ret = ma35d1_adc_reset(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset ADC\n");
+
+	ret = ma35d1_adc_init_vref(adc, dev);
+	if (ret)
+		return ret;
+
+	indio_dev->name = "ma35d1-eadc";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &ma35d1_adc_info;
+
+	ret = ma35d1_adc_parse_channels(indio_dev, dev);
+	if (ret)
+		return ret;
+
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize ADC\n");
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_hw_disable_action, adc);
+	if (ret)
+		return ret;
+
+	adc->irq = platform_get_irq(pdev, 0);
+	if (adc->irq < 0)
+		return adc->irq;
+
+	ret = devm_request_irq(dev, adc->irq, ma35d1_adc_isr, 0,
+			       dev_name(dev), indio_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
+					      ma35d1_adc_trigger_handler,
+					      &ma35d1_adc_buffer_ops);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, indio_dev);
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static int ma35d1_adc_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	struct regmap *map = adc->regmap;
+	int ret;
+
+	ret = iio_device_suspend_triggering(indio_dev);
+	if (ret)
+		return ret;
+
+	mutex_lock(&adc->lock);
+
+	ret = ma35d1_adc_disable_irq(adc);
+	if (ret)
+		goto resume_triggering;
+
+	synchronize_irq(adc->irq);
+
+	ret = regmap_clear_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
+	if (ret) {
+		/*
+		 * ADCIEN0 is enabled only while a conversion is active. Holding
+		 * adc->lock here guarantees that no conversion is in progress, so
+		 * leave it disabled. The next conversion enables it again.
+		 */
+		goto resume_triggering;
+	}
+
+	adc->suspended = true;
+	clk_disable_unprepare(adc->clk);
+	adc->clk_enabled = false;
+	mutex_unlock(&adc->lock);
+
+	return 0;
+
+resume_triggering:
+	mutex_unlock(&adc->lock);
+	iio_device_resume_triggering(indio_dev);
+
+	return ret;
+}
+
+static int ma35d1_adc_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&adc->lock);
+
+	ret = clk_prepare_enable(adc->clk);
+	if (ret)
+		goto unlock;
+
+	adc->clk_enabled = true;
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret) {
+		clk_disable_unprepare(adc->clk);
+		adc->clk_enabled = false;
+		goto unlock;
+	}
+
+	adc->suspended = false;
+	mutex_unlock(&adc->lock);
+
+	return iio_device_resume_triggering(indio_dev);
+
+unlock:
+	mutex_unlock(&adc->lock);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_adc_pm_ops,
+				ma35d1_adc_suspend, ma35d1_adc_resume);
+
+static const struct of_device_id ma35d1_adc_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-eadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ma35d1_adc_of_match);
+
+static struct platform_driver ma35d1_adc_driver = {
+	.probe = ma35d1_adc_probe,
+	.driver = {
+		.name = "ma35d1-eadc",
+		.of_match_table = ma35d1_adc_of_match,
+		.pm = pm_sleep_ptr(&ma35d1_adc_pm_ops),
+	},
+};
+module_platform_driver(ma35d1_adc_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 EADC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


