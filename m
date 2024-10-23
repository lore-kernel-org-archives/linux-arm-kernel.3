Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C69CFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnXmGzBtfa7kC1qzpg2xEmOEHLK960MKCFFUQoyIJF0=; b=adIhHouWB3gEuD/vzDCgkYiLiA
	kyCZVdcnVXgKbhcFIRz1cCFsSQevOxe4hulzNmWlvF1WqspBQecbKSwb7q6GZ0zJsSs8o6JFrbvgz
	4lwuqya+nQybAFquYjmm07/BsRaizZR79W6ckWR//FKp59CpmHQXQhR2BnX/gTxL0lIDOvxOgMn+M
	EFh6obN/uEDuotipA69u2k4RMtyFaCQhXDBfnRFltgh4RrGFIGdS06bs8o5THYG6UTg7ZkKNoKPVH
	UTigcpYdmztnAvJfO25POts1xPk7f8x2iIyLAnpH7LPg/UbkS100ooX9OU500Gpk8xIuJA8RrVezK
	uypo74BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eh8-0000000FFz7-3RAD;
	Wed, 23 Oct 2024 16:58:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e6G-0000000F76e-0IxP;
	Wed, 23 Oct 2024 16:20:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d533b5412so4859286f8f.2;
        Wed, 23 Oct 2024 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700442; x=1730305242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnXmGzBtfa7kC1qzpg2xEmOEHLK960MKCFFUQoyIJF0=;
        b=Tl6kXkVt72OZs4K6eic5ueZFZ3cfWmgNXK3Vda/WWfOGZxSev2cQYvzuW/1zPLdpI0
         G+vSOVMHHOwfb/1t6mRo10cp24YTJUFPt0T8RqDPcELBspnZdj5MJqtFpnTWqi5HW9Js
         ABcu4wzUf+PG//hZZYA8kTxK8mr/YHDkRO6v2C6KObiUET0qFMBRgtBpVOUXhniEC3En
         W70iOamIdi/NERAjYtzim6sUYJkfSDSLd7+KCI7XrFxScm8J6/PNjzZb1u3l8FQf+t52
         HANhJjBEA0bP2r7A7G6wdu1DP5jwUb5XvUFHbYrRkDks5Vai7hPQ2yb8RrV4pcMcwg+S
         Zzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700442; x=1730305242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnXmGzBtfa7kC1qzpg2xEmOEHLK960MKCFFUQoyIJF0=;
        b=sQ22XhbBHzVkcIzmTSko/dlKHPUaC47NRP5pCAn5uF2GIOzc84B0T0xc9Og5z6zgqK
         kV1Gq+ytujPxOGtzKKXQjK2D6ICoKA9reUaIsxxm398jD/lDn7r6LYDLb8xX1ximTVBJ
         nxWT33Od6c5/muJWUT90wUSG5/RI9iNPL39mQBO+mF+Vq+41604/ieAA3mtL02pdO3Vi
         XiUmLw95bTXS83GfdVuzluqj/bMOFcNZdMwc5Cm7BA1zavEF7LaslVaPFcW4aYXxijfj
         tUpZ/6kuCrDTIRYzOwyL2YWFrJ6WbYOa6pq2Ksi21Vyd/K5j7mLSXIsNZVpDEXh2x7Q0
         iFPA==
X-Forwarded-Encrypted: i=1; AJvYcCU4r9IkcS3cWt1FTv8vlQ8yNBI2FM8ryDK8HVzj9H0aRDjKlsu8F7bHwTbYvD2Un/KmjA96qtrOOpEWRvVafjKG@lists.infradead.org, AJvYcCWvrhqhDKkl4ZUf5Ig2VikhWqMIZ3/8OSC+sIegfjR5zu88+mqZ4N0Qwcnb98e67aaRNsx8W7ICb7Im4Y7hIn4=@lists.infradead.org
X-Gm-Message-State: AOJu0YympcfGNr737CoMXAv32Wqy7pryhV4lvzYL6ycuivL9B/6ptYo4
	bnnrxFxoCHcOI6XfgD50usQjv0JNRwfZLlL9OwEYhukKuKrPKTTUvBKVuA==
X-Google-Smtp-Source: AGHT+IGp8he+nOmx6pOtzShCTzm3JVZc/I0S6JDbj6P5LRnLn+aiBz1tuBucLUhrFfjLDnJmb0novQ==
X-Received: by 2002:a05:6000:1f86:b0:37d:50e1:b3e1 with SMTP id ffacd0b85a97d-37efcf0615cmr2722552f8f.16.1729700442055;
        Wed, 23 Oct 2024 09:20:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0ba7dffsm9249993f8f.116.2024.10.23.09.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:20:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next RFC PATCH v2 3/3] net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
Date: Wed, 23 Oct 2024 18:19:52 +0200
Message-ID: <20241023161958.12056-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023161958.12056-1-ansuelsmth@gmail.com>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_092044_245312_C4FF860B 
X-CRM114-Status: GOOD (  24.93  )
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

Add support for Airoha AN8855 Internal Switch Gigabit PHY.

This is a simple PHY driver to configure and calibrate the PHY for the
AN8855 Switch with the use of NVMEM cells.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                  |   1 +
 drivers/net/phy/Kconfig      |   5 +
 drivers/net/phy/Makefile     |   1 +
 drivers/net/phy/air_an8855.c | 265 +++++++++++++++++++++++++++++++++++
 4 files changed, 272 insertions(+)
 create mode 100644 drivers/net/phy/air_an8855.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e3077d9feee2..cf34add2a0bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,6 +726,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 F:	drivers/net/dsa/an8855.c
 F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
 
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index ee3ea0b56d48..1d474038ea7f 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -79,6 +79,11 @@ config SFP
 
 comment "MII PHY device drivers"
 
+config AIR_AN8855_PHY
+	tristate "Airoha AN8855 Internal Gigabit PHY"
+	help
+	  Currently supports the internal Airoha AN8855 Switch PHY.
+
 config AIR_EN8811H_PHY
 	tristate "Airoha EN8811H 2.5 Gigabit PHY"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 90f886844381..baba7894785b 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -35,6 +35,7 @@ obj-y				+= $(sfp-obj-y) $(sfp-obj-m)
 
 obj-$(CONFIG_ADIN_PHY)		+= adin.o
 obj-$(CONFIG_ADIN1100_PHY)	+= adin1100.o
+obj-$(CONFIG_AIR_AN8855_PHY)   += air_an8855.o
 obj-$(CONFIG_AIR_EN8811H_PHY)   += air_en8811h.o
 obj-$(CONFIG_AMD_PHY)		+= amd.o
 obj-$(CONFIG_AMCC_QT2025_PHY)	+= qt2025.o
diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
new file mode 100644
index 000000000000..c43ae7b76177
--- /dev/null
+++ b/drivers/net/phy/air_an8855.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/phy.h>
+#include <linux/module.h>
+#include <linux/bitfield.h>
+#include <linux/nvmem-consumer.h>
+
+#define AN8855_PHY_PAGE_CTRL			0x1f
+#define   AN8855_PHY_NORMAL_PAGE		0x0
+#define   AN8855_PHY_EXT_PAGE			0x1
+
+#define AN8855_PHY_EXT_REG_14			0x14
+#define   AN8855_PHY_EN_DOWN_SHFIT		BIT(4)
+
+/* R50 Calibration regs in MDIO_MMD_VEND1 */
+#define AN8855_PHY_R500HM_RSEL_TX_AB		0x174
+#define AN8855_PHY_R50OHM_RSEL_TX_A_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_A		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_B_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_B		GENMASK(6, 0)
+#define AN8855_PHY_R500HM_RSEL_TX_CD		0x175
+#define AN8855_PHY_R50OHM_RSEL_TX_C_EN		BIT(15)
+#define AN8855_PHY_R50OHM_RSEL_TX_C		GENMASK(14, 8)
+#define AN8855_PHY_R50OHM_RSEL_TX_D_EN		BIT(7)
+#define AN8855_PHY_R50OHM_RSEL_TX_D		GENMASK(6, 0)
+
+#define AN8855_SWITCH_EFUSE_R50O		GENMASK(30, 24)
+
+/* PHY TX PAIR DELAY SELECT Register */
+#define PHY_TX_PAIR_DLY_SEL_GBE			0x013
+/* PHY ADC Register */
+#define PHY_RXADC_CTRL				0x0d8
+#define PHY_RXADC_REV_0				0x0d9
+#define PHY_RXADC_REV_1				0x0da
+
+#define AN8855_PHY_ID			0xc0ff0410
+
+struct air_an8855_priv {
+	u8 calibration_data[4];
+};
+
+static const u8 dsa_r50ohm_table[] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
+	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
+	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
+	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
+	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
+	14,  12,  11,   9
+};
+
+static int en8855_get_r50ohm_val(struct device *dev, const char *calib_name,
+				 u8 *dest)
+{
+	u32 shift_sel, val;
+	int ret;
+	int i;
+
+	ret = nvmem_cell_read_u32(dev, calib_name, &val);
+	if (ret)
+		return ret;
+
+	shift_sel = FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
+	for (i = 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
+		if (dsa_r50ohm_table[i] == shift_sel)
+			break;
+
+	if (i < 8 || i >= ARRAY_SIZE(dsa_r50ohm_table))
+		*dest = dsa_r50ohm_table[25];
+	else
+		*dest = dsa_r50ohm_table[i - 8];
+
+	return 0;
+}
+
+static int an8855_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct device_node *node = dev->of_node;
+	struct air_an8855_priv *priv;
+	int ret;
+
+	/* If we don't have a node, skip get calib */
+	if (!node)
+		return 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = en8855_get_r50ohm_val(dev, "tx_a", &priv->calibration_data[0]);
+	if (ret)
+		return ret;
+
+	ret = en8855_get_r50ohm_val(dev, "tx_b", &priv->calibration_data[1]);
+	if (ret)
+		return ret;
+
+	ret = en8855_get_r50ohm_val(dev, "tx_c", &priv->calibration_data[2]);
+	if (ret)
+		return ret;
+
+	ret = en8855_get_r50ohm_val(dev, "tx_d", &priv->calibration_data[3]);
+	if (ret)
+		return ret;
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int an8855_config_init(struct phy_device *phydev)
+{
+	struct air_an8855_priv *priv = phydev->priv;
+	int ret;
+
+	/* Enable HW auto downshift */
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
+	if (ret)
+		return ret;
+	ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
+			   AN8855_PHY_EN_DOWN_SHFIT);
+	if (ret)
+		return ret;
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
+	if (ret)
+		return ret;
+
+	/* Enable Asymmetric Pause Capability */
+	ret = phy_set_bits(phydev, MII_ADVERTISE, ADVERTISE_PAUSE_ASYM);
+	if (ret)
+		return ret;
+
+	/* Disable EEE */
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
+	if (ret)
+		return ret;
+
+	/* Apply calibration values, if needed. BIT(0) signal this */
+	if (phydev->dev_flags & BIT(0)) {
+		u8 *calibration_data = priv->calibration_data;
+
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R500HM_RSEL_TX_AB,
+				     AN8855_PHY_R50OHM_RSEL_TX_A | AN8855_PHY_R50OHM_RSEL_TX_B,
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_A, calibration_data[0]) |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_B, calibration_data[1]));
+		if (ret)
+			return ret;
+		ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_R500HM_RSEL_TX_CD,
+				     AN8855_PHY_R50OHM_RSEL_TX_C | AN8855_PHY_R50OHM_RSEL_TX_D,
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_C, calibration_data[2]) |
+				     FIELD_PREP(AN8855_PHY_R50OHM_RSEL_TX_D, calibration_data[3]));
+		if (ret)
+			return ret;
+	}
+
+	/* Apply values to decude signal noise */
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_TX_PAIR_DLY_SEL_GBE, 0x4040);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_RXADC_CTRL, 0x1010);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_RXADC_REV_0, 0x100);
+	if (ret)
+		return ret;
+	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, PHY_RXADC_REV_1, 0x100);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int an8855_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val;
+	int ret;
+
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
+	if (ret)
+		return ret;
+
+	val = phy_read(phydev, AN8855_PHY_EXT_REG_14);
+	*data = val & AN8855_PHY_EXT_REG_14 ? DOWNSHIFT_DEV_DEFAULT_COUNT :
+					      DOWNSHIFT_DEV_DISABLE;
+
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	int ret;
+
+	ret = phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_EXT_PAGE);
+	if (ret)
+		return ret;
+
+	if (cnt != DOWNSHIFT_DEV_DISABLE) {
+		ret = phy_set_bits(phydev, AN8855_PHY_EXT_REG_14,
+				   AN8855_PHY_EN_DOWN_SHFIT);
+		if (ret)
+			return ret;
+	} else {
+		ret = phy_clear_bits(phydev, AN8855_PHY_EXT_REG_14,
+				     AN8855_PHY_EN_DOWN_SHFIT);
+		if (ret)
+			return ret;
+	}
+
+	return phy_write(phydev, AN8855_PHY_PAGE_CTRL, AN8855_PHY_NORMAL_PAGE);
+}
+
+static int an8855_get_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return an8855_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int an8855_set_tunable(struct phy_device *phydev,
+			      struct ethtool_tunable *tuna, const void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return an8855_set_downshift(phydev, *(const u8 *)data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static struct phy_driver an8855_driver[] = {
+{
+	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),
+	.name			= "Airoha AN8855 internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.flags			= PHY_IS_INTERNAL,
+	.probe			= an8855_probe,
+	.config_init		= an8855_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_tunable		= an8855_get_tunable,
+	.set_tunable		= an8855_set_tunable,
+	.suspend		= genphy_suspend,
+	.resume			= genphy_resume,
+}, };
+
+module_phy_driver(an8855_driver);
+
+static struct mdio_device_id __maybe_unused an8855_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(AN8855_PHY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, an8855_tbl);
+
+MODULE_DESCRIPTION("Airoha AN8855 PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.45.2


