Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B62C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/qmxXI3vhQKLCfYbPoUsffl13b60WKnwFwLUWZ4heA=; b=Q0kT3XheCA6B8lYztXXICriW36
	P7fCIAmTakuE3LSUNjsdPj11yfQA2VfRYLOMKdr43j1QSriNFWH6+OJxaZZzVqidqzrUQhtyr7765
	4daVNWSJyQHphDvGyxUXKFW5AYQYgWsWFtR5rJQmDWBitFY22D5XO4E0IAkZSSPeY+J9uvJmu9F8D
	kFdvPsClZBSelUOhGvwRR+DUPvJRtulSAe8Tz6C+y0Cj0Eu1M6kYQxzgqVY+DslYHMrqxBFOmsK4s
	8qm8xdYiyX4FaTmiwYs53BvWFKn4rtBNhoQeigYoSUeld5QbMecKMonzRf7WidQTEsI3nsnRSaZBm
	tHGjky5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PVU-00000005mzv-2B2U;
	Tue, 15 Sep 2026 09:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PVS-00000005mzg-49Ab
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u/qmxXI3vhQKLCfYbPoUsffl13b60WKnwFwLUWZ4heA=; b=Ovv3U/nQ6m5+PmOVDcyGHZDzQ6
	g4/5o5RyEeP8RAvkRjLIFhROIuYISdnWF5aaPooX3pH3XgGwgASXscXSxYBkjnZ2FbxPg/6Sdvws1
	KI8iuEhSstrnAnmu2e4+tVtQzYjrs3T2ahSQ7STS50T4U7VACpJQ46BQzN9VbsZyRfymKhjrh7C/o
	aAggaifBDXkMNesbarnnTnzsIh7dS7BdN5Kl1D2n+JXg+aAR4UKYJv2bl5pynmBJLoyFEMRX13CI4
	HGEV5OPNNqOsCMJhuviCksefa3gasC0ULXWhI2QL3YVENEFgWAHVuDM8dXCykc0podkcFOYCaouDn
	lnKSFzmg==;
Received: from out-65.mta0.migadu.com ([2001:41d0:1004:224b::41] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6PVP-00000006V8F-44HN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:31:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=K1tpiBhMEi6xm6OL69dgTWLGxpnuijEoB8W6TLPj2Rw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789464670; v=1; x=1790069470;
 b=KUJWKNFhaJdCjfRdCXXDPcBo/wk8Q3ZCvQe07alMpJ3xIUPzqTorifRXuM5ebq2bAvnGH+xk
 vhOiHI4de1u8NVZzTBwFnmDU66sm5bqDJ3rdf1EzVQaSQIZV7/9PdSBEMExNnB3Vk5iA+I0FTrz
 GEUoZMoxzXZUZgUDQ2sDBU1g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 12370f03206ab20d;
	Tue, 15 Sep 2026 09:31:09 +0000
X-Mizu-Trace-ID: 12370f03206ab20d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3971e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUM0VaFtQMZQkcZoCJ5H3AynlKAHLsLH4qWhG4SvPfnWHeov1CpXt8jAdB5y29LqU/K88Xk3V63ArCrnyG4A6d@lists.infradead.org
X-Gm-Message-State: AFuF++lUDC9TEyZIwpG7hYioI/bJ9gF5dlX8JHYlr0qdZ+2Ip1Jdls9E
	q7KG8UEB8WwreS4/nmcYz4VbJ1agbx059p+rSPNmKZl4BKngsrvRoSWRiEqiiNKvFm28VorposQ
	ybWVzFyZAs5gbQZmWouyyI4frMTD/NQSoM1xidD2s
X-Received: by 2002:a05:6512:3dac:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8b2d0db8bmr149174e87.4.1789464668791; Tue, 15 Sep 2026
 02:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260914174521.832575-1-fuad.tabba@linux.dev> <86zexi6f4x.wl-maz@kernel.org>
In-Reply-To: <86zexi6f4x.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 10:30:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzWJGzVswdwckfU6ByYQWmQ4z7BU0wQWQTxxHsDjG=ZKQ@mail.gmail.com>
X-Gm-Features: AcwNN1UQshuXGF5Wu7l-zOdL8fXBqDP838U_-8aNt2NxCj12tCNZ1V9nXV-BhVE
Message-ID: <CA+EHjTzWJGzVswdwckfU6ByYQWmQ4z7BU0wQWQTxxHsDjG=ZKQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Reject the stage-2 MMU pointer hypercalls
 under pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_103112_168009_7C2618D7 
X-CRM114-Status: GOOD (  17.93  )
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

Hi Marc,

On Tue, 15 Sept 2026 at 10:24, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > @@ -602,6 +614,9 @@ static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
> >  {
> >       DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> >
> > +     if (unlikely(is_protected_kvm_enabled()))
> > +             return;
> > +
> >       __kvm_flush_cpu_context(kern_hyp_va(mmu));
> >  }
> >
>
> Anf why not __kvm_flush_vm_context()? It doesn't take a S2 MMU
> pointer, but it is still logically wrong to let this being called.

I'll respin these, as you suggest, and consolidate them. I'll mention
in the cover letter which series/patches the new one supersedes.

Sorry for the noise,
/fuad

>
> And the whole sprinkling of guards like this is just horrible. We
> already have a filtering mechanism, just make use of it:
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index bffdeb36da1d2..51bf30b671fe4 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -62,6 +62,11 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
> +       __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
>
> @@ -70,11 +75,6 @@ enum __kvm_host_smccc_func {
>         /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
> -       __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>         __KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>         __KVM_HOST_SMCCC_FUNC___tracing_load,
>
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

