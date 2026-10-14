Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E95DCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FEN0Cztw+BYN7XA5fORyPpV9q6g1u7RdRnzRwOfUVTM=; b=jojPH5tM4XgjXS
	0NqAdo0BJliVQFM6Wx51QJ3rhyetma1fm7LSAzjdBkBUgyJaYbi7OMb0ynlptpYKeud6JYliR0/87
	O64c2KsE7AgNKNwVFwXR5j3y+vvNVB6AlvB7WyT5Qj0onPbgggoC5mpREFxdYjxzqHUFeh4wMBiPK
	AR849vcZiM6vX0ygxTeLBBzF5t4pR4LQwHigAkLk4SxbM4WsS3UwGaX/gQeHgdSlt7X4xxuHMEDbs
	ylGOF2lC885c29Zh42xvSHCfCdwSd9YM3+s4L1E71N2YNygUzmj+5D9U1J7KkoTksMKbyQTmEICmJ
	YiXKqeeI9WsBjdFvAtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyti-0000000FZGS-0Tpd;
	Wed, 14 Oct 2026 13:19:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyth-0000000FZFt-1Y5L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:19:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80F25600DA;
	Wed, 14 Oct 2026 13:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076EE1F000FF;
	Wed, 14 Oct 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983996;
	bh=FEN0Cztw+BYN7XA5fORyPpV9q6g1u7RdRnzRwOfUVTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Dq2DkGy2908a1ZLNzPOanS6vCdxfdErYhJ56neCG59Qo7E/IEvAvIURBVoYE3o4FB
	 LNic9MkoP6sv4UDKei69KFUglNeUN2kOaUC/OtyiEj5nuIeS2n/O1FyJCGDpXvkssd
	 0Xr1+/oWlXOkKbloJJu7gks239NwXpaxsR2DjlZniWextIxlNdbMypZqQEQIrJcQQz
	 AZMbPBM65ctwOgqz0GFB6HLmGk81hgBiXADnKDsoN2Q4A2y41/hOYaEnlx5JeoWYXj
	 VrkGOhW8cy0VYBFXBxcy3jZlX2hgjeEgW0I3ePuDdt18mxFB6BQ7MpdadcdykyobL3
	 1r7qKab3rBw9g==
Date: Wed, 14 Oct 2026 08:19:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 13/24] PCI: dwc: Add ZTE ZX279128S host controller
 driver
Message-ID: <20261014131954.GA1623979@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-14-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:53AM +0100, Navid Ghahremani wrote:
> Support the two Synopsys DesignWare PCIe host controllers of the
> ZTE ZX279128S SoC. The driver manages the controller clocks via CCF,
> asserts/deasserts resets via the Reset framework, and manages the
> analog SerDes and PLL via the Generic PHY framework.

Thanks for making the commit log complete.

Suggest making the subject line:

  PCI: zx: Add ...

or whatever tag you plan to use for the family of hardware this driver
will support over time.  Future changes to a driver typically don't
include "dwc" because the name of the driver itself is more useful.

I see "zx" used in the spi patch and "zte" used in the clk patch.
"zte" might be too generic; there may be future hardware that requires
a different driver.  "zx279128s" might be too specific; there will
likely be more SoCs that share this driver.  Same consideration
applies to filename, config symbol, struct and function names, etc.

> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  drivers/pci/controller/dwc/Kconfig          |  13 +
>  drivers/pci/controller/dwc/Makefile         |   1 +
>  drivers/pci/controller/dwc/pcie-zx279128s.c | 273 ++++++++++++++++++++
>  3 files changed, 287 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-zx279128s.c
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index dcfbe7e229..3a4008be84 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -577,4 +577,17 @@ config PCIE_ULTRARISC
>  	  By default, this symbol is enabled when ARCH_ULTRARISC is active,
>  	  requiring no further configuration on that platform.
>  
> +config PCIE_ZX279128S
> +	bool "ZTE zx279128s PCIe controller"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	depends on PCI_MSI
> +	select GENERIC_PHY
> +	select PCIE_DW_HOST
> +	select RESET_CONTROLLER
> +	help
> +	  Say Y here to enable support for the two PCIe host controllers of
> +	  the ZTE zx279128s SoC. They are based on the Synopsys DesignWare
> +	  PCIe IP. On the ZTE ZXHN H3600 they connect the MT7915 Wi-Fi chip.
> +	  The driver only supports legacy INTx interrupts.

Capitalization of "zx279128s" here (menu item, help text, comment
below) should probably match the commit log and marketing materials
for this SoC.

The config symbol should use the same tag as the subject line.
PCIE_ZX279128S might be too specific if more SoCs might share this
driver.

>  endmenu
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index d4f88cfc62..379198ebd6 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_PCIE_TEGRA194) += pcie-tegra194.o
>  obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
>  obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
>  obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
> +obj-$(CONFIG_PCIE_ZX279128S) += pcie-zx279128s.o
>  obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
>  obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
>  obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
> diff --git a/drivers/pci/controller/dwc/pcie-zx279128s.c b/drivers/pci/controller/dwc/pcie-zx279128s.c
> new file mode 100644
> index 0000000000..592a7f7c4e
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-zx279128s.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ZTE zx279128s PCIe host controller

