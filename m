Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5072EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYVkarbGTlgISBurccqc2jqkuYXw9q5Rk/awuWQnUDQ=; b=qFr8IZ7XY11feOE3tmB+btXcvn
	6dQk+2kL71eBJL+gxEnAs27ZrBlNtaIBpRZFGRGMPafejo+lWB8btABeJy73JU2qx2u5kOgGgcbDs
	dG+VvS556opYii95Gj9y/fYGj9sE7cMsujldzSykr9i57s7Y8Kc1fsFXt3xZ9AEIla+kP44chxzcz
	joIb2yM7HckCbd3w8LJOpFdO4MkJMMaR1OgYVXJJOAxNXWILfAXJDL6NFTbcTokt17djgWQ/6SFof
	pIo9c2yWIl/rOd3pEawWdcSDDJrTRpNg9Mu1pUfpbXRf74Ttlzc27px67B1UoGURgmBd1XxtfTfdK
	0zLpkwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4n8-00000008Bij-3MDl;
	Wed, 29 Jul 2026 13:57:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4n8-00000008BiR-161b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:57:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE89C40113;
	Wed, 29 Jul 2026 13:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1D61F00A3E;
	Wed, 29 Jul 2026 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785333468;
	bh=fYVkarbGTlgISBurccqc2jqkuYXw9q5Rk/awuWQnUDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bt+hF+KdOEUbsvd8Ebt+v3bsvf2lC1rPuBjvhOQtryDvrj0/6QwfoxSSMvEqoKL3N
	 PLhUiSUCTzLYwsrs5wzQZe+Fp4I+JPksLt/KM71OyVdOt6kL3zqUrNjXOBLYcjwyOu
	 E5ose4lx0hl6Twtbz2iBZ5zsigpeTclK3o3bP6JeRh0QREiWtqkEUu6WudW84QKbgm
	 BzWPOT4VPfk0vfk72NQY7hJm43EjKGFJt2MMmGSJZ4nERu2gp4lN0GDRTREePNiz0y
	 2Dg0cFqiZTkD1QoU3llLDLVyOLb6lhpyH7cjuC+Yi2NLXrjUxVey0el3O4GlbKG8Mt
	 P2fIsGMuBvrUg==
Date: Wed, 29 Jul 2026 15:57:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v3] PCI: imx6: Update MPLLB bandwidth to improve i.MX95
 Gen3 PCIe stability
Message-ID: <jtpctss4hz3djqd4ukq634ujfk5jdud6c6r6apgo2syrsubqz2@jivsombtim3v>
References: <20260714024107.4113926-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714024107.4113926-1-hongxing.zhu@oss.nxp.com>
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

On Tue, Jul 14, 2026 at 10:41:07AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Bandwidth marginality was observed during i.MX95 Gen3 PCIe tests with
> the default MPLLB_BANDWIDTH value. This margin degradation worsens
> across voltage and temperature (VT) variations and different test
> matrices, potentially causing link stability issues.
> 
> Testing with MPLLB_BANDWIDTH value of 140 (0x8c) shows significant
> improvement in bandwidth margins across all VT conditions and test
> scenarios.
> 
> Implement PHY register write helper function and configure:
> - MPLLB_BW_OVRD_IN = 140 (0x8c) for improved bandwidth margin
> - MPLLB_BW_OVRD_EN to enable the override
> 
> This ensures robust PCIe Gen3 performance across all operating
> conditions.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> Changes in v3:
> Regarding Frank's comments, refine naming consistency and clarity.
> 
> Changes in v2:
> Update the register name and bit definitions.
> Don't move IMX95_PCIE_PHY_CR_PARA_SEL settings.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 53f3da6ab30d5..fadf14de10f7c 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -80,6 +80,17 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_PHY_REG_ADDR			0x3008
> +#define IMX95_PCIE_PHY_REG_EN			BIT(31)
> +#define IMX95_PCIE_PHY_REG_ADDR_MASK		GENMASK(15, 0)
> +#define IMX95_PCIE_PHY_REG_DATA			0x300c
> +#define IMX95_PCIE_PHY_MPLLB_OVRD_IN		0x2004
> +/* BIT(10): Override enable for mpllb_bandwidth[15:0] */
> +#define IMX95_PCIE_PHY_MPLLB_OVRD_BW_EN		0x400

Use BIT(10) please.

> +/* Register offset: Override value for mpllb_bandwidth[15:0] */
> +#define IMX95_PCIE_PHY_MPLLB_BW_IN		0x2005
> +#define IMX95_PCIE_PHY_MPLLB_BW_VAL		0x8c

Is it possible to define individual bits?

> +
>  #define IMX95_PCIE_RST_CTRL			0x3010
>  #define IMX95_PCIE_COLD_RST			BIT(0)
>  
> @@ -269,6 +280,16 @@ static int imx95_pcie_select_ref_clk_src(struct imx_pcie *imx_pcie)
>  	return 0;
>  }
>  
> +static void imx95_pcie_phy_write(struct imx_pcie *imx_pcie, int addr, u16 data)
> +{
> +	udelay(200);

Why is this delay at the start of this function?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

