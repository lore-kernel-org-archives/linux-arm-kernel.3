Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1234C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pDkRGaYym4iXIoAiNyXfWBGsGWfcCCYMQLXWrwDv3A=; b=urzwneZrE0RebQyBflnIqE1TKP
	Vd8+Lr9nKer3/75Y5vouFK+Aa1CFt9X6fsKXWNEbwKdlcAth+iiszGEcDLSJt2BrMtCfJF5uLW3lw
	BDLmicqHMWgH9TY/bmHTvvbcqCF7oLa6LWuuxa6WbaooVW5OxaxWzvwEWchYLoRzQT5T+b39pvgQm
	caxIZJxbvl3+sBiDmkojaph8i1+e4C2GhY8u/PbIZw4gq5dNCJUpAYtQ9SZFBiEcQzEMooCfoPL7R
	C55wNcCZET9AAOYpJCE7wsmqwZmiQt6Z/Np7WtI0aPLwtiqrGvek5+5f2JQTAFKVUsZCjxP2jvDm/
	JFPgQB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbbf-0000000Bmia-2VjQ;
	Tue, 14 Jul 2026 11:47:23 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbaK-0000000BkQd-0hLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:46:23 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqkEG37rb1SAAo0zmG/1IeogEXIBVTEkwnHIhwf+ZvXg1GQMv4r7O/B+fUZoz1EXW6N4jScllIk9QsvJ3+7q/WX@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784029557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0pDkRGaYym4iXIoAiNyXfWBGsGWfcCCYMQLXWrwDv3A=;
	b=VPDOEB3pET+94E+APIbUWS1AG5o0UFWtaMFYEnHTjv2xHa4bUY9TU79oeCOas6hI0idlTt
	Pv8w/WrId/9vtaA54Xo6mJilCfh6YBXWC8f0a3QgKQcWKMqNQKAKGLQ1aMyWwEMcBb4ZDv
	vIOw/LDKJupJx34llRt3TwWOC0GnnLM=
X-Gm-Message-State: AOJu0YwRSUkwT2EFjZlqAvHCrjSzwS///ziBEq8KzeoDi0e7r5iDElYP
	za6LP3+2FuWulTwnPq6Ktl5GDfwAXvcpx/SStR1uLY9x70w6lufReIhzIGHysEIykxLDShNfd8j
	KTC+dTBlVgrfhRVnw56la/AD6d0M8P0iYPLe5OOd3
X-Received: by 2002:ac8:7fd1:0:b0:51c:9ad:d76 with SMTP id d75a77b69052e-51d7c6a8b03mr14122751cf.19.1784029540491;
 Tue, 14 Jul 2026 04:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260714110756.116950-1-alexandru.elisei@arm.com>
In-Reply-To: <20260714110756.116950-1-alexandru.elisei@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 12:44:57 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxFAqO38zZNTM5oQ26X7eUcu3ggfhMY2gn2bB4sMbOxoQ@mail.gmail.com>
X-Gm-Features: AUfX_mzZY9UVGBmT0JoFJAIUngCEaTE6JMkLfV1PK-I1CCi-zORRCvzJSWUlQsw
Message-ID: <CA+EHjTxFAqO38zZNTM5oQ26X7eUcu3ggfhMY2gn2bB4sMbOxoQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044600_511929_3804215A 
X-CRM114-Status: GOOD (  37.33  )
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

Hi Alex,

On Tue, 14 Jul 2026 at 12:08, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> The user cannot use MTE on VMAs created by mapping a guest_memfd file,
> as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.
>
> When creating a guest_memfd backed memslot,
> kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
> the VM and if guest_memfd has been mapped in a VMA that intersects the
> memslot.
>
> However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitly

nit: s/explicitely/explicitly/

> states that the only condition for userspace_addr is for it to be a legal
> userspace address, but the mapping is not required to be valid nor
> populated at memslot creation.
>
> If userspace sets userspace_addr to an address that hasn't been mapped, or
> if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
> file, or if the VMA doesn't intersect the memslot, memslot creation is
> successful and KVM ends up with a VM with MTE and guest_memfd-backed
> memslots.
>
> Forbid guest_memfd memslots unconditionally when the VM has MTE to prevent
> this from happening.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Is this worth a Fixes: tag?

> ---

git am chokes here: this kvmtool snippet between '---' and the real
diff parses as a stray patch fragment ("patch fragment without
header"). Worth indenting it or moving it below a scissors line ("--
>8 --") so the patch applies, though didn't test to see if this
actually works :)

>
> Tested by using Fuad's patches to add guest_memfd support for kvmtool at [1],
> with the following changes to arm64/kvm.c:
>
> @@ -125,10 +125,12 @@ static void kvm__arch_enable_mte(struct kvm *kvm)
>                 return;
>         }
>
> +       /*
>         if (kvm->cfg.arch.guest_memfd) {
>                 pr_debug("MTE is incompatible with guest_memfd");
>                 return;
>         }
> +       */
>
>         if (kvm->cfg.arch.mte_disabled) {
>                 pr_debug("MTE disabled by user");
>
> and kvm.c:
>
> @@ -332,8 +332,15 @@ int kvm__register_mem(struct kvm *kvm, u64 guest_phys, u64 size,
>                                 .guest_memfd_offset     = guest_memfd_offset,
>                         };
>
> +                       if (munmap(userspace_addr, size) < 0)
> +                               die_perror("munmap hack");
> +
>                         ret = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION2,
>                                     &mem2);
> +
> +                       if (mmap(userspace_addr, size, PROT_RW, MAP_SHARED | MAP_FIXED,
> +                           guest_memfd, guest_memfd_offset) == MAP_FAILED)
> +                               die_perror("mmap hack");
>                 } else {
>                         struct kvm_userspace_memory_region mem = {
>                                 .slot                   = slot,
>
> (not pasting the full diff because last time I did, git got confused and
> considered the snippet part of the actual patch).
>
> Without this patch, I was able to create a VM with MTE and guest_memfd
> backed ram (the guest reported MTE as enabled, but I didn't test that it
> actually worked).
>
> With this patch, creating a VM with MTE is rejected.
>
> [1] https://lore.kernel.org/kvmarm/20260712142536.1391557-1-fuad.tabba@linux.dev/
>
>  arch/arm64/kvm/mmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6c941aaa10c6..30c2ea235fa5 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2648,8 +2648,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>         /*
>          * Only support guest_memfd backed memslots with mappable memory, since
>          * there aren't any CoCo VMs that support only private memory on arm64.
> +        *
> +        * MTE is also not supported with guest_memfd.
>          */
> -       if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
> +       if (kvm_slot_has_gmem(new) &&
> +           (kvm_has_mte(kvm) || !kvm_memslot_is_gmem_only(new)))
>                 return -EINVAL;

This folds two unrelated rejections into one condition. I'd split them
so each carries its own comment:

        /* guest_memfd is incompatible with MTE. */
        if (kvm_slot_has_gmem(new) && kvm_has_mte(kvm))
            return -EINVAL;

        /*
         * Only support guest_memfd backed memslots with mappable memory,
         * since there aren't any CoCo VMs that support only private memory
         * on arm64.
         */
        if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
            return -EINVAL;

More importantly, this only closes one direction.
prepare_memory_region() runs on memslot changes, but KVM_CAP_ARM_MTE
gates only on !kvm->created_vcpus and never looks at memslots, so the
reverse order still gets you there:

      1. KVM_SET_USER_MEMORY_REGION2 with a gmem slot   (no MTE yet -> ok)
      2. KVM_ENABLE_CAP(KVM_CAP_ARM_MTE) (no vCPUs -> ok)

Since the justification is that userspace can do unexpected things,
the enable-MTE path wants the symmetric check too (reject if a gmem
memslot already exists), or enforce the invariant at one choke point.

Cheers,
/fuad

>
>         hva = new->userspace_addr;
>
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> --
> 2.55.0
>

