Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BE8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBdqPPtUULiKPyhwTFPqD90T8spQL0YyPmSSFju6JVk=; b=pBAkCButvTYD7Ha/a6TqqlVuhZ
	LV65U+hYTIT6QSpeoAFz9ojs0vw9Mkr29p9MI7LiI8A5caQiW64KvAh34S4udyuAu8PIDpKzXTiaR
	Uut6W2pJaa6SPraqtx2PT/ux0LICV9rA/kE7xHLY6Gf5/eWdf+i9zQIg7Cy+LwAjxLLGEUNFiouV1
	Bwtmks0D9chPNVP9oqanPHv5Pa9+idVTxaKnZvKfkzGSEYEmysHrrenc2RO/Dr2bQ78LUye0Zgu86
	iTiHhuY4ffF4jlOBSMmesoSuxGHUPhZG+YYpG3zeZ/Bpxq38Q28IS6rxCIACebu2HtFKQxOoJhd5h
	EEblgZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AFk-00000000A0c-2lHv;
	Thu, 03 Sep 2026 16:25:28 +0000
Received: from out-155.mta1.migadu.com ([95.215.58.155] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AFi-00000000A01-2CQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:25:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=K2XhZRaEcnv7ObK0vhzgK3Ez5fck2OLgKTd878PvPlw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788452724; v=1; x=1789057524;
 b=syxXBv85T9JWvtNrN7f3f2hBoGBTj2Ho8nlQpaJmtAWr4fNuUDPRPa2hYA5dcXtKkCRNpJDx
 DFTGv/V5myzpAGPtKpv9FVLH9LMHfZjIJYAxSXFJdj3OvnoNWwUqL8dTGXkDH4rkkf9cE1+1fXs
 IlcDX4DIAJRYB7TG4kYYrDOg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1b71846eca80b36b;
	Thu, 03 Sep 2026 16:25:24 +0000
X-Mizu-Trace-ID: 1b71846eca80b36b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so7962e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzv1C/XVQUxiYHBYIt2K/rOpk8nI7yPl66J2R6oy6vAAvdpcd17MGfr85lgH6NU7Lgf6IGvWI0O5c1RfVz5xN+4@lists.infradead.org
X-Gm-Message-State: AFuF++nU8tglicXl3PPvFKG1w3V/BSmOsLA1GLagBIDpcjdJYpcamRq8
	/JLkdnrZpKBTZakGRPOd9gbeAi9wNEvmmBPBadIuYNc1wGntQPLN9mwWynMkRdoF6wwWdCBXDP+
	Yf5s915+4O008BRZ9j2yvRLxJ9ahccVnN9N20B/Bm
X-Received: by 2002:a05:6512:230e:b0:5b6:bea:f091 with SMTP id
 2adb3069b0e04-5b60ecb9c0emr180091e87.10.1788452723672; Thu, 03 Sep 2026
 09:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev> <20260831163421.272420-8-fuad.tabba@linux.dev>
 <apg9R_QsE1cckIgJ@e143914.arm.com>
In-Reply-To: <apg9R_QsE1cckIgJ@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 3 Sep 2026 17:24:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz4dpJnWDco+1K4YwJs1D3=n4HqKti2zBNsxDUj7L9U7Q@mail.gmail.com>
X-Gm-Features: AcwNN1XaENgw11noY_HItOusfbxfw1uGRSOhZB7GEJ_PRsZTm3y4puO8FZvoGt4
Message-ID: <CA+EHjTz4dpJnWDco+1K4YwJs1D3=n4HqKti2zBNsxDUj7L9U7Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] KVM: arm64: Add system register reset framework for
 protected VMs
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_092526_731780_D9F689E5 
X-CRM114-Status: GOOD (  37.16  )
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

On Wed, 2 Sept 2026 at 16:14, Joey Gouly <joey.gouly@arm.com> wrote:
>
> On Mon, Aug 31, 2026 at 05:34:11PM +0100, Fuad Tabba wrote:
> > Reset a protected VM's system registers at EL2 rather than taking the
> > host's values: add kvm_reset_pvm_sys_regs() and the
> > pvm_sys_reg_reset_vals[] table that drives it, and call it from
> > init_pkvm_hyp_vcpu() for protected vCPUs. The values follow the
> > host-side reset in sys_regs.c, with a poison value where it resets to
> > UNKNOWN, and for VBAR_EL1 and CONTEXTIDR_EL1 in place of the 0 it
> > resets them to. MPIDR_EL1 is derived from vcpu_id, as for any KVM
> > guest.
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>
> The commit message says "rather than taking the host's values", but if I
> understand correctly, at this point in the series, they still take the
> hosts values because this is still present:
>
>         hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
>
> Not necessarily saying anything needs to change, just to write down what
> I noticed while reviewing / reading this code!

Actually, you're right. This should change. That copy runs on every
entry and is removed only in patch 13, so until then the reset values
are overwritten and this patch has no observable effect for a
protected VM. The message will say so for v2. Patch 6 hits the same
copy and works around it, preserving the timer registers across it.

>
> The only other thing I was a bit unsure of was the actual list of
> registers pvm_sys_reg_reset_vals. It's the EL1 registers, minus
> unsupported FEATs (MTE, debug(?), GCS, etc)

Not quite: some EL0 registers are in it, and debug isn't excluded.
I'll state the rule in the commit message. And there's the Sashiko fix
too.

Thanks!
/fuad

>
> Otherwise:
> Acked-by: Joey Gouly <joey.gouly@arm.com>
>
> Thanks,
> Joey
>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c         |  5 ++
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 91 ++++++++++++++++++++++++--
> >  3 files changed, 93 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index 49a0a992047ba..a04b7c04d5135 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -95,6 +95,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> > +void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
> >  int kvm_check_pvm_sysreg_table(void);
> >
> >  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index e85f13233da08..af334318d0a03 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -551,6 +551,11 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >               goto done;
> >
> >       ret = pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
> > +     if (ret)
> > +             goto done;
> > +
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
> >  done:
> >       if (ret)
> >               unpin_host_vcpu(host_vcpu);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 8758c68017765..ebfd48aa15b56 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -525,6 +525,84 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
> >       /* Performance Monitoring Registers are restricted. */
> >  };
> >
> > +struct sys_reg_desc_reset {
> > +     int reg;
> > +     void (*reset)(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *rd);
> > +     u64 value;
> > +};
> > +
> > +/* Hardware value, as sys_regs.c's reset_actlr()/reset_amair_el1(). */
> > +static void reset_actlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, read_sysreg(actlr_el1));
> > +}
> > +
> > +static void reset_amair_el1(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, read_sysreg(amair_el1));
> > +}
> > +
> > +static void reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, kvm_calculate_mpidr(vcpu));
> > +}
> > +
> > +static void reset_value(struct kvm_vcpu *vcpu, const struct sys_reg_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, r->value);
> > +}
> > +
> > +#define RESET_VAL(REG, RESET_VAL) {  REG, reset_value, RESET_VAL }
> > +
> > +#define RESET_ZERO(REG) RESET_VAL(REG, 0)
> > +
> > +#define RESET_UNKNOWN(REG) RESET_VAL(REG, 0x1de7ec7edbadc0deULL)
> > +
> > +#define RESET_FUNC(REG, RESET_FUNC) {  REG, RESET_FUNC, 0 }
> > +
> > +/* Sorted ascending by reg; kvm_check_pvm_sysreg_table() enforces it. */
> > +static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
> > +     RESET_FUNC(MPIDR_EL1, reset_mpidr),
> > +     RESET_UNKNOWN(TPIDR_EL0),
> > +     RESET_UNKNOWN(TPIDRRO_EL0),
> > +     RESET_UNKNOWN(TPIDR_EL1),
> > +     RESET_ZERO(CNTKCTL_EL1),
> > +     RESET_UNKNOWN(PAR_EL1),
> > +     RESET_ZERO(MDCCINT_EL1),
> > +     RESET_ZERO(DISR_EL1),
> > +     RESET_ZERO(PMCCFILTR_EL0),
> > +     RESET_ZERO(PMUSERENR_EL0),
> > +     RESET_ZERO(CPACR_EL1),
> > +     RESET_VAL(CONTEXTIDR_EL1, 0x00000000dbadc0deULL),
> > +     RESET_VAL(SCTLR_EL1, 0x00C50078ULL),
> > +     RESET_FUNC(ACTLR_EL1, reset_actlr),
> > +     RESET_ZERO(TCR_EL1),
> > +     RESET_UNKNOWN(AFSR0_EL1),
> > +     RESET_UNKNOWN(AFSR1_EL1),
> > +     RESET_UNKNOWN(ESR_EL1),
> > +     RESET_UNKNOWN(MAIR_EL1),
> > +     RESET_FUNC(AMAIR_EL1, reset_amair_el1),
> > +     RESET_ZERO(MDSCR_EL1),
> > +     RESET_ZERO(ZCR_EL1),
> > +     RESET_UNKNOWN(TTBR0_EL1),
> > +     RESET_UNKNOWN(TTBR1_EL1),
> > +     RESET_UNKNOWN(FAR_EL1),
> > +     RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
> > +     RESET_UNKNOWN(PIRE0_EL1),
> > +     RESET_UNKNOWN(PIR_EL1),
> > +};
> > +
> > +void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
> > +{
> > +     unsigned long i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
> > +             const struct sys_reg_desc_reset *r = &pvm_sys_reg_reset_vals[i];
> > +
> > +             r->reset(vcpu, r);
> > +     }
> > +}
> > +
> >  /*
> >   * Initializes feature registers for protected vms.
> >   */
> > @@ -550,16 +628,21 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
> >  }
> >
> >  /*
> > - * Checks that the sysreg table is unique and in-order.
> > - *
> > - * Returns 0 if the table is consistent, or 1 otherwise.
> > + * Both tables must be unique and sorted ascending. pvm_sys_reg_descs.reg is the
> > + * sys_reg() encoding, pvm_sys_reg_reset_vals.reg the vcpu_sysreg index, so they
> > + * compare differently. BUG_ON() at __pkvm_init: fatal at boot.
> >   */
> >  int kvm_check_pvm_sysreg_table(void)
> >  {
> >       unsigned int i;
> >
> >       for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_descs); i++) {
> > -             if (cmp_sys_reg(&pvm_sys_reg_descs[i-1], &pvm_sys_reg_descs[i]) >= 0)
> > +             if (cmp_sys_reg(&pvm_sys_reg_descs[i - 1], &pvm_sys_reg_descs[i]) >= 0)
> > +                     return 1;
> > +     }
> > +
> > +     for (i = 1; i < ARRAY_SIZE(pvm_sys_reg_reset_vals); i++) {
> > +             if (pvm_sys_reg_reset_vals[i - 1].reg >= pvm_sys_reg_reset_vals[i].reg)
> >                       return 1;
> >       }
> >
> > --
> > 2.39.5
> >

