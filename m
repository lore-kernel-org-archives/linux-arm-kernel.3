Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B84CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZRP8AhhvgZ8EEgAJLO+1bL+TPGneyCKqtP7iUuLHR0=; b=CyOkB2m6CWRH0PpSBP6qDgxs4I
	2odvRJ6AW6O3aojiuvOUIdoM1IYB8kP1d2obbqz8F6PipQWELRivDWB7JEDMzPC1LJGqrHuZsHKtB
	TJXhfobMrUspmEgapFQ3Tb8q7EtA0kt0e9V9XrDP3c5aJX1DTXu6450i+mIDRHcePSUFBcCjqv5ew
	mkKRySMcHJNU0SfbP85p05hnGf8MubNRo8hlAHem8SNUqnVuwgIRtbkfzWGAbRjOOJMXQSyMPCEy4
	wsdJcjGTD3R4frb2hneiznkCru57z2ljlayA15WoX3DP7gz8jwI5DSJ7NfadvXLie8HT3NC2J2Y66
	LEpUffkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKsU-000000081at-0WqJ;
	Wed, 10 Jun 2026 15:30:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKsS-000000081aV-3ckI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 15:30:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 559DF407CD;
	Wed, 10 Jun 2026 15:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E30A1F00893;
	Wed, 10 Jun 2026 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105400;
	bh=wZRP8AhhvgZ8EEgAJLO+1bL+TPGneyCKqtP7iUuLHR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DoOAIhdeWZ2NEH60xzHnIBqtsJPWYRVavXhN4H0/qvO9id/fMcAhhad1aHHbDwTHv
	 qNXBQE2R5Urcvc4Vl4K9iJeisrDOfHRhMee/yysUH7D2N4nXV5xbtWaBPhjT8SoZGu
	 XGfFEbIpsV/U0EBX/fRjCE9MRGwOotujUFXO+BmwJVNt0apwnq391gaBdCV06jy/WJ
	 P2EgOyxS7+MBODq8r4GYoDw9oUJbc33FnfvKsZdMRBOjaFCEh8nMyA8X4SgaIpduWz
	 /HQJHsR1mGlMSglrv0fwCLj7hX3wOV8MEPCAObpD5cRLg+yxvdPXdauFalY7sc+20X
	 S7oG4hYaY92YQ==
Date: Wed, 10 Jun 2026 20:59:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sherry.sun@nxp.com
Subject: Re: [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and update
 device trees
Message-ID: <cpgr6bt2635l2wijluapmqumtbeuskf6womowhvmx4pu36ab2v@gbvnwlmjckc6>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
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

On Wed, May 20, 2026 at 04:48:56PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> This series integrates the PCI pwrctrl framework into the pci-imx6
> driver and updates i.MX EVK board device trees to support it.
> 
> Patches 2-8 update device trees for i.MX EVK boards which maintained
> by NXP to move power supply properties from the PCIe controller node
> to the Root Port child node, which is required for pwrctrl framework.
> Affected boards:
> - i.MX6Q/DL SABRESD
> - i.MX6SX SDB
> - i.MX8MM EVK
> - i.MX8MP EVK
> - i.MX8MQ EVK
> - i.MX8DXL/QM/QXP EVK
> - i.MX95 15x15/19x19 EVK
> 
> The driver maintains legacy regulator handling for device trees that
> haven't been updated yet. Both old and new device tree structures are
> supported.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
> Changes in V3:
> 1. Rebased on top of latest 7.1.0-rc4
> 
> Changes in V2:
> 1. After commit 2d8c5098b847 ("PCI/pwrctrl: Do not power off on pwrctrl
>    device removal"), the pwrctrl drivers no longer power off devices
>    during removal. Update pci-imx6 driver's shutdown callback in patch#1
>    to explicitly call pci_pwrctrl_power_off_devices() before 
>    pci_pwrctrl_destroy_devices() to ensure devices are properly powered
>    off.
> ---
> 
> Sherry Sun (8):
>   PCI: imx6: Integrate new pwrctrl API for pci-imx6
>   arm: dts: imx6qdl-sabresd: Move power supply property to Root Port
>     node
>   arm: dts: imx6sx-sdb: Move power supply property to Root Port node
>   arm64: dts: imx8mm-evk: Move power supply property to Root Port node
>   arm64: dts: imx8mp-evk: Move power supply properties to Root Port node
>   arm64: dts: imx8mq-evk: Move power supply properties to Root Port node
>   arm64: dts: imx8dxl/qm/qxp: Move power supply properties to Root Port
>     node
>   arm64: dts: imx95: Move power supply properties to Root Port node

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
>  .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |  2 +-
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  4 ++--
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  4 ++--
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  4 ++--
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  4 ++--
>  .../boot/dts/freescale/imx95-15x15-evk.dts    |  4 ++--
>  .../boot/dts/freescale/imx95-19x19-evk.dts    |  8 +++----
>  drivers/pci/controller/dwc/Kconfig            |  1 +
>  drivers/pci/controller/dwc/pci-imx6.c         | 24 ++++++++++++++++++-
>  12 files changed, 43 insertions(+), 20 deletions(-)
> 
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

