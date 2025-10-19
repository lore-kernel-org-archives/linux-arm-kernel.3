Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9704ACCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzJBwVufIqSd28UXTJiRvSTu8HB03cFHT0WX4CBcKAs=; b=wtEnomRCzpwvWgLqSfPHdO1dSm
	9szgfGAPcZIXu2BkQ65lYwxPrUBwpxMzbX///GJQFFsXXwKYIgDJFilApjCR+FpmYkh3ig5/up4ku
	AEV3lF/E9yAWnTuZRp557QNnmnc8eyKGRhfS/3qLR2C8pVWJVkCzadj6OjlMls4OuJywPRHyP3rdR
	RAxfDEjso/Ul1TnscNG+KUBbNqoGcDoyhw+K2Xi61sr5W7e+VlmLr2eQIIxdxnaGPROClqRvsgJSZ
	4Jmagg4OnGLy8iqKW6xDBA/MrJpZQh4CE0cn2oSgDDJHxMcJtj/Z38/fFnhLQ3S1ctR8t/dq2rIwB
	PC8U70aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANtt-0000000AmcH-1RS0;
	Sun, 19 Oct 2025 07:32:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANtq-0000000AmbN-2tD6;
	Sun, 19 Oct 2025 07:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4643B44456;
	Sun, 19 Oct 2025 07:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF52DC4CEE7;
	Sun, 19 Oct 2025 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760859123;
	bh=Q5WZijcRsjXr1RWFkwdQADczeQBWeDR34cnzsxqPN0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oysZ12Tnrxw8qCzJaaW5FvHJsX9RECC9QhUHD4trdla7ylQC1SGPQ9dxBvbwfh4AB
	 EZuq9TNoFGZKeRbBH5MmkMv3fcI3RkZjkGjXSDd3+cdi4WsjG0b2rv96lVjbHCAhko
	 KmEaHXcJCviGKhdxY00RrIu2XmkcpgHioxyHCVaYgG7yjyq+cuSpKV6+xGOI73Pm/g
	 lyAcuHPLAav9ye31NNhcKtGXM8Y4UMZvwgwXL7b2aMfSzjNPIpxbseiRy60DFPUNlb
	 ktnUvzx6DG1m9szD4Ci9xy3LYv/BIuwrz+O+2qj57v5bPxfRwJ+1CXFQ4bTuhKnZ4Z
	 aDQTsk24cusQQ==
Date: Sun, 19 Oct 2025 13:01:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v5 5/5] PCI: mediatek: add support for Airoha AN7583 SoC
Message-ID: <hjyhso2sqgyq4ymzqg6pmjfrfncla24zwsev2mfinolmclm3ih@sol2yoapbykq>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251012205900.5948-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_003219_004175_11F05CB9 
X-CRM114-Status: GOOD (  26.40  )
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

On Sun, Oct 12, 2025 at 10:56:59PM +0200, Christian Marangi wrote:
> Add support for the second PCIe Root Complex present on Airoha AN7583
> SoC.
> 
> This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> also require workaround for the reset signals.
> 
> Introduce a new flag to skip having to reset signals and also introduce
> some additional logic to configure the PBUS registers required for
> Airoha SoC.
> 
> While at it, also add additional info on the PERST# Signal delay
> comments and use dedicated macro.
> 

This belongs to a separate patch which should come before this one.

> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 92 ++++++++++++++++++++------
>  1 file changed, 70 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 1678461e56d3..3340c005da4b 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -148,6 +148,7 @@ enum mtk_pcie_flags {
>  	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
>  			  * external block
>  			  */
> +	SKIP_PCIE_RSTB	= BIT(3), /* Skip calling RSTB bits on PCIe probe */
>  };
>  
>  /**
> @@ -684,28 +685,32 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
>  	}
>  
> -	/* Assert all reset signals */
> -	writel(0, port->base + PCIE_RST_CTRL);
> -
> -	/*
> -	 * Enable PCIe link down reset, if link status changed from link up to
> -	 * link down, this will reset MAC control registers and configuration
> -	 * space.
> -	 */
> -	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> -
> -	/*
> -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> -	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> -	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> -	 */
> -	msleep(100);
> -
> -	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> -	val = readl(port->base + PCIE_RST_CTRL);
> -	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> -	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> -	writel(val, port->base + PCIE_RST_CTRL);
> +	if (!(soc->flags & SKIP_PCIE_RSTB)) {
> +		/* Assert all reset signals */
> +		writel(0, port->base + PCIE_RST_CTRL);
> +
> +		/*
> +		 * Enable PCIe link down reset, if link status changed from
> +		 * link up to link down, this will reset MAC control registers
> +		 * and configuration space.
> +		 */
> +		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> +
> +		/*
> +		 * Described in PCIe CEM specification revision 3.0 sections
> +		 * 2.2 (PERST# Signal) and 2.2.1 (Initial Power-Up (G3 to S0)).
> +		 *
> +		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> +		 * for the power and clock to become stable.

You can drop the comments since PCIE_T_PVPERL_MS definition has them.

> +		 */
> +		msleep(PCIE_T_PVPERL_MS);
> +
> +		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> +		val = readl(port->base + PCIE_RST_CTRL);
> +		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> +		       PCIE_MAC_SRSTB | PCIE_CRSTB;
> +		writel(val, port->base + PCIE_RST_CTRL);

If PCIE_LINKDOWN_RST_EN corresponds to PERST# signal, then it should be
deasserted only after the power and REFCLK are stable. But I'm not sure what the
above PCIE_RST_CTRL setting is doing. If it somehow affects either power or
REFCLK, then it should come before PCIE_LINKDOWN_RST_EN.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

