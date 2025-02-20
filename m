Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F910C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9gueMMGR1Ohx7g9WsiSevqA6NIph2bjLV1PExbyhAw=; b=abQIqzYABzUILv3HCK5UqvpchQ
	JsrkIY+yp/Afjj5pbYsxBPceYzDvZSBIfQkCkcTZZ5iwbBK3bIGVmY8l7Bxmy/zSSUc9UujZPV7QI
	eZcNpN/XfQhmRCdrIX1mbB0liWCvPzWWUFC5tVHePb2PHN/kVz3rQ26BxNe+2oIZAeJR+0iGz9QXb
	5CvObL2ATv55sIF7oeg/6QcyQJrsgwon45tarlNud/7YtU2R7EptxroQ6cEE1qII31etB4MgaYNkk
	KatNiYJAzK5MkuTpd5Cx9ms4EecVYvmPqLsuO2/kB7Ngm7Udeb/UHIQT2U4cxyV08qSQW+YkDfV0q
	DizneSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl69c-00000000vYl-2TGY;
	Thu, 20 Feb 2025 12:59:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5qg-00000000qmO-0WVI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y9gueMMGR1Ohx7g9WsiSevqA6NIph2bjLV1PExbyhAw=; b=VLfdmlPubYGEmyuLQD9xrcOsdG
	LBC1dVEo9fai396YCV9fBnTdNlhXscZOvzupjQ4WtM+eBdZjaCOSWA0jPS8PSJM6QfhDJvalzyC7g
	eAH4+vzsabde8P7LkU3Cl+8WkHwvja9KHqHeXKFGsFM8GnFWAdyxyqYRZqnKQrqjPbHbjL/sXrzOv
	SIDtH89+FuXAjFONCnftvgIkhK/9uynwDY4g/RQs8PtWDAMVCOvdCkLHPeZwxqIJahuFNpJMRZ6JW
	DMQSbJ6IeMPPYUT6eFpI/3Ay3uChgY6VV+a5pCgTI4VnHJOQU20wNA8+FBv41oWWfIAeNiX03Ay0/
	eiaDE+IQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58218)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tl5qO-0000yE-2a;
	Thu, 20 Feb 2025 12:39:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tl5qK-0000zP-0u;
	Thu, 20 Feb 2025 12:39:52 +0000
Date: Thu, 20 Feb 2025 12:39:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v7 2/2] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <Z7cimPBdZ3W9GKmI@shell.armlinux.org.uk>
References: <20250220043712.31966-1-swathi.ks@samsung.com>
 <CGME20250220044132epcas5p305e4ed7ed1c84f9800299c2091ea0790@epcas5p3.samsung.com>
 <20250220043712.31966-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220043712.31966-3-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_044014_174364_17F8C7A5 
X-CRM114-Status: GOOD (  24.80  )
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

On Thu, Feb 20, 2025 at 10:07:12AM +0530, Swathi K S wrote:
> +static int fsd_eqos_probe(struct platform_device *pdev,
> +			  struct plat_stmmacenet_data *data,
> +			  struct stmmac_resources *res)
> +{
> +	struct clk *clk_rx1 = NULL;
> +	struct clk *clk_rx2 = NULL;
> +
> +	for (int i = 0; i < data->num_clks; i++) {
> +		if (strcmp(data->clks[i].id, "slave_bus") == 0)
> +			data->stmmac_clk = data->clks[i].clk;
> +		else if (strcmp(data->clks[i].id, "eqos_rxclk_mux") == 0)
> +			clk_rx1 = data->clks[i].clk;
> +		else if (strcmp(data->clks[i].id, "eqos_phyrxclk") == 0)
> +			clk_rx2 = data->clks[i].clk;
> +	}
> +
> +	/* Eth0 RX clock doesn't support MUX */
> +	if (clk_rx1)
> +		clk_set_parent(clk_rx1, clk_rx2);

Isn't there support in DT for automatically setting the clock tree?
See
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml#L24

Also, I think a cleanup like the below (sorry, it's on top of other
patches I'm working on at the moment but could be rebased) would
make sense.

With both of these, this should mean that your changes amount to:

1. making data->probe optional
2. providing a dwc_eth_dwmac_data structure that has .stmmac_clk_name
   filled in
3. adding your compatible to the match data with a pointer to the
   above structure.

In other words, support for your device becomes just a matter of adding
data structures rather than a chunk of extra code.

Thanks.

8<====
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next] net: stmmac: clean up clock initialisation

Clean up the clock initialisation by providing a helper to find a
named clock in the bulk clocks, and provide the name of the stmmac
clock in match data so we can locate the stmmac clock in generic
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 581c0b40db57..8e343ab7a7e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -34,6 +34,16 @@ struct tegra_eqos {
 	struct gpio_desc *reset;
 };
 
+static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
+				    const char *name)
+{
+	for (int i = 0; i < plat_dat->num_clks; i++)
+		if (strcmp(plat_dat->clks[i].id, name) == 0)
+			return plat_dat->clks[i].clk;
+
+	return 0;
+}
+
 static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 				   struct plat_stmmacenet_data *plat_dat)
 {
@@ -120,12 +130,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	for (int i = 0; i < plat_dat->num_clks; i++) {
-		if (strcmp(plat_dat->clks[i].id, "apb_pclk") == 0)
-			plat_dat->stmmac_clk = plat_dat->clks[i].clk;
-		else if (strcmp(plat_dat->clks[i].id, "phy_ref_clk") == 0)
-			plat_dat->pclk = plat_dat->clks[i].clk;
-	}
+	plat_dat->pclk = dwc_eth_find_clk(plat_dat, "phy_ref_clk");
 
 	return 0;
 }
@@ -230,18 +235,12 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 	eqos->dev = &pdev->dev;
 	eqos->regs = res->addr;
+	eqos->clk_slave = data->stmmac_clk;
 
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	for (int i = 0; i < data->num_clks; i++) {
-		if (strcmp(data->clks[i].id, "slave_bus") == 0) {
-			eqos->clk_slave = data->clks[i].clk;
-			data->stmmac_clk = eqos->clk_slave;
-		} else if (strcmp(data->clks[i].id, "tx") == 0) {
-			data->clk_tx_i = data->clks[i].clk;
-		}
-	}
+	data->clk_tx_i = dwc_eth_find_clk(data, "tx");
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
@@ -306,15 +305,18 @@ struct dwc_eth_dwmac_data {
 		     struct plat_stmmacenet_data *data,
 		     struct stmmac_resources *res);
 	void (*remove)(struct platform_device *pdev);
+	const char *stmmac_clk_name;
 };
 
 static const struct dwc_eth_dwmac_data dwc_qos_data = {
 	.probe = dwc_qos_probe,
+	.stmmac_clk_name = "apb_pclk",
 };
 
 static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.probe = tegra_eqos_probe,
 	.remove = tegra_eqos_remove,
+	.stmmac_clk_name = "slave_bus",
 };
 
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
@@ -354,6 +356,8 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
 
+	data->stmmac_clk = dwc_eth_find_clk(plat_dat, data->stmmac_clk_name);
+
 	ret = data->probe(pdev, plat_dat, &stmmac_res);
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
-- 
2.30.2


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

