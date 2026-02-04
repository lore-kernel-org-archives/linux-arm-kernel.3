Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BD7E83EFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRwfXy7QdATC08oD+OatBWey51mn3dQV9k441cvUTqY=; b=MXoBE/bsz8518c0YWCUaojB4hJ
	g9Ie6lnyRNKkvlJ+dop7IXH6Yr2vKOXEBas3GlZ1w6UJ1SqEtDcxxn7RwDBfxDYasG6UKev/iB7ox
	wc85Fb5HmbyFgNBYn49rKmTunP5g40Cf1JrNyG2cte3b9DCXcxIhXxgXCkBUcCfzWKq3zDLuhgqHm
	OWUlpOrCN9ybJPR+n+hMO55dKBjgEFuo1wfPrOlTFdEZ1d8kma2OfDP0DFaBgL/Vl3wmnixlSniZ1
	ZeNjPNYBsylqCg0P1PT0sLasqY499BB3h7MGI0gvfl6B3Gxaj2NGHS+C0KHy95LknFQFADenRp81d
	ii3CpJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYxv-00000008B8C-2onB;
	Wed, 04 Feb 2026 09:14:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYxu-00000008B7p-3MP9;
	Wed, 04 Feb 2026 09:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=jRwfXy7QdATC08oD+OatBWey51mn3dQV9k441cvUTqY=; b=CvkG7dx29J/IcGnT4oa9wNowt3
	Nsuq0k2vtTTucLYuL52XbGvLb8vprN8jayibkPMf1MYZX1i+PKZR5aA4kZt24ioPeUzsf7iDhFUTt
	c3w9GsKt8A9Dl9oNb6aoJR5ZnaVqStjBirbf/RjQM8gmP+472EqYgu78hLDdXlvrlRVCedr/aG/0a
	GwpRIU393DhKcnMRC4jR2urH3mZdNQnFfPRwik087eggnw699iNq4yHh7CRcewWE0C+nMGqKBc23O
	vg2W50pwO8lgSfAb8x1iNdrWZUEMZMM2j561RGojYctBFbl/nRMh9/wAEL7mv/odE1YPCNHm0R7ix
	VnNw+bsQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYxs-00000000C2k-00yX;
	Wed, 04 Feb 2026 09:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jRwfXy7QdATC08oD+OatBWey51mn3dQV9k441cvUTqY=; b=NInDkjocjF/5fUJ52IRioF/09A
	0K4I7vYrwjnlJEuyxk7T+fy4NosUtssr6jwPooBs6jPQGt7/66x+XPTRcC85G4HMa5Si/okYOExkV
	VXCtbA5D21B+WWavBVNK7UyusTgxgpfArsj6mVN9kxBLeOo4GO+3Z8H6xHNytxpCUuxJovk1VGAwr
	KTzp4bi452Ss4rOxNOJTyGoix4JV14rx1IbyEK6Jz0VZJknmyeN/QYCMyfbSTQk5WOt4oyPy34Nko
	3oIzroLXCTjpHZW1xyN7JEu6eIh8qHoiGGMcTuuQoKcd2fdeXJCvUZpIBEvDgmnuvHEJrKxpP7nH+
	e1w1/47Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37338 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnYxm-0000000066M-2QY7;
	Wed, 04 Feb 2026 09:14:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnYxl-00000007hol-3XiH;
	Wed, 04 Feb 2026 09:14:17 +0000
In-Reply-To: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/6] net: stmmac: rk: introduce flags indicating
 support for RGMII/RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnYxl-00000007hol-3XiH@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Feb 2026 09:14:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_091424_183253_4E677DBC 
X-CRM114-Status: GOOD (  13.24  )
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

Introduce two boolean flags into struct rk_priv_data indicating
whether RGMII and/or RMII is supported for this instance. Use these
to configure the supported_interfaces mask for phylink, validate the
interface mode. Initialise these from equivalent flags in the
rk_gmac_ops or depending on the presence of the ops->set_to_rgmii and
ops->set_to_mii methods. Finally, make ops->set_to_* optional.

This will allow us to get rid of empty set_to_rmii() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index c56cc40683a3..73d471844022 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -53,6 +53,8 @@ struct rk_gmac_ops {
 
 	bool gmac_grf_reg_in_php;
 	bool clock_grf_reg_in_php;
+	bool supports_rgmii;
+	bool supports_rmii;
 	bool php_grf_required;
 	bool regs_valid;
 	u32 regs[];
@@ -86,6 +88,8 @@ struct rk_priv_data {
 	bool clk_enabled;
 	bool clock_input;
 	bool integrated_phy;
+	bool supports_rgmii;
+	bool supports_rmii;
 
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -1415,6 +1419,9 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	bsp_priv->clock_grf_reg = ops->clock_grf_reg;
 	bsp_priv->clock = ops->clock;
 
+	bsp_priv->supports_rgmii = ops->supports_rgmii || !!ops->set_to_rgmii;
+	bsp_priv->supports_rmii = ops->supports_rmii || !!ops->set_to_rmii;
+
 	if (ops->init) {
 		ret = ops->init(bsp_priv);
 		if (ret) {
@@ -1434,11 +1441,11 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (!bsp_priv->ops->set_to_rgmii)
+		if (!bsp_priv->supports_rgmii)
 			return -EINVAL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		if (!bsp_priv->ops->set_to_rmii)
+		if (!bsp_priv->supports_rmii)
 			return -EINVAL;
 		break;
 	default:
@@ -1489,24 +1496,32 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	switch (bsp_priv->phy_iface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		dev_info(dev, "init for RGMII\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
-					    bsp_priv->rx_delay);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    bsp_priv->tx_delay,
+						    bsp_priv->rx_delay);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
 		dev_info(dev, "init for RGMII_ID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 		dev_info(dev, "init for RGMII_RXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay, 0);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    bsp_priv->tx_delay, 0);
 		break;
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		dev_info(dev, "init for RGMII_TXID\n");
-		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, bsp_priv->rx_delay);
+		if (bsp_priv->ops->set_to_rgmii)
+			bsp_priv->ops->set_to_rgmii(bsp_priv,
+						    0, bsp_priv->rx_delay);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		dev_info(dev, "init for RMII\n");
-		bsp_priv->ops->set_to_rmii(bsp_priv);
+		if (bsp_priv->ops->set_to_rmii)
+			bsp_priv->ops->set_to_rmii(bsp_priv);
 		break;
 	default:
 		dev_err(dev, "NO interface defined!\n");
@@ -1542,10 +1557,10 @@ static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 {
 	struct rk_priv_data *rk = bsp_priv;
 
-	if (rk->ops->set_to_rgmii)
+	if (rk->supports_rgmii)
 		phy_interface_set_rgmii(interfaces);
 
-	if (rk->ops->set_to_rmii)
+	if (rk->supports_rmii)
 		__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
 }
 
-- 
2.47.3


