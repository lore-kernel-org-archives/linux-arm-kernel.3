Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4393C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6eFHR/+HwP+QVEyAdkJj9R1VCVx1cbNXlZ7PvgU5mg=; b=hpbw+pRCsxWTmJQsy+qP6s3zGX
	XkpjqvYuxra/BHnGf9u9oim2CmtzDwkquz9y4EPWVFPiD6IC1rpvje/SpWap2cIJUbJaDfDBJ1mbz
	YxLjDZeUICJ0h0OkjK+VVV+jSom/KSXpeKeU75QmZMcAGOMAtJtDbeVM9yBg6l8s6wklJyelF2TX2
	D8zh0pucKfKauxiJRvuO2LowBTITGF2riw+9RpxteAySwGLxFddRX3/RzNF2de/DTzsyxtAbXymOA
	kNWawQOQL6+dn85aE2QdsXoYmoWpwO9pJYghPqYjloTI/Mf9evWLjUqlATI4q94OyOmomqhAtRkaB
	6ct0MHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2612-00000003cOL-1aIx;
	Tue, 08 Apr 2025 10:17:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d9-00000003WBS-0wAw;
	Tue, 08 Apr 2025 09:52:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso52714325e9.1;
        Tue, 08 Apr 2025 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105950; x=1744710750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6eFHR/+HwP+QVEyAdkJj9R1VCVx1cbNXlZ7PvgU5mg=;
        b=ITlrogVnnhhmMdS1hZ//quBpWuIEnmY76zP1YKPGtxJBQVpkDtivSVRvssnp6NqCZd
         Id2QnGdZHbuPaSSwFpypcwORNEN5RTM7Q7NBxL7LQX6dGe6d3qthIslbHyNvNxQ4HUCj
         YgBgMXiu1jEfj9DZuCIGv6M4hvdr/fNf4yei/C/zAHjLKTCXCYodkhcUKTXnoMkQSwfq
         AKIzEBLp5miPjcCIEYN8m4sBLKADgF3xwvCmOhUq5yaVNedC95g4SUsK7S7/hJUj45Cd
         x5BBymf9lTbqW8edEu96cqKFysNbdYcsSCsETU3FuLBowOwNz57eNTUw1Nzr5ySnzXzJ
         Vb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105950; x=1744710750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6eFHR/+HwP+QVEyAdkJj9R1VCVx1cbNXlZ7PvgU5mg=;
        b=xA4YfdHjZI2UG3GPdt2FADHJzT/Va+WufoAEN4YCAGvPzd9mWqEgfyKgv8DHVlUiqv
         eMXE45ndfFN7zxd9uPEnGZQZQ05bnPlxBP2ZMNqrKOc7g+o1P2nPEKmWk41HX2PJP5Yz
         zPN9tHDjx4kZKv6iFqX9OBRsQsAxyW0W/sqNZtdqE0pc9MhdRlma/SqNwewbsmeoEe2t
         po7z4UmUT9t1Qe6ocGxCdurz2ml1l4wwKlvor9zaw6lC10rN2lGT18wy/xle9GkGaaas
         5ICv6/InWC3xvv6zQLCVzXLtOk0vkXFppal+/uKcxLksiKldflVSVk/gzugwZlDju+VG
         oQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNm24pLQDPcZ7tsQzosAMgxtdKKypL8H52rCvMAMlCA0KJTvg1rWy/KRvfHD9BnTNMu/YnbVITFDVy8nLVp8s=@lists.infradead.org, AJvYcCXL+38IXLLsjn7whP8wuGaraGM1fyc8EsYurYNAM1eAElNWNkVPyrIqJcvcXMrcQzlpdjbC2bWdPC0NyY7b1f7V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6khmSYboNw64mY2ntrbisGMXaRsP1rfKxlZDo0ThC2tZy2tKe
	cxG0jysJh2YnijqRjgNk2EVVMnkCaEJiNEP4sBPQz9+1JGuT4+tm
X-Gm-Gg: ASbGnctj4MXBhs+F32BWSRD34T5chUer2vCBBlGrG4NOCAZP1pwk4GUpqcQXSM4TIqW
	IndAW6KRoB03b4uYnQyBieRUopva0JuKY68zxRnb37nOcJoLoy0AtCD66/a5x7shCePpjwkv0b7
	rGOLLjuD47e2hoG0+ENCiY8UqS7L1rAHM7tjmuFm3kKnlPwfhT7KZCEC4qXdMOM3J+bxanW+L3I
	M9Vcq4rbpEZde04Gn7EqunfA9z/5saIaW0O44YVpD/DqPk5nTi6nrVLDeQHU/phi5NDf49PQoRP
	Y2MOY3HOHli3OFqLqzUwgDnKZA5cUdc7HykXQ5sDixigJSuXP+YY8gKt5KuRsKyp8QDabL/RsKy
	uZRIr8TWf9eT8U6+LAfEGHXHU
X-Google-Smtp-Source: AGHT+IGnYUhJy/g8TudXJhkOLcfaktByFDYkfaf3ydBwVqRyzcsHcERQeIuA1I+0QEB3ctl78R0VKg==
X-Received: by 2002:a05:6000:4203:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39d0de28771mr13511876f8f.24.1744105949782;
        Tue, 08 Apr 2025 02:52:29 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:29 -0700 (PDT)
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
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 12/16] nvmem: an8855: Add support for Airoha AN8855 Switch EFUSE
Date: Tue,  8 Apr 2025 11:51:19 +0200
Message-ID: <20250408095139.51659-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025231_269627_7B95F0A8 
X-CRM114-Status: GOOD (  21.60  )
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
 drivers/nvmem/Kconfig        | 11 +++++++
 drivers/nvmem/Makefile       |  2 ++
 drivers/nvmem/an8855-efuse.c | 63 ++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 drivers/nvmem/an8855-efuse.c

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


