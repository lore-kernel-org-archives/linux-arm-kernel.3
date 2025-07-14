Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED79C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne8rs9QDS+ZD0R77lp4cErYEdMyDg+T8XV4YPy8cpuM=; b=CB74UaaiFM5n3+Psl72I64O4AM
	SxILqQoDE8ohBS6MRplvJVKXjaNrht5zXOOlgY+20D8RHH93yqlNrBcZBWUcX7CJUZREImgAWxkrd
	lCB8aKn2kdOK/ur1Jg69dgVDLDyXe+HijTX/1LyYZ1FQ1YHi43FYxxTYz0Xg+OR+jVKyhAVNqzDEY
	Id6JnmG0RdGo7LDoYN+b2dOb2/EwfuVujpzakvRPfIqa8owggD5zX5ykdDbHgV1Whd0nyj4kR5t1y
	o/96JCk8OkFPbzDXhlTFeH3AMfknntjrnwFKBBF6+Cuh6inQgpU4fE58XX7pBKEcpnv7JluDEOEcb
	8jP2Mm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIMW-00000002B3P-2VR4;
	Mon, 14 Jul 2025 12:32:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHz4-000000027fH-1nTx;
	Mon, 14 Jul 2025 12:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7091A57041;
	Mon, 14 Jul 2025 12:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99D4C4CEED;
	Mon, 14 Jul 2025 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494917;
	bh=wJpZOrDsWmR3OsD6VllKDLh4xwGIWO/czyVInoIGEZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trqiWccHinVvUiKTbjbxlGMWU2TqEjXG1ph1pc6e/dbRniwMVzHuzjWYIgSx5zY/S
	 n5D2uxRV0KYpkK68a/cJLoWy6EL5T9gOnR/gn3oho6w6PNt2yN6auNj2N1sBc0hxNS
	 K7z1j2Wv5C+a4VkQX0nNSSHfaFqWPjmx6ML5znRkgmLNdCJ2EePrQ/dJOumtQ5juQO
	 MhHt4tzV/51KIrhrRL9QZrSi7xdFmlq2knGX0kFd2yhT+A5MBEqSPA4mRQwLs4Hq9C
	 nnfsZtPAl49b3+Q/oRzYUboKsiFIYphlM4myKDlEK5iq8hI2vUEMXC15ObePthXA9C
	 Q/UnTDZpVVzxw==
Date: Mon, 14 Jul 2025 13:08:31 +0100
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, jgg@ziepe.ca, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v6 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <aHTzPwTob8_5rtBS@willie-the-truck>
References: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
 <20250710082450.125585-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710082450.125585-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_050838_597937_6E575721 
X-CRM114-Status: GOOD (  22.12  )
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

Hi,

On Thu, Jul 10, 2025 at 10:24:44AM +0200, Benjamin Gaignard wrote:
> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
> new file mode 100644
> index 000000000000..15322b9929af
> --- /dev/null
> +++ b/drivers/iommu/vsi-iommu.c
> @@ -0,0 +1,781 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (C) 2025 Collabora Ltd.
> + *
> + * IOMMU API for Verisilicon
> + *
> + * Module Authors:	Yandong Lin <yandong.lin@rock-chips.com>
> + *			Simon Xue <xxm@rock-chips.com>
> + *			Benjamin Gaignard <benjamin.gaignard@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/compiler.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iommu.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_iommu.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include "iommu-pages.h"
> +
> +struct vsi_iommu {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct clk_bulk_data *clocks;
> +	int num_clocks;
> +	struct iommu_device iommu;
> +	struct list_head node; /* entry in vsi_iommu_domain.iommus */
> +	struct iommu_domain *domain; /* domain to which iommu is attached */
> +	spinlock_t lock;
> +	int irq;
> +};
> +
> +struct vsi_iommu_domain {
> +	struct list_head iommus;
> +	struct device *dev;
> +	u32 *dt;
> +	dma_addr_t dt_dma;
> +	struct iommu_domain domain;
> +	u64 *pta;
> +	dma_addr_t pta_dma;
> +	spinlock_t lock;
> +};
> +
> +static struct iommu_domain vsi_identity_domain;
> +
> +#define NUM_DT_ENTRIES	1024
> +#define NUM_PT_ENTRIES	1024
> +#define PT_SIZE		(NUM_PT_ENTRIES * sizeof(u32))
> +
> +#define SPAGE_SIZE	BIT(12)
> +
> +/* vsi iommu regs address */
> +#define VSI_MMU_CONFIG1_BASE			0x1ac
> +#define VSI_MMU_AHB_EXCEPTION_BASE		0x380
> +#define VSI_MMU_AHB_CONTROL_BASE		0x388
> +#define VSI_MMU_AHB_TLB_ARRAY_BASE_L_BASE	0x38C
> +
> +/* MMU register offsets */
> +#define VSI_MMU_FLUSH_BASE		0x184
> +#define VSI_MMU_BIT_FLUSH		BIT(4)
> +
> +#define VSI_MMU_PAGE_FAULT_ADDR		0x380
> +#define VSI_MMU_STATUS_BASE		0x384	/* IRQ status */
> +
> +#define VSI_MMU_BIT_ENABLE		BIT(0)
> +
> +#define VSI_MMU_OUT_OF_BOUND		BIT(28)
> +/* Irq mask */
> +#define VSI_MMU_IRQ_MASK		0x7
> +
> +#define VSI_DTE_PT_ADDRESS_MASK		0xffffffc0
> +#define VSI_DTE_PT_VALID		BIT(0)
> +
> +#define VSI_PAGE_DESC_LO_MASK		0xfffff000
> +#define VSI_PAGE_DESC_HI_MASK		GENMASK_ULL(39, 32)
> +#define VSI_PAGE_DESC_HI_SHIFT		(32 - 4)

How does this page-table format relate to the one supported already by
rockchip-iommu.c? From a quick glance, I suspect this is a derivative
and so ideally we'd be able to have a common implementation of the
page-table code which can be used by both of the drivers.

Similarly:

> +static void vsi_iommu_domain_free(struct iommu_domain *domain)
> +{
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&vsi_domain->lock, flags);
> +
> +	WARN_ON(!list_empty(&vsi_domain->iommus));
> +
> +	for (i = 0; i < NUM_DT_ENTRIES; i++) {
> +		u32 dte = vsi_domain->dt[i];
> +
> +		if (vsi_dte_is_pt_valid(dte)) {
> +			phys_addr_t pt_phys = vsi_dte_pt_address(dte);
> +			u32 *page_table = phys_to_virt(pt_phys);
> +
> +			dma_unmap_single(vsi_domain->dev, pt_phys,
> +					 SPAGE_SIZE, DMA_TO_DEVICE);
> +			iommu_free_pages(page_table);
> +		}
> +	}
> +
> +	dma_unmap_single(vsi_domain->dev, vsi_domain->dt_dma,
> +			 SPAGE_SIZE, DMA_TO_DEVICE);
> +	iommu_free_pages(vsi_domain->dt);
> +
> +	dma_unmap_single(vsi_domain->dev, vsi_domain->pta_dma,
> +			 SPAGE_SIZE, DMA_TO_DEVICE);
> +	iommu_free_pages(vsi_domain->pta);
> +
> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> +
> +	kfree(vsi_domain);
> +}

is almost a carbon copy of rk_iommu_domain_free(), so it seems that
there's room for code re-use even beyond the page-table support.

I think that also means we'll want Heiko's Ack before we merge anything.

Will

