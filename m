Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE70CD2E9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHQIRqlD5UHz4mCtBj10mCMftiJf0gJGTEjDwwUXwj0=; b=XJxKzcS3C3uw2OyfuTJjVc2hg/
	2txPPG9kuefyw52AWFgAd4WadSjgs7f4NB/I/zAkV7RkM2SprGXd6SZwsGEzVk2xX10lru+LDPg87
	DWDZyA3HnmA2XgvPAmtx3OYt2cBnujx3tUWDW/fnHXQULLJK+N8wfOePnPwGVGHSogEhjtLRa9uep
	YziX6I+YwCM/7CfHWFbDz90F2tAERsbQsZqhOoSMBib4CgdldF99JGsyEK21WhssHi9n2/eNuLKrO
	S8a7ejIAjZZ6ejsea/xhVOpEeh1X8tRU/FlcBzc5txD6ldPT8UZNfFy+wM0mMTm/YgeSNh1Kyhw4U
	90KwWu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUHa-00000000A4E-4Biq;
	Mon, 11 Nov 2024 13:16:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUAZ-000000008o1-3fXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:09:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 695071CE0;
	Mon, 11 Nov 2024 05:09:55 -0800 (PST)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69E743F66E;
	Mon, 11 Nov 2024 05:09:20 -0800 (PST)
Message-ID: <a63e7c3b-ce96-47a5-b462-d5de3a2edb56@arm.com>
Date: Mon, 11 Nov 2024 13:09:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 0/7] vfio: Allow userspace to specify the address
 for each MSI vector
To: Nicolin Chen <nicolinc@nvidia.com>, maz@kernel.org, tglx@linutronix.de,
 bhelgaas@google.com, alex.williamson@redhat.com
Cc: jgg@nvidia.com, leonro@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 dlemoal@kernel.org, kevin.tian@intel.com, smostafa@google.com,
 andriy.shevchenko@linux.intel.com, reinette.chatre@intel.com,
 eric.auger@redhat.com, ddutile@redhat.com, yebin10@huawei.com,
 brauner@kernel.org, apatel@ventanamicro.com,
 shivamurthy.shastri@linutronix.de, anna-maria@linutronix.de,
 nipun.gupta@amd.com, marek.vasut+renesas@mailbox.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org
References: <cover.1731130093.git.nicolinc@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <cover.1731130093.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_050928_031837_CBEB4E0A 
X-CRM114-Status: GOOD (  29.34  )
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

On 2024-11-09 5:48 am, Nicolin Chen wrote:
> On ARM GIC systems and others, the target address of the MSI is translated
> by the IOMMU. For GIC, the MSI address page is called "ITS" page. When the
> IOMMU is disabled, the MSI address is programmed to the physical location
> of the GIC ITS page (e.g. 0x20200000). When the IOMMU is enabled, the ITS
> page is behind the IOMMU, so the MSI address is programmed to an allocated
> IO virtual address (a.k.a IOVA), e.g. 0xFFFF0000, which must be mapped to
> the physical ITS page: IOVA (0xFFFF0000) ===> PA (0x20200000).
> When a 2-stage translation is enabled, IOVA will be still used to program
> the MSI address, though the mappings will be in two stages:
>    IOVA (0xFFFF0000) ===> IPA (e.g. 0x80900000) ===> 0x20200000
> (IPA stands for Intermediate Physical Address).
> 
> If the device that generates MSI is attached to an IOMMU_DOMAIN_DMA, the
> IOVA is dynamically allocated from the top of the IOVA space. If attached
> to an IOMMU_DOMAIN_UNMANAGED (e.g. a VFIO passthrough device), the IOVA is
> fixed to an MSI window reported by the IOMMU driver via IOMMU_RESV_SW_MSI,
> which is hardwired to MSI_IOVA_BASE (IOVA==0x8000000) for ARM IOMMUs.
> 
> So far, this IOMMU_RESV_SW_MSI works well as kernel is entirely in charge
> of the IOMMU translation (1-stage translation), since the IOVA for the ITS
> page is fixed and known by kernel. However, with virtual machine enabling
> a nested IOMMU translation (2-stage), a guest kernel directly controls the
> stage-1 translation with an IOMMU_DOMAIN_DMA, mapping a vITS page (at an
> IPA 0x80900000) onto its own IOVA space (e.g. 0xEEEE0000). Then, the host
> kernel can't know that guest-level IOVA to program the MSI address.
> 
> To solve this problem the VMM should capture the MSI IOVA allocated by the
> guest kernel and relay it to the GIC driver in the host kernel, to program
> the correct MSI IOVA. And this requires a new ioctl via VFIO.

Once VFIO has that information from userspace, though, do we really need 
the whole complicated dance to push it right down into the irqchip layer 
just so it can be passed back up again? AFAICS 
vfio_msi_set_vector_signal() via VFIO_DEVICE_SET_IRQS already explicitly 
rewrites MSI-X vectors, so it seems like it should be pretty 
straightforward to override the message address in general at that 
level, without the lower layers having to be aware at all, no?

Thanks,
Robin.

> Extend the VFIO path to allow an MSI target IOVA to be forwarded into the
> kernel and pushed down to the GIC driver.
> 
> Add VFIO ioctl VFIO_IRQ_SET_ACTION_PREPARE with VFIO_IRQ_SET_DATA_MSI_IOVA
> to carry the data.
> 
> The downstream calltrace is quite long from the VFIO to the ITS driver. So
> in order to carry the MSI IOVA from the top to its_irq_domain_alloc(), add
> patches in a leaf-to-root order:
> 
>    vfio_pci_core_ioctl:
>      vfio_pci_set_irqs_ioctl:
>        vfio_pci_set_msi_prepare:                           // PATCH-7
>          pci_alloc_irq_vectors_iovas:                      // PATCH-6
>            __pci_alloc_irq_vectors:                        // PATCH-5
>              __pci_enable_msi/msix_range:                  // PATCH-4
>                msi/msix_capability_init:                   // PATCH-3
>                  msi/msix_setup_msi_descs:
>                    msi_insert_msi_desc();                  // PATCH-1
>                  pci_msi_setup_msi_irqs:
>                    msi_domain_alloc_irqs_all_locked:
>                      __msi_domain_alloc_locked:
>                        __msi_domain_alloc_irqs:
>                          __irq_domain_alloc_irqs:
>                            irq_domain_alloc_irqs_locked:
>                              irq_domain_alloc_irqs_hierarchy:
>                                msi_domain_alloc:
>                                  irq_domain_alloc_irqs_parent:
>                                    its_irq_domain_alloc(); // PATCH-2
> 
> Note that this series solves half the problem, since it only allows kernel
> to set the physical PCI MSI/MSI-X on the device with the correct head IOVA
> of a 2-stage translation, where the guest kernel does the stage-1 mapping
> that MSI IOVA (0xEEEE0000) to its own vITS page (0x80900000) while missing
> the stage-2 mapping from that IPA to the physical ITS page:
>    0xEEEE0000 ===> 0x80900000 =x=> 0x20200000
> A followup series should fill that gap, doing the stage-2 mapping from the
> vITS page 0x80900000 to the physical ITS page (0x20200000), likely via new
> IOMMUFD ioctl. Once VMM sets up this stage-2 mapping, VM will act the same
> as bare metal relying on a running kernel to handle the stage-1 mapping:
>    0xEEEE0000 ===> 0x80900000 ===> 0x20200000
> 
> This series (prototype) is on Github:
> https://github.com/nicolinc/iommufd/commits/vfio_msi_giova-rfcv1/
> It's tested by hacking the host kernel to hard-code a stage-2 mapping.
> 
> Thanks!
> Nicolin
> 
> Nicolin Chen (7):
>    genirq/msi: Allow preset IOVA in struct msi_desc for MSI doorbell
>      address
>    irqchip/gic-v3-its: Bypass iommu_cookie if desc->msi_iova is preset
>    PCI/MSI: Pass in msi_iova to msi_domain_insert_msi_desc
>    PCI/MSI: Allow __pci_enable_msi_range to pass in iova
>    PCI/MSI: Extract a common __pci_alloc_irq_vectors function
>    PCI/MSI: Add pci_alloc_irq_vectors_iovas helper
>    vfio/pci: Allow preset MSI IOVAs via VFIO_IRQ_SET_ACTION_PREPARE
> 
>   drivers/pci/msi/msi.h             |   3 +-
>   include/linux/msi.h               |  11 +++
>   include/linux/pci.h               |  18 ++++
>   include/linux/vfio_pci_core.h     |   1 +
>   include/uapi/linux/vfio.h         |   8 +-
>   drivers/irqchip/irq-gic-v3-its.c  |  21 ++++-
>   drivers/pci/msi/api.c             | 136 ++++++++++++++++++++----------
>   drivers/pci/msi/msi.c             |  20 +++--
>   drivers/vfio/pci/vfio_pci_intrs.c |  41 ++++++++-
>   drivers/vfio/vfio_main.c          |   3 +
>   kernel/irq/msi.c                  |   6 ++
>   11 files changed, 212 insertions(+), 56 deletions(-)
> 


