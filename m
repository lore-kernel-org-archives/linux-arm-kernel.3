Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2961CFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 09:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT6tg8wCzQke7nH4Nhk2JSIFo7u0fhCA78vCOx8f1JQ=; b=qyWj4Wp4BCZBWuxZNZabG7sOLn
	d28xKmFl44aDgssmCf3v6r8Pj70k1S4Ztx4eNRZ8Apr2bHnL85y5x2Nh6Dg7xYEVwrCLJNs2a06aS
	kVeFdxPCBjawlsoa3mbIqFU47+Ry9EfaQK9eI9gIeu5Ht7ctvAkRbzZV5y5gxS5BTA/zTzAZUB8KW
	0PXvN5BOub94iRFIIZ8amzWpVjCKgvJhhEXtef8BsGLDiyLRFyTlfyFB0RkGXZKbDHI9afiHViWjj
	v5mqci7TFMH/HFZ/VfODZixhA/KPpMpzZsPHi+i5xDpZaSujidEfCgB1mIJRXKu0iDTNEjQyY3fdA
	5JAM+MxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwdNo-0000000B0Ey-3v03;
	Sun, 01 Mar 2026 09:46:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwdNn-0000000B0Ed-0TbC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 09:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46D61402BE;
	Sun,  1 Mar 2026 09:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8E1C116C6;
	Sun,  1 Mar 2026 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772358398;
	bh=ah8m82Urr9ZVdbuAaL7dhveEEkY6qwHNCon+PPeoyBY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z0KHJpNunNcjXEqJWgt/2aE9/sPgUgk19iKbhLZyj5sIoyncIPiC5DtoCtdNTI5rN
	 ae0CchWvin1ZNSonWM/xcQgjOh45AZVjjLAorbihnBcMIFCKtMS24eSaPw8HZnnVNh
	 5m4IkmnaB7evNsc6rbzVP0cRVentf+1TS247vJ3/0N8jlZzcWLmBhtl2BAJGolpc3K
	 SnBcnBqiqxfnfBMAkYqzWAVYsHCE+jWgxpQKRt5AkvNqeOi+fCiSa9vUa65yy7weLX
	 yKjk6CJMJJlg4upoVm/xuuaj7cVFmtysK8UpS29DujEG5BWbnmwsyrINgwPMuAJ4Ye
	 0ngrTpp3uzY1g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vwdNi-0000000Eusy-3vXA;
	Sun, 01 Mar 2026 09:46:35 +0000
Date: Sun, 01 Mar 2026 09:46:34 +0000
Message-ID: <86342janlx.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,	Nikhil Agarwal
 <nikhil.agarwal@amd.com>,	Joerg Roedel <joro@8bytes.org>,	Will Deacon
 <will@kernel.org>,	Robin Murphy <robin.murphy@arm.com>,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Thomas Gleixner <tglx@kernel.org>,	Rob Herring
 <robh@kernel.org>,	Saravana Kannan <saravanak@kernel.org>,	Richard Zhu
 <hongxing.zhu@nxp.com>,	Lucas Stach <l.stach@pengutronix.de>,	Krzysztof
 =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,	Manivannan
 Sadhasivam <mani@kernel.org>,	Bjorn Helgaas <bhelgaas@google.com>,	Frank Li
 <Frank.Li@nxp.com>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
	Juergen Gross <jgross@suse.com>,	Stefano Stabellini
 <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,	Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,	Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Prakash Gupta
 <prakash.gupta@oss.qualcomm.com>,	Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,	linux-pci@vger.kernel.org,	imx@lists.linux.dev,
	xen-devel@lists.xenproject.org,	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
In-Reply-To: <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
	<20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: vijayanand.jitta@oss.qualcomm.com, nipun.gupta@amd.com, nikhil.agarwal@amd.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, lpieralisi@kernel.org, tglx@kernel.org, robh@kernel.org, saravanak@kernel.org, hongxing.zhu@nxp.com, l.stach@pengutronix.de, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, krzk+dt@kernel.org, prakash.gupta@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_014639_197362_9B9098ED 
X-CRM114-Status: GOOD (  26.94  )
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

On Sun, 01 Mar 2026 08:34:19 +0000,
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> 
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> properties, give them some wrappers to conveniently encapsulate the
> appropriate sets of property names. This will also make it easier to
> then change of_map_id() to correctly account for specifier cells.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/cdx/cdx_msi.c                    |  3 +--
>  drivers/iommu/of_iommu.c                 |  4 +---
>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>  drivers/of/irq.c                         |  3 +--
>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>  drivers/pci/controller/pcie-apple.c      |  3 +--
>  drivers/xen/grant-dma-ops.c              |  3 +--
>  include/linux/of.h                       | 14 ++++++++++++++
>  8 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> index 91b95422b263..63b3544ec997 100644
> --- a/drivers/cdx/cdx_msi.c
> +++ b/drivers/cdx/cdx_msi.c
> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>  	int ret;
>  
>  	/* Retrieve device ID from requestor ID using parent device */
> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
> -			NULL, &dev_id);
> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
>  	if (ret) {
>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>  		return ret;
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 6b989a62def2..a511ecf21fcd 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int err;
>  
> -	err = of_map_id(master_np, *id, "iommu-map",
> -			 "iommu-map-mask", &iommu_spec.np,
> -			 iommu_spec.args);
> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index d36b278ae66c..b63343a227a9 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>  
>  	struct device_node *msi_ctrl __free(device_node) = NULL;
>  
> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
>  }
>  
>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 6367c67732d2..e37c1b3f8736 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>  	 * "msi-map" or an "msi-parent" property.
>  	 */
>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> -				"msi-map-mask", msi_np, &id_out))
> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
>  			break;
>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
>  			break;
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a5b8d0b71677..bff8289f804a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
> -			  &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>  	if (target) {
>  		of_node_put(target);
>  	} else {
> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  	}
>  
>  	target = NULL;
> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
> -			  &target, &sid_m);
> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>  
>  	/*
>  	 *   err_m      target
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 2d92fc79f6dd..a0937b7b3c4d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
> -			"iommu-map-mask", NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index c2603e700178..1b7696b2d762 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>  
> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> -				iommu_spec.args)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>  			dev_dbg(dev, "Cannot translate ID\n");
>  			return -ESRCH;
>  		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index be6ec4916adf..824649867810 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
>  	return of_property_read_u32(np, propname, (u32*) out_value);
>  }
>  
> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> +				  struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> +			 target, id_out);
> +}
> +
> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
> +				struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
> +			 target, id_out);
> +}
> +

Any particular reason why this is made inline instead of out of line
in of/base.c? Also, some documentation would be helpful for the
aspiring hackers dipping into this.

Other than that,

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

