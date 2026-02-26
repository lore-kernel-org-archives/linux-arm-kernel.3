Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C518FD375D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZPmsmFndXQGjcjbVB8WI05coqZ1fJJnbk/j2C0mctg=; b=M5t59rDXIRQBQLLidMr6UNWSBF
	JbtXk11hhMW8/L3QDgt6bxKM3VP+zXl2Vqgy/mm7QO72Plr4MvGDRJAt/rNXW/7Or16DyFxDEsrDS
	ppPfC3eIoJgkCehQoUIr8S7VzeI6YfAScdtaQlttZyX+iCz2hxK9kpgB/ptekJ2bpAglJX4ZUtO1e
	2+MF+6U5wXFe1eJ1fn8jokHI3TaSq4imVMQrjNA+E1+mYw/Hg6g7dZc1XZ89iPXI5ohWZb3TSX3qR
	uaN2/Dsi2NZ2hxTtONQDwvGV2H0h2+JTTmpx7/alf4Mxbw4J7AvNUjw5YZvMlwL63lpJlxO6eXtQ3
	Li+aDgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUwK-00000005V5y-2MM1;
	Thu, 26 Feb 2026 06:33:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUwI-00000005V5r-3rM7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7FF060054;
	Thu, 26 Feb 2026 06:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C6FC19422;
	Thu, 26 Feb 2026 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772087613;
	bh=TQcjNDCthRmxoghOT2T0FWsXkA4piqIaaOpYR6a5s4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbGSrvcupcn+h4fSa+L/b7cSolIXGPrRwp3dyI0q9iPQYaqipe3QccDiDR54tHkHW
	 F+4AIwN/JRG5wOv/BWdUi71OGxvlhvmA2Is7wj2VbS3L7yoIZpWN2DNNJNHL4q0TdM
	 dcV1WucverRdKdncs4SYMtwxg800QKxv1DVxsKktYcExupBmWynxOmvBQvt6J+80aW
	 /pOkRY82quk9Y8q9pCTCwGS9oDzcaSTAf4QAHpMtsIFqqt07/OlbDMfTaHUuXxuSC6
	 Y2eVFhzbQB6Y+mdr+k8L8jd4To3IDy0BpTfFJoP/Gavqj0VrJNBHy0lMkBI5mfeFTJ
	 G2owFRTaeTFiA==
Date: Thu, 26 Feb 2026 12:03:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] PCI: layerscape: Allow to compile as module
Message-ID: <6xnmjhwm5mfrff6gyomwrnft3bfuxvun2cxi56lx6qvlugxg6l@yossniactj2r>
References: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
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

On Mon, Jan 12, 2026 at 08:17:11PM +0100, Steffen Trumtrar wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The layerscape pcie host controller could also be compiled as module.
> Add the necessary infrastructure to allow building as module instead of
> only as builtin driver.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Applied to controller/dwc-layerscape, thanks!

- Mani

> ---
>  drivers/pci/controller/dwc/Kconfig          |  2 +-
>  drivers/pci/controller/dwc/pci-layerscape.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 519b59422b479..abfa4a6e62c25 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -121,7 +121,7 @@ config PCI_IMX6_EP
>  	  DesignWare core functions to implement the driver.
>  
>  config PCI_LAYERSCAPE
> -	bool "Freescale Layerscape PCIe controller (host mode)"
> +	tristate "Freescale Layerscape PCIe controller (host mode)"
>  	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index a44b5c256d6e2..14d6ac4fc53fd 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> +#include <linux/module.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
> @@ -403,8 +404,16 @@ static const struct dev_pm_ops ls_pcie_pm_ops = {
>  	NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq, ls_pcie_resume_noirq)
>  };
>  
> +static void ls_pcie_remove(struct platform_device *pdev)
> +{
> +	struct ls_pcie *pcie = platform_get_drvdata(pdev);
> +
> +	dw_pcie_host_deinit(&pcie->pci->pp);
> +}
> +
>  static struct platform_driver ls_pcie_driver = {
>  	.probe = ls_pcie_probe,
> +	.remove = ls_pcie_remove,
>  	.driver = {
>  		.name = "layerscape-pcie",
>  		.of_match_table = ls_pcie_of_match,
> @@ -412,4 +421,9 @@ static struct platform_driver ls_pcie_driver = {
>  		.pm = &ls_pcie_pm_ops,
>  	},
>  };
> -builtin_platform_driver(ls_pcie_driver);
> +module_platform_driver(ls_pcie_driver);
> +
> +MODULE_AUTHOR("Minghuan Lian <Minghuan.Lian@freescale.com>");
> +MODULE_DESCRIPTION("Layerscape PCIe host controller driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, ls_pcie_of_match);
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139
> 
> Best regards,
> -- 
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 

-- 
மணிவண்ணன் சதாசிவம்

