Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4748AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaiT2z3qpXhTNE58QdMIFf3NiMwIsaqv9pHhX1hnvXY=; b=qyCrErYUfl8Kb7b2j9v8OxAbun
	cXtPXIx+Ck+37LXdcN8FUh19ydXkkBTMjGl6AF+VdQ6RrzLakgf7Pjn77jIDuZFgzmYquBlwoLS4R
	pXu+U+fE0/79oSgq/Il7zg/mTWE+brjc3CBe7VhfJu7Lrkq/x9mmeDfYnoCrfsSqDpCEStv6jT+n3
	n51k86Dux5L8c/XQFRcRGQM3ZdHY6KmRwRhkPJ9JeXuFUloLbde097hDP0p03dF+UdinkHMuBKs59
	bLz7p8h426rQtC2yzgaP5YIwReYBiDA3Ko1BDUsHOtd6KbTxwW+9mJcfE/EMlVhboQZXuiVMbjGmB
	HQT+CSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggaE-0000000CDYo-0evj;
	Mon, 06 Jul 2026 10:29:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggaC-0000000CDYX-3MeW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:29:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FA6841623;
	Mon,  6 Jul 2026 10:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366911F000E9;
	Mon,  6 Jul 2026 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783333788;
	bh=YaiT2z3qpXhTNE58QdMIFf3NiMwIsaqv9pHhX1hnvXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=deZw+PHZpD4PiC0sDZ+djpQLp9rq1RHiV3XJ4vz8ya27J+ITC8sQrrFsxsgM2rbWh
	 QuSF3XOxqXtS59J7ZItsOgAlnu8M2dhW2VLiuzRfi1OnHZe4bXe6JoL+JMdZDMVL7u
	 cbW/kExxihnu45MyBitLObmt8fn15wK+TewA4KedSUbFbJ+PU2eAdTumd7y9ggk92o
	 aGjvtMcgUi/3cVFZXh3NKYfH6BJtKa5cl5Cben3FaoC11KQD2j/b1wMO0aXBnZuL/d
	 ekH98V2cPLpFUPgye9mTySNgTjrat1iOCiF7PT/7uH0Eu7S8MW/lJD3wKNwAIVjBM8
	 PLDBE0qSS+ydw==
Date: Mon, 6 Jul 2026 12:29:35 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Soeren Moch <smoch@web.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, stable@vger.kernel.org, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
Message-ID: <2cbqhvfjszzuanp4i3rohntkxpfgftfjvzt66te3wkohsvw26g@yv4txuy74tvu>
References: <20260427115804.134231-1-smoch@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427115804.134231-1-smoch@web.de>
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

On Mon, Apr 27, 2026 at 01:58:04PM +0200, Soeren Moch wrote:
> Also on the NXP i.MX6Q chipset MSIs from the endpoints won't be received by
> the iMSI-RX MSI controller if the Root Port MSI capability is disabled.
> 
> Even though the Root Port MSIs won't be received by the iMSI-RX controller
> due to design, this chipset has some weird hardware bug that prevents
> the endpoint MSIs from reaching when the Root Port MSI capability is
> disabled.
> 
> Hence, always keep the Root Port MSI capability for this chipset.
> 
> Note that by keeping Root Port MSI capability, Root Port MSIs such as AER,
> PME and others won't be received by default. So users need to use
> workarounds such as passing 'pcie_pme=nomsi' cmdline param.
> 
> Fixes: 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI capability with iMSI-RX to work around hardware bug")

This is not the correct fixes tag. Correct one is:
f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port if iMSI-RX is used as MSI controller")

> Cc: <stable@vger.kernel.org> # 7.0.x
> Signed-off-by: Soeren Moch <smoch@web.de>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

@Bjorn: Can you merge this patch for 7.2-rcS with correct fixes tag?

- Mani

> ---
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: imx@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> 
> Tested on a tbs2910 board [1]
> [1] arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 6d6a1688e7eb..3d461bdef967 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1865,7 +1865,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>  			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>  		.dbi_length = 0x200,
>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>  		.ltssm_off = IOMUXC_GPR12,
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

