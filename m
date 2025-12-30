Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774FCE92722
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 03:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts6r7QqfUF3YI7dl/i0FaC3+dLzP6Eq+YuewnnBackc=; b=lY2loUB4kGoviQifyFDz7BWvWp
	L6kMR5zwOiK8RdLKm8xNw2/sy2axFTUN0vJnqLYIiIw6ovHRrV4uM4RbMOOgzh6SxCZGerVD7+bES
	h09Wzc/sIgKFS8MoRSzJX1gn5sc9JSGsZB/gjFwqaR1W6zBpyfQDHr9MaLqRPPbTfEr6h3P6PD45x
	zG87YknS3mMgi4flh2ITlVUu1ilpMCcbHZd26fzv8SAXazbhuRaYmImOEnlY8zNYsxD0jIRpmQg0p
	lShP/Bw3+4oWZMYWair2dHormo91AZBv9BSUqVzdMqjzG5Gb2EvgdyKN79Yi+IUBid7GkaTTuAOwi
	jhFGg5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQPJ-00000004MfF-1RTj;
	Tue, 30 Dec 2025 03:28:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQPH-00000004Mf6-4Ap3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 03:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EADB06000A;
	Tue, 30 Dec 2025 03:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87405C16AAE;
	Tue, 30 Dec 2025 03:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767065302;
	bh=Dccpw7NPvtBDj/FiKmoCP1aZ1Hu8cpN1GGFZQAOlyAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3/K7jpk/8nZPjwYl44wpek4Pb6k5lsqGww8UKUxKm0vtED6l/Qe6gmgMFRl22BR0
	 Rb0Hbp6YVKnByxVtcyD5CLRDuUzvtx+SITxnWHn1oUemGtsV8vsguciQI55RRm85AL
	 Lg3BiEh5kRHpVeKfjHWDCDx0GutRyXKaFIEFVZ5znJvGR5BfBZDBunoaTKq6aZKH+H
	 33DQo2cxFKA+uvpnZl5y27MTkzfP77a2YQN+oCeFtrTngRqMdQ0y50E8i0adNTfeeb
	 8/YqrJNGlXXHdYo52LQo+xVR9nkHxFRUO0HMwmoVprvOdMmmOC/9a5jNIeB4dABhoV
	 eDpJOeW7fuGDg==
Date: Tue, 30 Dec 2025 11:28:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] arm64: dt: imx95: Add the missed ref clock for
 PCIe[0,1]
Message-ID: <aVNG0BjbEVHhgNCa@dragon>
References: <20251211064821.2707001-1-hongxing.zhu@nxp.com>
 <20251211064821.2707001-5-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211064821.2707001-5-hongxing.zhu@nxp.com>
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

On Thu, Dec 11, 2025 at 02:48:21PM +0800, Richard Zhu wrote:
> i.MX95 PCIes have two reference clock inputs, one of them is from
> internal PLL. It's wired inside chip and present as "ref" clock. It's
> not an optional clock.
> 
> Add the missed ref clock for PCIe[0,1].
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

It doesn't seem to apply to my tree.

Shawn

> ---
>  .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
> index 5b6b2bb80b288..1258fcb54681e 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
> @@ -237,8 +237,9 @@ &pcie0 {
>  	clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  		 <&pcieclk 1>,
>  		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
> @@ -250,8 +251,9 @@ &pcie1 {
>  	clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  		 <&pcieclk 0>,
>  		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> -		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> -	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> +		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
>  	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
> -- 
> 2.37.1
> 

