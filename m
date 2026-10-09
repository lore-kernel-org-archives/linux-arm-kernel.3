Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ED5CA601F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+kikrxi+sh8E+pdHoha/lvcr0WXLci+SCvPEp+jlXw=; b=EOwHaxGwWNKv6S34J9BMv1UdfQ
	vtKWHccvCpK7kimG2bxHh0TNsiWjEYP771eo7GsGlP7L69cWjPzRC+Dz97bqazyucdImlJpLpB43o
	VqSytTh0ttxESn0dKjahyudIWZIcYW3elsAzz5+fUVDSCaxpP1t1zNomy46ziuPYhja/7JENAY2bh
	OaN1HXDS25YioN8hIM5p8lecDOSYmMoc5LGEVxqFr9X80PpLUrmB4H60lWdfwcq3cRz3r5K7Lwche
	I6t46MM94qRxcc2z1iC22ukc3LAxpHYQ5MkTQhrdZ5jxtxTzDzRiJnX6UYuAE8S3eNvTR+Xq+nXG8
	GXsVnZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBv-00000006cVY-1WN7;
	Fri, 09 Oct 2026 16:11:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBr-00000006cQN-2BVd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=q+kikrxi+sh8E+pdHoha/lvcr0WXLci+SCvPEp+jlXw=; b=pY0Sa4C4lhAw7DubQHevudNlSI
	APfQrd2NbxDc0nmCQLJu6AFO+A5xKIaBTfTyaSz/szdw406eO/gslDz/ZW6kB8gzX5z4N5pyHBXpS
	A2N5P5sjm+b1khqTHW10TSyRuENdCikak6TLXSU34vOcGL+Gk/ZZS9rpblWzrwNuCAo852LLq3Y6d
	ZFB76x9Ct9we5wNOPya7Pf7nR1QO/t1mZDWsTerX86rHoKQumwFQtL2epGewRBFXsvftvCo9IAtcD
	vb+8dy/r2D2ZeBluwf24W2t0SLrRVsBu/7yemNBdGWj3uPxva/a7qF6Q/R8A0PVkuQzGFv3fm4b32
	0nRZbTGg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBo-0000000BOlU-3Q2S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4207ac26so3383683f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562279; x=1792167079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q+kikrxi+sh8E+pdHoha/lvcr0WXLci+SCvPEp+jlXw=;
        b=edvKdKwk0c8LawvzCNL6zvL9z85PkIZOkE3AL0zlh6Nu6R+9qqSSLgv9+Qg2nrDLiv
         LOEE9bdJqQrFycVItx7P/AGKWWbxE4Wlw2pa/87bUoPPcNYTyx2i+KQDgu1PeZcwGPQq
         7Blwya1SeFzWCGMNHYRZ36Sm0CBEr1uvlNnRKO3+q52pZRF47G6DK3n55nXuo97+SEHk
         yVx8Npp5Mui+Hv5rTHRl/gq2UOpfL3/Jmht9twry6bRWRksnZBv2KAEwtS/2F4tqVoeB
         ARK1IFFERk6YWQ9vs4ODX8TgcQl0MHoAIURO9S88JER6Np6jN2BBjXIQeACsvLrAkTPI
         XmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562279; x=1792167079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q+kikrxi+sh8E+pdHoha/lvcr0WXLci+SCvPEp+jlXw=;
        b=UjVwjyfewOGIhc7mLvE7f8NSKYs5QnuX3Y2C+5EsiIVOwWfQS1eHQdXuAe+kyi+xdM
         3fMVCd3ZTWR4HZSVGAwOQclYfzhg4WKw4qcjozeykE8hPQToxPpJGGXDa2767zeMh/2F
         HYQRceCUDdSWbdp2aidzCuz5GLnBRNJWoBgD5D9X7s769ACZ7WO/jhQiTiOCss5pC6Sw
         +2X2PkB4En34iQegQUT+w6g4/ftLeL25OB5iCIQUwLWPVNhQ8Q5bimJ1tqdpLQ+QKg+3
         0oYrzgxmsm0vVaxF7pA+90S22JHjIXtRiWhyQruDLyettBKxsmHtyGBai/hGUtjM3evp
         Rypg==
X-Forwarded-Encrypted: i=1; AKwUvBw+IIbth4ug6oqbY2ZVZ+Y6yk+qQoZg+CLdhLgEymARcWhCcEfNTjBONT64LzeinPoQ1mMVLYzxDRJyeUeJ0ELz@lists.infradead.org
X-Gm-Message-State: AFq9FYKK5niaXnvCsnCXESi6zP748o3lREBe+U9mD5cVvHe+v13P0Ac0
	eXPt+aE2hNwI5BgvNsIeh6lHkI3q2/p/rSjou+0vMz0ySwRiPhizWJ3/
X-Gm-Gg: AYBFou3WRN1SsHBIpX/ivufaETLkn3f/QChWhT7BJXdew8EYmdaa0E8LkN6+hREpRN7
	6uojgDsrC/9m7wuwGj2e5Mvl8W/X+mJJdoFLsTBxzG/R+wjwPu8Uqcq7uc+wFcI4OOWNRsqziyE
	jUIOYlym2WOZAccbPD49UtZDTQmtRXjh2SAvsA02npIKUp3EDWAGeDU+FvJjKWXPtnPAF5c7X1G
	icW4HYriKY7vG7d5m4apjivT5hmFwsmKNTQssSY4nHSJxirU+9zmcupLt078ZpVlY7PO8GnrODV
	090e0LHaQXElNCV89Lg4r387ez6jOqWXxUnro5xgfbzZtgQdxao+fUO+hZV/adswg9KmaaZAouH
	EJr7rUWTQzDnUgInK+tHAM4pJKkKNnUOfmZ3l3YHBJn24+TkGyEioaEBMYAF20DyAs+5i/cB9mt
	F+LLL+LtYccYlZwX5z6tB3ysaiBZyHw1pf4wMgn6hQtcFGKQHMwEVgz8czaB+eFuMGl8BQF0v2n
	m9SA0MvrxT6r9pTH4e8gSPseQM9nETWEWrKkY4VJwGU4ASM392/z2JhPdDJLR3FL0wNmWG6RLKW
	PQZz0kEtvW+s2gKumO+aw2Nu66yw
X-Received: by 2002:a05:6000:4285:b0:48c:4485:3357 with SMTP id ffacd0b85a97d-48dbacf2482mr3779069f8f.57.1791562279000;
        Fri, 09 Oct 2026 09:11:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Fri,  9 Oct 2026 18:10:49 +0200
Message-ID: <20261009161102.38961-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171120_939967_08F4A10C 
X-CRM114-Status: GOOD (  29.21  )
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

Add support for Airoha AN8855 Switch that provide support for a DSA
switch and a NVMEM provider.

Also make use of the mdio-regmap driver and register a regmap for each
internal PHY of the switch.
This is needed to handle the double usage of the PHYs as both PHY and
Switch accessor.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mfd/Kconfig         |  14 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/airoha-an8855.c | 579 ++++++++++++++++++++++++++++++++++++
 3 files changed, 594 insertions(+)
 create mode 100644 drivers/mfd/airoha-an8855.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..afbdcec0fce8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -54,6 +54,20 @@ config MFD_ALTERA_SYSMGR
 	  using regmap_mmio accesses for ARM32 parts and SMC calls to
 	  EL3 for ARM64 parts.
 
+config MFD_AIROHA_AN8855
+	tristate "Airoha AN8855 Switch Core"
+	select MFD_CORE
+	select REGMAP
+	select PHYLIB
+	select MDIO_REGMAP
+	depends on NETDEVICES && OF
+	help
+	  Support for the Airoha AN8855 Switch Core. This is an SoC
+	  that provides various peripherals, to count, i2c, an Ethrnet
+	  Switch, a CPU timer, GPIO, eFUSE.
+
+	  Currently it provides a DSA switch and a NVMEM provider.
+
 config MFD_ACT8945A
 	tristate "Active-semi ACT8945A"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..484127dba2ad 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
 obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
+obj-$(CONFIG_MFD_AIROHA_AN8855)	+= airoha-an8855.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
new file mode 100644
index 000000000000..a2778511dfef
--- /dev/null
+++ b/drivers/mfd/airoha-an8855.c
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Core driver for Airoha AN8855 Switch
+ *
+ * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/fwnode_mdio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mfd/core.h>
+#include <linux/mdio.h>
+#include <linux/mdio/mdio-regmap.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+
+/* Register for HW trap status */
+#define AN8855_HWTRAP			0x1000009c
+
+/*
+ * Register of the Switch ID
+ * (called Project ID in Documentation)
+ */
+#define AN8855_CREV			0x10005000
+#define   AN8855_ID			0x8855 /* Switch ID */
+
+/* Register for GPHY Power Down
+ * Used to Toggle the Gigabit PHY power and enable them.
+ */
+#define AN8855_RG_GPHY_AFE_PWD		0x1028c840
+
+/* MII Registers */
+#define AN8855_PHY_SELECT_PAGE		0x1f
+#define   AN8855_PHY_PAGE		GENMASK(2, 0)
+#define   AN8855_PHY_PAGE_STANDARD	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
+#define   AN8855_PHY_PAGE_EXTENDED_1	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
+#define   AN8855_PHY_PAGE_EXTENDED_4	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x4)
+
+/* MII Registers Page 4 */
+#define AN8855_PBUS_MODE		0x10
+#define   AN8855_PBUS_MODE_ADDR_FIXED	0x0
+#define   AN8855_PBUS_MODE_ADDR_INCR	BIT(15)
+#define AN8855_PBUS_WR_ADDR_HIGH	0x11
+#define AN8855_PBUS_WR_ADDR_LOW		0x12
+#define AN8855_PBUS_WR_DATA_HIGH	0x13
+#define AN8855_PBUS_WR_DATA_LOW		0x14
+#define AN8855_PBUS_RD_ADDR_HIGH	0x15
+#define AN8855_PBUS_RD_ADDR_LOW		0x16
+#define AN8855_PBUS_RD_DATA_HIGH	0x17
+#define AN8855_PBUS_RD_DATA_LOW		0x18
+
+#define AN8855_MAX_PHY_PORT		5
+
+struct an8855_core {
+	struct mii_bus *bus;
+	struct mii_bus *phy_bus;
+	unsigned int switch_addr;
+	u16 current_page;
+};
+
+struct an8855_phy {
+	u8 addr;
+	struct an8855_core *core;
+};
+
+struct an8855_phy_bus {
+	struct mii_bus *bus;
+	struct fwnode_handle *node;
+	u8 addr;
+};
+
+static const struct mfd_cell an8855_cells[] = {
+	MFD_CELL_OF("an8855-efuse", NULL, NULL, 0, 0,
+		    "airoha,an8855-efuse"),
+	MFD_CELL_OF("an8855-switch", NULL, NULL, 0, 0,
+		    "airoha,an8855-switch"),
+};
+
+static int an8855_mii_set_page(struct an8855_core *priv, u8 addr,
+			       u8 page) __must_hold(&priv->bus->mdio_lock)
+{
+	struct mii_bus *bus = priv->bus;
+	int ret;
+
+	ret = __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);
+	if (ret) {
+		dev_err_ratelimited(&bus->dev, "failed to set mii page\n");
+		return ret;
+	}
+
+	/* Cache current page if next MII read/write is for Switch page */
+	priv->current_page = page;
+	return 0;
+}
+
+static int an8855_mii_read32(struct mii_bus *bus, u8 phy_id, u32 reg,
+			     u32 *val) __must_hold(&bus->mdio_lock)
+{
+	int lo, hi, ret;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
+			      AN8855_PBUS_MODE_ADDR_FIXED);
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_HIGH,
+			      upper_16_bits(reg));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_LOW,
+			      lower_16_bits(reg));
+	if (ret)
+		goto err;
+
+	hi = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_HIGH);
+	if (hi < 0) {
+		ret = hi;
+		goto err;
+	}
+
+	lo = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_LOW);
+	if (lo < 0) {
+		ret = lo;
+		goto err;
+	}
+
+	*val = ((u32)hi << 16) | lo;
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev, "failed to read register\n");
+	return ret;
+}
+
+/*
+ * Protect concurrent access to phy page if switch address also
+ * expose a PHY.
+ */
+static void an8855_regmap_lock(struct an8855_core *priv)
+{
+	if (priv->phy_bus)
+		mutex_lock(&priv->phy_bus->mdio_lock);
+	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static void an8855_regmap_unlock(struct an8855_core *priv)
+{
+	mutex_unlock(&priv->bus->mdio_lock);
+	if (priv->phy_bus)
+		mutex_unlock(&priv->phy_bus->mdio_lock);
+}
+
+static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855_core *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	int ret;
+
+	an8855_regmap_lock(priv);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret < 0)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(priv);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_mii_write32(struct mii_bus *bus, u8 phy_id, u32 reg,
+			      u32 val) __must_hold(&bus->mdio_lock)
+{
+	int ret;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
+			      AN8855_PBUS_MODE_ADDR_FIXED);
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_HIGH,
+			      upper_16_bits(reg));
+	if (ret)
+		goto err;
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_LOW,
+			      lower_16_bits(reg));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_HIGH,
+			      upper_16_bits(val));
+	if (ret)
+		goto err;
+
+	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_LOW,
+			      lower_16_bits(val));
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	dev_err_ratelimited(&bus->dev,
+			    "failed to write an8855 register\n");
+	return ret;
+}
+
+static int an8855_regmap_write(void *ctx, uint32_t reg, uint32_t val)
+{
+	struct an8855_core *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	int ret;
+
+	an8855_regmap_lock(priv);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(priv);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_regmap_update_bits(void *ctx, uint32_t reg, uint32_t mask,
+				     uint32_t write_val)
+{
+	struct an8855_core *priv = ctx;
+	struct mii_bus *bus = priv->bus;
+	u16 addr = priv->switch_addr;
+	u32 val;
+	int ret;
+
+	an8855_regmap_lock(priv);
+	ret = an8855_mii_set_page(priv, addr, AN8855_PHY_PAGE_EXTENDED_4);
+	if (ret)
+		goto exit;
+
+	ret = an8855_mii_read32(bus, addr, reg, &val);
+	if (ret < 0)
+		goto exit;
+
+	val &= ~mask;
+	val |= write_val & mask;
+	ret = an8855_mii_write32(bus, addr, reg, val);
+
+exit:
+	an8855_regmap_unlock(priv);
+
+	return ret < 0 ? ret : 0;
+}
+
+static const struct regmap_range an8855_readable_ranges[] = {
+	regmap_reg_range(0x10000000, 0x10000fff), /* SCU */
+	regmap_reg_range(0x10001000, 0x10001fff), /* RBUS */
+	regmap_reg_range(0x10002000, 0x10002fff), /* MCU */
+	regmap_reg_range(0x10005000, 0x10005fff), /* SYS SCU */
+	regmap_reg_range(0x10007000, 0x10007fff), /* I2C Slave */
+	regmap_reg_range(0x10008000, 0x10008fff), /* I2C Master */
+	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
+	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
+	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
+	regmap_reg_range(0x1000a300, 0x1000a3ff), /* GPIO */
+	regmap_reg_range(0x1000a400, 0x1000a5ff), /* EFUSE */
+	regmap_reg_range(0x1000c000, 0x1000cfff), /* GDMP CSR */
+	regmap_reg_range(0x10010000, 0x1001ffff), /* GDMP SRAM */
+	regmap_reg_range(0x10200000, 0x10203fff), /* Switch - ARL Global */
+	regmap_reg_range(0x10204000, 0x10207fff), /* Switch - BMU */
+	regmap_reg_range(0x10208000, 0x1020bfff), /* Switch - ARL Port */
+	regmap_reg_range(0x1020c000, 0x1020cfff), /* Switch - SCH */
+	regmap_reg_range(0x10210000, 0x10213fff), /* Switch - MAC */
+	regmap_reg_range(0x10214000, 0x10217fff), /* Switch - MIB */
+	regmap_reg_range(0x10218000, 0x1021bfff), /* Switch - Port Control */
+	regmap_reg_range(0x1021c000, 0x1021ffff), /* Switch - TOP */
+	regmap_reg_range(0x10220000, 0x1022ffff), /* SerDes */
+	regmap_reg_range(0x10286000, 0x10286fff), /* RG Batcher */
+	regmap_reg_range(0x1028c000, 0x1028ffff), /* ETHER_SYS */
+	regmap_reg_range(0x30000000, 0x37ffffff), /* I2C EEPROM */
+	regmap_reg_range(0x38000000, 0x3fffffff), /* BOOT_ROM */
+	regmap_reg_range(0xa0000000, 0xbfffffff), /* GPHY */
+};
+
+static const struct regmap_access_table an8855_readable_table = {
+	.yes_ranges = an8855_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(an8855_readable_ranges),
+};
+
+static const struct regmap_config an8855_regmap_config = {
+	.name = "switch",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0xbfffffff,
+	.reg_read = an8855_regmap_read,
+	.reg_write = an8855_regmap_write,
+	.reg_update_bits = an8855_regmap_update_bits,
+	.disable_locking = true,
+	.rd_table = &an8855_readable_table,
+};
+
+static int an8855_regmap_phy_reset_page(struct an8855_core *priv,
+					int phy) __must_hold(&priv->bus->mdio_lock)
+{
+	/* Check PHY page only for addr shared with switch */
+	if (phy != priv->switch_addr)
+		return 0;
+
+	/* Don't restore page if it's not set to Switch page */
+	if (priv->current_page != AN8855_PHY_PAGE_EXTENDED_4)
+		return 0;
+
+	/*
+	 * Restore page to 0, PHY might change page right after but that
+	 * will be ignored as it won't be a switch page.
+	 */
+	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);
+}
+
+static int an8855_regmap_phy_read(void *ctx, uint32_t reg, uint32_t *val)
+{
+	struct an8855_phy *priv = ctx;
+	struct an8855_core *core_priv;
+	u32 addr = priv->addr;
+	struct mii_bus *bus;
+	int ret;
+
+	core_priv = priv->core;
+	bus = core_priv->bus;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_regmap_phy_reset_page(core_priv, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_read(bus, addr, reg);
+	if (ret >= 0)
+		*val = ret;
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int an8855_regmap_phy_write(void *ctx, uint32_t reg, uint32_t val)
+{
+	struct an8855_phy *priv = ctx;
+	struct an8855_core *core_priv;
+	u32 addr = priv->addr;
+	struct mii_bus *bus;
+	int ret;
+
+	core_priv = priv->core;
+	bus = core_priv->bus;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_regmap_phy_reset_page(core_priv, addr);
+	if (ret)
+		goto exit;
+
+	ret = __mdiobus_write(bus, addr, reg, val);
+
+exit:
+	mutex_unlock(&bus->mdio_lock);
+
+	return ret;
+}
+
+static const struct regmap_config an8855_phy_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = an8855_regmap_phy_read,
+	.reg_write = an8855_regmap_phy_write,
+	.disable_locking = true,
+	.max_register = 0x1f,
+};
+
+static int an8855_read_switch_id(struct device *dev, struct regmap *regmap)
+{
+	u32 id;
+	int ret;
+
+	ret = regmap_read(regmap, AN8855_CREV, &id);
+	if (ret)
+		return ret;
+
+	if (id != AN8855_ID) {
+		dev_err(dev, "Detected Switch ID %x but %x was expected\n",
+			id, AN8855_ID);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int an8855_phy_bus_register(struct device *dev, struct an8855_core *priv,
+				   struct device_node *phy_np,
+				   struct an8855_phy_bus *phy_bus_info)
+{
+	struct mdio_regmap_config mrc = { };
+	struct an8855_phy *phy_priv;
+	struct regmap *regmap;
+	u32 addr, phy_offset;
+	struct mii_bus *bus;
+	int ret;
+
+	ret = of_property_read_u32(phy_np, "reg", &addr);
+	if (ret)
+		return ret;
+
+	phy_offset = addr - priv->switch_addr;
+	if (phy_offset >= AN8855_MAX_PHY_PORT)
+		return -EINVAL;
+
+	phy_priv = devm_kzalloc(dev, sizeof(*phy_priv), GFP_KERNEL);
+	if (!phy_priv)
+		return -ENOMEM;
+
+	phy_priv->addr = addr;
+	phy_priv->core = priv;
+
+	regmap = devm_regmap_init(dev, NULL, phy_priv, &an8855_phy_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "phy%d regmap initialization failed\n",
+				      addr);
+
+	mrc.regmap = regmap;
+	mrc.parent = dev;
+	mrc.valid_addr = addr;
+	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%u", dev_name(dev), addr);
+
+	bus = devm_mdio_regmap_register(dev, &mrc);
+	if (IS_ERR(bus))
+		return PTR_ERR(bus);
+
+	if (addr == priv->switch_addr)
+		priv->phy_bus = bus;
+
+	phy_bus_info->bus = bus;
+	phy_bus_info->addr = addr;
+	phy_bus_info->node = fwnode_handle_get(of_fwnode_handle(phy_np));
+
+	return 0;
+}
+
+static int an8855_mdio_register(struct device *dev, struct an8855_core *priv,
+				struct an8855_phy_bus *phy_bus_infos)
+{
+	struct device_node *mdio_np;
+	int ret = 0;
+	int i = 0;
+
+	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
+	if (!mdio_np)
+		return -ENODEV;
+
+	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
+		if (i >= AN8855_MAX_PHY_PORT) {
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		ret = an8855_phy_bus_register(dev, priv, phy_np,
+					      &phy_bus_infos[i]);
+		if (ret)
+			goto exit;
+
+		i++;
+	}
+
+exit:
+	of_node_put(mdio_np);
+	if (ret) {
+		while (i--)
+			fwnode_handle_put(phy_bus_infos[i].node);
+
+		return ret;
+	}
+
+	return i;
+}
+
+static int an8855_core_probe(struct mdio_device *mdiodev)
+{
+	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
+	struct device *dev = &mdiodev->dev;
+	struct an8855_core *priv;
+	struct regmap *regmap;
+	int num_phys;
+	int i, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->bus = mdiodev->bus;
+	priv->switch_addr = mdiodev->addr;
+	/* No DMA for mdiobus, mute warning for DMA mask not set */
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	/* Register virtual MDIO for each PHY */
+	num_phys = an8855_mdio_register(dev, priv, phy_bus_infos);
+	if (num_phys < 0)
+		return num_phys;
+
+	regmap = devm_regmap_init(dev, NULL, priv, &an8855_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err_probe(dev, ret, "regmap initialization failed\n");
+		goto err_put_fwnodes;
+	}
+
+	/* Reset PHY page for switch address */
+	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
+	ret = an8855_mii_set_page(priv, priv->switch_addr,
+				  AN8855_PHY_PAGE_STANDARD);
+	mutex_unlock(&priv->bus->mdio_lock);
+	if (ret)
+		goto err_put_fwnodes;
+
+	ret = an8855_read_switch_id(dev, regmap);
+	if (ret)
+		goto err_put_fwnodes;
+
+	/* Release global PHY power down */
+	ret = regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
+	if (ret)
+		goto err_put_fwnodes;
+
+	/* Register PHYs */
+	for (i = 0; i < num_phys; i++) {
+		ret = fwnode_mdiobus_register_phy(phy_bus_infos[i].bus,
+						  phy_bus_infos[i].node,
+						  phy_bus_infos[i].addr);
+		fwnode_handle_put(phy_bus_infos[i].node);
+		phy_bus_infos[i].node = NULL;
+
+		if (ret)
+			goto err_put_fwnodes;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
+				    ARRAY_SIZE(an8855_cells), NULL, 0,
+				    NULL);
+
+err_put_fwnodes:
+	for (i = 0; i < num_phys; i++)
+		if (phy_bus_infos[i].node)
+			fwnode_handle_put(phy_bus_infos[i].node);
+
+	return ret;
+}
+
+static const struct of_device_id an8855_core_of_match[] = {
+	{ .compatible = "airoha,an8855" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an8855_core_of_match);
+
+static struct mdio_driver an8855_core_driver = {
+	.probe = an8855_core_probe,
+	.mdiodrv.driver = {
+		.name = "an8855",
+		.of_match_table = an8855_core_of_match,
+	},
+};
+mdio_module_driver(an8855_core_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for Airoha AN8855");
+MODULE_LICENSE("GPL");
-- 
2.55.0


