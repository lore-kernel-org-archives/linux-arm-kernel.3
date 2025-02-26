Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E542C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jY/bwN9A5xa9iSopLwyTQOxIV4QgdsLsdC4BTyAYt0s=; b=CpEcceBupmp5wPv+JHmoHHzhjm
	5WvZyVceqiP3Qv9h35gaPk8alNyP9R9C+rVFCyBhKvHAhFqQGi9b0M5wdE3gy3QZheQ4mNNbNzS7C
	Uk9VXDB1fyuGONU1cN7SJ7lkNoqtaeibSgQ+fQynE0bTi7ly0HLKVHbSe86uS5M4KZZmDBkvtSrCA
	53Yz4yIKBKwZhDL494SgHPGxKJ8ITOtYtwsaNIRfTaOZkv5HnPAGuBxb/AyQRvV8Lwc3VzkrdiqhO
	uIGg0J9WIzZHj04fVdlK9lJz0e8SthYFYNFXnJ6i9Ef6yFtt+Ai9Rh/qcrEnvqXPrgKarxLZJ5g1F
	OfuiPtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY6-000000047lp-08Zu;
	Wed, 26 Feb 2025 14:38:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGiJ-00000003ixW-47oE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jY/bwN9A5xa9iSopLwyTQOxIV4QgdsLsdC4BTyAYt0s=; b=qeMkGQ3y0EikusQ5iHd4bfTahQ
	VIXzKqFJ8IuD3zi7Bds5zQxg6xqFWF1UTAxmGM5ZFoaZpFhfGgwlOywV9EthV0Aw1BXHUkvLrNKAV
	rmcVXqxqtO4SQUrZ2YNITE4q9QJqb2A+zRm77pMqU3169CUNZCcoFYmCGRod2yFDfu8ydaJ+NHk6a
	jQVGp+KrPPtvH8pDfAlr5i1MHou26K+PWMKnf+fbN40ZHh1D6KN9GJhwEUQ0jmwijbhhKS9UAj/h4
	+kZw30OqsrDFWVsqH1MK6fFHR/ZAS5ERJK8l/v+NOP86YirCEDQ51wEXwnGxoIjp/dfaT3PbslIWO
	IdQ4fMHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32848)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnGi8-0004Ez-2J;
	Wed, 26 Feb 2025 12:40:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnGi5-000766-0H;
	Wed, 26 Feb 2025 12:40:21 +0000
Date: Wed, 26 Feb 2025 12:40:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 6/7] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <Z78LtBo2lfTGG-9o@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZB-004RZU-4A@rmk-PC.armlinux.org.uk>
 <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n67c4bq7n7ejakmqmglve3os6vqvm57umysjjzexxkygvusnoo@ndee4gfnmsst>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_044036_020915_7A49D34E 
X-CRM114-Status: GOOD (  22.70  )
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

On Tue, Feb 25, 2025 at 09:46:56PM +0100, Thierry Reding wrote:
> On Tue, Feb 18, 2025 at 11:15:05AM +0000, Russell King (Oracle) wrote:
> > Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> > clock.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
> >  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> This isn't quite the same code, but the result should be the same since
> clk_set_rate() will be ignored if the clock is NULL, which would be the
> case for !dwmac->data->tx_clk_en.

You're right, thanks for spotting! I'll move it out of the if()
statement so the code has the exact same behaviour. Replacement patch
below.

> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thanks for the review.

8<====
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next] net: stmmac: intel: use generic
 stmmac_set_clk_tx_rate()

Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
clock.

Note that given the current unpatched driver structure,
plat_dat->fix_mac_speed will always be populated with
kmb_eth_fix_mac_speed(), even when no clock is present. We preserve
this behaviour in this patch by always initialising plat_dat->clk_tx_i
and plat_dat->set_clk_tx_rate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 24 +++----------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 0591756a2100..599def7b3a64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -22,31 +22,12 @@ struct intel_dwmac {
 };
 
 struct intel_dwmac_data {
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	unsigned long ptp_ref_clk_rate;
 	unsigned long tx_clk_rate;
 	bool tx_clk_en;
 };
 
-static void kmb_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct intel_dwmac *dwmac = priv;
-	long rate;
-	int ret;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dwmac->dev, "Invalid speed\n");
-		return;
-	}
-
-	ret = clk_set_rate(dwmac->tx_clk, rate);
-	if (ret)
-		dev_err(dwmac->dev, "Failed to configure tx clock rate\n");
-}
-
 static const struct intel_dwmac_data kmb_data = {
-	.fix_mac_speed = kmb_eth_fix_mac_speed,
 	.ptp_ref_clk_rate = 200000000,
 	.tx_clk_rate = 125000000,
 	.tx_clk_en = true,
@@ -89,8 +70,6 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	 * platform_match().
 	 */
 	dwmac->data = device_get_match_data(&pdev->dev);
-	if (dwmac->data->fix_mac_speed)
-		plat_dat->fix_mac_speed = dwmac->data->fix_mac_speed;
 
 	/* Enable TX clock */
 	if (dwmac->data->tx_clk_en) {
@@ -132,6 +111,9 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 		}
 	}
 
+	plat_dat->clk_tx_i = dwmac->tx_clk;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->eee_usecs_rate = plat_dat->clk_ptp_rate;
 
-- 
2.30.2


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

