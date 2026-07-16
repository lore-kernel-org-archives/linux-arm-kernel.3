Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D44C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRQXasdSjh/IVyj+LLVVvuKUHT3n1CA/5KP9qz5vin8=; b=zorKW88+dWcvIZTeh5VIXdoAjX
	oZaWS0nZNP5bzK/7W+U+Ujq2ILsn9MkGxaMl3MAVx5l1X4qo0WPbHxArhETIlBD51CechG4Fi7WHu
	eqs7dXt9xDucFD1FEEEMDMbXZlg2cif80h/EzsWYCyBLvU1nNbZ5LQmWvvhXNt3gJnXzw7nvE3nhh
	zZh/DU1h43fXtW2bSK7XhQUox1tDnqkAEsmUaGtZxHd/TPI3N/URl1G3K+gtOWkuLmOkJv2tWP10k
	1c1v7UtqoEpKj3OyVWXthMYtjFeg6RJrn8spvFWDdsMsIqxRwL/Pych/jUUMzPv816kYXShhmHM0D
	pkLSiWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPBy-00000000CHK-0GPc;
	Thu, 16 Jul 2026 16:44:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPBw-00000000CH3-23Ot
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:44:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B866F60A61;
	Thu, 16 Jul 2026 16:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59961F000E9;
	Thu, 16 Jul 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220247;
	bh=KRQXasdSjh/IVyj+LLVVvuKUHT3n1CA/5KP9qz5vin8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bSVWybz7hoRT6SwmRrOHtV4PdMzz02I7aAxH9ydTXI3xq2ij/ySjxL7NobDNDmx/Q
	 l6Ckz+/LD6fkpfqrSabZew2DjAM4oDQZ2FC11ziHvNXI9uCZQ/4k63fEK2pBmgpLeM
	 7Qervo37/1gwY7R18JunzNEJfvtzWKEgzctHXQ6wkphF+N0UHmRki/A0UUNkvtAX1r
	 mJEMhXsuCbcgXqi8JScXu9dxnNx+S18xanJWKwOUNFjRVN8wLfceYfYgV47j5lE1Nn
	 Zuz6yeztWML3Udeycwve/w68HrGv4fL/zA6MgtJd7iMzjxrTJkGTRndNZJ1m+EcZ1a
	 MJiRKzNIsdDAg==
Date: Thu, 16 Jul 2026 18:43:48 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Add runtime PM support for i.MX95
Message-ID: <aprkipjl3lpdn37dlcdv7wx6piepbbqjsd6ljfgpa5pmua2axu@etxjfuahtg3u>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
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

On Wed, Jul 08, 2026 at 11:59:26AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Enable runtime PM support for i.MX95 PCIe Root Complex to allow dynamic
> power management when the PCIe link is idle.
> 
> The i.MX95 PCIe controller supports entering D3hot state when PCIe
> devices are not actively in use. This implementation uses
> pm_runtime_no_callbacks() to leverage the PCI core's generic runtime PM
> handling. The PCI core automatically manages D-state transitions based
> on the runtime PM state of connected endpoint devices.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Please resend this patch separately. Currently, you've sent other patches as a
reply to this patch which just messes up the order.

- Mani

> ---
> Changes in v2:
> Use devm_pm_runtime_set_active_enabled() simplify the codes and error
> path.
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index eae495a1b7990..578410f262aed 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -130,6 +130,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
>  /* Preserve MSI capability for platforms that require it */
>  #define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
> +#define IMX_PCIE_FLAG_PM_RUNTIME		BIT(14)
>  
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
>  
> @@ -1973,6 +1974,13 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		 */
>  		imx_pcie_add_lut_by_rid(imx_pcie, 0);
>  	} else {
> +		if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_PM_RUNTIME) {
> +			pm_runtime_no_callbacks(dev);
> +			ret = devm_pm_runtime_set_active_enabled(dev);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
>  		/*
>  		 * i.MX RC is powered off during suspend, force L2 entry to
>  		 * ensure proper endpoint notification before power loss.
> @@ -2121,6 +2129,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.flags = IMX_PCIE_FLAG_HAS_SERDES |
>  			 IMX_PCIE_FLAG_HAS_LUT |
>  			 IMX_PCIE_FLAG_8GT_ECN_ERR051586 |
> +			 IMX_PCIE_FLAG_PM_RUNTIME |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.ltssm_off = IMX95_PE0_GEN_CTRL_3,
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

