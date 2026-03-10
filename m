Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1BEFD4F06
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Syy1zo6Lbhwro4kP2STBiC9YNb3BiShgrR/WzLGhJR4=; b=M3PHOoiU1uJN0qvHC1s0GMZfF2
	P4+FHI9IwK8MPYxS0HgflstiK90ri96bs3Th3XZf1udYV4M15zGHQNDvWRw6SmXoxyXs1tfJHP7T8
	yJiMyMvSALnn7v18qzIrLJT2PBef6JqcRoJEoNeQvJL/w42r1GP05p+neQ2VgMUMHYEpYpDZbHXyH
	pUTNweHFEosN0N0vZ235X/qGwJfsZEutIDRIyiI7vBaflSIOtvUVO8ecYj/qHfPEHBznFyS7r0H8q
	DRX8+Epvt7PtvW40iaHa+pAQByRqNDjFJ0pAQIePysWeUHkHoULqNKbXUPNVnZD6fRPwrOHMd0dIl
	M/7+GkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzlu-00000009tm5-2bXu;
	Tue, 10 Mar 2026 16:17:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzlq-00000009tjS-2SaQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:17:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0F31596;
	Tue, 10 Mar 2026 09:17:12 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E6C13F694;
	Tue, 10 Mar 2026 09:17:16 -0700 (PDT)
Date: Tue, 10 Mar 2026 16:17:07 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH RESEND 2/2] KVM: arm64: nv: Expose shadow page tables in
 debugfs
Message-ID: <thetpwxswabflbntrrxfsxpej4scwq25qpviv2svmbj7br3w3d@mdrrhsuexsf4>
References: <20260308231829.864983-1-weilin.chang@arm.com>
 <20260308231829.864983-3-weilin.chang@arm.com>
 <20260310152604.GA3093715@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310152604.GA3093715@e124191.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_091722_722371_67E5978B 
X-CRM114-Status: GOOD (  34.29  )
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

On Tue, Mar 10, 2026 at 03:26:04PM +0000, Joey Gouly wrote:
> On Sun, Mar 08, 2026 at 11:18:29PM +0000, Wei-Lin Chang wrote:
> > Exposing shadow page tables in debugfs improves the debugability and
> > testability of NV. With this patch a new directory "nested" is created
> > for each VM created if the host is NV capable. Within the directory each
> > valid s2 mmu will have its shadow page table exposed as a readable file
> > with the file name formatted as 0x<vttbr>-0x<vtcr>-s2-{en,dis}abled. The
> > creation and removal of the files happen at the points when an s2 mmu
> > becomes valid, or the context it represents change. In the future the
> > "nested" directory can also hold other NV related information.
> > 
> > This is gated behind CONFIG_PTDUMP_STAGE2_DEBUGFS.
> > 
> > Suggested-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h |  7 +++++++
> >  arch/arm64/include/asm/kvm_mmu.h  |  4 ++++
> >  arch/arm64/kvm/nested.c           |  6 +++++-
> >  arch/arm64/kvm/ptdump.c           | 27 +++++++++++++++++++++++++++
> >  4 files changed, 43 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 5d5a3bbdb95e..f88f6c4d646e 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -217,6 +217,10 @@ struct kvm_s2_mmu {
> >  	 */
> >  	bool	nested_stage2_enabled;
> >  
> > +#ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> > +	struct dentry *shadow_pt_debugfs_dentry;
> > +#endif
> > +
> >  	/*
> >  	 * true when this MMU needs to be unmapped before being used for a new
> >  	 * purpose.
> > @@ -405,6 +409,9 @@ struct kvm_arch {
> >  	 * the associated pKVM instance in the hypervisor.
> >  	 */
> >  	struct kvm_protected_vm pkvm;
> > +
> > +	/* Nested virtualization info */
> > +	struct dentry *debugfs_nv_dentry;
> 
> Seems like this could be guarded with CONFIG_PTDUMP_STAGE2_DEBUGFS too, or is
> there a reason you didn't?

Right, I was thinking this "nested" directory can also hold other NV
related information in the future, that's why I didn't keep it behind
the option.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Joey
> 
> >  };
> >  
> >  struct kvm_vcpu_fault_info {
> > diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> > index d968aca0461a..01e9c72d6aa7 100644
> > --- a/arch/arm64/include/asm/kvm_mmu.h
> > +++ b/arch/arm64/include/asm/kvm_mmu.h
> > @@ -393,8 +393,12 @@ static inline bool kvm_supports_cacheable_pfnmap(void)
> >  
> >  #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> >  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
> > +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
> > +void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
> >  #else
> >  static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
> > +static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
> > +static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
> >  #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
> >  
> >  #endif /* __ASSEMBLER__ */
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index eeea5e692370..31d74ed8449e 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -730,8 +730,10 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
> >  	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
> >  
> >  	/* Make sure we don't forget to do the laundry */
> > -	if (kvm_s2_mmu_valid(s2_mmu))
> > +	if (kvm_s2_mmu_valid(s2_mmu)) {
> > +		kvm_nested_s2_ptdump_remove_debugfs(s2_mmu);
> >  		s2_mmu->pending_unmap = true;
> > +	}
> >  
> >  	/*
> >  	 * The virtual VMID (modulo CnP) will be used as a key when matching
> > @@ -745,6 +747,8 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
> >  	s2_mmu->tlb_vtcr = vcpu_read_sys_reg(vcpu, VTCR_EL2);
> >  	s2_mmu->nested_stage2_enabled = vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM;
> >  
> > +	kvm_nested_s2_ptdump_create_debugfs(s2_mmu);
> > +
> >  out:
> >  	atomic_inc(&s2_mmu->refcnt);
> >  
> > diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> > index 98763b291956..3a70f633fc8b 100644
> > --- a/arch/arm64/kvm/ptdump.c
> > +++ b/arch/arm64/kvm/ptdump.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/kvm_host.h>
> >  #include <linux/seq_file.h>
> >  
> > +#include <asm/cpufeature.h>
> >  #include <asm/kvm_mmu.h>
> >  #include <asm/kvm_pgtable.h>
> >  #include <asm/ptdump.h>
> > @@ -277,6 +278,29 @@ static const struct file_operations kvm_pgtable_levels_fops = {
> >  	.release	= kvm_pgtable_debugfs_close,
> >  };
> >  
> > +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu)
> > +{
> > +	struct dentry *dent;
> > +	/* format: 0x<vttbr>-0x<vtcr>-s2-{en, dis}abled\0 */
> > +	char file_name[2 + 16 + 1 + 2 + 16 + 4 + 3 + 6];
> > +
> > +	snprintf(file_name, sizeof(file_name), "0x%llx-0x%llx-s2-%sabled",
> > +		 mmu->tlb_vttbr,
> > +		 mmu->tlb_vtcr,
> > +		 mmu->nested_stage2_enabled ? "en" : "dis");
> > +
> > +	dent = debugfs_create_file(file_name, 0400,
> > +				   mmu->arch->debugfs_nv_dentry, mmu,
> > +				   &kvm_ptdump_guest_fops);
> > +
> > +	mmu->shadow_pt_debugfs_dentry = dent;
> > +}
> > +
> > +void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu)
> > +{
> > +	debugfs_remove(mmu->shadow_pt_debugfs_dentry);
> > +}
> > +
> >  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
> >  {
> >  	debugfs_create_file("stage2_page_tables", 0400, kvm->debugfs_dentry,
> > @@ -285,4 +309,7 @@ void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
> >  			    &kvm->arch.mmu, &kvm_pgtable_range_fops);
> >  	debugfs_create_file("stage2_levels", 0400, kvm->debugfs_dentry,
> >  			    &kvm->arch.mmu, &kvm_pgtable_levels_fops);
> > +	if (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
> > +		kvm->arch.debugfs_nv_dentry =
> > +			debugfs_create_dir("nested", kvm->debugfs_dentry);
> >  }
> > -- 
> > 2.43.0
> > 

