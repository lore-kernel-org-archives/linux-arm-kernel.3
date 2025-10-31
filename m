Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7695ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F9+uCkTTPZNitcXoasL3jxbNQG9cxbs2rnefJEzDKW0=; b=IumJnh7zwgkPEoioNvxU0TZOEi
	D+2XqJHXRFUikzGmHcDXgFQU7mUdiK9sACbeJ9lm6HOGcw1zylqjuad7UanN3FEBZoxqMxiZ+ZJBk
	wnWRIgoyvKizwvzn1NJEp8Pl/IgIcS3I5Ff+Z00+65XFKgpg4XzdOz96ShX5rtcRgI6k7TSIulZFT
	czPvAEL4/xOkqnTbq94WzgQeCnHTv8ucfzNMeaQfrMwm2usxAQzWT8qKpkDuOEliI7xpPcKrsdvC3
	1rublP6pCbsAI+CZSY+/ye3xaUu/sg/BgwgXsxK6P5DtR5A0XFeJU/o1B9ghFCSLHJSnb0rj0v+es
	oGo2eJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn1r-00000005zEL-08Su;
	Fri, 31 Oct 2025 11:10:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn1o-00000005zE8-36zC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 11:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:In-Reply-To:References;
	bh=F9+uCkTTPZNitcXoasL3jxbNQG9cxbs2rnefJEzDKW0=; b=O11siPc5JjvcClGuFSzLsm9WDC
	vILzi0vsL9HGv9BeRkf8x0OUK7mdrqQbzAXFouZN/c0AHfXO5w23OPYcFIknOZ9R3eSTe9xZobHvb
	2wAFAnMaBczf3XTxcGo+w6kSMWLCZOWDzswa/+hUrYJ8FBTe0jZUHOCgyyw+t5pC4RDxWL5RPtib6
	yXu+CXlWCuaM1q5v2lpprLQ72Ew5l6fBeIfcMdWY6SZVh4uYIvvcIU0f1R79U0jDOR/Wgq1dFZVyI
	RIwFLnOtT1sxBVGhyhrXYYkERnuQF88GqEMCCOTqgZmc39Aqlsd5Rztrwr5ezenBkE8ZKsnhjUBa+
	EX9bdB3Q==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmA3-0000000B7IX-0tTH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F9+uCkTTPZNitcXoasL3jxbNQG9cxbs2rnefJEzDKW0=; b=joABAYhGrqXg1LpCJ/57xmaHzs
	Joy9pfh00DUTWJrxapt5IQ8iU/TrR3I0S+p4RMyUwSRI27Nf/Sddz3PZkFJLMuww3lIuTL14iKaFE
	V6g/09pEEIq/s1Rl86FgEwnsWjvWhd7h+lqsghtMTAsqztSQBuiBIYp4RIlQ2wwPZ4ABkxSqJzU1z
	T7l4aMuhpDI/TP3n35qtkYnVosxfwUXg9p7b1rIA9Y/mys6xLnGXffOhaPrlXxGIY50UwpUORc2SF
	I35kWcofuGvmy/rCJNyNtRf/kqiogoDbWBCfmefc58OTUnIUxnKK2WTVNp4ilIKjIDqGPO5WiqD8I
	qqOlOtCQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35954 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vEn1X-000000006oz-1kl6;
	Fri, 31 Oct 2025 11:10:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vEn1W-0000000CHoi-2koP;
	Fri, 31 Oct 2025 11:10:26 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next] net: stmmac: imx: use phylink's interface mode for
 set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
Date: Fri, 31 Oct 2025 11:10:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101511_458663_A8A77399 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
which will be the same as plat_dat->phy_interface. Use the passed-in
interface mode rather than plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4268b9987237..147fa08d5b6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -195,9 +195,6 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
 static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 				     phy_interface_t interface, int speed)
 {
-	struct imx_priv_data *dwmac = bsp_priv;
-
-	interface = dwmac->plat_dat->phy_interface;
 	if (interface == PHY_INTERFACE_MODE_RMII ||
 	    interface == PHY_INTERFACE_MODE_MII)
 		return 0;
-- 
2.47.3


