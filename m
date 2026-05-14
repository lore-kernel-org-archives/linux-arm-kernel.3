Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53078CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56SvB+5VFovawmBRFc6D2ToEDWWm59abwyWEWjpISVU=; b=b5t9Hb5BGw8Gz/3wP3AMBzaD9S
	gKVX4z6G0xOfBviqRJlcslPdywsHZFBeXMYgYzEeLWcuILQf3TVVQR6YD5GtE0ALttXZzt8tuKTUw
	MmS5bk7hZeAgP+qW4vfXoG4MGicVXNplyO2a7fXcz3B7HiorSV2iJLQmfTQ+pz4Eryr/94Zhpipbt
	P2RWQGVCdKKihWwya2uVqY5pcZMM+RP2W0vxB5epknYYLCVWYcErVM1caygRPKhXHaxqMPm+NbETK
	d40xFWTIsFo5FO8eEkaR0ENlb3alAB1/Nil7W8Jl8PFDNGL4SsOWXfFwn83ShkNUVYsDNp6bPDY+Y
	0qoqIo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNR7a-00000004u5S-3mp6;
	Thu, 14 May 2026 08:08:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNR7Z-00000004u5A-0Z4t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 08:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EEA7600AE;
	Thu, 14 May 2026 08:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C718EC2BCB7;
	Thu, 14 May 2026 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746119;
	bh=neubxVpu/X2LCngSEN7uVvoKch8IAHKiJULMvXS3QwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kR2mw9nCQ+x/HROxAAb4Xw+lwdnW4iU1LT/ogmwMhUpnWBvqCQeZ5NCc88V8+nV7r
	 kRtSu8NjAg/8m8+uHSRew6zMbOV2crcVKubScsyfqa4UlCgmySOdlwewrOmcnhvV4y
	 +T2KnYR94wQFg4i/YHlP7iHJnSkecOLIiCSLo5bpCOBz/4RrE1W0t8jOGH34ZhOm8h
	 UVeWr9kg4J2h+4pARe39VGJG7Dq4Ii5vdDQhbETKCukOP8ggDkEGezDPwYr8xOwocA
	 njsLvab7HraddN7W4Q2nSDp2rc6t/tAi+qq9mPhwz0aUimrr6wy1Zguvx8ba239/HG
	 NCEOaNOv1MJYA==
Date: Thu, 14 May 2026 13:38:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org, 
	skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, alistair@alistair23.me, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, s-vadapalli@ti.com, 
	danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v3 3/4] PCI: endpoint: Add API for DOE initialization and
 setup in EPC core
Message-ID: <m4z3q3pe3ro5vkl4uq4zkewpjdqccgeact2hj4tjnkonttx4vr@ndan37zzwgxc>
References: <20260427051725.223704-1-a-garg7@ti.com>
 <20260427051725.223704-4-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427051725.223704-4-a-garg7@ti.com>
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

On Mon, Apr 27, 2026 at 10:47:24AM +0530, Aksh Garg wrote:
> Add pci_epc_setup_doe() API in EPC core driver to initialize and setup
> the DOE framework for an endpoint controller. The API discovers the DOE
> capabilities (extended capability ID 0x2E), and registers each discovered
> DOE mailbox for all the functions in the endpoint controller. This API
> should be invoked by the controller driver during probe based on the
> doe_capable feature.
> 
> Add pci_epc_destroy_doe() API in EPC core driver for cleanup of DOE
> resources, which should be invoked by the controller driver during
> controller cleanup based on the doe_capable feature.
> 
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
> 
> Changes from v2 to v3:
> - Rebased on 7.1-rc1.
> 
> Changes since v1:
> - New patch added to v2 (not present in v1)
> 
> v2: https://lore.kernel.org/all/20260401073022.215805-4-a-garg7@ti.com/
> 
> This patch is introduced based on the feedback provided by Manivannan
> Sadhasivam at [1].
> 

Sweet! But I was expecting you to add atleast one EPC driver implementation to
make use of these APIs.

Also, why can't you call these APIs from the EPC core directly? Maybe during
pci_epc_init_notify() once the register accesses become valid.

- Mani

> [1]: https://lore.kernel.org/all/p57x6jleaim5w7t2k3v7tioujnaxuovfpj5euop5ogefvw23se@y5fw3che5p5d/
> 
>  drivers/pci/endpoint/pci-epc-core.c | 71 +++++++++++++++++++++++++++++
>  include/linux/pci-epc.h             | 21 +++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index 6c3c58185fc5..5a95a07b7d3a 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -14,6 +14,8 @@
>  #include <linux/pci-epf.h>
>  #include <linux/pci-ep-cfs.h>
>  
> +#include "../pci.h"
> +
>  static const struct class pci_epc_class = {
>  	.name = "pci_epc",
>  };
> @@ -548,6 +550,75 @@ void pci_epc_mem_unmap(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_mem_unmap);
>  
> +/**
> + * pci_epc_doe_setup() - Setup and discover DOE mailboxes for all functions
> + * @epc: the EPC device on which DOE mailboxes has to be setup
> + *
> + * Discover DOE (Data Object Exchange) capabilities for all physical functions
> + * in the endpoint controller and register DOE mailboxes.
> + *
> + * This API should be called by the controller driver during initialization
> + * if DOE support is available (indicated by doe_capable in pci_epc_features).
> + *
> + * RETURNS: 0 on success, -errno on failure
> + */
> +int pci_epc_doe_setup(struct pci_epc *epc)
> +{
> +	u16 cap_offset = 0;
> +	u8 func_no;
> +	int ret;
> +
> +	if (!epc || !epc->ops || !epc->ops->find_ext_capability)
> +		return -EINVAL;
> +
> +	/* Initialize DOE framework for this controller */
> +	ret = pci_ep_doe_init(epc);
> +	if (ret)
> +		return ret;
> +
> +	/* Discover DOE capabilities for all functions */
> +	for (func_no = 0; func_no < epc->max_functions; func_no++) {
> +		while ((cap_offset = epc->ops->find_ext_capability(epc, func_no, 0,
> +								   cap_offset,
> +								   PCI_EXT_CAP_ID_DOE))) {
> +			/* Register this DOE mailbox */
> +			ret = pci_ep_doe_add_mailbox(epc, func_no, cap_offset);
> +			if (ret) {
> +				dev_err(&epc->dev,
> +					"[pf%d:offset %x] failed to add DOE mailbox\n",
> +					func_no, cap_offset);
> +			}
> +		}
> +	}
> +
> +	dev_dbg(&epc->dev, "DOE mailboxes setup complete\n");
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_doe_setup);
> +
> +/**
> + * pci_epc_doe_destroy() - Destroy and cleanup DOE mailboxes
> + * @epc: the EPC device on which DOE mailboxes has to be destroyed
> + *
> + * Destroy all DOE mailboxes registered on this endpoint controller and
> + * free associated resources.
> + *
> + * This API should be called by the controller driver during controller cleanup
> + * if DOE support is available (indicated by doe_capable in pci_epc_features).
> + *
> + * RETURNS: 0 on success, -errno on failure
> + */
> +int pci_epc_doe_destroy(struct pci_epc *epc)
> +{
> +	if (!epc)
> +		return -EINVAL;
> +
> +	pci_ep_doe_destroy(epc);
> +	dev_dbg(&epc->dev, "DOE mailboxes destroyed\n");
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_doe_destroy);
> +
>  /**
>   * pci_epc_clear_bar() - reset the BAR
>   * @epc: the EPC device for which the BAR has to be cleared
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index dd26294c8175..7b0f258ef330 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -84,6 +84,8 @@ struct pci_epc_map {
>   * @start: ops to start the PCI link
>   * @stop: ops to stop the PCI link
>   * @get_features: ops to get the features supported by the EPC
> + * @find_ext_capability: ops to find extended capability offset for a function
> + *			 in endpoint controller
>   * @owner: the module owner containing the ops
>   */
>  struct pci_epc_ops {
> @@ -115,6 +117,8 @@ struct pci_epc_ops {
>  	void	(*stop)(struct pci_epc *epc);
>  	const struct pci_epc_features* (*get_features)(struct pci_epc *epc,
>  						       u8 func_no, u8 vfunc_no);
> +	u16	(*find_ext_capability)(struct pci_epc *epc, u8 func_no,
> +				       u8 vfunc_no, u16 start, u8 cap);
>  	struct module *owner;
>  };
>  
> @@ -270,6 +274,7 @@ struct pci_epc_bar_desc {
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
>   * @intx_capable: indicate if the endpoint can raise INTx interrupts
> + * @doe_capable: indicate if the endpoint function has DOE capability
>   * @bar: array specifying the hardware description for each BAR
>   * @align: alignment size required for BAR buffer allocation
>   */
> @@ -280,6 +285,7 @@ struct pci_epc_features {
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
>  	unsigned int	intx_capable : 1;
> +	unsigned int	doe_capable : 1;
>  	struct	pci_epc_bar_desc bar[PCI_STD_NUM_BARS];
>  	size_t	align;
>  };
> @@ -368,6 +374,21 @@ int pci_epc_mem_map(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  void pci_epc_mem_unmap(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  		       struct pci_epc_map *map);
>  
> +#ifdef CONFIG_PCI_ENDPOINT_DOE
> +int pci_epc_doe_setup(struct pci_epc *epc);
> +int pci_epc_doe_destroy(struct pci_epc *epc);
> +#else
> +static inline int pci_epc_doe_setup(struct pci_epc *epc)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int pci_epc_doe_destroy(struct pci_epc *epc)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  #else
>  static inline void pci_epc_init_notify(struct pci_epc *epc)
>  {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

