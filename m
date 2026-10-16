Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1B8CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrawypbR72zOeXff0okCji8GyQSFSXt+QrPVIgh2YKI=; b=k36uHj/zcytD2fcWpe2a6YIcP3
	vl2Vr5gV8rm4RsojG+T9oMWJS+qkBi55z3D3EZNTJqjb2ZPMa/OyiRqVG+gA1ep8/DETkw28RVmFo
	JKVe/cAcbWX3hFKrIBuoRNGRY8NdKE3xiLX7lzbf7chYiHbeRS6+jfTC8SIAjIe932GKN9WpWhVQv
	P+ivLmprDLGeyxGcntS0BCExzZZWSTuMP6DrJPV8Rv37NciSnyEPrN8COsr5G/E6gkAgNg4c+1GWp
	i3UFGRMZSA5swG0UEIKwWPpYvZo2U/3AxhInXa8OjhuNmgCa+Vl2fYFQUgv5u2CdBuCiAhpRXlll5
	MTnWilXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEe-00000002dtm-1cgg;
	Fri, 16 Oct 2026 10:32:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfEQ-00000002dh3-2qVd;
	Fri, 16 Oct 2026 10:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PrawypbR72zOeXff0okCji8GyQSFSXt+QrPVIgh2YKI=; b=COaZQ0Tk/Qksu0Wj576S7rvE7Z
	vQ6aIxUd8A9jAp+aZtFH6teMsBLo3mqj8fy7SqrKyccUF48bMtvcRzYFT+jN9tXIm6hlLYK6S72om
	nupWwcucvkpQ5syupAMbJ59D5FDqg7lvumlsi/bfDlHxbPJ4RPkj37ybTA3WFYINW34orTIPA6vt3
	HL2t9Xof3y1czz8mJk6znHYEwQAwxY1gXzSHXW6yacjk7dTT7sa1FzELDg/T33SHyELoOHtnNkXGv
	5abcCFU9dmmlqxmx0oDXeAhgrn9h0mFYLTGYznRYrxAtFREL47OSvbU1CybHlu8Fc0eq4I7/06cCX
	HzXbU1Yw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfEN-00000001O1i-1Uq7;
	Fri, 16 Oct 2026 10:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792146726;
	bh=CFQwDm8eQ75u4g96g4zYZYElLaE9tj7lH3fV9uMhw9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CBTSvX63e21VSH5L735f9dNFD6B1vLPFXfBBzLLsAAvnPhtj5fAAkUoNPZkb4FDFT
	 mY8YNlscuffkXZRpWyJLyPEa4Qde1Vy/6Se7uXcW+kpu3JOacC7IrhRF1bXwGvPNFO
	 pg8mG22xEj4ihw2FUfFVe0GZhS7Mpdcbj9tcXH9ETMvqIXBalrCIEphOuw2C7ZO64m
	 UCthVt9acQ9dkTA0BBjhpZBHBCAGFG0F0X9DPzoBvi38Gshe7KHWuuatBWLcu87KZA
	 XjRZVh72E/Fh1StScqBLi6nA//4XEz5omi2PFiLWBx88BPqeBZCM6NYYkQqjAGoYii
	 qElpskD0nbiPA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 399DC17E0C39;
	Fri, 16 Oct 2026 12:32:05 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 16 Oct 2026 12:31:12 +0200
Subject: [PATCH net-next v3 8/9] net: stmmac: mediatek: add support for TX
 clock output enable feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dwmac-mediatek-mt8189-v3-8-25daf2bbcf35@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146716; l=1691;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CFQwDm8eQ75u4g96g4zYZYElLaE9tj7lH3fV9uMhw9g=;
 b=pZi/hzqMDk8iLVaUaF3gyMVd4sWEV0Xsr628AyZJ1lynke2jMs0tOMpInXyf3qicIFRcwy5yn
 nZR/WTEq7CgD7+2I9fsiZCgeFF15QOIpJ83LP454VqvMZTMNYUhCM/L
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113207_621521_849AF427 
X-CRM114-Status: GOOD (  13.75  )
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

The MT8189 SoC has in the Ethernet control 0 register from the
peripheral configuration (pericfg) an additional bit to enable the TX
clock signal output.

In preparation of MT8189 SoC support, add its definition, use in the
mt8195_set_interface callback, and a support flag in the platform
data.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 4b2d5280f703..147e217b8662 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -44,6 +44,9 @@
 #define MT2712_RGMII_DLY_TXC_STAGE_DIV	550 /* 550ps per stage */
 #define MT2712_RGMII_DLY_TXC_MAX	17600 /* 32 x 550ps */
 
+/* Peri Configuration register for mt8189 */
+#define MT8189_CTRL0_TXC_OUT_OP_EN	BIT(20)
+
 /* Peri Configuration register for mt8195 */
 #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
 
@@ -119,6 +122,7 @@ struct mediatek_dwmac_variant {
 	u16 rx_rgmii_delay_stage_div;
 	u16 tx_rgmii_delay_stage_div;
 	u8 dma_bit_mask;
+	bool mac_txclk_out_en;
 };
 
 /* list of clocks required for mac */
@@ -299,6 +303,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 	/* MT8195 only support external PHY */
 	intf_val |= MT8195_EXT_PHY_MODE;
 
+	if (plat->variant->mac_txclk_out_en)
+		intf_val |= MT8189_CTRL0_TXC_OUT_OP_EN;
+
 	regmap_write(plat->peri_regmap,
 		     reg_offset + MT8195_PERI_ETH_CTRL0,
 		     intf_val);

-- 
2.56.0


