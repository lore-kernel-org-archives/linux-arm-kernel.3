Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9729C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuMi2nIWHsKlu1mivKx7SMlMkzxqcl0xL49MUGDd3Qc=; b=22PwcQoaD6l6FUENDhh5aiBnRF
	6Q4/RMMbXOwv6+PhJv2elRPHkoGTHzLoiSmIs/IdaCTnb0yLMbCo2EU4p9WDKDjJyZ6Pp5fxxt0nt
	sakvPA3qX4f8y5f0G6z4qR+aWq5AmQMfxfzy/dQ/Z86utXMTpRfwA317mxrIa07/hfYXemc7kt+tj
	pkI2hx10li0lhSpmxGcnXaNNcDj2h8t7uix5f1iWmXGWs9bWKbzmYBwlBk27Wm2Gwq/hO0qNs51nL
	DdG4ryFEHrGZO70odqLl9Xk8wc00X8NRX+Ya/oZ7uV5tSk6EayQdhIPoIXrDDAaIufHl22GOVztZI
	sbQBOKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUj-0000000BFSe-1Lf4;
	Thu, 30 Jul 2026 19:32:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUf-0000000BFRV-2wAf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Jul 2026 19:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PuMi2nIWHsKlu1mivKx7SMlMkzxqcl0xL49MUGDd3Qc=; b=ktuqQQrD3BC1VNr77rcQkX5t73
	VS/LmHErvsCOe98L1VMo7WvG6bhdy/yTCkiymqqrOq90KoO56qCLGa74queGVGI+duKXxfVz74veS
	/FxLN8SoWZOqYenFIr7hua8G+v1ro2g7mLqjQeYxwotVstN/onBtKAHllydMwZkLY4tXa1kHwfvS5
	ihLfq9b4s5ZL0zoArOL9vZKIbqj0OGGj/ouwRdrIl0uYuPPReQzhAnoiYolb6xTltQX4C8CXdK93W
	XZPXj+f5IAmmUqBWw2udvVMEIv2cNP89z2t35P2YiTb9xzIckVlojR0Ty5AMHLh8RGj4BCxB0VkUn
	T0/s8sFA==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUc-00000003les-1P21
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:32:36 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7629B84A2E;
	Thu, 30 Jul 2026 21:32:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwkS04LOjMHy; Thu, 30 Jul 2026 21:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785439932; bh=7L2ejw0xtm7swpPJZwVGSBP6gmcPcH2N4Pa44Th2vWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NZxMNGhat2uWmCSSr+2ZREj7wHeTZ0Y7Mf6eQ8+ToWj9WKEbt2HeC7eyetpgXMgw/
	 /qgooDx6FBKI4M3QR6vNh6zCni4V3eXTLfQr019L/XRxl+QQhPMFO7l8YjbZg+4gj4
	 xScUwnMrEURm5ok5+5Ox5FCMaTG+lBOrFTQ+Sduyn5DLJ6GeVnSfKY7N8eOkV73QSH
	 ax9t7hDCdaRH4oHzLSM/qkiF4qmmLFkswl5gLKNmEuLYEjSqzD/my0CJz2r2T3Ct17
	 UbKz+3rIOfxE3Q+xzRWRQjmzv/2Rr7minj8RwyICj4aHHHhxnWwyJ35SqKwJPeRSHO
	 spL1LyiXarMyA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:01:30 +0530
Subject: [PATCH v2 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
References: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
In-Reply-To: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_203234_569340_512BFCEA 
X-CRM114-Status: GOOD (  23.44  )
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

The GP2AP070S is a proximity sensor designed and manufactured by Sharp
Corporation. This sensor is used in mobile devices, including, but not
limited to - the Samsung Galaxy J6.

The driver has been adopted from Samsung's downstream kernel
implementation [1]. Due to the lack of public documentation about the
schematics of this device. The downstream driver acts as the secondary
source of information. Driver clarity has also been improved with the
help of the GP2AP* drivers in iio/light.

Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/blob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/iio/proximity/Kconfig     |  11 +
 drivers/iio/proximity/Makefile    |   1 +
 drivers/iio/proximity/gp2ap070s.c | 502 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 514 insertions(+)

diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
index bb77fad2a1b3..3f30ebfc21bc 100644
--- a/drivers/iio/proximity/Kconfig
+++ b/drivers/iio/proximity/Kconfig
@@ -41,6 +41,17 @@ config D3323AA
 	  To compile this driver as a module, choose M here: the module will be
 	  called d3323aa.
 
+config GP2AP070S
+	tristate "Sharp GP2AP070S proximity sensor"
+	select REGMAP_I2C
+	depends on I2C
+	help
+	  Say Y here to build a driver for the Sharp GP2AP070S proximity
+	  sensor.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called gp2ap070s.
+
 config HX9023S
 	tristate "TYHX HX9023S SAR sensor"
 	select IIO_BUFFER
diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
index 4352833dd8a4..627ffb04acb2 100644
--- a/drivers/iio/proximity/Makefile
+++ b/drivers/iio/proximity/Makefile
@@ -7,6 +7,7 @@
 obj-$(CONFIG_AS3935)		+= as3935.o
 obj-$(CONFIG_CROS_EC_MKBP_PROXIMITY) += cros_ec_mkbp_proximity.o
 obj-$(CONFIG_D3323AA)		+= d3323aa.o
+obj-$(CONFIG_GP2AP070S)		+= gp2ap070s.o
 obj-$(CONFIG_HX9023S)		+= hx9023s.o
 obj-$(CONFIG_IRSD200)		+= irsd200.o
 obj-$(CONFIG_ISL29501)		+= isl29501.o
diff --git a/drivers/iio/proximity/gp2ap070s.c b/drivers/iio/proximity/gp2ap070s.c
new file mode 100644
index 000000000000..9625f53d956e
--- /dev/null
+++ b/drivers/iio/proximity/gp2ap070s.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * IIO driver for Sharp GP2AP070S proximity sensor.
+ *
+ * Copyright (C) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
+ */
+
+#include <linux/i2c.h>
+#include <linux/iio/events.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/types.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define GP2AP070S_REG_COM1		0x80
+#define GP2AP070S_REG_COM2		0x81
+#define GP2AP070S_REG_COM3		0x82
+#define GP2AP070S_REG_COM4		0x83
+#define GP2AP070S_REG_PS1		0x85
+#define GP2AP070S_REG_PS2		0x86
+#define GP2AP070S_REG_PS3		0x87
+#define GP2AP070S_REG_PS_THD_LO_LE16	0x88
+#define GP2AP070S_REG_PS_THD_HI_LE16	0x8a
+#define GP2AP070S_REG_OS_D0_LE16	0x8c
+#define GP2AP070S_REG_D0_LE16		0x90
+
+/* GP2AP070S_REG_COM1 */
+#define GP2AP070S_VAL_COM1_WKUP		BIT(7)
+#define GP2AP070S_VAL_COM1_EN		BIT(5)
+
+/* GP2AP070S_REG_COM3 */
+#define GP2AP070S_VAL_COM3_INT_PULSE	BIT(1)
+
+/* GP2AP070S_REG_COM4 */
+#define GP2AP070S_VAL_COM1_BLINK	GENMASK(2, 0)	/* LED Blink Interval */
+
+#define GP2AP070S_VAL_COM1_BLINK_0ms	0
+#define GP2AP070S_VAL_COM1_BLINK_2ms	1
+#define GP2AP070S_VAL_COM1_BLINK_8ms	2
+#define GP2AP070S_VAL_COM1_BLINK_33ms	3
+#define GP2AP070S_VAL_COM1_BLINK_66ms	4
+#define GP2AP070S_VAL_COM1_BLINK_131ms	5
+#define GP2AP070S_VAL_COM1_BLINK_262ms	6
+#define GP2AP070S_VAL_COM1_BLINK_524ms	7
+
+/* GP2AP070S_REG_PS1 */
+#define GP2AP070S_VAL_PS1_RESOL		GENMASK(5, 4)	/* Resolution */
+
+#define GP2AP070S_VAL_PS1_RESOL_14ms	0
+#define GP2AP070S_VAL_PS1_RESOL_12ms	1
+#define GP2AP070S_VAL_PS1_RESOL_10ms	2
+#define GP2AP070S_VAL_PS1_RESOL_8ms	3
+
+/* GP2AP070S_REG_PS2 */
+#define GP2AP070S_VAL_PS2_IOUT		GENMASK(6, 4)	/* Current Output */
+#define GP2AP070S_VAL_PS2_SUM32		BIT(2)
+
+#define GP2AP070S_VAL_PS2_IOUT_0mA	0
+#define GP2AP070S_VAL_PS2_IOUT_24mA	1
+#define GP2AP070S_VAL_PS2_IOUT_89mA	2
+#define GP2AP070S_VAL_PS2_IOUT_130mA	3
+#define GP2AP070S_VAL_PS2_IOUT_190mA	4
+
+/* GP2AP070S_REG_PS3 */
+#define GP2AP070S_VAL_PS3_PRST		GENMASK(6, 4)	/* Repeating Measurements */
+
+struct gp2ap070s_drvdata {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regulator_bulk_data *regulators;
+	u32 near_level;
+};
+
+static const struct regmap_config gp2ap070s_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const char *const gp2ap070s_regulator_names[] = {
+	"vdd",
+	"vled",
+};
+
+static ssize_t gp2ap070s_iio_read_near_level(struct iio_dev *indio_dev,
+					     uintptr_t priv,
+					     const struct iio_chan_spec *chan,
+					     char *buf)
+{
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+
+	return sprintf(buf, "%u\n", drvdata->near_level);
+}
+
+static const struct iio_chan_spec_ext_info gp2ap070s_iio_chan_spec_ext_info[] = {
+	{
+		.name = "nearlevel",
+		.shared = IIO_SEPARATE,
+		.read = gp2ap070s_iio_read_near_level,
+	},
+	{ /* sentinel */ }
+};
+
+static const struct iio_event_spec gp2ap070s_iio_event_spec[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_EITHER,
+		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
+static const struct iio_chan_spec gp2ap070s_iio_chan_spec[] = {
+	{
+		.type = IIO_PROXIMITY,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.ext_info = gp2ap070s_iio_chan_spec_ext_info,
+		.event_spec = gp2ap070s_iio_event_spec,
+		.num_event_specs = ARRAY_SIZE(gp2ap070s_iio_event_spec),
+	},
+};
+
+static int gp2ap070s_iio_read_raw(struct iio_dev *indio_dev,
+				  struct iio_chan_spec const *chan, int *val,
+				  int *val2, long mask)
+{
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+	__le16 value;
+	int ret;
+
+	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_D0_LE16, &value,
+			      sizeof(value));
+	if (ret)
+		return ret;
+
+	*val = le16_to_cpu(value);
+	return IIO_VAL_INT;
+}
+
+static int gp2ap070s_iio_read_event_value(struct iio_dev *indio_dev,
+					  const struct iio_chan_spec *chan,
+					  enum iio_event_type type,
+					  enum iio_event_direction dir,
+					  enum iio_event_info info, int *val,
+					  int *val2)
+{
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+	__le16 value;
+	int ret;
+
+	if (type != IIO_EV_TYPE_THRESH || info != IIO_EV_INFO_VALUE)
+		return -EINVAL;
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		ret = regmap_raw_read(drvdata->regmap,
+				      GP2AP070S_REG_PS_THD_HI_LE16, &value,
+				      sizeof(value));
+		if (ret)
+			return ret;
+
+		*val = le16_to_cpu(value);
+		return IIO_VAL_INT;
+	case IIO_EV_DIR_FALLING:
+		ret = regmap_raw_read(drvdata->regmap,
+				      GP2AP070S_REG_PS_THD_LO_LE16, &value,
+				      sizeof(value));
+		if (ret)
+			return ret;
+
+		*val = le16_to_cpu(value);
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int gp2ap070s_iio_write_event_value(struct iio_dev *indio_dev,
+					   const struct iio_chan_spec *chan,
+					   enum iio_event_type type,
+					   enum iio_event_direction dir,
+					   enum iio_event_info info, int val,
+					   int val2)
+{
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+	__le16 value;
+	u16 threshold_other;
+	int ret;
+
+	if (type != IIO_EV_TYPE_THRESH || info != IIO_EV_INFO_VALUE)
+		return -EINVAL;
+
+	switch (dir) {
+	case IIO_EV_DIR_RISING:
+		ret = regmap_raw_read(drvdata->regmap,
+				      GP2AP070S_REG_PS_THD_LO_LE16, &value,
+				      sizeof(value));
+		if (ret)
+			return ret;
+
+		/* Ensure lo_threshold < hi_threshold */
+		threshold_other = le16_to_cpu(value);
+		if (threshold_other >= val)
+			return -EINVAL;
+
+		value = cpu_to_le16((u16)val);
+		ret = regmap_raw_write(drvdata->regmap,
+				       GP2AP070S_REG_PS_THD_HI_LE16, &value,
+				       sizeof(value));
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	case IIO_EV_DIR_FALLING:
+		ret = regmap_raw_read(drvdata->regmap,
+				      GP2AP070S_REG_PS_THD_HI_LE16, &value,
+				      sizeof(value));
+		if (ret)
+			return ret;
+
+		/* Ensure hi_threshold > lo_threshold */
+		threshold_other = le16_to_cpu(value);
+		if (threshold_other <= val)
+			return -EINVAL;
+
+		value = cpu_to_le16((u16)val);
+		ret = regmap_raw_write(drvdata->regmap,
+				       GP2AP070S_REG_PS_THD_LO_LE16, &value,
+				       sizeof(value));
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int gp2ap070s_read_event_config(struct iio_dev *indio_dev,
+				       const struct iio_chan_spec *chan,
+				       enum iio_event_type type,
+				       enum iio_event_direction dir)
+{
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+	unsigned int value;
+	int ret;
+
+	if (type != IIO_EV_TYPE_THRESH)
+		return -EINVAL;
+
+	switch (dir) {
+	case IIO_EV_DIR_EITHER:
+		ret = regmap_read(drvdata->regmap, GP2AP070S_REG_COM3, &value);
+		if (ret)
+			return ret;
+
+		return !!(value & GP2AP070S_VAL_COM3_INT_PULSE);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gp2ap070s_write_event_config(struct iio_dev *indio_dev,
+					const struct iio_chan_spec *chan,
+					enum iio_event_type type,
+					enum iio_event_direction dir,
+					bool state)
+{
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+	int ret;
+
+	if (type != IIO_EV_TYPE_THRESH)
+		return -EINVAL;
+
+	switch (dir) {
+	case IIO_EV_DIR_EITHER:
+		if (state)
+			ret = regmap_set_bits(drvdata->regmap,
+					      GP2AP070S_REG_COM3,
+					      GP2AP070S_VAL_COM3_INT_PULSE);
+		else
+			ret = regmap_clear_bits(drvdata->regmap,
+						GP2AP070S_REG_COM3,
+						GP2AP070S_VAL_COM3_INT_PULSE);
+		if (ret)
+			return ret;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct iio_info gp2ap070s_iio_info = {
+	.read_raw = gp2ap070s_iio_read_raw,
+	.read_event_value = gp2ap070s_iio_read_event_value,
+	.write_event_value = gp2ap070s_iio_write_event_value,
+	.read_event_config = gp2ap070s_read_event_config,
+	.write_event_config = gp2ap070s_write_event_config,
+};
+
+static irqreturn_t gp2ap070s_irq_handler(int irq, void *private)
+{
+	struct iio_dev *indio_dev = private;
+	struct gp2ap070s_drvdata *drvdata = iio_priv(indio_dev);
+	struct device *dev = drvdata->dev;
+	u16 threshold_lo, threshold_hi, distance;
+	__le16 value;
+	int ret;
+
+	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_LO_LE16,
+			      &value, sizeof(value));
+	if (ret) {
+		dev_err(dev, "Failed to read low threshold value (%d)\n", ret);
+		return IRQ_HANDLED;
+	}
+
+	threshold_lo = __le16_to_cpu(value);
+
+	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_HI_LE16,
+			      &value, sizeof(value));
+	if (ret) {
+		dev_err(dev, "Failed to read high threshold value (%d)\n", ret);
+		return IRQ_HANDLED;
+	}
+
+	threshold_hi = __le16_to_cpu(value);
+
+	ret = regmap_raw_read(drvdata->regmap, GP2AP070S_REG_D0_LE16, &value,
+			      sizeof(value));
+	if (ret) {
+		dev_err(dev, "Failed to read proximity distance (%d)\n", ret);
+		return IRQ_HANDLED;
+	}
+
+	distance = __le16_to_cpu(value);
+
+	if (distance >= threshold_hi) {
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_RISING),
+			       iio_get_time_ns(indio_dev));
+	} else if (distance <= threshold_lo) {
+		iio_push_event(indio_dev,
+			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_FALLING),
+			       iio_get_time_ns(indio_dev));
+	} else {
+		/*
+		 * If none match, then it's stuck in the threshold band gap.
+		 * The hardware generally does not issue interrupts here.
+		 */
+		WARN_ONCE(true, "spurious interrupt issued in proximity threshold gap\n");
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int gp2ap070s_probe_hw_register(struct gp2ap070s_drvdata *drvdata)
+{
+	struct device *dev = drvdata->dev;
+	int ret;
+
+	ret = regmap_clear_bits(drvdata->regmap, GP2AP070S_REG_COM1, ~0);
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to reset sensor\n");
+
+	ret = regmap_clear_bits(drvdata->regmap, GP2AP070S_REG_COM2, ~0);
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to unmask interrupts\n");
+
+	ret = regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM3,
+			      GP2AP070S_VAL_COM3_INT_PULSE);
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to enable interrupt\n");
+
+	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_COM4,
+				GP2AP070S_VAL_COM1_BLINK,
+				FIELD_PREP_CONST(GP2AP070S_VAL_COM1_BLINK,
+						 GP2AP070S_VAL_COM1_BLINK_33ms));
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to set LED blink timing\n");
+
+	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_PS1,
+				GP2AP070S_VAL_PS1_RESOL,
+				FIELD_PREP_CONST(GP2AP070S_VAL_PS1_RESOL,
+						 GP2AP070S_VAL_PS1_RESOL_10ms));
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to set resolution\n");
+
+	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_PS2,
+				GP2AP070S_VAL_PS2_IOUT | GP2AP070S_VAL_PS2_SUM32,
+				FIELD_PREP_CONST(GP2AP070S_VAL_PS2_IOUT,
+						 GP2AP070S_VAL_PS2_IOUT_89mA) |
+				GP2AP070S_VAL_PS2_SUM32);
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to set current output\n");
+
+	ret = regmap_write_bits(drvdata->regmap, GP2AP070S_REG_PS3,
+				GP2AP070S_VAL_PS3_PRST,
+				FIELD_PREP_CONST(GP2AP070S_VAL_PS3_PRST, 3));
+	if (ret)
+		return dev_err_probe(drvdata->dev, ret, "Failed to set measurement repetitions\n");
+
+	ret = regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM1,
+			      GP2AP070S_VAL_COM1_WKUP | GP2AP070S_VAL_COM1_EN);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable sensor\n");
+
+	return 0;
+}
+
+static int gp2ap070s_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct iio_dev *indio_dev;
+	struct gp2ap070s_drvdata *drvdata;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*drvdata));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	drvdata = iio_priv(indio_dev);
+	i2c_set_clientdata(client, drvdata);
+
+	drvdata->dev = dev;
+	drvdata->regmap = devm_regmap_init_i2c(client, &gp2ap070s_regmap_config);
+	if (IS_ERR(drvdata->regmap))
+		return dev_err_probe(dev, PTR_ERR(drvdata->regmap), "Failed to create regmap\n");
+
+	ret = devm_regulator_bulk_get_enable(dev,
+					     ARRAY_SIZE(gp2ap070s_regulator_names),
+					     gp2ap070s_regulator_names);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get and enable regulators");
+
+	usleep_range(10000, 11000);
+
+	indio_dev->name = "gp2ap070s";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = gp2ap070s_iio_chan_spec;
+	indio_dev->num_channels = ARRAY_SIZE(gp2ap070s_iio_chan_spec);
+	indio_dev->info = &gp2ap070s_iio_info;
+
+	device_property_read_u32(&client->dev, "proximity-near-level",
+				 &drvdata->near_level);
+
+	ret = gp2ap070s_probe_hw_register(drvdata);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					gp2ap070s_irq_handler, IRQF_ONESHOT,
+					"gp2ap070s-irq", indio_dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ");
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct of_device_id gp2ap070s_of_device_id[] = {
+	{ .compatible = "sharp,gp2ap070s" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, gp2ap070s_of_device_id);
+
+static const struct i2c_device_id gp2ap070s_i2c_device_id[] = {
+	{ .name = "gp2ap070s" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, gp2ap070s_i2c_device_id);
+
+static struct i2c_driver gp2ap070s_i2c_driver = {
+	.driver = {
+		.name = "gp2ap070s",
+		.of_match_table = gp2ap070s_of_device_id,
+	},
+	.probe = gp2ap070s_probe,
+	.id_table = gp2ap070s_i2c_device_id,
+};
+module_i2c_driver(gp2ap070s_i2c_driver);
+
+MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
+MODULE_DESCRIPTION("Sharp GP2AP070S Proximity Sensor");
+MODULE_LICENSE("GPL");

-- 
2.54.0


