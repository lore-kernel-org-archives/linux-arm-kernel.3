Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAED0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 00:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tn1cpZ2Y5hoUhR23cd+RDNcfycsdmg0+/7hxNHZhHck=; b=iMck3PPlh33CDDrBraiz6ZqYaT
	1mzs3FehkMcBbb1ZITRL1bMEUfPGKcO8CawjrhqOIaz27o47DWrFwtLjA1w3h7wuxY44rzJe//FaO
	XVubnHAL+umxTOBNQrYrW8d5dSEnhSXCz2fi/yL4hrEfWncFjO/CF81Ww/jtaDAVvjV8Ti5BW/0nj
	euVKSSnr3DFsa7C2Q/UOT29PvDZNlHwMjFMkzVFOC14tuXSfACkemRJaH3X8gij2T3pQthxZleRbx
	S2aEUbAEgRpul9TwR5gQGPgda8+0wRrRfiOacPMrFIhSGvxEzuT+8ryNrK6pz0esmN4lB8aM4AwYv
	dviD2QVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK5AT-00000004cP8-3SYN;
	Sun, 08 Dec 2024 00:29:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK53d-00000004bCC-1jdH;
	Sun, 08 Dec 2024 00:21:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a45f05feso34990215e9.3;
        Sat, 07 Dec 2024 16:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733617316; x=1734222116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tn1cpZ2Y5hoUhR23cd+RDNcfycsdmg0+/7hxNHZhHck=;
        b=mIRByuYOXzf1hVSggKXhR0NeGeniOPaG/xzGM1o6tuEaPHWz5sWl55mW2f9bny3gWU
         6o+y+yxLEUbiFZmUDoZ47qm5OI5w/7v1Zqla5vtLYHoMkImDWIx5dlIlqxPk6WCtYh27
         +IF8j2ZU9h+9isqX81uqyebeUi0X0huRglFnolarR/6U9zJEKe3IIHZ/MlRzTTWjc2Tz
         k+d0JwZedT2DB8KwCZYGgPPD4wV+LvXhY7wnJZ/IymL3lN8NDzdc6qdovI0AKnsGFpup
         IJjjHC1j0uZGjEy9nc2h5vIfWgNg0spEHn2mN+mt+TtVwchDqbcY+fe/PZUBrP0wyen0
         nI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733617316; x=1734222116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tn1cpZ2Y5hoUhR23cd+RDNcfycsdmg0+/7hxNHZhHck=;
        b=rNuc03hK3EMOHNOup5KPlNXOv2G6/h+6FkChz7UOdc+MQpzJBzlPhxax3ZA81x1eLi
         J2Fpd8V0KLY8l5l8oczIsc02dFQoWFWkQGrXY6svdP5dZJhAutgA+VqqkStqqT7M10j0
         tTLprroOauQ238B2rbGvHTYAWUhXNJH9gMNiKSwBZK6TfcKCIFgk+X9nE/mWw4UprjNj
         3nDBv4HBJ1lokP7+x0nApZ41ML+vhK9mGOduK4jzpm5ZL3sW5NysvsSXaa1oT7Nguoi7
         Qq651Fx5Xf1OU8Gtf+i6CmPHCL9bkvwYdJEz2YETNchNhBmJ544qPsyAaaO9xafsXmmN
         WcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8YMJRnYg7LupwknNfIrp2JdGAGpiHCoBv12EmBcYtXmuuf3w7UZCMnYo2009TGwbe157jRfXpFWlqonpjLFO3@lists.infradead.org, AJvYcCVIv5zA1o7Ni8PzZDd8glZAmdCztLbuNBHf025r7rZQiNOYUvtKMn35yIKyEjc37vNf5Ab+j8rwbF8j3Ck9fmU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgwwPI6LriKpEnZA57Eu/bub74YjIuZrcgO/21mqarp8OL3xkO
	GqPl+FfC1LRaFigo/woMCDKXYdU9Wl8K2HTDClStIXvZMT+I3qgd
X-Gm-Gg: ASbGncvOR1WlFByUPF4QEVQ1r/tH0LCZtBcNuI7HXFEJsPbEaVIdJg4YrsOvn7NSB8z
	cLV/ducxHhHOBgRHSEO/U8zYvLp97UXnJgF4B2QAyWO+MkMjd2LDsR/iVjpO3ZVf6rJLDFM/duh
	W3itN0HZ/tAUOe40UVcoiAmRuwDxQCrBVY/ZX261QkAYQjy32EpnCM0yhOaCzk98CwdKX1Co8Uq
	T53Kdh2yGGIdHERn+bbGK/djvP2l6gZGxB0OF7yyjRtO2jaP8kpDuDyEtuj4xJEzzHvloY5yhne
	sFSx0cA82QT/zp7MwP4=
X-Google-Smtp-Source: AGHT+IFzJpA8K9EvKqV1C9cCyyeyWFGq2HK5XNv8kAYHobekq7oqEJFOkPV3vXdYjdQHhRGE6/OqLw==
X-Received: by 2002:a05:600c:6a12:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-434f13124b5mr11896925e9.8.1733617315532;
        Sat, 07 Dec 2024 16:21:55 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38621909644sm8719170f8f.76.2024.12.07.16.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 16:21:54 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v10 6/9] net: mdio: Add Airoha AN8855 Switch MDIO Passtrough
Date: Sun,  8 Dec 2024 01:20:41 +0100
Message-ID: <20241208002105.18074-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241208002105.18074-1-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_162157_452988_DDB09CC1 
X-CRM114-Status: GOOD (  24.74  )
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

Add Airoha AN8855 Switch driver to register a MDIO passtrough as switch
address is shared with the internal PHYs and require additional page
handling.

This requires the upper Switch MFD to be probed and init to actually
work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                    |   1 +
 drivers/net/mdio/Kconfig       |   9 +++
 drivers/net/mdio/Makefile      |   1 +
 drivers/net/mdio/mdio-an8855.c | 113 +++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-an8855.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f4d7c48b6e1..38c7b2362c92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -722,6 +722,7 @@ F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/mdio/mdio-an8855.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 4a7a303be2f7..64fc5c3ef38b 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -61,6 +61,15 @@ config MDIO_XGENE
 	  This module provides a driver for the MDIO busses found in the
 	  APM X-Gene SoC's.
 
+config MDIO_AN8855
+	tristate "Airoha AN8855 Switch MDIO bus controller"
+	depends on MFD_AIROHA_AN8855
+	depends on OF_MDIO
+	help
+	  This module provides a driver for the Airoha AN8855 Switch
+	  that require a MDIO passtrough as switch address is shared
+	  with the internal PHYs and require additional page handling.
+
 config MDIO_ASPEED
 	tristate "ASPEED MDIO bus controller"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 1015f0db4531..546c4e55b475 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_ACPI_MDIO)		+= acpi_mdio.o
 obj-$(CONFIG_FWNODE_MDIO)	+= fwnode_mdio.o
 obj-$(CONFIG_OF_MDIO)		+= of_mdio.o
 
+obj-$(CONFIG_MDIO_AN8855)		+= mdio-an8855.o
 obj-$(CONFIG_MDIO_ASPEED)		+= mdio-aspeed.o
 obj-$(CONFIG_MDIO_BCM_IPROC)		+= mdio-bcm-iproc.o
 obj-$(CONFIG_MDIO_BCM_UNIMAC)		+= mdio-bcm-unimac.o
diff --git a/drivers/net/mdio/mdio-an8855.c b/drivers/net/mdio/mdio-an8855.c
new file mode 100644
index 000000000000..d8a856352842
--- /dev/null
+++ b/drivers/net/mdio/mdio-an8855.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * MDIO passthrough driver for Airoha AN8855 Switch
+ */
+
+#include <linux/mfd/airoha-an8855-mfd.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/platform_device.h>
+
+static int an855_phy_restore_page(struct an8855_mfd_priv *priv,
+				  int phy) __must_hold(&priv->bus->mdio_lock)
+{
+	/* Check PHY page only for addr shared with switch */
+	if (phy != priv->switch_addr)
+		return 0;
+
+	/* Don't restore page if it's not set to switch page */
+	if (priv->current_page != FIELD_GET(AN8855_PHY_PAGE,
+					    AN8855_PHY_PAGE_EXTENDED_4))
+		return 0;
+
+	/* Restore page to 0, PHY might change page right after but that
+	 * will be ignored as it won't be a switch page.
+	 */
+	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);
+}
+
+static int an8855_phy_read(struct mii_bus *bus, int phy, int regnum)
+{
+	struct an8855_mfd_priv *priv = bus->priv;
+	struct mii_bus *real_bus = priv->bus;
+	int ret;
+
+	mutex_lock_nested(&real_bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	ret = an855_phy_restore_page(priv, phy);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_read(real_bus, phy, regnum);
+exit:
+	mutex_unlock(&real_bus->mdio_lock);
+
+	return ret;
+}
+
+static int an8855_phy_write(struct mii_bus *bus, int phy, int regnum, u16 val)
+{
+	struct an8855_mfd_priv *priv = bus->priv;
+	struct mii_bus *real_bus = priv->bus;
+	int ret;
+
+	mutex_lock_nested(&real_bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	ret = an855_phy_restore_page(priv, phy);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_write(real_bus, phy, regnum, val);
+exit:
+	mutex_unlock(&real_bus->mdio_lock);
+
+	return ret;
+}
+
+static int an8855_mdio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct an8855_mfd_priv *priv;
+	struct mii_bus *bus;
+	int ret;
+
+	/* Get priv of MFD */
+	priv = dev_get_drvdata(dev->parent);
+
+	bus = devm_mdiobus_alloc(dev);
+	if (!bus)
+		return -ENOMEM;
+
+	bus->priv = priv;
+	bus->name = KBUILD_MODNAME "-mii";
+	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d",
+		 priv->switch_addr);
+	bus->parent = dev;
+	bus->read = an8855_phy_read;
+	bus->write = an8855_phy_write;
+
+	ret = devm_of_mdiobus_register(dev, bus, dev->of_node);
+	if (ret)
+		dev_err(dev, "failed to register MDIO bus: %d", ret);
+
+	return ret;
+}
+
+static const struct of_device_id an8855_mdio_ids[] = {
+	{ .compatible = "airoha,an8855-mdio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_mdio_ids);
+
+static struct platform_driver an8855_mdio_driver = {
+	.probe	= an8855_mdio_probe,
+	.driver = {
+		.name = "an8855-mdio",
+		.of_match_table = an8855_mdio_ids,
+	},
+};
+module_platform_driver(an8855_mdio_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for AN8855 Mdio passthrough");
+MODULE_LICENSE("GPL");
-- 
2.45.2


