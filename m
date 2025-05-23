Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E83C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGEcvDBfYeZBjwUC/CCx28OaHYTCv9ycCaOblUmx3bM=; b=mIXA+ywTJMysDpP5Eo9qgL4KAi
	j2UrLzAhXhZc1b688oVvNmKPy+u73KFf5U2fvbBJQ575+cwCtM2/XfNn77HPzH/Eh+o24EWRCeDD5
	DkZzDL/upRaezW7/VrOkZka/0ZyLKI6Idj5iowPy1n1QY7Xo+jnGtNfq6cAWg8C+/apR7jx2d7yhq
	s+9XePHADPGzCHX3Tf8IbEd+uNVfk6TFU7TuhhrPVrRAJEO+S6a2EI4S0xVC98pOE0YaFNZc4aGY5
	cm1ZIyFItOEEsIDUQt3oVJ9+M9G7HHoMTIQzd0cWyVnOoPDXNBIrdmD0KBanbfLM932nG+Sc4ViSE
	Wf9OON9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQlI-00000003jL1-378n;
	Fri, 23 May 2025 11:40:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQhZ-00000003isO-2XHA;
	Fri, 23 May 2025 11:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AGEcvDBfYeZBjwUC/CCx28OaHYTCv9ycCaOblUmx3bM=; b=OqXA7rcHVoUpldz0BrUIvC3Ke9
	lTiwvIo0Ec7LhZbiPBhFfjn/kJVuwqPP9Hqcx5FluAiH0Wua2SzQFRv7y+olnB8qApyuqLltO/xQi
	amMG4YFjH0DEEAKhUqoJayxkf0g/d+Pjh63KCcLFZNShmVH+xcy/SqumnlpgSh7MgQ9kMAFYIwlqx
	9WjaKEQhdgsnRrSvsILsutppXDO1pp/4/hlBLAAcqyNQ4idDTGCweuJRfctbMVqtiLtZgJ1qbOXLY
	Efkn4koVazkkd5GfxGNlgP72NXa4P+QsmjMuhMzSaoOZXgELKs0rV38MQ/GghphAeV20ZxF8vCjz6
	zVql1VHA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIQhV-00000001ILI-2dpl;
	Fri, 23 May 2025 11:36:36 +0000
X-UUID: 25ff579437ca11f08d385d50fb11b32d-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AGEcvDBfYeZBjwUC/CCx28OaHYTCv9ycCaOblUmx3bM=;
	b=hhOWTUt1NH4pfuqOuUvkgSj+37Z2bArepHJi6y/XGa/+qwMwBAWP27ijsESo9s+jO38fsgNusrG3kStex7uyqjavz+PbLDaQZ326Vo1MpiuYjQ1aZVP0aVs+SiG6eSaOuF/sECz7AMrhU/qpwMHn2/qgakxY5djbqdmMGTTIRdw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:33e032b1-94c2-4d35-a7c7-2be42110ab96,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d25a35f1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25ff579437ca11f08d385d50fb11b32d-20250523
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1850178189; Fri, 23 May 2025 04:36:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 19:36:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 19:36:16 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Sky Huang <skylake.huang@mediatek.com>
Subject: [PATCH net-next 1/2] net: phy: mtk-2p5ge: Add LED support for MT7988
Date: Fri, 23 May 2025 19:36:00 +0800
Message-ID: <20250523113601.3627781-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
References: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_123634_052193_561E23AF 
X-CRM114-Status: GOOD (  16.54  )
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

From: Sky Huang <skylake.huang@mediatek.com>

Add LED support for MT7988's built-in 2.5Gphy. LED hardware has almost
the same design with MT7981's/MT7988's built-in GbE. So hook the same
helper function here.

Before mtk_phy_leds_state_init(), set correct default values of LED0
and LED1.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 drivers/net/phy/mediatek/mtk-2p5ge.c | 104 +++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-2p5ge.c b/drivers/net/phy/mediatek/mtk-2p5ge.c
index e147eab52..de8a41a18 100644
--- a/drivers/net/phy/mediatek/mtk-2p5ge.c
+++ b/drivers/net/phy/mediatek/mtk-2p5ge.c
@@ -249,8 +249,80 @@ static int mt798x_2p5ge_phy_get_rate_matching(struct phy_device *phydev,
 	return RATE_MATCH_PAUSE;
 }
 
+static const unsigned long supported_triggers =
+	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
+	BIT(TRIGGER_NETDEV_LINK)        |
+	BIT(TRIGGER_NETDEV_LINK_10)     |
+	BIT(TRIGGER_NETDEV_LINK_100)    |
+	BIT(TRIGGER_NETDEV_LINK_1000)   |
+	BIT(TRIGGER_NETDEV_LINK_2500)   |
+	BIT(TRIGGER_NETDEV_RX)          |
+	BIT(TRIGGER_NETDEV_TX);
+
+static int mt798x_2p5ge_phy_led_blink_set(struct phy_device *phydev, u8 index,
+					  unsigned long *delay_on,
+					  unsigned long *delay_off)
+{
+	bool blinking = false;
+	int err = 0;
+
+	err = mtk_phy_led_num_dly_cfg(index, delay_on, delay_off, &blinking);
+	if (err < 0)
+		return err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, blinking);
+	if (err)
+		return err;
+
+	if (blinking)
+		mtk_phy_hw_led_on_set(phydev, index, MTK_2P5GPHY_LED_ON_MASK,
+				      false);
+
+	return 0;
+}
+
+static int mt798x_2p5ge_phy_led_brightness_set(struct phy_device *phydev,
+					       u8 index,
+					       enum led_brightness value)
+{
+	int err;
+
+	err = mtk_phy_hw_led_blink_set(phydev, index, false);
+	if (err)
+		return err;
+
+	return mtk_phy_hw_led_on_set(phydev, index, MTK_2P5GPHY_LED_ON_MASK,
+				     (value != LED_OFF));
+}
+
+static int mt798x_2p5ge_phy_led_hw_is_supported(struct phy_device *phydev,
+						u8 index, unsigned long rules)
+{
+	return mtk_phy_led_hw_is_supported(phydev, index, rules,
+					   supported_triggers);
+}
+
+static int mt798x_2p5ge_phy_led_hw_control_get(struct phy_device *phydev,
+					       u8 index, unsigned long *rules)
+{
+	return mtk_phy_led_hw_ctrl_get(phydev, index, rules,
+				       MTK_2P5GPHY_LED_ON_SET,
+				       MTK_2P5GPHY_LED_RX_BLINK_SET,
+				       MTK_2P5GPHY_LED_TX_BLINK_SET);
+};
+
+static int mt798x_2p5ge_phy_led_hw_control_set(struct phy_device *phydev,
+					       u8 index, unsigned long rules)
+{
+	return mtk_phy_led_hw_ctrl_set(phydev, index, rules,
+				       MTK_2P5GPHY_LED_ON_SET,
+				       MTK_2P5GPHY_LED_RX_BLINK_SET,
+				       MTK_2P5GPHY_LED_TX_BLINK_SET);
+};
+
 static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
 {
+	struct mtk_socphy_priv *priv;
 	struct pinctrl *pinctrl;
 	int ret;
 
@@ -273,19 +345,34 @@ static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	/* Setup LED */
+	/* Setup LED. On default, LED0 is on/off when link is up/down. As for
+	 * LED1, it blinks as tx/rx transmission takes place.
+	 */
 	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED0_ON_CTRL,
-			 MTK_PHY_LED_ON_POLARITY | MTK_PHY_LED_ON_LINK10 |
-			 MTK_PHY_LED_ON_LINK100 | MTK_PHY_LED_ON_LINK1000 |
-			 MTK_PHY_LED_ON_LINK2500);
-	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_ON_CTRL,
-			 MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX);
+			 MTK_PHY_LED_ON_POLARITY | MTK_2P5GPHY_LED_ON_SET);
+	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED0_BLINK_CTRL,
+			   MTK_2P5GPHY_LED_TX_BLINK_SET |
+			   MTK_2P5GPHY_LED_RX_BLINK_SET);
+	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_ON_CTRL,
+			   MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX |
+			   MTK_2P5GPHY_LED_ON_SET);
+	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_BLINK_CTRL,
+			 MTK_2P5GPHY_LED_TX_BLINK_SET |
+			 MTK_2P5GPHY_LED_RX_BLINK_SET);
 
 	/* Switch pinctrl after setting polarity to avoid bogus blinking */
 	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "i2p5gbe-led");
 	if (IS_ERR(pinctrl))
 		dev_err(&phydev->mdio.dev, "Fail to set LED pins!\n");
 
+	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(struct mtk_socphy_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	phydev->priv = priv;
+
+	mtk_phy_leds_state_init(phydev);
+
 	return 0;
 }
 
@@ -303,6 +390,11 @@ static struct phy_driver mtk_2p5gephy_driver[] = {
 		.resume = genphy_resume,
 		.read_page = mtk_phy_read_page,
 		.write_page = mtk_phy_write_page,
+		.led_blink_set = mt798x_2p5ge_phy_led_blink_set,
+		.led_brightness_set = mt798x_2p5ge_phy_led_brightness_set,
+		.led_hw_is_supported = mt798x_2p5ge_phy_led_hw_is_supported,
+		.led_hw_control_get = mt798x_2p5ge_phy_led_hw_control_get,
+		.led_hw_control_set = mt798x_2p5ge_phy_led_hw_control_set,
 	},
 };
 
-- 
2.45.2


