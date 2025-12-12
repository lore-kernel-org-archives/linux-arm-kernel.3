Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54136D49208
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBNbYpFWBWKcEqYzcjctFtpn5wuZ+IxeR40YwArtqgw=; b=R7+lZ0iBPrce+/PdqjM8LtjR2p
	1EEzkzlVON8evC8psHfaqqAh5hz2Kizv00qNhrrm2pw0NN82/JwKBKgI7c6OgtjZiz5xtQSHcky56
	WwaRFiPIGm5sHggWf7uo6GnPaL913bPL2LXfNRJ4NqL4Of8KaZ2a2G3hew/VUqtis2d6SvkC2aMyH
	OWU5wiKK6thFkzlo2SjuXzTmUj+CZ3q+DwFVCJmBRHlhOxI4pSUOyX3WJI4CJR35fqLMg0IxFGZOl
	NmSuKHgvdZis7rqhib85Smu+0xDOM2xn/p0iELxIuVsZ7HnF6Oaudj/WZ3v6X/7bk2A/NRlge8S8u
	hyCHAaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1j1-00000000UNt-2O0z;
	Fri, 12 Dec 2025 11:54:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1iy-00000000UNY-1HdE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 11:54:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E9B1FEC;
	Fri, 12 Dec 2025 03:54:07 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810F53F762;
	Fri, 12 Dec 2025 03:54:12 -0800 (PST)
Date: Fri, 12 Dec 2025 11:54:09 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 00/35] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <aTwCYSitrJHIue8t@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251211163425.GA4113166@e132581.arm.com>
 <aTvr8_xjoKY6pB8P@raptor>
 <20251212111541.GA138375@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212111541.GA138375@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_035416_470322_524696DD 
X-CRM114-Status: GOOD (  33.53  )
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

Hi Leo,

On Fri, Dec 12, 2025 at 11:15:41AM +0000, Leo Yan wrote:
> On Fri, Dec 12, 2025 at 10:18:27AM +0000, Alexandru Elisei wrote:
> 
> [...]
> 
> 
> > > 3) In the end, the KVM hypervisor pins physical pages on the host
> > >    stage-1 page table for:
> > 
> > By 'pin' meaning using pin_user_pages(), yes.
> > 
> > > 
> > >    The physical pages are pinned for Guest stage-1 table;
> > 
> > Yes.
> > 
> > >    The physical pages are pinned for Guest stage-2 table;
> > 
> > Yes and no. The pages allocated for the stage 2 translation tables are not
> > mapped in the host's userspace, they are mapped in the kernel linear address
> > space. This means that they are not subject to migration/swap/compaction/etc,
> > they will only be reused after KVM frees them.
> > 
> > But that's how KVM manages stage 2 for all VMs, so maybe I misunderstood what
> > you were saying.
> 
> No, you did not misunderstand.  I did not understand stage-2 table
> allocation before — it is allocated by KVM, not from user memory via
> the VMM.
> 
> [...]
> 
> > > Due the host might migrate or swap pages, so all the pin operations
> > > happen on the host's page table.  The pin operations never to be set up
> > > in guest's stage-2 table, right?
> > 
> > I'm not sure what you mean.
> 
> Never mind.  I think you have answered this below (pin user memory via
> pin_user_pages() and no matter with stage-2 tables).
> 
> > > My understanding is that there are two prominent challenges for SPE
> > > virtualization:
> > > 
> > > 1) Allocation: we need to allocate trace buffer with mapping both
> > >    guest's stage-1 and stage-2 before enabling SPU.  (For me, the free
> > 
> > It's the guest responsibility to map the buffer in the guest stage 1 before
> > enabling it. When the guest enables the buffer, KVM walks the guest's stage 1
> > and if it doesn't find a translation for a buffer guest VA, it will inject a
> > profiling buffer management event to the guest, with EC stage 1 data abort.
> 
> IIUC, KVM will inject a buffer management interrupt to guest and then
> guest driver can detect EC="stage 1 data abort".  KVM does not raise a
> data abort exception in this case.
> 
> > If the buffer was mapped in the guest stage 1 when the guest enabled the buffer,
> > but at same point in the future the guest unmaps the buffer from stage 1, the
> > statistical profiling unit might encounter a stage 1 data abort when attempting
> > to write to memory. If that's the case, the interrupt is taken by the host, and
> > KVM will inject the buffer management event back to the guest.
> 
> Hmm... just a note, it would be straightforward for guest to directly
> respond IRQ for "stage-1 data abort" (TBH, I don't know how to inject
> IRQ vs fast-forward IRQ, you could ignore this note until I dig a bit).

PMBIRQ is a purely virtual interrupt for KVM. Very early on guest exit, KVM
saves the hardware value for PMBSR_EL1 and clears PMBSR_EL1.S, which leads to
the SPU deasserting PMBIRQ to the GIC.

From my very limited testing, the GIC is always fast enough to deasserts the
interrupt to the CPU before interrupts are enabled much later in the VCPU run
loop. If that doesn't happen (GIC is still asserting PMBIRQ when interrupts on
enabled on the CPU), the SPE driver interrupt handler will treat it as a
spurious interrupt because the driver reads PMBSR_EL1.S = 0.

Thanks,
Alex

