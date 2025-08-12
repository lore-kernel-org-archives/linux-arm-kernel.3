Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8696CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/ZpZvB0UzjhtgcaCIPiBa1y+srn05JmQRr3JIc84E4=; b=YrMr8KQZcEbOwa9Gl6EtwYx3lo
	hieE3aR9MeSQ1xcWeRwGhK46fv8vhc8jNZjBSslATQaeQjeJmJmhMuYSJz3bQk4OV0z6lk8hlE31z
	wNvDp0tCCrkexd5sXJsLRhn27wFcavO+BfptDdoXCFTTZnNCZD7SQdR2WnVffrmf11ceGCUgm5mep
	06+SnAjHOWwLdRa562uBj548YteM0hIYKhM6wquv7WvyEWOms8hUnYl7hAokzM6dxtJ0inA8nt10G
	DKNkG3IxyXTS7elKQBTVbIvxgXTw/USkNxf2HIWk0W4ron2jUPUqSW9k5Q53Wypt39sxY6/HuceE5
	4Xa+ohSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulufq-0000000BqZa-2U13;
	Tue, 12 Aug 2025 19:28:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsY0-0000000BWQ7-2r7q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F316860054;
	Tue, 12 Aug 2025 17:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B54C4CEF0;
	Tue, 12 Aug 2025 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755018747;
	bh=sbkCPKwftTrUkZdiXc/EE3AJ3jJBcpouENbdl33Fz34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXx9gseDXKIuFwtIIhveZDwIf2HCNERDvQcwjBm11f0IoKqQfl16vACxSWboPJ2vT
	 ZmlgdaRgw2T11JvWC+MrugfTSEOKkcNF6de6dcUu4+7+L2XiA8dzz/DTpkF2wbxSA8
	 lkFScCz4E8iTgYebg9Uvan5h7Z/NOnpSGCtwdsN1BDbSHMdaCbpCpJjwICJEJ4llkX
	 EJhhnU+PAyYoGwX31zZaNUjgy+DQ15n0nZ014YLlUciPnPdD39h5neAMEZfxyd2jQU
	 Q1BvJaIxYpI3gnnUvezXBXr07frMKY7rYXSIBnp81Og5N/djbx+PnhKikvjnmYK88/
	 LeHLfMA/8TgsA==
Date: Tue, 12 Aug 2025 22:42:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: imx6: Enable the vpcie regulator when fetch it
Message-ID: <zl6ie74kyeen2oudt3l2hv6ba5fwjsuiqlpdgaao5l7al7zjwu@bsj3agyukypn>
References: <20250619072438.125921-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619072438.125921-1-hongxing.zhu@nxp.com>
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

On Thu, Jun 19, 2025 at 03:24:38PM GMT, Richard Zhu wrote:
> Enable the vpcie regulator at probe time and keep it enabled for the
> entire PCIe controller lifecycle. This ensures support for outbound
> wake-up mechanism such as WAKE# signaling.

I'm not sure about this part. For supporting WAKE#, Vaux supply has to be
supplied to the endpoint. But here, 'vpcie' looks like the main 3.3V supply. So
keeping it always on to support WAKE#, sounds to me that the component never
enters the D3Cold state. So no WAKE# is required.

- Mani

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 27 ++++-----------------------
>  1 file changed, 4 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5a38cfaf989b..7cab4bcfae56 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -159,7 +159,6 @@ struct imx_pcie {
>  	u32			tx_deemph_gen2_6db;
>  	u32			tx_swing_full;
>  	u32			tx_swing_low;
> -	struct regulator	*vpcie;
>  	struct regulator	*vph;
>  	void __iomem		*phy_base;
>  
> @@ -1198,15 +1197,6 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct imx_pcie *imx_pcie = to_imx_pcie(pci);
>  	int ret;
>  
> -	if (imx_pcie->vpcie) {
> -		ret = regulator_enable(imx_pcie->vpcie);
> -		if (ret) {
> -			dev_err(dev, "failed to enable vpcie regulator: %d\n",
> -				ret);
> -			return ret;
> -		}
> -	}
> -
>  	if (pp->bridge && imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT)) {
>  		pp->bridge->enable_device = imx_pcie_enable_device;
>  		pp->bridge->disable_device = imx_pcie_disable_device;
> @@ -1222,7 +1212,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	ret = imx_pcie_clk_enable(imx_pcie);
>  	if (ret) {
>  		dev_err(dev, "unable to enable pcie clocks: %d\n", ret);
> -		goto err_reg_disable;
> +		return ret;
>  	}
>  
>  	if (imx_pcie->phy) {
> @@ -1269,9 +1259,6 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  	phy_exit(imx_pcie->phy);
>  err_clk_disable:
>  	imx_pcie_clk_disable(imx_pcie);
> -err_reg_disable:
> -	if (imx_pcie->vpcie)
> -		regulator_disable(imx_pcie->vpcie);
>  	return ret;
>  }
>  
> @@ -1286,9 +1273,6 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
>  		phy_exit(imx_pcie->phy);
>  	}
>  	imx_pcie_clk_disable(imx_pcie);
> -
> -	if (imx_pcie->vpcie)
> -		regulator_disable(imx_pcie->vpcie);
>  }
>  
>  static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
> @@ -1739,12 +1723,9 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	pci->max_link_speed = 1;
>  	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
>  
> -	imx_pcie->vpcie = devm_regulator_get_optional(&pdev->dev, "vpcie");
> -	if (IS_ERR(imx_pcie->vpcie)) {
> -		if (PTR_ERR(imx_pcie->vpcie) != -ENODEV)
> -			return PTR_ERR(imx_pcie->vpcie);
> -		imx_pcie->vpcie = NULL;
> -	}
> +	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie");
> +	if (ret < 0 && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable vpcie");
>  
>  	imx_pcie->vph = devm_regulator_get_optional(&pdev->dev, "vph");
>  	if (IS_ERR(imx_pcie->vph)) {
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

