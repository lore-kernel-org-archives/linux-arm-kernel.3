Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8452C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuZC6t1UYlFciBpg1zV84k8LEGoSNzJaZwOR2qwxHEI=; b=xXDB7cqLC1pE65yVkFG9UvNc//
	nSal5b3wz3XryOKUrDr/qe2aDvjH26hiD9Tl99yzfgFUN8uYXCHCeTco1Wjw6vfhQ5w+Iz6MENFw6
	6tyARnkk5IH7awGetkoC7rBR+op3WHhtQyi+1GHFWkgiJMx8BeXdbOuwMK5dkZpgHcgrUFBd1Sq7t
	t0AsA1PDb2r2PrMV+Jmd88e4uTXIGGZPA97vfUg8zBSncAdus2mPdkXXCWtqGA3zmkxLqP+Z8vI7Q
	B7k4lLg8HCwQ/femcnYeoKoBZRBuA4hDCXKZHaS9WUrPjLaDz6kh3FKDIX9aMTI73uIQVnkmysnFS
	Ch5bcdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgGU-0000000CgEB-1b4M;
	Tue, 14 Jul 2026 16:45:50 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgGL-0000000CgDA-3DrG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:45:49 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpwXQwTto09/3Wc1wkVDF+CB63yvzYqn8nZwMErlQ4PWr5oVI7pH+ouH0p/jPDVsZBUQ4RGDX2iUcMrQu7MC2OF@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784047538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SuZC6t1UYlFciBpg1zV84k8LEGoSNzJaZwOR2qwxHEI=;
	b=RU4u4UaLHIOYq/6cArGMXnnBFwE0Hml+tBpbSFuzeTRcF+nZ4nH+tH4LLnnreDxDNwHLmE
	ZwTdw8uElX3+9W714bYb/tHujXb8L8ygqXMwyLEnnPVPaSBQMAWF4rVXfTvpusiORaPncz
	2NnpR/gDs+U1to1KMnf2ku3WqJ0czJM=
X-Gm-Message-State: AOJu0Yw6uFO3C3mVKkk7+qHW+sXLT7YsYcJZzVgzcPxsOv5dV/HJu8Lz
	lWcknVBe6dajcHsW2l5afFoUJNWHVH9SnRV/yNaz5ky614c1o7e1Rh1vH1YT6PkJC6vDXzwmKeN
	/1cA5iwpnTfKGWnPLoHbHRB2JlV9Rm+wUaSxWFahV
X-Received: by 2002:ac8:5884:0:b0:51c:7a8b:c401 with SMTP id
 d75a77b69052e-51d7bdc0864mr16190161cf.26.1784047534927; Tue, 14 Jul 2026
 09:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260714101601.4142645-1-fuad.tabba@linux.dev>
 <20260714101601.4142645-3-fuad.tabba@linux.dev> <86ik6hoayl.wl-maz@kernel.org>
 <CA+EHjTxtOhC=f0K=j-ka5A0nPtU0S_5vbnZcVhTOViHX6WMi=Q@mail.gmail.com> <86h5m1o79h.wl-maz@kernel.org>
In-Reply-To: <86h5m1o79h.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 17:44:57 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzpN2CW4xTmf_v7eP=1YE1NxGowWOfzN3dDUT5pG61NJw@mail.gmail.com>
X-Gm-Features: AUfX_mznT_SLWLuauUrlhHI9C3W65sxw9EWRoDLi0nznfhEJGm_X5GEVQufJlLo
Message-ID: <CA+EHjTzpN2CW4xTmf_v7eP=1YE1NxGowWOfzN3dDUT5pG61NJw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_094542_251562_2C608E6A 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, 14 Jul 2026 at 17:39, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 14 Jul 2026 16:32:54 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > On Tue, 14 Jul 2026 at 16:19, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 14 Jul 2026 11:15:55 +0100,
> > > Fuad Tabba <fuad.tabba@linux.dev> wrote:
> > > >
> > > > The vcpu_{read,write}_sys_reg() accessors are only valid on a VHE host,
> > > > so helpers built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be()
> > > > cannot be shared with hyp code. exception.c already wraps them in local
> > > > helpers that pick the host- or hyp-side accessor via has_vhe().
> > > >
> > > > Rename the host-only implementations to __vcpu_{read,write}_sysreg_vhe()
> > >
> > > I'm a bit puzzled by this. There is nothing that makes these functions
> > > VHE-specific. Look at where they are called from: plenty of non-VHE
> > > uses. These helpers are the canonical accessors for any system
> > > register, and they don't cater for any particular mode.
> >
> > I might have misunderstood what Oliver asked me to do here [1]:
> > > Can you instead name the wrappers vcpu_{read,write}_sys_reg() and rename
> > > the current implementations, like __vcpu_{read,write}_sysreg_vhe()?
> >
> > Since they're only used and gated by has_vhe(), they're vhe-specific?
>
> But they factually aren't VHE specific. Look at sys_reg.c, for
> example. The whole point is that they abstract where the registers are
> located, irrespective of the KVM mode.
>
> The code in exception.c is actually a local specialisation of this
> code for the nVHE code not to explode. And the exact same effect could
> be achieved without repainting the whole thing and renaming *perfectly
> named* accessors! ;-)
>
> Something like below (compile-tested only).
>
>         M.

If it's fine by you and Oliver it works for me. I'll respin with that.

Cheers,
/fuad

>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 9d9e7674d45fe..5ea708ff29436 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -526,6 +526,14 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
>         return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
>  }
>
> +#if   defined (__KVM_NVHE_HYPERVISOR__)
> +#define vcpu_read_sys_reg(v, r)                __vcpu_sys_reg(v, r)
> +#define vcpu_write_sys_reg(v, x, r)    __vcpu_assign_sys_reg(v, x, r)
> +#elif defined (__KVM_VHE_HYPERVISOR__)
> +#define vcpu_read_sys_reg(v, r)                vcpu_read_sys_reg(v, r)
> +#define vcpu_write_sys_reg(v, x, r)    vcpu_write_sys_reg(v, x, r)
> +#endif
> +
>  static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
>  {
>         if (vcpu_mode_is_32bit(vcpu)) {
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index bef40ddb16dbc..754e2dc1df54a 100644
> --- a/arch/arm64/kvm/hyp/exception.c
> +++ b/arch/arm64/kvm/hyp/exception.c
> @@ -20,22 +20,6 @@
>  #error Hypervisor code only!
>  #endif
>
> -static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> -{
> -       if (has_vhe())
> -               return vcpu_read_sys_reg(vcpu, reg);
> -
> -       return __vcpu_sys_reg(vcpu, reg);
> -}
> -
> -static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> -{
> -       if (has_vhe())
> -               vcpu_write_sys_reg(vcpu, val, reg);
> -       else
> -               __vcpu_assign_sys_reg(vcpu, reg, val);
> -}
> -
>  static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
>                               u64 val)
>  {
> @@ -101,14 +85,14 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>
>         switch (target_mode) {
>         case PSR_MODE_EL1h:
> -               vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> -               sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> -               __vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
> +               vbar = vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +               sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +               vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
>                 break;
>         case PSR_MODE_EL2h:
> -               vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
> -               sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> -               __vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
> +               vbar = vcpu_read_sys_reg(vcpu, VBAR_EL2);
> +               sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL2);
> +               vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
>                 break;
>         default:
>                 /* Don't do that */
> @@ -185,7 +169,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>   */
>  static unsigned long get_except32_cpsr(struct kvm_vcpu *vcpu, u32 mode)
>  {
> -       u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +       u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>         unsigned long old, new;
>
>         old = *vcpu_cpsr(vcpu);
> @@ -281,7 +265,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>  {
>         unsigned long spsr = *vcpu_cpsr(vcpu);
>         bool is_thumb = (spsr & PSR_AA32_T_BIT);
> -       u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
> +       u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>         u32 return_address;
>
>         *vcpu_cpsr(vcpu) = get_except32_cpsr(vcpu, mode);
> @@ -305,7 +289,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
>         if (sctlr & (1 << 13))
>                 vect_offset += 0xffff0000;
>         else /* always have security exceptions */
> -               vect_offset += __vcpu_read_sys_reg(vcpu, VBAR_EL1);
> +               vect_offset += vcpu_read_sys_reg(vcpu, VBAR_EL1);
>
>         *vcpu_pc(vcpu) = vect_offset;
>  }
>
> --
> Without deviation from the norm, progress is not possible.

