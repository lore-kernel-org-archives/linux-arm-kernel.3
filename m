Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D95CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWAQ3qjHXiKQYtyQNVwlmIX+cJpiI8WCcZJ8FfqtV7s=; b=dMCTZg2nvGkn7nb2hSszGWwGd5
	SU4gPZR4dUblOK8KAnXnMi/zal52h/u13/QwiCqQQAfBfYY4/IXsmHWKdGCiLtviKegAxGTEaGPs5
	QgbVN4juPe0u4xdHtrfgKUIQWR48pKBjLHWUAwZ5EwduU8FYCbNdS2vsg8mSttxOvuVk98KllgrVS
	/ZCvZMAUsVij8vZLRaYgQkyvQ+b27o+CwsXShkELqkAQHoI0G9SjWL1OG2WL5ptDIDNouujOeR4BR
	tjO9gg7m45doKyHiOS4+vELejg5tc+iuPTErMAhWC7bC+GG0PY+odZYTzJcpJYhX6eEsvsMVpvD2L
	f5TCKgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg2j-00000003nPS-1ipU;
	Fri, 19 Sep 2025 18:41:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzg2h-00000003nOy-126v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BA2240B92;
	Fri, 19 Sep 2025 18:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB6DC4CEF0;
	Fri, 19 Sep 2025 18:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758307270;
	bh=mqexrFz3ljxCYgU9d7/KUR9s+3jMqD7nGXKxzXiThmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZWyLlKb88A2f3+kLfctcP2/Y4BvexTSu7W9DAeLIvJ7gftHAhfhfo5LiUR3ZiALN
	 nt66Ejy9NOeXL9YiSmar23uHmkF8KNdR6opFO3tUt5vcVf63TOSTkdYCcUmXtjDn1d
	 niAgXyt8GUqGe3oly8fNZgkrUSzqSsC6R/615HHO6463Dq6h+Q0q7ch6ojuBIpfVYL
	 RpdNwmWTnhxCIaEd1NTat0zkYppGmrXYS68GSYBl6hEAzlVwHtjFj9VVTcf80vfRfd
	 MEBk0N8/64nwjojGH7F1o3HTWoYx1kXnIRaVEvZ1PvYc3bmeYmXK0N0+IkaNmQ0c7e
	 CzYyh3UzB1D5A==
Date: Sat, 20 Sep 2025 00:10:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	qiang.yu@oss.qualcomm.com, mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, inochiama@gmail.com, 
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com, 
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 10/10] PCI: keystone: Add support to build as a
 loadable module
Message-ID: <6nj2fkhxixpkneh7pdvyveu6ogpm5phbpvaw6cog3bshm5spfh@kb64rycphtft>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-11-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912122356.3326888-11-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_114111_329507_45252122 
X-CRM114-Status: GOOD (  29.77  )
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

On Fri, Sep 12, 2025 at 05:46:21PM +0530, Siddharth Vadapalli wrote:
> The 'pci-keystone.c' driver is the application/glue/wrapper driver for the
> Designware PCIe Controllers on TI SoCs. Now that all of the helper APIs
> that the 'pci-keystone.c' driver depends upon have been exported for use,
> enable support to build the driver as a loadable module.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> v1: https://lore.kernel.org/r/20250903124505.365913-12-s-vadapalli@ti.com/
> Changes since v1:
> - Based on the feedback from Manivannan Sadhasivam <mani@kernel.org> at:
>   https://lore.kernel.org/r/2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5/
>   builtin_platform_driver() is being retained in the driver due to which
>   the change made in the v1 patch of replacing builtin_platform_driver()
>   with module_platform_driver() has been discarded in this patch.
> 
>  drivers/pci/controller/dwc/Kconfig        |  6 +++---
>  drivers/pci/controller/dwc/pci-keystone.c | 22 ++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 34abc859c107..46012d6a607e 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -482,10 +482,10 @@ config PCI_DRA7XX_EP
>  	  This uses the DesignWare core.
>  
>  config PCI_KEYSTONE
> -	bool
> +	tristate
>  
>  config PCI_KEYSTONE_HOST
> -	bool "TI Keystone PCIe controller (host mode)"
> +	tristate "TI Keystone PCIe controller (host mode)"
>  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
> @@ -497,7 +497,7 @@ config PCI_KEYSTONE_HOST
>  	  DesignWare core functions to implement the driver.
>  
>  config PCI_KEYSTONE_EP
> -	bool "TI Keystone PCIe controller (endpoint mode)"
> +	tristate "TI Keystone PCIe controller (endpoint mode)"
>  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>  	depends on PCI_ENDPOINT
>  	select PCIE_DW_EP
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index e85942b4f6be..661e31b60a48 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -17,6 +17,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
> @@ -132,6 +133,7 @@ struct keystone_pcie {
>  	struct			device_node *msi_intc_np;
>  	struct irq_domain	*intx_irq_domain;
>  	struct device_node	*np;
> +	struct gpio_desc	*reset_gpio;
>  
>  	/* Application register space */
>  	void __iomem		*va_app_base;	/* DT 1st resource */
> @@ -1211,6 +1213,7 @@ static const struct of_device_id ks_pcie_of_match[] = {
>  	},
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, ks_pcie_of_match);
>  
>  static int ks_pcie_probe(struct platform_device *pdev)
>  {
> @@ -1329,6 +1332,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  			dev_err(dev, "Failed to get reset GPIO\n");
>  		goto err_link;
>  	}
> +	ks_pcie->reset_gpio = gpiod;
>  
>  	/* Obtain references to the PHYs */
>  	for (i = 0; i < num_lanes; i++)
> @@ -1440,9 +1444,23 @@ static void ks_pcie_remove(struct platform_device *pdev)
>  {
>  	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
>  	struct device_link **link = ks_pcie->link;
> +	struct dw_pcie *pci = ks_pcie->pci;
>  	int num_lanes = ks_pcie->num_lanes;
> +	const struct ks_pcie_of_data *data;
>  	struct device *dev = &pdev->dev;
> +	enum dw_pcie_device_mode mode;
> +
> +	ks_pcie_disable_error_irq(ks_pcie);
> +	data = of_device_get_match_data(dev);
> +	mode = data->mode;
> +	if (mode == DW_PCIE_RC_TYPE) {
> +		dw_pcie_host_deinit(&pci->pp);
> +	} else {
> +		pci_epc_deinit_notify(pci->ep.epc);
> +		dw_pcie_ep_deinit(&pci->ep);
> +	}
>  
> +	gpiod_set_value_cansleep(ks_pcie->reset_gpio, 0);

Can ks_pcie_remove() be called for a builtin_platform_driver?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

