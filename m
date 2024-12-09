Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE933E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DldiGMf+UNaTXcwD2GR4/Mu9wTXADlrYU7RCMfHqsv4=; b=oS0jHXeywQXgeL+tMuyebpb5+d
	KR4GpoWhNG3RWAWk88i22q9QatDeidc1cFqaHPj6QLn4BfRR9gl1e4aSSMCvS/jQpaNdmoGuvHZv6
	1iuJA+ou3MSWQl2Et2wnSARfBrA/rZ/W5FTJ/8qlFgpfgci5tkK2gomCmE09ManJJlETATvPXqPRI
	BO2HS0pUH4oKCvAE0+/9WHAwG2oAbhu3lWMQIAKEr7R7s47uUnm8rPLcFSCEKlbA9CLCqpMFr73pF
	mYQRBwuBIcAV0KRNHGpRJUzM5WAeswzlR7B3QMIRd15csUj/J67gILKPs6Y/bzH4ragvXbx1VRB7f
	Ot0DdX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeCA-000000085j0-2BI4;
	Mon, 09 Dec 2024 13:53:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe57-000000083ZX-3LVs;
	Mon, 09 Dec 2024 13:45:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-432d86a3085so28819425e9.2;
        Mon, 09 Dec 2024 05:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751948; x=1734356748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DldiGMf+UNaTXcwD2GR4/Mu9wTXADlrYU7RCMfHqsv4=;
        b=JTV11QlDjsIfJuS8lps3PWnJSZa7ZY1xIi5t2CRQFKhSChBydl/IiYEzXnwfWiKoc3
         vZITI6TBAF6lUHSyOxwpJJQG0M3sGqHH6UDO0Yd28LWMOqbMeQT85C+/iqBRHSzw+vWC
         01Yt2konXv45fjWeQBI+LmwAyD3wjGiYQ7QZneiphDDncsW6BUSZamTvB/V4dW4sy7lD
         OL56UU9+CZiVN/fSRSxsf7/k0AXNZAmUOWUdARtsdEeflN29zkz2CBKPj84dZeBaq7Bm
         8X7q8cq38+b7PnT9G2266FIqwnvq/jUBf5ZYNe59ZyI6aaD9kiljjqHLlJq1pOvblq4R
         VV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751948; x=1734356748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DldiGMf+UNaTXcwD2GR4/Mu9wTXADlrYU7RCMfHqsv4=;
        b=hpjKTTSTIuGZMHEfh2uFVSRY1aY7KbGHwsS9UrxOw4ADK+g16ICeWrGeLrChB44CD5
         OECrFFhRWaEvW2Ci7ncn672OCS7AwOhtT8nvBZPAYbA2p4J8/ee9DvOGdNzz2MlqO1/r
         SdafhoyPTIfS9sfHHYcZAndKxRgM+QwPMUfxEpoTygVUsc9qImBoflNNkH0488JvvaKK
         bFNqmUZGJy+nItgniovHz0alLmg6fp5aUlITL0LFnOQtrfKmOQ14UPKJn6RQCIdGajBE
         D0oigKBkNi2K+2L1TdAW8OTt7cuwXOsDpK08R6rihpxDI5CkmRP9K5jJOB2wo8Z8A7KO
         MxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaRUsBwwOBnFNbuoxYtys93lnoCcw493GsafCxGG8Gdcbs1USSQtxsqpR/KVHjmotr9yIsyeJTov24NtFbMIfF@lists.infradead.org, AJvYcCV5BMt3AZDUj707toZ+MjLo6TDIiL291V04ntMjIOavxjMs8K+4p0CX/Ksf4QsSRBrroY7NVMP/sBdcnsF4ZiM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgkVXp37BAxJ9N3gy37dv2j24e3NK6Go9EIIX+3bLy7T7RL4gX
	LEDTz9OvfDwDDOxyo6bgMatVJEJlafBGI0mKhIrTJvImoPlRQ/XQ
X-Gm-Gg: ASbGncsq0HjQBBh15fTh58lfHmSrvkvPzpoqgck3Lggc5O4ppfhWgh+MC6WdQOyDCYR
	zWLvdhgAb18cCuc74q//8I5VOYwn6EsC0xHLxuXaVz+5XFsr2oh8z6t4/sLxnX02b4lT25lOC1L
	rkHosTPyKrlE+Kvptwtz687PoI7wyPGYOdXDKx0R88BdTIsHT87FsbmVp28Qrqdt6JMU8vSju4C
	jpIIjinX8Kln/CnCQlSNiIghESULqmngIXDDrc0EApxNcq+j+2oG1ixy60ked1rPtN6DdtHH9Rn
	PkeAmF/wF7cYPRwzN0M=
X-Google-Smtp-Source: AGHT+IHota3qg6SjncGFPW99L4xsi++Tc42l5xWftrvBwDlXV4AR0O6QVOD1U1N5MpkxS/DPc3Baow==
X-Received: by 2002:a05:600c:83c3:b0:434:f230:f4f0 with SMTP id 5b1f17b1804b1-434fff3704fmr4165605e9.1.1733751948054;
        Mon, 09 Dec 2024 05:45:48 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f30bceadsm62705135e9.41.2024.12.09.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:45:47 -0800 (PST)
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
Subject: [net-next PATCH v11 6/9] net: mdio: Add Airoha AN8855 Switch MDIO Passtrough
Date: Mon,  9 Dec 2024 14:44:23 +0100
Message-ID: <20241209134459.27110-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054549_838942_BC0010CC 
X-CRM114-Status: GOOD (  24.94  )
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
index 4a7a303be2f7..3d417948e73a 100644
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
+	  that requires a MDIO passtrough as switch address is shared
+	  with the internal PHYs and requires additional page handling.
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
index 000000000000..5feba72c021b
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
+		return dev_err_probe(dev, ret, "failed to register MDIO bus\n");
+
+	return ret;
+}
+
+static const struct of_device_id an8855_mdio_of_match[] = {
+	{ .compatible = "airoha,an8855-mdio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_mdio_of_match);
+
+static struct platform_driver an8855_mdio_driver = {
+	.probe	= an8855_mdio_probe,
+	.driver = {
+		.name = "an8855-mdio",
+		.of_match_table = an8855_mdio_of_match,
+	},
+};
+module_platform_driver(an8855_mdio_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for AN8855 MDIO passthrough");
+MODULE_LICENSE("GPL");
-- 
2.45.2


