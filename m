Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DDED3F062
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npyah0sl8Kr7fLgvp4kpX3GIlGcq0OufLTQfYHzrPQQ=; b=l3mfu3IvWNYSBSCQRoG/PwqKOx
	2kYzzyZ4RZ2Gi4OQgN9gJfP5Ei0Lki6U8aaAFphPKLBX818g0qEzrhMdj19TGkmTV08/OUw7KPSGe
	LCau2aw+AalgjDuwJG+s83tSQhNgegUspdMzyi+V94gywL7fm+ZZCSimqmX9EiK/x4NHDZLwXF4dh
	GBkjnc5EVN9irSSsDGrNt2ewejTbBOTTK0F8KEg2D2p0XlH6KUDDU77W02YCsuXDm5wFgEyx3xgbK
	z0lpnm+0M+Y1jJpywf/CuPfqHorYdqKKQdJKd2KVl6tIEpNTK6rRvZWCg9FsC/XDZmdyF5aYklEqN
	BpaBn4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl69V-0000000G8ZT-14Vj;
	Wed, 28 Jan 2026 14:04:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl69S-0000000G8ZH-3iVi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFAD960054;
	Wed, 28 Jan 2026 14:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAACC4CEF1;
	Wed, 28 Jan 2026 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609049;
	bh=hxcTLKnHYOGMq+wQPMZTSaN0ajdDCwMjn4DWO3u/5yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qBmX2s/6+TKnA4ruOgDeCz8Uda1gcQC9EwGYIy6HZgS1rK0fQN8lvanAQWsQG4FHr
	 efFxiO46WeHJtVMkykabrelayOE+mNenoVa/UzQxpVxiguCgG5ZD4xCS/6T0yz/LYL
	 trJjYc5/JS8FV/dLQW6ufEJsTQlln6gQIrgiPhXYmE6CGWP+f49Ygj+2bZ+6irjFEd
	 OTKH6k5alYzhaNTSSxS6uF4eBdi8lSN2U0vqKn84ltESdIfFZJw9yA3vIVOCWJ479l
	 5IBQFybOTcSGB6anIChgTwieDZOAHVkOzhnZAtYJbdhdXMDWa30vPxTzsI50uTbR5L
	 WsjzD+C7DuVeg==
Date: Wed, 28 Jan 2026 19:33:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arch@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, joro@8bytes.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de, 
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com, romank@linux.microsoft.com
Subject: Re: [PATCH v0 08/15] PCI: hv: rename hv_compose_msi_msg to
 hv_vmbus_compose_msi_msg
Message-ID: <vvxvn53hffoh6w4lkpfnwaenmz4nib3tbolvnxcggperdtamdl@j7d6ub75r7d4>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-9-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120064230.3602565-9-mrathor@linux.microsoft.com>
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

On Mon, Jan 19, 2026 at 10:42:23PM -0800, Mukesh R wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> Main change here is to rename hv_compose_msi_msg to
> hv_vmbus_compose_msi_msg as we introduce hv_compose_msi_msg in upcoming
> patches that builds MSI messages for both VMBus and non-VMBus cases. VMBus
> is not used on baremetal root partition for example.

> While at it, replace
> spaces with tabs and fix some formatting involving excessive line wraps.
>

Don't mix up cleanup changes. Do it in a separate patch.

- Mani
 
> There is no functional change.
> 
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> ---
>  drivers/pci/controller/pci-hyperv.c | 95 +++++++++++++++--------------
>  1 file changed, 48 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index 1e237d3538f9..8bc6a38c9b5a 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -30,7 +30,7 @@
>   * function's configuration space is zero.
>   *
>   * The rest of this driver mostly maps PCI concepts onto underlying Hyper-V
> - * facilities.  For instance, the configuration space of a function exposed
> + * facilities.	For instance, the configuration space of a function exposed
>   * by Hyper-V is mapped into a single page of memory space, and the
>   * read and write handlers for config space must be aware of this mechanism.
>   * Similarly, device setup and teardown involves messages sent to and from
> @@ -109,33 +109,33 @@ enum pci_message_type {
>  	/*
>  	 * Version 1.1
>  	 */
> -	PCI_MESSAGE_BASE                = 0x42490000,
> -	PCI_BUS_RELATIONS               = PCI_MESSAGE_BASE + 0,
> -	PCI_QUERY_BUS_RELATIONS         = PCI_MESSAGE_BASE + 1,
> -	PCI_POWER_STATE_CHANGE          = PCI_MESSAGE_BASE + 4,
> +	PCI_MESSAGE_BASE		= 0x42490000,
> +	PCI_BUS_RELATIONS		= PCI_MESSAGE_BASE + 0,
> +	PCI_QUERY_BUS_RELATIONS		= PCI_MESSAGE_BASE + 1,
> +	PCI_POWER_STATE_CHANGE		= PCI_MESSAGE_BASE + 4,
>  	PCI_QUERY_RESOURCE_REQUIREMENTS = PCI_MESSAGE_BASE + 5,
> -	PCI_QUERY_RESOURCE_RESOURCES    = PCI_MESSAGE_BASE + 6,
> -	PCI_BUS_D0ENTRY                 = PCI_MESSAGE_BASE + 7,
> -	PCI_BUS_D0EXIT                  = PCI_MESSAGE_BASE + 8,
> -	PCI_READ_BLOCK                  = PCI_MESSAGE_BASE + 9,
> -	PCI_WRITE_BLOCK                 = PCI_MESSAGE_BASE + 0xA,
> -	PCI_EJECT                       = PCI_MESSAGE_BASE + 0xB,
> -	PCI_QUERY_STOP                  = PCI_MESSAGE_BASE + 0xC,
> -	PCI_REENABLE                    = PCI_MESSAGE_BASE + 0xD,
> -	PCI_QUERY_STOP_FAILED           = PCI_MESSAGE_BASE + 0xE,
> -	PCI_EJECTION_COMPLETE           = PCI_MESSAGE_BASE + 0xF,
> -	PCI_RESOURCES_ASSIGNED          = PCI_MESSAGE_BASE + 0x10,
> -	PCI_RESOURCES_RELEASED          = PCI_MESSAGE_BASE + 0x11,
> -	PCI_INVALIDATE_BLOCK            = PCI_MESSAGE_BASE + 0x12,
> -	PCI_QUERY_PROTOCOL_VERSION      = PCI_MESSAGE_BASE + 0x13,
> -	PCI_CREATE_INTERRUPT_MESSAGE    = PCI_MESSAGE_BASE + 0x14,
> -	PCI_DELETE_INTERRUPT_MESSAGE    = PCI_MESSAGE_BASE + 0x15,
> +	PCI_QUERY_RESOURCE_RESOURCES	= PCI_MESSAGE_BASE + 6,
> +	PCI_BUS_D0ENTRY			= PCI_MESSAGE_BASE + 7,
> +	PCI_BUS_D0EXIT			= PCI_MESSAGE_BASE + 8,
> +	PCI_READ_BLOCK			= PCI_MESSAGE_BASE + 9,
> +	PCI_WRITE_BLOCK			= PCI_MESSAGE_BASE + 0xA,
> +	PCI_EJECT			= PCI_MESSAGE_BASE + 0xB,
> +	PCI_QUERY_STOP			= PCI_MESSAGE_BASE + 0xC,
> +	PCI_REENABLE			= PCI_MESSAGE_BASE + 0xD,
> +	PCI_QUERY_STOP_FAILED		= PCI_MESSAGE_BASE + 0xE,
> +	PCI_EJECTION_COMPLETE		= PCI_MESSAGE_BASE + 0xF,
> +	PCI_RESOURCES_ASSIGNED		= PCI_MESSAGE_BASE + 0x10,
> +	PCI_RESOURCES_RELEASED		= PCI_MESSAGE_BASE + 0x11,
> +	PCI_INVALIDATE_BLOCK		= PCI_MESSAGE_BASE + 0x12,
> +	PCI_QUERY_PROTOCOL_VERSION	= PCI_MESSAGE_BASE + 0x13,
> +	PCI_CREATE_INTERRUPT_MESSAGE	= PCI_MESSAGE_BASE + 0x14,
> +	PCI_DELETE_INTERRUPT_MESSAGE	= PCI_MESSAGE_BASE + 0x15,
>  	PCI_RESOURCES_ASSIGNED2		= PCI_MESSAGE_BASE + 0x16,
>  	PCI_CREATE_INTERRUPT_MESSAGE2	= PCI_MESSAGE_BASE + 0x17,
>  	PCI_DELETE_INTERRUPT_MESSAGE2	= PCI_MESSAGE_BASE + 0x18, /* unused */
>  	PCI_BUS_RELATIONS2		= PCI_MESSAGE_BASE + 0x19,
> -	PCI_RESOURCES_ASSIGNED3         = PCI_MESSAGE_BASE + 0x1A,
> -	PCI_CREATE_INTERRUPT_MESSAGE3   = PCI_MESSAGE_BASE + 0x1B,
> +	PCI_RESOURCES_ASSIGNED3		= PCI_MESSAGE_BASE + 0x1A,
> +	PCI_CREATE_INTERRUPT_MESSAGE3	= PCI_MESSAGE_BASE + 0x1B,
>  	PCI_MESSAGE_MAXIMUM
>  };
>  
> @@ -1775,20 +1775,21 @@ static u32 hv_compose_msi_req_v1(
>   * via the HVCALL_RETARGET_INTERRUPT hypercall. But the choice of dummy vCPU is
>   * not irrelevant because Hyper-V chooses the physical CPU to handle the
>   * interrupts based on the vCPU specified in message sent to the vPCI VSP in
> - * hv_compose_msi_msg(). Hyper-V's choice of pCPU is not visible to the guest,
> - * but assigning too many vPCI device interrupts to the same pCPU can cause a
> - * performance bottleneck. So we spread out the dummy vCPUs to influence Hyper-V
> - * to spread out the pCPUs that it selects.
> + * hv_vmbus_compose_msi_msg(). Hyper-V's choice of pCPU is not visible to the
> + * guest, but assigning too many vPCI device interrupts to the same pCPU can
> + * cause a performance bottleneck. So we spread out the dummy vCPUs to influence
> + * Hyper-V to spread out the pCPUs that it selects.
>   *
>   * For the single-MSI and MSI-X cases, it's OK for hv_compose_msi_req_get_cpu()
>   * to always return the same dummy vCPU, because a second call to
> - * hv_compose_msi_msg() contains the "real" vCPU, causing Hyper-V to choose a
> - * new pCPU for the interrupt. But for the multi-MSI case, the second call to
> - * hv_compose_msi_msg() exits without sending a message to the vPCI VSP, so the
> - * original dummy vCPU is used. This dummy vCPU must be round-robin'ed so that
> - * the pCPUs are spread out. All interrupts for a multi-MSI device end up using
> - * the same pCPU, even though the vCPUs will be spread out by later calls
> - * to hv_irq_unmask(), but that is the best we can do now.
> + * hv_vmbus_compose_msi_msg() contains the "real" vCPU, causing Hyper-V to
> + * choose a new pCPU for the interrupt. But for the multi-MSI case, the second
> + * call to hv_vmbus_compose_msi_msg() exits without sending a message to the
> + * vPCI VSP, so the original dummy vCPU is used. This dummy vCPU must be
> + * round-robin'ed so that the pCPUs are spread out. All interrupts for a
> + * multi-MSI device end up using the same pCPU, even though the vCPUs will be
> + * spread out by later calls to hv_irq_unmask(), but that is the best we can do
> + * now.
>   *
>   * With Hyper-V in Nov 2022, the HVCALL_RETARGET_INTERRUPT hypercall does *not*
>   * cause Hyper-V to reselect the pCPU based on the specified vCPU. Such an
> @@ -1863,7 +1864,7 @@ static u32 hv_compose_msi_req_v3(
>  }
>  
>  /**
> - * hv_compose_msi_msg() - Supplies a valid MSI address/data
> + * hv_vmbus_compose_msi_msg() - Supplies a valid MSI address/data
>   * @data:	Everything about this MSI
>   * @msg:	Buffer that is filled in by this function
>   *
> @@ -1873,7 +1874,7 @@ static u32 hv_compose_msi_req_v3(
>   * response supplies a data value and address to which that data
>   * should be written to trigger that interrupt.
>   */
> -static void hv_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> +static void hv_vmbus_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	struct hv_pcibus_device *hbus;
>  	struct vmbus_channel *channel;
> @@ -1955,7 +1956,7 @@ static void hv_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  			return;
>  		}
>  		/*
> -		 * The vector we select here is a dummy value.  The correct
> +		 * The vector we select here is a dummy value.	The correct
>  		 * value gets sent to the hypervisor in unmask().  This needs
>  		 * to be aligned with the count, and also not zero.  Multi-msi
>  		 * is powers of 2 up to 32, so 32 will always work here.
> @@ -2047,7 +2048,7 @@ static void hv_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  
>  		/*
>  		 * Make sure that the ring buffer data structure doesn't get
> -		 * freed while we dereference the ring buffer pointer.  Test
> +		 * freed while we dereference the ring buffer pointer.	Test
>  		 * for the channel's onchannel_callback being NULL within a
>  		 * sched_lock critical section.  See also the inline comments
>  		 * in vmbus_reset_channel_cb().
> @@ -2147,7 +2148,7 @@ static const struct msi_parent_ops hv_pcie_msi_parent_ops = {
>  /* HW Interrupt Chip Descriptor */
>  static struct irq_chip hv_msi_irq_chip = {
>  	.name			= "Hyper-V PCIe MSI",
> -	.irq_compose_msi_msg	= hv_compose_msi_msg,
> +	.irq_compose_msi_msg	= hv_vmbus_compose_msi_msg,
>  	.irq_set_affinity	= irq_chip_set_affinity_parent,
>  	.irq_ack		= irq_chip_ack_parent,
>  	.irq_eoi		= irq_chip_eoi_parent,
> @@ -2159,8 +2160,8 @@ static int hv_pcie_domain_alloc(struct irq_domain *d, unsigned int virq, unsigne
>  			       void *arg)
>  {
>  	/*
> -	 * TODO: Allocating and populating struct tran_int_desc in hv_compose_msi_msg()
> -	 * should be moved here.
> +	 * TODO: Allocating and populating struct tran_int_desc in
> +	 *	 hv_vmbus_compose_msi_msg() should be moved here.
>  	 */
>  	int ret;
>  
> @@ -2227,7 +2228,7 @@ static int hv_pcie_init_irq_domain(struct hv_pcibus_device *hbus)
>  /**
>   * get_bar_size() - Get the address space consumed by a BAR
>   * @bar_val:	Value that a BAR returned after -1 was written
> - *              to it.
> + *		to it.
>   *
>   * This function returns the size of the BAR, rounded up to 1
>   * page.  It has to be rounded up because the hypervisor's page
> @@ -2573,7 +2574,7 @@ static void q_resource_requirements(void *context, struct pci_response *resp,
>   * new_pcichild_device() - Create a new child device
>   * @hbus:	The internal struct tracking this root PCI bus.
>   * @desc:	The information supplied so far from the host
> - *              about the device.
> + *		about the device.
>   *
>   * This function creates the tracking structure for a new child
>   * device and kicks off the process of figuring out what it is.
> @@ -3100,7 +3101,7 @@ static void hv_pci_onchannelcallback(void *context)
>  			 * sure that the packet pointer is still valid during the call:
>  			 * here 'valid' means that there's a task still waiting for the
>  			 * completion, and that the packet data is still on the waiting
> -			 * task's stack.  Cf. hv_compose_msi_msg().
> +			 * task's stack.  Cf. hv_vmbus_compose_msi_msg().
>  			 */
>  			comp_packet->completion_func(comp_packet->compl_ctxt,
>  						     response,
> @@ -3417,7 +3418,7 @@ static int hv_allocate_config_window(struct hv_pcibus_device *hbus)
>  	 * vmbus_allocate_mmio() gets used for allocating both device endpoint
>  	 * resource claims (those which cannot be overlapped) and the ranges
>  	 * which are valid for the children of this bus, which are intended
> -	 * to be overlapped by those children.  Set the flag on this claim
> +	 * to be overlapped by those children.	Set the flag on this claim
>  	 * meaning that this region can't be overlapped.
>  	 */
>  
> @@ -4066,7 +4067,7 @@ static int hv_pci_restore_msi_msg(struct pci_dev *pdev, void *arg)
>  		irq_data = irq_get_irq_data(entry->irq);
>  		if (WARN_ON_ONCE(!irq_data))
>  			return -EINVAL;
> -		hv_compose_msi_msg(irq_data, &entry->msg);
> +		hv_vmbus_compose_msi_msg(irq_data, &entry->msg);
>  	}
>  	return 0;
>  }
> @@ -4074,7 +4075,7 @@ static int hv_pci_restore_msi_msg(struct pci_dev *pdev, void *arg)
>  /*
>   * Upon resume, pci_restore_msi_state() -> ... ->  __pci_write_msi_msg()
>   * directly writes the MSI/MSI-X registers via MMIO, but since Hyper-V
> - * doesn't trap and emulate the MMIO accesses, here hv_compose_msi_msg()
> + * doesn't trap and emulate the MMIO accesses, here hv_vmbus_compose_msi_msg()
>   * must be used to ask Hyper-V to re-create the IOMMU Interrupt Remapping
>   * Table entries.
>   */
> -- 
> 2.51.2.vfs.0.1
> 

-- 
மணிவண்ணன் சதாசிவம்

