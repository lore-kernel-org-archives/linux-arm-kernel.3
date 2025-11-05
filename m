Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F32CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vJAkYgDYja28W9+m7ImQv3XKVEjSe37hg9qICz9dao=; b=TzckM0LkgTOr+xZhDxmU1PAJ1y
	9Iv293hWsViBtrSjVN6BingeUlJnHu2XavLeyAf3HEaTCXmfhj59ZE65Py4joYcUwHfyegDGRHGJ0
	Y1gcj8LwLxbfxT9RyDaICW13BtLQYZ6WzLami2IEa7D2UnXaeexHUa3DA1xgBjH9kMjo9VsVHhRlp
	T4LjnUh1RJ8bOPqh8akkRG/PSwgKqPDogJJi4kh3NUgJLV3eqK0pY9KxADqYxRrqSAXWlTPjf2dys
	j8/eNmUPCeTDbrFUb2tCS/7mzLLWE+bYkDhDlSjTrOC9Z77ecM3s+ziHSPq2zdLSO+t1GkTpC0b4W
	lP9RoFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdXh-0000000Dm9c-0LLb;
	Wed, 05 Nov 2025 13:27:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdXg-0000000Dm7o-041v
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Nov 2025 13:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7vJAkYgDYja28W9+m7ImQv3XKVEjSe37hg9qICz9dao=; b=mhrQY4ocLYX+SR95VB1e+XNpU4
	N3BiRaBrE4Bsi4N6oRwBKKLLvjrCB+XpDuhCHakKMNQYkQ9aPECqoQt1/h2X6DOof3eTX7hIO4vEF
	I3EzC5aag6UzUjTYOxsgugTxPvLDLy3uK2w7RPww3zsOzhxCuLOZXZ7Wb+u3UcdLRg67US0Cc5y1u
	0RqvSqn8Z8OYN2OhbiFC7x8qD7Bp7WBRdsE+SMc9LEwpqm2JN7PbLJY2Aa2SDGla84d2pc9TytHvA
	yIl7MYP59Gbpj+8YxPmZRrI6aWI/E8MNn/Ws+0TYwMZ24gNda8qgayGyg/8DFNnPVBX0GDNbg55PN
	E6D7GxUg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcfw-000000028Ye-0Nvr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7vJAkYgDYja28W9+m7ImQv3XKVEjSe37hg9qICz9dao=; b=clylRTLn0FWM3qn0pWTxxY7NO/
	L7x5ZjmAfERGsEFaLrQ5ybgvj7QNVrPiEyhNphNM2w1hXwMo/yGtmoi0a977dlid/fcZasPCFTv+6
	CP3Ee1SGBns/Myph/gYgmK/j60UwtNL/2ZWPX7RvSweeWtHLb8leC7hGcDLTtMyiu8elyqkANv0gU
	raFB7upy1P5unlecHR5rLULHXTMk3HjK2tboR4FTjwUa2jmj7xvrIov2z/zZgmiTLKohG3m1R2Xml
	vhVVerTZky7Fti9+lH3YCRZpaNVLLZBkvJJ0wGG8UsQMhy+bADMpfkmoQNmfIppInlgLrj41QX2Tz
	XnIyf3zg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50732 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGdXQ-000000003UM-3swe;
	Wed, 05 Nov 2025 13:27:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGdXP-0000000CloH-0FW9;
	Wed, 05 Nov 2025 13:26:59 +0000
In-Reply-To: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 10/11] net: stmmac: ingenic: pass ingenic_mac struct
 rather than plat_dat
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGdXP-0000000CloH-0FW9@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:26:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_123144_184936_4BFDCFAB 
X-CRM114-Status: GOOD (  12.26  )
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

It no longer makes sense to pass a pointer to struct
plat_stmmacenet_data when calling the set_mode() methods to only use it
to get a pointer to the ingenic_mac structure that we already had in
the caller. Simplify this by passing the struct ingenic_mac pointer.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 98fd4c31a694..5ea26ee8e9d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -64,15 +64,13 @@ struct ingenic_soc_info {
 	enum ingenic_mac_version version;
 	u32 mask;
 
-	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
+	int (*set_mode)(struct ingenic_mac *mac, u8 phy_intf_sel);
 
 	u8 valid_phy_intf_sel;
 };
 
-static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			       u8 phy_intf_sel)
+static int jz4775_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
@@ -82,19 +80,14 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
-
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
 }
 
-static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1600_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
@@ -103,10 +96,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1830_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
@@ -116,10 +107,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
@@ -165,7 +154,7 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
 			phy_modes(interface));
 
-		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
+		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
-- 
2.47.3


