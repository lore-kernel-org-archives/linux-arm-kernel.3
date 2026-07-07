Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B598C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o72t+wW6LXrZumvYGWEeuDfbD8CGkx3Ce+qlwWRJMkA=; b=tWjH4MY2Je0VroXxpevR4odMQb
	ON7If/1WRKilNoIiPXa8L+MzlKp8flFiBAOCWfGC6SPiBNFyelCWNDPwe+ITmaj/kbSpg/7xLW03D
	zg9W/+aSGITZdgPxnCzFFy5tpsWHsF306B/aZpDn1MMiNxmQFycgZLpuDAAfhapQYWuWxs4PLsm3W
	0wbiOwikCrmXLILY8PFMKNmBEDSg5H9TgtvfvKKWkGRD/4Lq70FzY10qoQEEw7YjnuI6Mexly7Q9W
	qfSxbpw3b9+NoehW8LH1K9WRgn9c4ziGoaPQzlxhxgyjbyAl6omIeBoJVIlyn3FUfT624bl/UnXg3
	bnIJyo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13u-0000000ES56-2eMj;
	Tue, 07 Jul 2026 08:21:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh13l-0000000ERwX-2CD0;
	Tue, 07 Jul 2026 08:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783412498;
	bh=297HFzkz6sVk4zIF49E7x3OB7iSwN5HM9tWtJK1lYoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=doda2EoVN2sz4TOkZhF1eEOo4Wm10EpkEyR9LU3KXh7EL7flfuETaSHihIw79mtet
	 +ek+OdEuyoDoOYjHPDKxYw+9D/0xJxBEvbbLttbDWBFPVE1lnMRNnaAH+YOu38b8mZ
	 08qCWlu4F71+NkFQ6R4m/7qU59Zn/sxnJMEzG76ZMwVZZqgSNgR5zsWtZchbm+gVJu
	 R7O/fJlswVbb3nkeRjC00m4oef/6BOL3P3rUPSWagFRpH4IPNyfe4vkcE3idSLrZvg
	 tl8iMubeUghhIzK6o1jzPWdclS/iyRMIAUXTm+oBNhWX/OJgXtNr/1k+gY/CY7tmSP
	 Wp8RjPhCl7oeA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A405B17E05D3;
	Tue, 07 Jul 2026 10:21:37 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 07 Jul 2026 10:21:21 +0200
Subject: [PATCH net-next 3/6] net: stmmac: mediatek: rename MT2712 and
 MT8195 variant methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, 
 kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783412493; l=4942;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=297HFzkz6sVk4zIF49E7x3OB7iSwN5HM9tWtJK1lYoM=;
 b=9xWmgQ8+4B+/axCW0JPbLQ9cf+MzgwJmIxuBmpWzy/o++Vv7ZG4O61ikmRnMSsvoAEfJVjQcV
 ONpxT1462dkDJCXLKXEjYhntjJw+FnoGma5deoG7YJ0leJylqrD7UMg
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012141_743556_C1382C46 
X-CRM114-Status: GOOD (  12.51  )
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

In preparation of newer SoC support, rename MT2712 and MT8195 variant
methods and sub functions to more generic names.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 0cabab4fd89a..28e87990b0a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -110,7 +110,7 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
-static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
+static int set_phy_interface_v1(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
 	u32 intf_val = phy_intf_sel;
@@ -127,7 +127,7 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
 	return 0;
 }
 
-static void mt2712_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
+static void delay_ps2stage_v1(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 
@@ -152,7 +152,7 @@ static void mt2712_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
 	}
 }
 
-static void mt2712_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
+static void delay_stage2ps_v1(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 
@@ -177,12 +177,12 @@ static void mt2712_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
 	}
 }
 
-static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
+static int set_delay_v1(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 delay_val = 0, fine_val = 0;
 
-	mt2712_delay_ps2stage(plat);
+	delay_ps2stage_v1(plat);
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
@@ -261,14 +261,14 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	regmap_write(plat->peri_regmap, PERI_ETH_DLY, delay_val);
 	regmap_write(plat->peri_regmap, PERI_ETH_DLY_FINE, fine_val);
 
-	mt2712_delay_stage2ps(plat);
+	delay_stage2ps_v1(plat);
 
 	return 0;
 }
 
 static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
-		.dwmac_set_phy_interface = mt2712_set_interface,
-		.dwmac_set_delay = mt2712_set_delay,
+		.dwmac_set_phy_interface = set_phy_interface_v1,
+		.dwmac_set_delay = set_delay_v1,
 		.clk_list = mt2712_dwmac_clk_l,
 		.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
 		.rx_delay_max = 17600,
@@ -276,7 +276,7 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.dma_bit_mask = 33,
 };
 
-static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
+static int set_phy_interface_v2(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
 	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
@@ -299,7 +299,7 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	return 0;
 }
 
-static void mt8195_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
+static void delay_ps2stage_v2(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 
@@ -308,7 +308,7 @@ static void mt8195_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
 	mac_delay->rx_delay /= 290;
 }
 
-static void mt8195_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
+static void delay_stage2ps_v2(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 
@@ -317,13 +317,13 @@ static void mt8195_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
 	mac_delay->rx_delay *= 290;
 }
 
-static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
+static int set_delay_v2(struct mediatek_dwmac_plat_data *plat)
 {
 	u32 gtxc_delay_val = 0, delay_val = 0, rmii_delay_val = 0;
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 reg_offset = plat->variant->peri_eth_ctrl_offset;
 
-	mt8195_delay_ps2stage(plat);
+	delay_ps2stage_v2(plat);
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
@@ -419,14 +419,14 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 		     reg_offset + MT8195_PERI_ETH_CTRL2,
 		     rmii_delay_val);
 
-	mt8195_delay_stage2ps(plat);
+	delay_stage2ps_v2(plat);
 
 	return 0;
 }
 
 static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
-	.dwmac_set_phy_interface = mt8195_set_interface,
-	.dwmac_set_delay = mt8195_set_delay,
+	.dwmac_set_phy_interface = set_phy_interface_v2,
+	.dwmac_set_delay = set_delay_v2,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
 	.rx_delay_max = 9280,

-- 
2.55.0


