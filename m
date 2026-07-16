Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F003EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iynh3mALdGfTeVuUBCsluq6Ns/4eXtdG/rMGWalEpDs=; b=rkP2shVwn/3x3cpMPkB1fZjFL7
	OiKP0H6//U4n1cp3ktiDhVC/vt06RIsH4yzh3IJm1A3KHsvqrcpugHB6uX52lC2F5Kc/n76ATsO9k
	gZuK4yf9xPVLBbwUtlbFJOgo0Hf46Ll48Pog2UO8wlU5DZTrpHw97Pa9y77Hi7zfYDZooFs9jQ01v
	10MH+JCAgwikrzhX5J4d6wMXN2a/Er9ervs7y8689+OHYPMOLRTWyzbBwGGfeok3HISZDc58wnsqE
	Jh9uPusAH5fFIG6cVm2J3mpP6DyJYx68GgmskY30ZMbhm3zFelOAcZZJsZ6gvl2/ezPAyT54wKg8q
	6TX7Ujvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGx5-0000000GhRf-2zOx;
	Thu, 16 Jul 2026 07:56:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGx4-0000000GhRL-39UL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:56:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A1BB41497;
	Thu, 16 Jul 2026 07:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731EE1F000E9;
	Thu, 16 Jul 2026 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784188574;
	bh=iynh3mALdGfTeVuUBCsluq6Ns/4eXtdG/rMGWalEpDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hz7yz6VjkJcH4OhxChCfi+2nTnKbplW+xQa/kSuTd4tNeWHzOQBDFhfGj6gHTK0PI
	 tjNWopMkN99H8xbcYueCcVkgnpSuuPv9dfmcjJk7sGOI8RxbtjJRsVkX8lLYTMjvQP
	 rG3OO5EhmEP/X5gYzUSinEs8zAhV5rH/CEYIShcpGC1qnIKtV1yNpA7P4Sd0fkQPYh
	 Ulxul+WK1o1bdFQ7QtLGlzK/kyaMzDmeHCBG5RM9QnMy56ywhs+05gvmidPODbPj4u
	 oGlcXsz13tbYXrCG7A3k2uqFPtuYwch5Rw9iyIuyL6bx7IfBGnujwPWX+RjsmDytPT
	 IcQyW0IDB7whQ==
Date: Thu, 16 Jul 2026 09:56:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 4/4] net: stmmac: dwmac-socfpga: Add support
 for Agilex5 TSN GMAC with FPGA converter
Message-ID: <20260716-monumental-daring-beagle-28e81d@quoll>
References: <20260716021932.20037-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260716021932.20037-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716021932.20037-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Wed, Jul 15, 2026 at 07:19:32PM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Agilex5 SoCDK TSN Config2 board uses a GMII-to-RGMII converter
> implemented as FPGA soft IP between gmac1 and its PHY. This converter
> provides the RGMII TX/RX clock delays, so the MAC interface selector
> must be configured for GMII while the PHY is configured without delays.
> 
> Add the "altr,socfpga-stmmac-agilex5-tsn" compatible to the match table
> and detect it in probe to force GMII for the MAC interface selector and
> strip the delay bits from phy_interface so the PHY is not configured to
> add delays already provided by the FPGA converter.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v4: Add Reviewed-by from Andrew Lunn.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 1d7f0a57d288..bf591a68502f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -69,12 +69,13 @@ struct socfpga_dwmac {
>  	void __iomem *tse_pcs_base;
>  	void __iomem *sgmii_adapter_base;
>  	bool f2h_ptp_ref_clk;
> +	phy_interface_t mac_interface;
>  	const struct socfpga_dwmac_ops *ops;
>  };
>  
>  static phy_interface_t socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
>  {
> -	return dwmac->plat_dat->phy_interface;
> +	return dwmac->mac_interface;
>  }
>  
>  static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
> @@ -650,6 +651,15 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
>  	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
>  
> +	dwmac->mac_interface = plat_dat->phy_interface;
> +
> +	if (of_device_is_compatible(pdev->dev.of_node,
> +				    "altr,socfpga-stmmac-agilex5-tsn")) {

Don't add compatibles around the code. Does not scale. You have driver
match data exactly for that purpose.

> +		dwmac->mac_interface = PHY_INTERFACE_MODE_GMII;
> +		if (phy_interface_mode_is_rgmii(plat_dat->phy_interface))
> +			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> +	}
> +
>  	ops->setup_plat_dat(dwmac);
>  
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> @@ -674,6 +684,7 @@ static const struct of_device_id socfpga_dwmac_match[] = {
>  	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
>  	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
>  	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
> +	{ .compatible = "altr,socfpga-stmmac-agilex5-tsn", .data = &socfpga_agilex5_ops },

Otherwise dvices are compatible? They why would you need this entry in
the first place?

Best regards,
Krzysztof


