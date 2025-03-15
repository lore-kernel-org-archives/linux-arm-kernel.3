Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57D3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLADOhZLwHgDJvwkej1GksyyIBUmhIAfbT2mkxjXrtg=; b=GbKFLpcmzO55UrWXg6261LGTRT
	aCFQpxn5nT6xDUC1I0evrxO6JjmZXAQZR3FvXlA0QCBUplJw5vp73bffd1yxVVj6xCPzOXVOushFP
	Aa872lM1KMM3YpiQizSfIZE/BfcDQuCvlVygEAlsbMABn4KPtIZvQeGNc79T7OTVnFf7qNOL8DIQ3
	Votym+86s58nF/xUQbco/aD9/TTF+bWJx/q7q85Z40zxxmNt+x7Tytrfdof/CyCHE/FY0wePUwNuq
	zkkAkit4RstIWK+ygfAAzxRLaiKU/KVtg8YtWXiTUREn8xk/+xzvoDRUOJfvP+OPoqtTZoOsvmtW+
	HYt+hUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttU2M-0000000GZgo-3M8R;
	Sat, 15 Mar 2025 16:06:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTh7-0000000GX6i-2FaP;
	Sat, 15 Mar 2025 15:45:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so7250005e9.3;
        Sat, 15 Mar 2025 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053500; x=1742658300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLADOhZLwHgDJvwkej1GksyyIBUmhIAfbT2mkxjXrtg=;
        b=EYCWU8CwpirwQjIh/u5OygbQ2XK1wEt4V3VUObZBMdmxQiqXhmbd/OgKcYSM2//caJ
         7sA3EvplkDAU2l4bmie7rtMlkxkxVwrTgU51N6MqdRP9u3t5oSfS0E0tXwAkfi/ONdpt
         CUO7eD9V3ytV4vhLHowi/qR1VMpUn6v4P9jX8bsU0NNy0+KagOXp/NYgE/lgbmzfEcH+
         vqib1Q1rh+U5ELUWjkpgHC7kxXWPo7PROdD7AR9tka9b05AM7NBnUKXvOWkGpi7cCPGx
         HYgwbMvPhelRcrjhVqWMMPD+DtTB+FpNtiqoaZ1g5dhKhgz8cpql/hd1E+wD/xCs4okF
         +rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053500; x=1742658300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLADOhZLwHgDJvwkej1GksyyIBUmhIAfbT2mkxjXrtg=;
        b=HKJDYazrMA8rzCBZ+QW0zKKUQKQR1URtn+YBC42AJBhIs91DRZKopC03xyh+k94uDl
         fv4NV9pjcWHwIKk3VUdnphPS0ykwByXrmonz+wxlMev2Irf8LtvHYv5u5ibca4Oo0Keo
         rhFf+lehxuUIK/xNLPoHsXkr8wgU5j991Mt0xbnN3xG5M7RkH6swJ6GX+XlMwxClW4P9
         5SZqfnNe28paAPVlSGYlkUDyZXCJX1IRiXotUbPBc+L+bLp5V3B2hC5ILrnKtCJ0x6zD
         DLS1kquU28zmWkNEGlYusWnN+Ifth/QCetuvSouI6MqdmbMO7G41GazoEELh4ThIad+I
         6c7g==
X-Forwarded-Encrypted: i=1; AJvYcCVzVp3LpwcVGID5YOMkrzitnCB4LvJxqlCgDT9/7ZUD7JJkUNeG+zddgMYYaNeE0ySs3xPWYbeNqDaTc8/fmgo=@lists.infradead.org, AJvYcCVzYpjXZzd8BkzsFqo2zudyPudrC2kV5XfzE2fK7X3AwaghZB3516J8zspnskVfYBIzeBxvKmpLfIbgkAyHlQv0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DN7SZlKdZ+oAjP4rlszlo8aMpixpQYlm2dInaR6oytyYuRgu
	fDOnw3vwvBto2eFD9i1VQ46XEx/ONlacAfIGaTO7Zxl31BFFpdw4
X-Gm-Gg: ASbGncv1T/aRFfYysQqqTCzyl9r5jQKtvzLwT6lSqiKghoF+b7x0GCLiHxZD3USDM61
	12K8fNdy5Cb1I++wnn7q4pEaQ/hcTA/seNW+pnLPjAzXI//958uZnwm550evR1pVhJMoFbGLt8I
	anZ0HlVP7SMW3MrRgbJYN1Hys+ZTL3uxnxeR71P5XTl3H3OpWtgpUnNjDH8CvaaZBsB6YRaYCYy
	PBK/4Iz4kP/HE9Mi5pVnQPDuxM1sQIcrSEYGDzNbPWONdDQQUx44qvJeHLRLou+ES6U2qPQFbQO
	T/CZ92tNmAgL9v4uWMIpqwzQg3QrA9W3eZjD1Ay5rst1/RgbYDeWMumOzcH6UpFoo7vhVox9A9X
	nTOpbEQ5nuLKcWA==
X-Google-Smtp-Source: AGHT+IHw40EB6m3XbCZVxnXK0drFuLtBU4zju5WbN9CNTainjG2Tg6Im/75POmqbfCbDd2b7v424dg==
X-Received: by 2002:a05:600c:358c:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43d1ecc31admr77024235e9.20.1742053499835;
        Sat, 15 Mar 2025 08:44:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 12/14] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Sat, 15 Mar 2025 16:43:52 +0100
Message-ID: <20250315154407.26304-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084501_623241_27ABFECC 
X-CRM114-Status: GOOD (  21.97  )
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

Add support for Airoha AN8855 Switch EFUSE. These EFUSE might be used
for calibration data for the internal switch PHYs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                  |  1 +
 drivers/nvmem/Kconfig        | 11 +++++++
 drivers/nvmem/Makefile       |  2 ++
 drivers/nvmem/an8855-efuse.c | 63 ++++++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 drivers/nvmem/an8855-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f4c8054d3980..2cc8871186d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -732,6 +732,7 @@ F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 F:	drivers/mfd/airoha-an8855.c
 F:	drivers/net/mdio/mdio-an8855.c
+F:	drivers/nvmem/an8855-efuse.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b9..ca96c6ea685a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -28,6 +28,17 @@ source "drivers/nvmem/layouts/Kconfig"
 
 # Devices
 
+config NVMEM_AN8855_EFUSE
+	tristate "Airoha AN8855 eFuse support"
+	depends on MFD_AIROHA_AN8855 || COMPILE_TEST
+	help
+	  Say y here to enable support for reading eFuses on Airoha AN8855
+	  Switch. These are e.g. used to store factory programmed
+	  calibration data required for the PHY.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-an8855-efuse.
+
 config NVMEM_APPLE_EFUSES
 	tristate "Apple eFuse support"
 	depends on ARCH_APPLE || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488b..c732132c0e45 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -10,6 +10,8 @@ nvmem_layouts-y			:= layouts.o
 obj-y				+= layouts/
 
 # Devices
+obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+= nvmem-an8855-efuse.o
+nvmem-an8855-efuse-y 			:= an8855-efuse.o
 obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
diff --git a/drivers/nvmem/an8855-efuse.c b/drivers/nvmem/an8855-efuse.c
new file mode 100644
index 000000000000..cd1564379098
--- /dev/null
+++ b/drivers/nvmem/an8855-efuse.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Airoha AN8855 Switch EFUSE Driver
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define AN8855_EFUSE_CELL		50
+
+#define AN8855_EFUSE_DATA0		0x1000a500
+#define   AN8855_EFUSE_R50O		GENMASK(30, 24)
+
+static int an8855_efuse_read(void *context, unsigned int offset,
+			     void *val, size_t bytes)
+{
+	struct regmap *regmap = context;
+
+	return regmap_bulk_read(regmap, AN8855_EFUSE_DATA0 + offset,
+				val, bytes / sizeof(u32));
+}
+
+static int an8855_efuse_probe(struct platform_device *pdev)
+{
+	struct nvmem_config an8855_nvmem_config = {
+		.name = "an8855-efuse",
+		.size = AN8855_EFUSE_CELL * sizeof(u32),
+		.stride = sizeof(u32),
+		.word_size = sizeof(u32),
+		.reg_read = an8855_efuse_read,
+	};
+	struct device *dev = &pdev->dev;
+	struct nvmem_device *nvmem;
+
+	/* Assign NVMEM priv to MFD regmap */
+	an8855_nvmem_config.priv = dev_get_regmap(dev->parent, "switch");
+	an8855_nvmem_config.dev = dev;
+	nvmem = devm_nvmem_register(dev, &an8855_nvmem_config);
+
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id an8855_efuse_of_match[] = {
+	{ .compatible = "airoha,an8855-efuse", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_efuse_of_match);
+
+static struct platform_driver an8855_efuse_driver = {
+	.probe = an8855_efuse_probe,
+	.driver = {
+		.name = "an8855-efuse",
+		.of_match_table = an8855_efuse_of_match,
+	},
+};
+module_platform_driver(an8855_efuse_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for AN8855 Switch EFUSE");
+MODULE_LICENSE("GPL");
-- 
2.48.1


