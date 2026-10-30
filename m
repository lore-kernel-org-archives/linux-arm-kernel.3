Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rlBy/mjf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JlypaKs4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DBKO3UIY39zZUQ4CA38/YGH1Nzkfo+0rcJ8P4w8cKV8=; b=rlBy/mjfMJUwwq
	Fe4aIHWLxuqCS9ce0ox+OPjrZfn+yEnurkCQx8EX2r0WnHqscXW0iOIL2Bipxn4elzRVUS1njn4j6
	tAuT9YBCL6l/guEW1m6R7KWmWgz8kMDsLaxy89IXhj2IQsOg7WTaR/+CImm2Xw30MavG9TUUMrvH6
	q/nrj3OHCZ7y6iQKuT1x6I1Qxsuiz/1tKZJeNYjexqprxxoFBPewSn4Yl6N3+HVHApTxfMU9M1qox
	cJx0TEiZdK5SBhw9ovaVIb8IQC8RPLpLIlKQq0mrIHKkgYI537BObiCG5mlxiVeQW/Ang9KkKzXSa
	Fj4qDFtONhmg1VjcSSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMd5Z-0000000AibP-3hze;
	Fri, 30 Oct 2026 03:15:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMd5U-0000000AiZQ-2Cdl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 03:15:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so146729a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330127; x=1793934927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBKO3UIY39zZUQ4CA38/YGH1Nzkfo+0rcJ8P4w8cKV8=;
        b=JlypaKs4b6lJS4B4lxVk2UyYhF+00iU5K92p6Z6psoaqCaWVAoWlTgxBKbmgO0G52E
         0iqMcLjHSIin29fWcLniHciPVb/CReOQdZx3p9slYkDEaW6XTORnH8Px7cdYAphY85ru
         H7e56ChJ+r9pMEq6jIUR3F4SkrWVlFwLmt/1XhNL1o8G7wfhYqzRmYIcPoyjNsvsyO4n
         MU4tD4rF5abFJQj5ss8sy4Rn4jjTiXqwQ2ROOGzRlysAnqohi1pDBYRl6qRsZGm6RJ43
         PlZQN0nZ15g6aN5FZZc/opLmJ/hTgUWviluHtSZWcG0+NWwHM2EsC/9rYETyCXcd0xwc
         TraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330127; x=1793934927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBKO3UIY39zZUQ4CA38/YGH1Nzkfo+0rcJ8P4w8cKV8=;
        b=FR15H6wMxpJjizfv0ddyKmHKTOzp2hGymk2aQrTcbp26SO4I489GpSYR5+JUByUkCq
         SFCJWZ3Kh7sSVAQcwQM2YqI85NHAsgwMKbJI6I1CeF4lon19pQrsz2h3ZXae5XWaPeM8
         4uenKj2AyK2o5bCsULIP8jDGTXRzAhgKbtPebEo3MKkUmlBuoUrU9iG8RCo+6X6FkKE3
         WAxXAwnTc1BQEe8ffXSI22aStQeoVsJ1nGqeu0LYAEeoa6T1GVnH8eJwRWXENbXIb0Tf
         4AQ72Ju7PKq/Twqchwttsvmc8+qzm6lLmSzGfymdz+/Pmz+3BqtEygYr4QSetSic4zJN
         TgPg==
X-Forwarded-Encrypted: i=1; AKwUvByGMpmGVIbFWKJ2pyLr9oQP64kzfmSUkiVoFCPGqFY1AMNzzUaKHtPgNNlD7fOsKtpg031NwuskXQxGHV3tWeF0@lists.infradead.org
X-Gm-Message-State: AFq9FYL3TT7gvGV96eSGCLCOCSeFrmR7pe0EtXsnuLsjVE1pW196vVS9
	jwuU/C1Nh5lfdQcReRaWE2cA6UrO70YzwwteiOlrryJVh7VB1SZ5919S
X-Gm-Gg: AYBFou0C2NqEmB9cH9tCsyhQOQ7ZuwmE1lJdOxyq5uBsderMc4m6rDmE2+pK5IJG+Mv
	mR2hsdAy4ICCPkJZhgInmi1z2bVp9mgr1mZDwC5PaqJm84ijxUccIrZX5FJA5mA26qic+SK2ce1
	L36+AUT7QF1dllza+gtDOV/PjlMpTNjEoB5xQ62x+VpC7KDFtVoVwZZosVfQlfBcKUwPkrWljQB
	4LTc4ITT2fUlIrUdQ4KQ6YlHalYgL9Q2matii0OUv0WF0+TIezEcAobzWlCvuMZyPx9R5SqYX5r
	46Ov9KhudNRR1N8we3hukLDCNZrKGWus+wUWQmOcoSs0jCliAY59Lf6gpxmZDTpUTDrcSEMpQGB
	qgNiUcjpPjpUoLqu7RyCgzUx5+qxBbIbDJyQ/DSvKUter/7TOrQIrc1kIF/nvi91mFkkL8Kb0ss
	0P2X5TWNXDWqGwnJpgoYXLlezqUzZhsuRNnYYtZusO1d6fwzNYIunhA8DKOLFc4Fla2AhisROif
	VMxzM0eTXWsi7BVmlBRhIfYgYNeNZtDRedgcC+Lm4al75AXVUYgUzfueZWBhUUXHYAJWsZE4Oqb
	cgrdULrdmqqZymTvO+pwk7oJEX2eXVDrhVpu+NVhHbQiDbexsUj73DVteGmjx2PixnUX8TzXoDd
	iL+7Ltq1+gO8U7l4=
X-Received: by 2002:a17:90b:55c6:b0:3ac:9f00:3bc8 with SMTP id 98e67ed59e1d1-3ae8976f2f0mr736574a91.36.1793330126752;
        Thu, 29 Oct 2026 20:15:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm6590630a91.0.2026.10.29.20.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:15:26 -0700 (PDT)
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
Subject: [PATCH v3 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Date: Fri, 30 Oct 2026 11:15:01 +0800
Message-Id: <20261030031501.130290-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030031501.130290-1-cwweng.linux@gmail.com>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_201528_653866_DABE845E 
X-CRM114-Status: GOOD (  28.75  )
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

Add an IIO driver for the Enhanced Analog-to-Digital Converter (EADC)
found on Nuvoton MA35D1 SoCs.

The driver supports direct conversion and externally triggered buffered
capture using sample module 0. Both single-ended inputs and the four
fixed differential input pairs are supported.

Use the internal 1.6 V reference when no external reference supply is
provided, and report the reference voltage through the IIO scale
interface.

Use ADINT0 for conversion completion. Configure the interrupt source
and end-of-conversion position explicitly, and recover from conversion
timeouts by resetting the EADC control circuits, synchronizing the IRQ
and clearing stale conversion state before another conversion is
started.

Reset the EADC control circuits during hardware initialization and
sanitize interrupt, compare and sample-module trigger configuration so
the driver does not depend on state left by firmware when the external
reset control is unavailable.

Provide firmware-node channel translation so DT IIO consumers select
channels by the logical channel index described by the channel node's
reg property rather than by the position of the channel in the driver's
channel array.

Add clock, optional reset and system sleep handling, and restore the
controller configuration after resume.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/iio/adc/Kconfig       |  14 +
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/ma35d1_eadc.c | 849 ++++++++++++++++++++++++++++++++++
 3 files changed, 864 insertions(+)
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
index 000000000000..9b6c38a66a66
--- /dev/null
+++ b/drivers/iio/adc/ma35d1_eadc.c
@@ -0,0 +1,849 @@
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
+#define MA35D1_EADC_DAT_RESULT_MASK	GENMASK(15, 0)
+#define MA35D1_EADC_DAT_RESULT_12BIT	GENMASK(11, 0)
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
+	struct regulator *vref;
+	struct completion completion;
+	/* Protect conversion state and register accesses from PM transitions. */
+	struct mutex lock;
+	const struct iio_chan_spec *scan_chan;
+	unsigned int vref_mV;
+	int irq;
+	bool suspended;
+};
+
+static const struct regmap_config ma35d1_adc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MA35D1_EADC_REFADJCTL,
+	.cache_type = REGCACHE_NONE,
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
+	if (adc->vref) {
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
+					1, USEC_PER_MSEC);
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
+	ma35d1_adc_hw_disable(data);
+}
+
+static void ma35d1_adc_vref_disable(void *data)
+{
+	regulator_disable(data);
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
+					    chan->address));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(map, MA35D1_EADC_INTSRC0,
+				  MA35D1_EADC_INTSRC0_MASK,
+				  MA35D1_EADC_INTSRC0_SPLIEN0);
+}
+
+static int ma35d1_adc_abort_conversion(struct ma35d1_adc *adc)
+{
+	struct regmap *map = adc->regmap;
+	int ret;
+	int err;
+
+	ret = ma35d1_adc_disable_irq(adc);
+
+	/*
+	 * Reset the EADC control circuits to terminate a conversion which may
+	 * still be in progress. EADCRST is cleared automatically by hardware
+	 * when the reset completes and the EADC register values are preserved.
+	 */
+	err = ma35d1_adc_reset_control(adc);
+	if (!ret)
+		ret = err;
+
+	/* Drain an interrupt which may already have been latched by the GIC. */
+	synchronize_irq(adc->irq);
+
+	err = regmap_write(map, MA35D1_EADC_STATUS2,
+			   MA35D1_EADC_STATUS2_ADIF0);
+	if (!ret)
+		ret = err;
+
+	reinit_completion(&adc->completion);
+
+	return ret;
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
+		ret = ma35d1_adc_abort_conversion(adc);
+		return ret ?: -ETIMEDOUT;
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
+	*raw = FIELD_GET(MA35D1_EADC_DAT_RESULT_MASK, val);
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
+	unsigned int status;
+	int ret;
+
+	ret = regmap_read(adc->regmap, MA35D1_EADC_STATUS2, &status);
+	if (ret || !(status & MA35D1_EADC_STATUS2_ADIF0))
+		return IRQ_NONE;
+
+	regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
+		     MA35D1_EADC_STATUS2_ADIF0);
+	complete(&adc->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_adc_sign_extend(u16 raw)
+{
+	return sign_extend32(raw & MA35D1_EADC_DAT_RESULT_12BIT, 11);
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
+
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
+			return -EBUSY;
+
+		guard(mutex)(&adc->lock);
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
+			*val = raw & MA35D1_EADC_DAT_RESULT_12BIT;
+
+		return IIO_VAL_INT;
+	}
+	case IIO_CHAN_INFO_SCALE:
+		*val = adc->vref_mV;
+		/* Differential mode has a VREF / 2048 LSB; single-ended uses /4096. */
+		*val2 = chan->differential ? 11 : 12;
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
+	const struct iio_chan_spec *scan_chan = NULL;
+	unsigned long bit;
+
+	for_each_set_bit(bit, scan_mask, iio_get_masklength(indio_dev)) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[bit];
+
+		if (chan->type == IIO_TIMESTAMP)
+			continue;
+
+		if (chan->type != IIO_VOLTAGE || scan_chan)
+			return -EINVAL;
+
+		scan_chan = chan;
+	}
+
+	if (!scan_chan)
+		return -EINVAL;
+
+	adc->scan_chan = scan_chan;
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
+	return adc->scan_chan ? 0 : -EINVAL;
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
+static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ma35d1_adc *adc = iio_priv(indio_dev);
+	IIO_DECLARE_BUFFER_WITH_TS(u16, scan, 1) = { };
+	u16 raw;
+	int ret;
+
+	mutex_lock(&adc->lock);
+
+	if (!adc->suspended && adc->scan_chan) {
+		ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &raw);
+		if (!ret) {
+			scan[0] = raw & MA35D1_EADC_DAT_RESULT_12BIT;
+			iio_push_to_buffers_with_ts(indio_dev, scan, sizeof(scan),
+						    pf->timestamp);
+		}
+	}
+
+	mutex_unlock(&adc->lock);
+
+	iio_trigger_notify_done(indio_dev->trig);
+
+	return IRQ_HANDLED;
+}
+
+static const struct iio_buffer_setup_ops ma35d1_adc_buffer_ops = {
+	.postenable = ma35d1_adc_buffer_postenable,
+	.predisable = ma35d1_adc_buffer_predisable,
+};
+
+static int ma35d1_adc_fwnode_xlate(struct iio_dev *indio_dev,
+				   const struct fwnode_reference_args *iiospec)
+{
+	unsigned int i;
+
+	if (iiospec->nargs != 1)
+		return -EINVAL;
+
+	for (i = 0; i < indio_dev->num_channels; i++) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[i];
+
+		if (chan->type == IIO_VOLTAGE &&
+		    chan->channel == iiospec->args[0])
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
+static void ma35d1_adc_init_channel(struct iio_chan_spec *chan, u32 index,
+				    u32 vinp, u32 vinn,
+				    unsigned int scan_index,
+				    bool differential)
+{
+	chan->type = IIO_VOLTAGE;
+	chan->indexed = 1;
+	chan->channel = index;
+	chan->address = vinp;
+	chan->scan_index = scan_index;
+	chan->info_mask_separate =
+		BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE);
+	chan->scan_type.format = differential ? IIO_SCAN_FORMAT_SIGNED_INT :
+					      IIO_SCAN_FORMAT_UNSIGNED_INT;
+	chan->scan_type.realbits = 12;
+	chan->scan_type.storagebits = 16;
+	chan->scan_type.endianness = IIO_CPU;
+
+	if (differential) {
+		chan->differential = 1;
+		chan->channel2 = vinn;
+	}
+}
+
+static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
+				     struct device *dev)
+{
+	DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
+	struct iio_chan_spec *channels;
+	unsigned int scan_index;
+	int num_channels;
+	int ret;
+
+	bitmap_zero(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
+
+	num_channels = device_get_child_node_count(dev);
+	if (!num_channels)
+		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
+
+	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
+		return dev_err_probe(dev, -EINVAL, "too many ADC channels\n");
+
+	channels = devm_kcalloc(dev, size_add(num_channels, 1),
+				sizeof(*channels), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	scan_index = 0;
+	device_for_each_child_node_scoped(dev, child) {
+		bool differential;
+		u32 reg;
+		u32 vinp;
+		u32 vinn;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "missing channel reg property\n");
+
+		if (reg >= MA35D1_EADC_MAX_EXT_CHANNELS)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid ADC channel index %u\n", reg);
+
+		if (test_and_set_bit(reg, used_regs))
+			return dev_err_probe(dev, -EINVAL,
+					     "duplicate ADC channel index %u\n", reg);
+
+		if (fwnode_property_present(child, "single-channel")) {
+			ret = fwnode_property_read_u32(child, "single-channel",
+						       &vinp);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid single-channel for index %u\n",
+						     reg);
+
+			if (vinp >= MA35D1_EADC_MAX_EXT_CHANNELS)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid ADC input %u\n", vinp);
+
+			vinn = 0;
+			differential = false;
+		} else {
+			if (reg >= 4)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid differential pair %u\n", reg);
+
+			vinp = reg;
+			vinn = reg + 4;
+			differential = true;
+		}
+
+		ma35d1_adc_init_channel(&channels[scan_index], reg, vinp, vinn,
+					scan_index, differential);
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
+	adc->vref = devm_regulator_get_optional(dev, "vref");
+	ret = PTR_ERR_OR_ZERO(adc->vref);
+	if (ret == -ENODEV) {
+		adc->vref = NULL;
+		adc->vref_mV = MA35D1_EADC_INTERNAL_VREF_mV;
+		return 0;
+	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get VREF supply\n");
+
+	ret = regulator_enable(adc->vref);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable VREF supply\n");
+
+	ret = devm_add_action_or_reset(dev, ma35d1_adc_vref_disable, adc->vref);
+	if (ret)
+		return ret;
+
+	ret = regulator_get_voltage(adc->vref);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -EINVAL,
+				     "failed to get VREF voltage\n");
+
+	adc->vref_mV = ret / (MICRO / MILLI);
+
+	return 0;
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
+	adc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(adc->clk))
+		return dev_err_probe(dev, PTR_ERR(adc->clk),
+				     "failed to get and enable ADC clock\n");
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
+	adc->irq = platform_get_irq_byname(pdev, "adint0");
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
+	ret = regmap_clear_bits(adc->regmap, MA35D1_EADC_CTL,
+				MA35D1_EADC_CTL_ADCEN);
+	if (ret)
+		goto resume_triggering;
+
+	adc->suspended = true;
+	clk_disable_unprepare(adc->clk);
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
+	ret = ma35d1_adc_hw_init(adc);
+	if (ret) {
+		clk_disable_unprepare(adc->clk);
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


