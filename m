Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4799DCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soFg8ocob4fM3jA9325OZzbLpQYDuksdjYn2+9BYMO0=; b=0xTP5dHgZkkQJ7v2XeJoPdwz6l
	8wxyWFy8K6VN9IFdVYnTaDT1myeAVF3lNiZ+UybfRC9Xwkwry3P+e3I66ys4iKZs9iz6oqIEXKsqB
	6D3DveWhiYqyYyP1Z4sRs4KhgeYGZ60+FLOK+pdo4vFHAJr8yknH5X6ZMDGY80xBziict8C8lQF34
	bvb5mpU7Jb1Rm7iQAhRA8Blx33b7M+cIiZ6wPJDGPV+b26wysAd9Olond0ZjczNwKKAdw7An0cpus
	Ra6P618XuqpVvcsUv0VKUAY1DxWHnygM9DIaEoJ7s6h6EBZZNxwgU5n0ibZT92vxej0LjwQi2OQ9f
	WPRuRUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEf-00000002dv3-0Nfh;
	Fri, 16 Oct 2026 10:32:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEQ-00000002dh9-33AX;
	Fri, 16 Oct 2026 10:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=soFg8ocob4fM3jA9325OZzbLpQYDuksdjYn2+9BYMO0=; b=RHja2611UshQOYWMSeHP7+MpnO
	V/PPAcjhEUE7N5khWzit5R3DoY2xLtKuRYv6v/iOyVI8CWApM08L1zCU+HBfLakd89IXYkL94egaL
	WldwhSjsez1MnacgtXhipvTx/OG/g2V2MN1gnAUj1dFQFksPW/tTtlSZhWMEFSBDHeLLxAVFmuzUF
	SY+cnB2SyofOYwsjU+uAOTIGAQqqzc+d3+KygcbJYg2DF/yCyNE4aCXvWx+0BzncOYFqCUjJWaump
	sAQlCxFDrhY4M6yb4r3DovYAp2jYJPjm+lZ8dDVprsM7EhD1rp7gOWLc3GcJYNWOPogFcE3nwmw3o
	dNfwNdjQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfEL-00000001O0d-2xyV;
	Fri, 16 Oct 2026 10:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792146722;
	bh=03Ex1zCNSPyov2YYXhbUHFVZTDuwhkzfGLjwZ8Qdr3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=juvVg7HC3ZDGdhRbVfN+0gmvhUm2IB9lnrdRU9yWDYE6104Z3rHUcNuYuG/CBWQdH
	 gv46FGbPmeM/XG8aBdGTtN06Rc7+6NPne0VyfRjJdT89vpwQ6WdiTuav1qsNCcvdfR
	 nYUufE6lwhMVcmUdBvG+8Bur2dmL2Uedbkg/qCqK7XISIVtzXoNVmivZdTmrk6i/8H
	 xPOcnbksqY1iF6xjVE7tx5DbQcUIIuAqGhMEfNF89AAYKREMFm8K6XZ3hG30ebperu
	 7Iz04Qzm7QCM/2kIV21pilTc72iWoxTetO82Fzo/pi58qNl6m99g7rhSGaojeg5s6k
	 ESkXVboDlDrHw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E211817E0A33;
	Fri, 16 Oct 2026 12:32:01 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 12:31:09 +0200
Subject: [PATCH net-next v3 5/9] net: stmmac: mediatek: add RX/TX delay
 stage divider in platform data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dwmac-mediatek-mt8189-v3-5-25daf2bbcf35@collabora.com>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
In-Reply-To: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146716; l=4145;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=03Ex1zCNSPyov2YYXhbUHFVZTDuwhkzfGLjwZ8Qdr3o=;
 b=BkWztVCRIDSiq0wUrGYGPm/7TXIvuyUMDwWuqgrGjlX33cPWt1ioC6jTJIz7Mne+Zcq8SgHle
 jXxQvjua1beBdKY1xL4oPY1ul+8ksOnBdqeOorLbvtVJ5cEcfpcrsDb
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113206_053096_099322AF 
X-CRM114-Status: GOOD (  15.51  )
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

In preparation of newer SoC support, that have like MT8189 SoC
different RX and TX internal delay stage steps than MT8188/MT8195, add
the RX and TX delay stage divider values in the variant platform data
and replace the hardcoded value uses in mt2712_set_delay and
mt8195_set_delay.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 46 ++++++++++++++++++----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 596411d4a5b2..cb5bda53edb9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -108,6 +108,10 @@ struct mediatek_dwmac_variant {
 
 	u32 rx_delay_max;
 	u32 tx_delay_max;
+	u16 rx_rmii_delay_stage_div;
+	u16 tx_rmii_delay_stage_div;
+	u16 rx_rgmii_delay_stage_div;
+	u16 tx_rgmii_delay_stage_div;
 	u8 dma_bit_mask;
 };
 
@@ -146,14 +150,22 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	u32 fine_val = 0;
 
 	if (phy_interface_mode_is_rgmii(plat->phy_mode)) {
-		rx_delay_stage_div = MT2712_RGMII_DLY_RXC_STAGE_DIV;
-		tx_delay_stage_div = MT2712_RGMII_DLY_TXC_STAGE_DIV;
+		rx_delay_stage_div = plat->variant->rx_rgmii_delay_stage_div;
+		tx_delay_stage_div = plat->variant->tx_rgmii_delay_stage_div;
 	} else {
-		rx_delay_stage_div = MT2712_RMII_DLY_RXC_STAGE_DIV;
-		tx_delay_stage_div = MT2712_RMII_DLY_TXC_STAGE_DIV;
+		rx_delay_stage_div = plat->variant->rx_rmii_delay_stage_div;
+		tx_delay_stage_div = plat->variant->tx_rmii_delay_stage_div;
 	}
-	rx_delay_stage_val = mac_delay->rx_delay / rx_delay_stage_div;
-	tx_delay_stage_val = mac_delay->tx_delay / tx_delay_stage_div;
+
+	if (rx_delay_stage_div)
+		rx_delay_stage_val = mac_delay->rx_delay / rx_delay_stage_div;
+	else
+		rx_delay_stage_val = 0;
+
+	if (tx_delay_stage_div)
+		tx_delay_stage_val = mac_delay->tx_delay / tx_delay_stage_div;
+	else
+		tx_delay_stage_val = 0;
 
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
@@ -258,6 +270,10 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 	.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
 	.rx_delay_max = MT2712_RGMII_DLY_RXC_MAX,
 	.tx_delay_max = MT2712_RGMII_DLY_TXC_MAX,
+	.rx_rmii_delay_stage_div = MT2712_RMII_DLY_RXC_STAGE_DIV,
+	.tx_rmii_delay_stage_div = MT2712_RMII_DLY_TXC_STAGE_DIV,
+	.rx_rgmii_delay_stage_div = MT2712_RGMII_DLY_RXC_STAGE_DIV,
+	.tx_rgmii_delay_stage_div = MT2712_RMII_DLY_TXC_STAGE_DIV,
 	.dma_bit_mask = 33,
 };
 
@@ -283,13 +299,25 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 
 static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
+	u16 rx_delay_stage_div = plat->variant->rx_rgmii_delay_stage_div;
+	u16 tx_delay_stage_div = plat->variant->tx_rgmii_delay_stage_div;
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
-	u32 rx_delay_stage_val = mac_delay->rx_delay / MT8195_DLY_RXC_STAGE_DIV;
-	u32 tx_delay_stage_val = mac_delay->tx_delay / MT8195_DLY_TXC_STAGE_DIV;
+	u32 rx_delay_stage_val;
+	u32 tx_delay_stage_val;
 	u32 gtxc_delay_val = 0;
 	u32 rmii_delay_val = 0;
 	u32 delay_val = 0;
 
+	if (rx_delay_stage_div)
+		rx_delay_stage_val = mac_delay->rx_delay / rx_delay_stage_div;
+	else
+		rx_delay_stage_val = 0;
+
+	if (tx_delay_stage_div)
+		tx_delay_stage_val = mac_delay->tx_delay / tx_delay_stage_div;
+	else
+		tx_delay_stage_val = 0;
+
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
 		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
@@ -398,6 +426,8 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
 	.rx_delay_max = MT8195_DLY_RXC_MAX,
 	.tx_delay_max = MT8195_DLY_TXC_MAX,
+	.rx_rgmii_delay_stage_div = MT8195_DLY_RXC_STAGE_DIV,
+	.tx_rgmii_delay_stage_div = MT8195_DLY_TXC_STAGE_DIV,
 	.dma_bit_mask = 35,
 };
 

-- 
2.56.0


