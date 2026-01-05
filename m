Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E9C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk7tF1kExeP9jqtvKR3Dy5vw7dYXW5dPVBknzKbQkig=; b=zal90SS0QsTgIKaLt9IIYTrEut
	cLH4hDXSalKuTRlSX66lwRBHiiAQ/gLgqYgpQ+i3Rm29HIPRqojwpxKDb2Nf68YytBWtFj9bcSUk6
	Jdgn7r3oFGEciLk+VksfPAyp9Lp4Td+DR2AoYXjUz8tsXg1Bey9Pe0AO+CZujPKnr1wvUnuBAxGEi
	xP0I/dYc2TqXYuz5grAQnzKDr5ZgJDq+am8ujWEXfdmssPudjt2Zh8XmecgktU740N8i1+0Oxk7e/
	a3P51qljTsxFV/CyRn2D0mIW7LeawsWXwp9jDC1CDXKk3uAKDJWmSL3l1jhV0vtWyzu0PvtcEP+BH
	6ZqFcY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnf2-0000000BkGJ-49Ra;
	Mon, 05 Jan 2026 16:42:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnf0-0000000BkFc-3BBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:42:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 975A1339;
	Mon,  5 Jan 2026 08:42:15 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C7F33F6A8;
	Mon,  5 Jan 2026 08:42:20 -0800 (PST)
Date: Mon, 5 Jan 2026 16:42:09 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	james.clark@linaro.org, mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 16/35] KVM: arm64: Advertise SPE version in
 ID_AA64DFR0_EL1.PMSver
Message-ID: <aVvppjU3OXXIcJIo@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-17-alexandru.elisei@arm.com>
 <36416368-4447-4b16-8496-3e3d603d88d4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36416368-4447-4b16-8496-3e3d603d88d4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084226_912252_2A2AE4B1 
X-CRM114-Status: GOOD (  31.54  )
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

Hi Suzuki,

Thanks for having a look.

On Tue, Dec 16, 2025 at 11:40:20AM +0000, Suzuki K Poulose wrote:
> On 14/11/2025 16:06, Alexandru Elisei wrote:
> > The VCPU registers are reset during the KVM_ARM_VCPU_INIT ioctl, before
> > userspace can set the desired SPU. Assume that the VCPU is initialized from
> 
> 
> > a thread that runs on one of the physical CPUs that correspond to the SPU
> > that userspace will choose for the VM. Set PMSVer to that CPUs hardware
> > value.
> 
> This doesn't match the code. See below.

Indeed.

> 
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >   arch/arm64/include/asm/kvm_spe.h |  6 ++++++
> >   arch/arm64/kvm/spe.c             | 10 ++++++++++
> >   arch/arm64/kvm/sys_regs.c        | 10 +++++++++-
> >   3 files changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> > index 6ce70cf2abaf..5e6d7e609a48 100644
> > --- a/arch/arm64/include/asm/kvm_spe.h
> > +++ b/arch/arm64/include/asm/kvm_spe.h
> > @@ -33,6 +33,8 @@ static __always_inline bool kvm_supports_spe(void)
> >   void kvm_spe_init_vm(struct kvm *kvm);
> >   int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu);
> > +u8 kvm_spe_get_pmsver_limit(void);
> > +
> >   int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >   int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >   int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> > @@ -53,6 +55,10 @@ static inline int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
> >   {
> >   	return 0;
> >   }
> > +static inline u8 kvm_spe_get_pmsver_limit(void)
> > +{
> > +	return 0;
> > +}
> >   static inline int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >   {
> >   	return -ENXIO;
> > diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> > index 6bd074e40f6c..0c4896c6a873 100644
> > --- a/arch/arm64/kvm/spe.c
> > +++ b/arch/arm64/kvm/spe.c
> > @@ -68,6 +68,16 @@ int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
> >   	return 0;
> >   }
> > +u8 kvm_spe_get_pmsver_limit(void)
> > +{
> > +	unsigned int pmsver;
> > +
> > +	pmsver = SYS_FIELD_GET(ID_AA64DFR0_EL1, PMSVer,
> > +			       read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1));
> 
> The read_sanitised_ftr_reg() gives you the system wide sanitised
> version, not the one on the current CPU. You may need
> read_sysreg_s() instead here.

Yes.

> 
> 
> > +
> > +	return min(pmsver, ID_AA64DFR0_EL1_PMSVer_V1P5);
> > +}
> > +
> >   static u64 max_buffer_size_to_pmbidr_el1(u64 size)
> >   {
> >   	u64 msb_idx, num_bits;
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index e67eb39ddc11..ac859c39c2be 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -29,6 +29,7 @@
> >   #include <asm/kvm_hyp.h>
> >   #include <asm/kvm_mmu.h>
> >   #include <asm/kvm_nested.h>
> > +#include <asm/kvm_spe.h>
> >   #include <asm/perf_event.h>
> >   #include <asm/sysreg.h>
> > @@ -1652,6 +1653,9 @@ static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
> >   		case ID_AA64DFR0_EL1_DebugVer_SHIFT:
> >   			kvm_ftr.type = FTR_LOWER_SAFE;
> >   			break;
> > +		case ID_AA64DFR0_EL1_PMSVer_SHIFT:
> > +			kvm_ftr.type = FTR_LOWER_SAFE;
> 
> PMSVer is already FTR_LOWER_SAFE, and we don't need to override it here ?
> (unlike the DebugVer or PMU Ver)

Don't need to override it, yes, didn't realize that it's FTR_LOWER_SAFE in
cpufeature.c when I wrote this.

> 
> > +			break;
> >   		}
> >   		break;
> >   	case SYS_ID_DFR0_EL1:
> > @@ -2021,8 +2025,11 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
> >   		val |= SYS_FIELD_PREP(ID_AA64DFR0_EL1, PMUVer,
> >   				      kvm_arm_pmu_get_pmuver_limit());
> > -	/* Hide SPE from guests */
> >   	val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
> > +	if (vcpu_has_spe(vcpu)) {
> > +		val |= SYS_FIELD_PREP(ID_AA64DFR0_EL1, PMSVer,
> > +				      kvm_spe_get_pmsver_limit());
> > +	}
> 
> So, we ignore value that the user sets and go with what the SPE instance
> that has been chosen ? Should we make it non-writable then ?

I modelled this after how PMUVer is handled, though that's not an excuse for
getting it wrong. My intention was to limit the maximum version that userspace
can set to the version of the SPU assigned to the VM.

But now that I think about it, some SPE versions introduce new fields in a
record, and there's no way for KVM to hide that if userspace set a lower version
for the VM. So I guess for now I'll not allow userspace to write PMSVer and
revisit it if someone wants it.

Thanks,
Alex

