Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE0606D835
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ODu8fyLZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f87BU2dW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/S2YUQqO72SBVgftpfYjn9HLD7xZ6RYxbPRNuRqrY+E=; b=ODu8fyLZtT+GhI
	HIa2kzbHC2PdgBMvSJqMXYmiTudvHt/8TFvt/uFnUEmuKU+5GfAxj68YjNa8JHFBS5m4kKhilJlFK
	xQLzpak/CxzMLWPsKoU9Qd0jPTZS2B6HFKRpwVoN2hrvIGqkkQ2P+wPBdTQFqVyJ2rIZ07K84AEAJ
	jxuzqcEEnKO+GD5QNN5dl3Nb6zfBeQH8jnDhRHp7umHg0OBhQipPv3U42HxPrF/MlpEz3a4Ew9god
	SO0HqUCZ2nJVfTOMYLEkPNTBm5SJSFso6WlHR2dnzxtScef1lJRZGcXbCQRWct6dNAfXmCb+jzZFp
	GqbaMCgQlkIGxmk4GI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmX-00000003oQE-2Req;
	Tue, 03 Nov 2026 22:15:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmQ-00000003oD1-1u1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:15:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so351075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744096; x=1794348896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/S2YUQqO72SBVgftpfYjn9HLD7xZ6RYxbPRNuRqrY+E=;
        b=f87BU2dWmQOY7/iJ+WKFip4ujssi48EsaLizba271h5jCbr8zapxs+sc96z4w99xUk
         9mGl8kMeD2yOzCaiAwh0U6xxIjrN95rN81Q3WZyR8+coPjHi4U1D4CIsqjb3MmCctgze
         do226NlgcrFhabHojcWRtnz53jnV/mLnqWmcAhc/CdHDhzdnIfZ/OGYbyBvY9304U2To
         vbBrZUuUlFDUpvLTjadhaow1Fs1dbJn4XFYuzx0LXo7tlFtoT/uuTAE5ZiKI20imBnyC
         lghVvZ1ASiapaPGGBWbEns5ZFoltjXRWcz8tdU73U+Ef9At1/OpoTK2oK+vLAQhHGMRn
         hgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744096; x=1794348896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/S2YUQqO72SBVgftpfYjn9HLD7xZ6RYxbPRNuRqrY+E=;
        b=LfV0ThZhtPMHzyrIX7zEljGFgEMtic2a8VYYj9Rhoo/RNeIUm9wbb9yOfWafNK5t7/
         dyTJCvevQn2hb6JX4qHq6HjDtkUupX9Wun24mpsHwDe4k7oLWd70VvsUeqHPYB8WhhFy
         E0gORckWgX+g8iCgfJ0zGDLX8WeoclW+3JPVLOt6cKeb6hoGweo2eHEbpuL3YgsKlOpc
         0KnnrtQ3V0tjVMgRb0s1ze1SNo5VGYgBkOUGOFQLDk/f/rk1go9mqE1wouCrrjW533R8
         7xfkFVfDc+lqaPOUCf1Oandt3prjvGZlq0wrqbryICHiEaqZGxjeCz7Sf2TUWzOSjRUC
         rVCw==
X-Forwarded-Encrypted: i=1; AKwUvBz4yNxh6HYbzqPvZYa1X5EQmO8NvUCL/v5CmMRnpv6lgB8Ul1kTk+aN6ZcoajcAJ2ikMX0gNgQEDZi0eUh2u4/+@lists.infradead.org
X-Gm-Message-State: APuU4Z+fsmSmuh31kmmHKae5PedqGJ8GrQWrBBRBZNNvxIhlEq9ZINx4
	NmhWvI0JAzg32vm2aL98JuDVK3f4s12oLlHtfw/YRsowL68hcSbClgr2
X-Gm-Gg: AYBFou29RWXwshrchPaw6KgvqniOJt9unQt7L1kmo/3S8riNl2ItMvty08epF4yvOtt
	mD9z+5/tAKrlHu4TgawtodwXyvFFnBR8WUA94akKuh7epGbaP8FN8jo7VR5IAj4i5dcxJzPYKog
	q6rNhv4RsXTcKSM1BryXnhgwWXfWqVUTfbbntOunbslSFzxONhsxx/m5pjzrtlKoee9NovDEQ7M
	RwvUhvkHLdv2dXgp+qujDcYi5jIcOHSyqwUjudP9fdXnerMjkDmVKDvh5fyPNZWmi5hOffwkqo+
	mw448g92+aySLya1aNWQLhOuzlAx02xsa23HkLbJShMo0IT2n0Q7UKI1MB+Yr9ao2csQTWn7gJU
	/4Ib8u9Rqs+yCXM/OxDR2y6u8JcXi70w0o67GrF0T1rc6nxV2qkGqFTxvpc6Z2pe61+HQdHLCWh
	hBMJBnDsTBJGTW2LAsOLm/6Tbn3u+CxJFEuGgAX2Ec91mP8ZDMPGjsGhIy7Bop7HWSzR2mlEdRX
	cXfFH6Yca7y3fdrJ4WxxkxWsKMqV4j4EDbPxis9zzFI56UXqICLmDPNrahikB2BW+FYfT4asDro
	ozxg4+Z2XOTBN4BWzzj88ZrOjWQs+gBlEwhXqRr6caQyjgo7Br9NtKKfIb1rcYKQ1wV0/UTFscC
	hAjB4tthspGqXCFm3z/NLYR7jKzC8eCOSe/tts0NVm2htBiqHJ12EnWk=
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr307926675e9.0.1793744096353;
        Tue, 03 Nov 2026 14:14:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 4/6] net: phy: mediatek: split Airoha code to dedicated source
Date: Tue,  3 Nov 2026 23:14:35 +0100
Message-ID: <20261103221439.30502-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141458_709465_86152B90 
X-CRM114-Status: GOOD (  28.55  )
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

In preparation for Airoha PHYs software calibration support, split the
Airoha code to dedicated source following Mediatek naming pattern of
"ge-soc".

This is to tidy things up and not overload the mediatek driver of specific
Airoha code and ship a bigger PHY kernel module with dead code.

Move the shared LEDs function to mtk-phy-lib to permit the split instead of
duplicating the code.

Also add myself as MAINTAINER of the now new airoha-ge-soc driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                              |   8 ++
 drivers/net/phy/mediatek/Kconfig         |  18 ++-
 drivers/net/phy/mediatek/Makefile        |   1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 128 +++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    | 172 -----------------------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |   6 +-
 drivers/net/phy/mediatek/mtk-phy-lib.c   |  72 ++++++++++
 drivers/net/phy/mediatek/mtk.h           |  12 ++
 8 files changed, 239 insertions(+), 178 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8add8b8cd306..8a3e84d7eff3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -771,6 +771,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA ETHERNET PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/phy/mediatek/airoha-ge-soc.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 3b9cf82c0cb2..5abf78202991 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -1,4 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config AIROHA_GE_SOC_PHY
+	tristate "Airoha SoC Gigabit Ethernet PHYs"
+	depends on ARM64 || ECONET || COMPILE_TEST
+	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
+	select MTK_NET_PHYLIB
+	select PHY_PACKAGE
+	help
+	  Supports Airoha SoC built-in Gigabit Ethernet PHYs.
+
+	  Include support for built-in Ethernet PHYs which are present in
+	  the AN7581 and AN7583 SoCs. These PHYs will dynamically
+	  calibrate during startup.
+
 config MEDIATEK_2P5GE_PHY
 	tristate "MediaTek 2.5Gb Ethernet PHYs"
 	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
@@ -32,9 +45,8 @@ config MEDIATEK_FE_SOC_PHY
 
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Gigabit Ethernet PHYs"
-	depends on ARM64 || ECONET || COMPILE_TEST
-	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
-		   ECONET || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
+	depends on (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
 	select MTK_NET_PHYLIB
 	select PHY_PACKAGE
 	help
diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
index 6f9cacf7f906..5594057f51d0 100644
--- a/drivers/net/phy/mediatek/Makefile
+++ b/drivers/net/phy/mediatek/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_AIROHA_GE_SOC_PHY)		+= airoha-ge-soc.o
 obj-$(CONFIG_MEDIATEK_2P5GE_PHY)	+= mtk-2p5ge.o
 obj-$(CONFIG_MEDIATEK_FE_SOC_PHY)	+= mtk-fe-soc.o
 obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
new file mode 100644
index 000000000000..e40e4597cd94
--- /dev/null
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0+
+#include <linux/pinctrl/consumer.h>
+#include <linux/phy.h>
+
+#include "mtk.h"
+#include "mtk-ge-soc.h"
+
+#define AIROHA_PHY_MAX_LEDS			2
+
+static int an7581_phy_probe(struct phy_device *phydev)
+{
+	struct mtk_socphy_priv *priv;
+	struct pinctrl *pinctrl;
+
+	/* Toggle pinctrl to enable PHY LED */
+	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
+	if (IS_ERR(pinctrl))
+		dev_err(&phydev->mdio.bus->dev,
+			"Failed to setup PHY LED pinctrl\n");
+
+	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
+				       unsigned long modes)
+{
+	u16 val = 0;
+	u32 mode;
+
+	if (index >= AIROHA_PHY_MAX_LEDS)
+		return -EINVAL;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			val = MTK_PHY_LED_ON_POLARITY;
+			break;
+		case PHY_LED_ACTIVE_HIGH:
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
+			      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
+			      MTK_PHY_LED_ON_POLARITY, val);
+}
+
+static int en7528_phy_config_init(struct phy_device *phydev)
+{
+	/* The LED controller of the EN7528 powers up with its external
+	 * control disabled, leaving the LED pins dark regardless of what is
+	 * programmed into the LED control registers. Hand the pins over to
+	 * the LED control registers the same way the air_en8811h driver
+	 * does; the mode field of this register is already set out of reset.
+	 */
+	return phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED_BCR,
+				MTK_PHY_LED_BCR_CLK_EN |
+				MTK_PHY_LED_BCR_EXT_CTRL);
+}
+
+static int an7583_phy_config_init(struct phy_device *phydev)
+{
+	/* BMCR_PDOWN is enabled by default */
+	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+}
+
+static struct phy_driver mtk_socphy_driver[] = {
+	{
+		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_EN7528),
+		.name		= "EcoNet EN7528 PHY",
+		.config_init	= en7528_phy_config_init,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
+	{
+		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581),
+		.name		= "Airoha AN7581 PHY",
+		.config_intr	= genphy_no_config_intr,
+		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
+	{
+		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7583),
+		.name		= "Airoha AN7583 PHY",
+		.config_init	= an7583_phy_config_init,
+		.probe		= an7581_phy_probe,
+		.led_blink_set	= mt798x_phy_led_blink_set,
+		.led_brightness_set = mt798x_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
+		.led_hw_control_set = mt798x_phy_led_hw_control_set,
+		.led_hw_control_get = mt798x_phy_led_hw_control_get,
+		.led_polarity_set = an7581_phy_led_polarity_set,
+	},
+};
+
+module_phy_driver(mtk_socphy_driver);
+
+static const struct mdio_device_id __maybe_unused airoha_socphy_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_EN7528) },
+	{ PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581) },
+	{ PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7583) },
+	{ }
+};
+
+MODULE_DESCRIPTION("Airoha SoC Gigabit Ethernet PHY driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+MODULE_DEVICE_TABLE(mdio, airoha_socphy_tbl);
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index f3ce6e67eb38..4132ac403583 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -887,73 +887,6 @@ static int mt798x_phy_config_init(struct phy_device *phydev)
 	return mt798x_phy_calibration(phydev);
 }
 
-static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
-				    unsigned long *delay_on,
-				    unsigned long *delay_off)
-{
-	bool blinking = false;
-	int err;
-
-	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
-	if (err < 0)
-		return err;
-
-	err = mtk_phy_hw_led_blink_set(phydev, index, blinking);
-	if (err)
-		return err;
-
-	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
-				     false);
-}
-
-static int mt798x_phy_led_brightness_set(struct phy_device *phydev,
-					 u8 index, enum led_brightness value)
-{
-	int err;
-
-	err = mtk_phy_hw_led_blink_set(phydev, index, false);
-	if (err)
-		return err;
-
-	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
-				     (value != LED_OFF));
-}
-
-static const unsigned long supported_triggers =
-	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
-	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
-	BIT(TRIGGER_NETDEV_LINK)        |
-	BIT(TRIGGER_NETDEV_LINK_10)     |
-	BIT(TRIGGER_NETDEV_LINK_100)    |
-	BIT(TRIGGER_NETDEV_LINK_1000)   |
-	BIT(TRIGGER_NETDEV_RX)          |
-	BIT(TRIGGER_NETDEV_TX);
-
-static int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
-					  unsigned long rules)
-{
-	return mtk_phy_led_hw_is_supported(phydev, index, rules,
-					   supported_triggers);
-}
-
-static int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
-					 unsigned long *rules)
-{
-	return mtk_phy_led_hw_ctrl_get(phydev, index, rules,
-				       MTK_GPHY_LED_ON_SET,
-				       MTK_GPHY_LED_RX_BLINK_SET,
-				       MTK_GPHY_LED_TX_BLINK_SET);
-};
-
-static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
-					 unsigned long rules)
-{
-	return mtk_phy_led_hw_ctrl_set(phydev, index, rules,
-				       MTK_GPHY_LED_ON_SET,
-				       MTK_GPHY_LED_RX_BLINK_SET,
-				       MTK_GPHY_LED_TX_BLINK_SET);
-};
-
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
 	struct mtk_socphy_shared *priv = phy_package_get_priv(phydev);
@@ -1090,71 +1023,6 @@ static int mt7981_phy_probe(struct phy_device *phydev)
 	return mt798x_phy_calibration(phydev);
 }
 
-static int an7581_phy_probe(struct phy_device *phydev)
-{
-	struct mtk_socphy_priv *priv;
-	struct pinctrl *pinctrl;
-
-	/* Toggle pinctrl to enable PHY LED */
-	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
-	if (IS_ERR(pinctrl))
-		dev_err(&phydev->mdio.bus->dev,
-			"Failed to setup PHY LED pinctrl\n");
-
-	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	phydev->priv = priv;
-
-	return 0;
-}
-
-static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
-				       unsigned long modes)
-{
-	u16 val = 0;
-	u32 mode;
-
-	if (index >= MTK_PHY_MAX_LEDS)
-		return -EINVAL;
-
-	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
-		switch (mode) {
-		case PHY_LED_ACTIVE_LOW:
-			val = MTK_PHY_LED_ON_POLARITY;
-			break;
-		case PHY_LED_ACTIVE_HIGH:
-			break;
-		default:
-			return -EINVAL;
-		}
-	}
-
-	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, index ?
-			      MTK_PHY_LED1_ON_CTRL : MTK_PHY_LED0_ON_CTRL,
-			      MTK_PHY_LED_ON_POLARITY, val);
-}
-
-static int an7583_phy_config_init(struct phy_device *phydev)
-{
-	/* BMCR_PDOWN is enabled by default */
-	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
-}
-
-static int en7528_phy_config_init(struct phy_device *phydev)
-{
-	/* The LED controller of the EN7528 powers up with its external
-	 * control disabled, leaving the LED pins dark regardless of what is
-	 * programmed into the LED control registers. Hand the pins over to
-	 * the LED control registers the same way the air_en8811h driver
-	 * does; the mode field of this register is already set out of reset.
-	 */
-	return phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED_BCR,
-				MTK_PHY_LED_BCR_CLK_EN |
-				MTK_PHY_LED_BCR_EXT_CTRL);
-}
-
 static struct phy_driver mtk_socphy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981),
@@ -1190,43 +1058,6 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 	},
-	{
-		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_EN7528),
-		.name		= "EcoNet EN7528 PHY",
-		.config_init	= en7528_phy_config_init,
-		.probe		= an7581_phy_probe,
-		.led_blink_set	= mt798x_phy_led_blink_set,
-		.led_brightness_set = mt798x_phy_led_brightness_set,
-		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
-		.led_hw_control_set = mt798x_phy_led_hw_control_set,
-		.led_hw_control_get = mt798x_phy_led_hw_control_get,
-		.led_polarity_set = an7581_phy_led_polarity_set,
-	},
-	{
-		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581),
-		.name		= "Airoha AN7581 PHY",
-		.config_intr	= genphy_no_config_intr,
-		.handle_interrupt = genphy_handle_interrupt_no_ack,
-		.probe		= an7581_phy_probe,
-		.led_blink_set	= mt798x_phy_led_blink_set,
-		.led_brightness_set = mt798x_phy_led_brightness_set,
-		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
-		.led_hw_control_set = mt798x_phy_led_hw_control_set,
-		.led_hw_control_get = mt798x_phy_led_hw_control_get,
-		.led_polarity_set = an7581_phy_led_polarity_set,
-	},
-	{
-		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583),
-		.name		= "Airoha AN7583 PHY",
-		.config_init	= an7583_phy_config_init,
-		.probe		= an7581_phy_probe,
-		.led_blink_set	= mt798x_phy_led_blink_set,
-		.led_brightness_set = mt798x_phy_led_brightness_set,
-		.led_hw_is_supported = mt798x_phy_led_hw_is_supported,
-		.led_hw_control_set = mt798x_phy_led_hw_control_set,
-		.led_hw_control_get = mt798x_phy_led_hw_control_get,
-		.led_polarity_set = an7581_phy_led_polarity_set,
-	},
 };
 
 module_phy_driver(mtk_socphy_driver);
@@ -1234,9 +1065,6 @@ module_phy_driver(mtk_socphy_driver);
 static const struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988) },
-	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_EN7528) },
-	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7581) },
-	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_AN7583) },
 	{ }
 };
 
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
index 14370b5ce482..419d87a341a0 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -7,9 +7,9 @@
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
 #define MTK_GPHY_ID_MT7988			0x03a29481
-#define MTK_GPHY_ID_EN7528			0x03a29491
-#define MTK_GPHY_ID_AN7581			0x03a294c1
-#define MTK_GPHY_ID_AN7583			0xc0ff0420
+#define AIROHA_GPHY_ID_EN7528			0x03a29491
+#define AIROHA_GPHY_ID_AN7581			0x03a294c1
+#define AIROHA_GPHY_ID_AN7583			0xc0ff0420
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_STANDARD			0x0000
diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 3e4fb899a85b..dc4abd95d73f 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -339,6 +339,78 @@ void mtk_phy_leds_state_init(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(mtk_phy_leds_state_init);
 
+int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
+{
+	bool blinking = false;
+	int err;
+
+	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
+	if (err < 0)
+		return err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, blinking);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
+				     false);
+}
+EXPORT_SYMBOL_GPL(mt798x_phy_led_blink_set);
+
+int mt798x_phy_led_brightness_set(struct phy_device *phydev,
+				  u8 index, enum led_brightness value)
+{
+	int err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, false);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, MTK_GPHY_LED_ON_MASK,
+				     (value != LED_OFF));
+}
+EXPORT_SYMBOL_GPL(mt798x_phy_led_brightness_set);
+
+static const unsigned long supported_triggers =
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
+
+int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				   unsigned long rules)
+{
+	return mtk_phy_led_hw_is_supported(phydev, index, rules,
+					   supported_triggers);
+}
+EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_is_supported);
+
+int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
+				  unsigned long *rules)
+{
+	return mtk_phy_led_hw_ctrl_get(phydev, index, rules,
+				       MTK_GPHY_LED_ON_SET,
+				       MTK_GPHY_LED_RX_BLINK_SET,
+				       MTK_GPHY_LED_TX_BLINK_SET);
+};
+EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_control_get);
+
+int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
+				  unsigned long rules)
+{
+	return mtk_phy_led_hw_ctrl_set(phydev, index, rules,
+				       MTK_GPHY_LED_ON_SET,
+				       MTK_GPHY_LED_RX_BLINK_SET,
+				       MTK_GPHY_LED_TX_BLINK_SET);
+};
+EXPORT_SYMBOL_GPL(mt798x_phy_led_hw_control_set);
+
 MODULE_DESCRIPTION("MediaTek Ethernet PHY driver common");
 MODULE_AUTHOR("Sky Huang <SkyLake.Huang@mediatek.com>");
 MODULE_AUTHOR("Daniel Golle <daniel@makrotopia.org>");
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 3565e39b96a8..bc46646a95fd 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -103,4 +103,16 @@ int mtk_phy_hw_led_blink_set(struct phy_device *phydev, u8 index,
 			     bool blinking);
 void mtk_phy_leds_state_init(struct phy_device *phydev);
 
+int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
+			     unsigned long *delay_on,
+			     unsigned long *delay_off);
+int mt798x_phy_led_brightness_set(struct phy_device *phydev,
+				  u8 index, enum led_brightness value);
+int mt798x_phy_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				   unsigned long rules);
+int mt798x_phy_led_hw_control_get(struct phy_device *phydev, u8 index,
+				  unsigned long *rules);
+int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
+				  unsigned long rules);
+
 #endif /* _MTK_EPHY_H_ */
-- 
2.55.0


