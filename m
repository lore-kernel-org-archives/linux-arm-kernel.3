Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C6C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT6fZaLiypq7Y1/xhUfGKsjNYTruNOINhDDVg2b5xms=; b=B6rrjYLQg0wBHM3xbvpHYmoRuv
	fFHPF1QbHf6+51ezqhKzi/TcbkuoNJ4HEwCJ5WZiWlfOH4u61UipDmXNUyW0Do35MS/sLTZYN1VhH
	Zr53VhQ2vePlqJsfAFRpz9c2LzjZMDBh002p0FzSoia84WbuhZcxhvzta37SHP+lvkXa/jmkvhwFO
	o59F5U+ReZQ4rVJygd5ZFzIPhtmJ04QNWS0wZT9bz3VRzrvF5jDVptrDYkRW409O3SZ0sn0n90J7m
	1EXu3iSN3jobrjuIvkrkyt+uE7v5lC7lH50aqng5M9jy7T/Jm3IIGOzQje6M1FsVjjR43HxCC4ab+
	hOEUWDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ADE-000000009Y0-44Fs;
	Thu, 03 Sep 2026 16:22:52 +0000
Received: from out-39.mta0.migadu.com ([2001:41d0:1004:224b::27] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ADD-000000009Wo-0KPs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:22:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yAWEaoHlzAByy1p/MfIorhvFlDICqbscs9jfE/luEfA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788452569; v=1; x=1789057369;
 b=jSF5KFdzCmwXAjJ+rNC6ldOa0QesGJIYvPSEewqiLhRWlBK7Lt8wCdmC0HEG1dEr+YX08mHA
 Rfn+U7KFijuPxq8ltuobo+jR8H7ttbReKn8smG3Tne5C/U/65KwTqJ/QT83gZge/W8FVyW9n3XP
 2rYMRghUIm393B3U3hz9+TeI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id dd77787337117ed9;
	Thu, 03 Sep 2026 16:22:49 +0000
X-Mizu-Trace-ID: dd77787337117ed9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so8417e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:22:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwiUwXRiBKbx18JtKIPDyiXuJF7RGBVZ4EEVwad9timDHrxintP92byWHTdg/jv9Eg90JA0dFs2ZU0qRLvvsGl@lists.infradead.org
X-Gm-Message-State: AFuF++lyCU2aVV7vXY9dFoK5jlAbYCvYZ0oyTf++34zcFguzfUUynEhw
	TEX5ktjhTWrq3K4f6bdXdAgJeRKWm5RKTfjvNY+UJQiKsnAlkiKrqo25d65wmDPRDJ7W9I41YPa
	DwUkvwhDFTcjUQh/dIlLgMhE34IfZcUhHOx+tg7r8
X-Received: by 2002:ac2:4c51:0:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b60f977efamr153962e87.13.1788452567982; Thu, 03 Sep 2026
 09:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev> <20260831163421.272420-6-fuad.tabba@linux.dev>
 <apg7KNpamnpYi-kl@google.com> <aphAO_nmoTzI6Yvf@google.com>
In-Reply-To: <aphAO_nmoTzI6Yvf@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 3 Sep 2026 17:22:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyQciNWyaMr3rogsz53D_JJQGUXtv5jBJtSd4pajfv+8g@mail.gmail.com>
X-Gm-Features: AcwNN1XA72CBM17Z_CeCSMDbmKPDC8n6403MdwU3XpedWw0uwZihTsZDnm-yw0s
Message-ID: <CA+EHjTyQciNWyaMr3rogsz53D_JJQGUXtv5jBJtSd4pajfv+8g@mail.gmail.com>
Subject: Re: [PATCH 05/17] KVM: arm64: Skip fixed-feature state flush for
 protected vCPUs
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_092251_261581_F69C715D 
X-CRM114-Status: GOOD (  31.87  )
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

On Wed, 2 Sept 2026 at 16:26, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Wed, Sep 02, 2026 at 04:05:12PM +0100, Vincent Donnefort wrote:
> > On Mon, Aug 31, 2026 at 05:34:09PM +0100, Fuad Tabba wrote:
> > > flush_hyp_vcpu() copies the host's mdcr_el2, TWI/TWE and debug state
> > > into the hyp vCPU on every entry, so for a protected vCPU the host's
> > > trap configuration overrides the one pkvm_vcpu_init_traps() computed
> > > at EL2. Move those copies into the non-protected branch, and sync the
> > > debug state back for non-protected vCPUs only: a protected guest's
> > > debug registers are hypervisor-owned, and it takes the host's TWI/TWE
> > > at vCPU load. MDCR_EL2.TDA traps only the guest's own accesses; it
> > > does not stop the world switch from loading host-supplied breakpoints
> > > and MDSCR_EL1.
> > >
> > > EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
> > > FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
> > > the value the host's copy carried; a protected guest's PMU accesses
> > > trap regardless.
> > >
> > > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 31 +++++++++++++++++++-----------
> > >  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
> > >  2 files changed, 21 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index ca7122b0bccdd..14e847b122abf 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > @@ -231,7 +231,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> > >     u8 esr_ec;
> > >
> > >     fpsimd_sve_flush();
> > > -   flush_debug_state(hyp_vcpu);
> > >
> > >     /*
> > >      * If we deal with a non-protected guest and the state is potentially
> > > @@ -241,7 +240,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> > >     if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > >             if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
> > >                     flush_hyp_vcpu_state(hyp_vcpu);
> > > +
> > > +           hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> > > +           hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > > +                                                    (HCR_TWI | HCR_TWE);
> > > +
> > > +           hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
> > >             hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
> > > +           flush_debug_state(hyp_vcpu);
> > >     } else {
> > >             hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
> > >     }
> > > @@ -249,17 +255,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> > >     /* __hyp_running_vcpu must be NULL in a guest context. */
> > >     hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
> > >
> > > -   hyp_vcpu->vcpu.arch.mdcr_el2    = host_vcpu->arch.mdcr_el2;
> > >     /*
> > > -    * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> > > -    * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> > > -    * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> > > +    * A host-injected vSError is masked by the guest's own PSTATE.A, so it
> > > +    * applies to protected guests too.
> > >      */
> > > -   hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> > > -   hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > > -                                            (HCR_TWI | HCR_TWE | HCR_VSE);
> > > -
> > > -   hyp_vcpu->vcpu.arch.vsesr_el2   = host_vcpu->arch.vsesr_el2;
> > > +   hyp_vcpu->vcpu.arch.hcr_el2 &= ~HCR_VSE;
> > > +   hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & HCR_VSE;
> > > +   hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
> > >
> > >     flush_hyp_vgic_state(hyp_vcpu);
> > >
> > > @@ -288,7 +290,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
> > >     struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > >
> > >     fpsimd_sve_sync(&hyp_vcpu->vcpu);
> > > -   sync_debug_state(hyp_vcpu);
> > > +   if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > > +           sync_debug_state(hyp_vcpu);
> >
> > nit: We can't use the else arm below?
>
> or actually could we move the check into sync_debug_state() just like
> sync_hyp_timer_state() does?

Will do, and there's another case of this in the series that gets fixed with it.


/fuad

>
> >
> > >
> > >     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > >             host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> > > @@ -329,6 +332,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
> > >             /* Propagate WFx trapping flags */
> > >             hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
> > >             hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> > > +
> > > +           /* HPMN == 0 is reserved without FEAT_HPMN0. */
> > > +           if (system_supports_pmuv3())
> > > +                   u64p_replace_bits(&hyp_vcpu->vcpu.arch.mdcr_el2,
> > > +                                     FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)),
> > > +                                     MDCR_EL2_HPMN);
> > >     } else {
> > >             memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
> > >                    sizeof(hyp_vcpu->vcpu.arch.fgt));
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > index 459bd9eb7e4bc..e85f13233da08 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > @@ -102,7 +102,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> > >
> > >     if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
> > >             val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> > > -           val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
> > > +           val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME);
> > >     }
> > >
> > >     if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
> > > --
> > > 2.39.5
> > >
>
> --
> Vincent

