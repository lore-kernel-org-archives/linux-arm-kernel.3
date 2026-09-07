Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B33C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1vepcmj6rDsLu88edRt9asSdaVkIpI6mD9170IPz4c=; b=S+TJbAjPvZxmgUxESYdU/Xoc+3
	1ELe/2rz3Q3LHYoMCm9bkpX063rRkgzHnS7w0N9PjYhvO8kc5fvHJi7pkoKpUo/fAR9fr+tyQ5606
	NZB8+AWw6F5mCecVXt2GqY8EFcQegizZF9dR9UgLhDBIR4CC/xOpOzVIDRPb9Ns6Ae0ikbDovfTIa
	JNGBrwsHWX84q+k8GgvdUsoTDxSktmEsz0kZq/lai9BKUdOf/KwHzN7hUshnCZ0nCgP1KJwRzewFJ
	mkFKXEeAImmNwxvMIRyhN8X1hG0SivUzTo5Dmv+c2GGmgMrKYmkLBuHd8yoBdH6ZtNQ40fn6o4cuO
	6IQGb4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WbJ-00000006UBb-3STD;
	Mon, 07 Sep 2026 10:29:21 +0000
Received: from out-120.mta1.migadu.com ([2001:41d0:203:375::78] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WbG-00000006UAp-22tO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:29:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gr4ntL2ls1kQt9OlB8hZM5ulhfyIRqyK823Iegsl1Sk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788776955; v=1; x=1789381755;
 b=k3dAdO9l3e6VBI+y6mF2I8sx2AwMCPquqqUUSaeKE96Ab7L+bc0tmCwxAQ/TxsKbtzgfzg39
 0gdBu07G1PyjU4ssM2aNdOTTkQK3Dr2yEZ1cSAF1y1g3JZRPcnYCxJVN/YKb+bCS2209QIbdbSW
 vUnb6NT7tfEXAhg3YiQzmXho=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 90d7772b263b108b;
	Mon, 07 Sep 2026 10:29:15 +0000
X-Mizu-Trace-ID: 90d7772b263b108b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so7901e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 03:29:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy51RnbQN7OPRm2wQnnEfq8wl7i0tqQYcSNgKTRPGLsBR8MlFMpVlOiJEHBFmMo2vFgdOeUlXhZddqM+55mRSch@lists.infradead.org
X-Gm-Message-State: AFuF++mjWHPlEUBK5xOXqdu3dsYw0wF9MwkGtyUuW+whnGyeQeJcWu5u
	da6NJ4ahsmv0d4i47UIr6JWSPWJDdtGdFUJ0q6jBk9mBhGA/P3vyH52gWh6rlk46ZYiaOv7bTH7
	1j+8RRw637O1cBMEg2HceQz2J6p5NRdvxnv2QK7Qm
X-Received: by 2002:a05:6512:3d22:b0:5a8:6646:d7b4 with SMTP id
 2adb3069b0e04-5b74d1f915cmr158049e87.1.1788776950693; Mon, 07 Sep 2026
 03:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260903160819.831518-1-fuad.tabba@linux.dev> <dd850141-ea85-4d94-9793-393f24a2fdc2@arm.com>
In-Reply-To: <dd850141-ea85-4d94-9793-393f24a2fdc2@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 11:28:34 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyuLKYE1UL4XYvq4rxW7fgFNafdTY8H0=Qt6Hnjz3wYvQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wj8Xs--qUJv8B64ImQS5H8o3vx5bKORqTK09jwke8ojoQgldDdImoBrM8
Message-ID: <CA+EHjTyuLKYE1UL4XYvq4rxW7fgFNafdTY8H0=Qt6Hnjz3wYvQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_032919_144325_6C20534E 
X-CRM114-Status: GOOD (  27.73  )
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

Hi Ben,

On Mon, 7 Sept 2026 at 10:12, Ben Horgan <ben.horgan@arm.com> wrote:
...
> > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > index 7404a6e83a930..8863ae99596bc 100644
> > --- a/arch/arm64/include/asm/cpufeature.h
> > +++ b/arch/arm64/include/asm/cpufeature.h
> > @@ -873,6 +873,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
> >       return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
> >  }
> >
> > +static __always_inline bool system_supports_mpam_sysregs(void)
> > +{
> > +     return alternative_has_cap_unlikely(ARM64_MPAM_SYSREGS);
> > +}
>
> The sashiko comments reminded me about the possibility of mismatched systems. I see two cases to
> consider here. One is if the firmware doesn't touch the MPAM system registers and leaves
> MPAM3_EL3.TRAPLOWER set to 1. In which case the user is required to add arm64.nompam to the cmdline
> as the MPAM registers can't be accessed from EL2. The second is if the f/w clears
> MPAM3_EL3.TRAPLOWER, in which case arm64.nompam can't be used without making MPAM1_EL1 etc, shared
> between guests. Perhaps for these mismatched systems we need to unconditionally enable the EL2 traps
> for the cpus that support MPAM and not advertise any support for MPAM. Furthermore, if we, before
> kvm gets involved, unconditionally enable the EL2 traps on systems where MPAM can't be enabled then
> I'm not sure that we need to distinguish system_supports_mpam_sysregs() and system_supports_mpam()
> in the kvm code. What do you think? Does that fit in with the pattern of how cpu features are
> generally handled?

This patch misses that case. check_override reads the CPU's own ID
registers, detect_ftr_has_mpam() the sanitised ones, so
finalise_el2_state clears the traps and neither cap is set.

Not advertising MPAM already happens, since a mismatch lowers the ID
field to 0. The trap default is the missing half, and I agree it
belongs in finalise_el2_state, which already computes whether
MPAM2_EL2 can be touched. KVM then needs only system_supports_mpam(),
and the cap goes.

The one host left is a forced nVHE, where test_has_mpam()'s MPAM1_EL1
read would trap before cpu_enable_mpam(). The respin makes the caps
false when is_hyp_nvhe(), so MPAM is off there rather than the boot
hanging [1].

I'll respin along those lines.

Cheers,
/fuad

[1] https://lore.kernel.org/all/apqrky27mJmUV9UA@willie-the-truck/


>
> Thanks,
>
> Ben
>
>
> > +
> >  static inline bool system_supports_pmuv3(void)
> >  {
> >       return cpus_have_final_cap(ARM64_HAS_PMUV3);
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 17b83a2518a8f..36a27692e5cf7 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2501,6 +2501,13 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
> >       return (read_sysreg_s(SYS_MPAM1_EL1) & MPAM1_EL1_MPAMEN);
> >  }
> >
> > +static bool
> > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > +{
> > +     /* The registers exist whether or not firmware enabled MPAM. */
> > +     return detect_ftr_has_mpam();
> > +}
> > +
> >  static void
> >  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
> >  {
> > @@ -3116,6 +3123,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >               .matches = test_has_mpam,
> >               .cpu_enable = cpu_enable_mpam,
> >       },
> > +     {
> > +             .desc = "Memory Partitioning And Monitoring system registers",
> > +             .type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > +             .capability = ARM64_MPAM_SYSREGS,
> > +             .matches = test_has_mpam_sysregs,
> > +     },
> >       {
> >               .desc = "Memory Partitioning And Monitoring Virtualisation",
> >               .type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > index 1ce7130e25490..8941335724f6b 100644
> > --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> > +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > @@ -298,7 +298,7 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
> >       u64 clr = MPAM2_EL2_EnMPAMSM;
> >       u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
> >
> > -     if (!system_supports_mpam())
> > +     if (!system_supports_mpam_sysregs())
> >               return;
> >
> >       /* trap guest access to MPAMIDR_EL1 */
> > @@ -317,7 +317,7 @@ static inline void __deactivate_traps_mpam(void)
> >       u64 clr = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1 | MPAM2_EL2_TIDR;
> >       u64 set = MPAM2_EL2_EnMPAMSM;
> >
> > -     if (!system_supports_mpam())
> > +     if (!system_supports_mpam_sysregs())
> >               return;
> >
> >       sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
> > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > index 2775ba3359cfe..aa5be51385f68 100644
> > --- a/arch/arm64/tools/cpucaps
> > +++ b/arch/arm64/tools/cpucaps
> > @@ -78,6 +78,7 @@ KVM_PROTECTED_MODE
> >  MISMATCHED_CACHE_TYPE
> >  MPAM
> >  MPAM_HCR
> > +MPAM_SYSREGS
> >  MTE
> >  MTE_ASYMM
> >  MTE_FAR
> >
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
>

