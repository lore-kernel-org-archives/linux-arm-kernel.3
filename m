Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A052C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNdh5DzKkHzYa5BInKwu7W+JyJ1xHiWn4QJkYHQJpjQ=; b=4o99W8YhqaVAZybbDGUsL41UXx
	CY8fORexUALHnBMa3vnoFd8IYqmSZX97ESF1M3Qru4WunwzRTitX2KbofkTaUUWS6wE4h4jVaMa6x
	wi6xI88lFPbz5g0ImUGIOzMLEbf1jFPvV9juuecytqedMS9UtrhQcvNpvABtf6N0fKDQ7eMGOPnXk
	ilX6UEqVdu8pqikkG+54PDpOZ6x1rxIT5HHfBluBT7zUEhDI3vkXAcjYBvCGwv5HtiLnzRfK7njmC
	cDCJ04ihK7IFVk6BZJ2dsgVBf+ywzXn4cSGK67Ib4ih7+qe/yW3YHYh6Dx+bhEvGljizJUQtR/+fx
	kLfchi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ3-000000024Pa-2Kwi;
	Mon, 07 Apr 2025 21:47:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rgw-00000001j2T-43IM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=WNdh5DzKkHzYa5BInKwu7W+JyJ1xHiWn4QJkYHQJpjQ=; b=WE/ZtwsP/xmJnlKb8R4DzEOAXJ
	7tLrP0jAchtZ8vH39hwTsbx7sXBEmyz+h9qIzR7AF97U1KBC+lJsbbZuJtEJ6AwqPHKQ4sSiVfdkY
	j+/bggxlu3YlNtiHFZm/N6Xfkdv3aDEIrywXoAo/oQqiDpnfTq4VK1sEJB3Cw28xMbXmoaJSM8u16
	oQVUsPyercSiHuy1mK5cUpR3MehexwbR6Y4DV2v8kLyIsgEEkUhu06G3lz6vjvWAx2VJDd69E7sZE
	FAzNa5WxGbW2cuzsU3328d3B3Fi/MM2/i/nX+CS2jPy3hdGBKdRInpj84KAgkai7HDST4okNCd9Bo
	XjWl4Q5A==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rgu-000000086gF-0l05
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WNdh5DzKkHzYa5BInKwu7W+JyJ1xHiWn4QJkYHQJpjQ=; b=oe0T4ZWdJrQUHI1RLctiKWbMbQ
	jp7LrA30xsy5eMJj75+mY1+PDfwuCESzZsgUqxkkzIFQtCgMWz3lzemH6SMMeBRYEQdlslW5wAgJW
	v4/dH9NbZRlBHGZa+tGq3I1KJhazhmmCix6rDseVCvn7m3k9ZBLtRj+nMj6y7Tak/rPTS3j+c9DfC
	cMZrI6XkQamBGpkfkstrBdDRN/LmElz+gJrLcou6EkTQu6TFnHLPC/RNvh8BJEK+6jmT4cnWoUdXy
	sCGjDDnc1tCDDkQ7h5E2dtxCaDFXWHsbkY2XQSP1LJ0wAbsxxDFSkwt78a+JCLQnQ4VNUCRAsnZsH
	jGdbfzDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47696 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rgp-000697-0g;
	Mon, 07 Apr 2025 19:59:23 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rgJ-0013gd-2q; Mon, 07 Apr 2025 19:58:51 +0100
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 1/5] net: stmmac: dwc-qos: remove tegra_eqos_init()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rgJ-0013gd-2q@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:58:51 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195928_313965_864FDBA0 
X-CRM114-Status: GOOD (  13.96  )
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

tegra_eqos_init() initialises the 1US TIC counter for the EEE timers.
However, the DWGMAC core is reset after this write, which clears
this register to its default.

However, dwmac4_core_init() configures this register using the same
clock, which happens after reset - thus this is the write which
ensures that the register is correctly configured.

Therefore, tegra_eqos_init() is not required and is removed. This also
means eqos->clk_slave can also be removed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 24 +------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 126702873e2a..2b6ed0f720eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -29,7 +29,6 @@ struct tegra_eqos {
 	void __iomem *regs;
 
 	struct reset_control *rst;
-	struct clk *clk_slave;
 
 	struct gpio_desc *reset;
 };
@@ -199,20 +198,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 	}
 }
 
-static int tegra_eqos_init(struct platform_device *pdev, void *priv)
-{
-	struct tegra_eqos *eqos = priv;
-	unsigned long rate;
-	u32 value;
-
-	rate = clk_get_rate(eqos->clk_slave);
-
-	value = (rate / 1000000) - 1;
-	writel(value, eqos->regs + GMAC_1US_TIC_COUNTER);
-
-	return 0;
-}
-
 static int tegra_eqos_probe(struct platform_device *pdev,
 			    struct plat_stmmacenet_data *plat_dat,
 			    struct stmmac_resources *res)
@@ -227,7 +212,6 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 	eqos->dev = &pdev->dev;
 	eqos->regs = res->addr;
-	eqos->clk_slave = plat_dat->stmmac_clk;
 
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
@@ -267,18 +251,12 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 bypass_clk_reset_gpio:
 	plat_dat->fix_mac_speed = tegra_eqos_fix_speed;
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
-	plat_dat->init = tegra_eqos_init;
 	plat_dat->bsp_priv = eqos;
 	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE |
 			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 
-	err = tegra_eqos_init(pdev, eqos);
-	if (err < 0)
-		goto reset;
-
 	return 0;
-reset:
-	reset_control_assert(eqos->rst);
+
 reset_phy:
 	gpiod_set_value(eqos->reset, 1);
 
-- 
2.30.2


