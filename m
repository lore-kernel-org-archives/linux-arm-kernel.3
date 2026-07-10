Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F475C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HsR2t+CM1gEbj7YDybNgOOuROSnjWp8XwwNRjSK1d0=; b=foeat8U2h6QaddvTuLsgBoMYQK
	VUHuko1PfFNSpl+aJPQbFQWfFuMe6T26BlWXo1L/F0okPrSGd6n4hmEvLUcRPE9igc2mEdYQJbGn8
	arREdVLLlnX/x0zL776YUmgM0yNaUAyDzxUzzkVtWO1ll5COQIX1Yoge5/w9aoo3EXKnipn4GeOz+
	cMOK2N0iEkI+7Q2QZuWTNiLq08PgVAaVxvtLc2EFr0rd+dhpkGcEIzJU4boeCPLh3aanpUAoMwqF7
	szFrmDfzDU7Ee2y9io0LcyoAxuNQy9CLrTjCky4lWINiUeReV1pcfRu/PgsWBB/Ll3oFBb/cjsiG+
	+5Y5cnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEif-00000005Pwu-2y1a;
	Fri, 10 Jul 2026 17:08:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEid-00000005Pw1-2sV3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:08:57 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-804e46366d7so17719027b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783703334; x=1784308134; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HsR2t+CM1gEbj7YDybNgOOuROSnjWp8XwwNRjSK1d0=;
        b=P3wmftm3CqdNTG2PuJS9dI/lH6nIJmD21IimpklQWuh1ZrmSAQZe5z2rDKnebTZfif
         I40N0KBGiGycJf67b/KmeHy+KdVAdU6jsRxGVXaPCmQGwzcOL38G6xIOuKiMZsoX2ATQ
         7DscGFau07SnfF6U2gWh6N0HPZOFY505/aASU3inkal4w+bjtGXyuqXOejrDwTfMVeqW
         vTVMXJzi+7YSsTPf0lsnQKNympY1/ih7EiUo4yQ3obzb2AAVjhrnn3R7nGELfn16VsDc
         u9RmRb7WvLkP0Rugi5IqRmDjC1wIx0tnyeisuyC9PhT2FPDh4Q2Ma0y7oPX7NpTvDhKM
         e0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703334; x=1784308134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/HsR2t+CM1gEbj7YDybNgOOuROSnjWp8XwwNRjSK1d0=;
        b=ceHxkDCnDc6Vozkgu/lLnvd3JOtS5IH+nh20GArp+vI53aWWMpwPY65Zvw0+I3NUuF
         FYy616xmQ6jp9vaD/XHDPPvG8FBp1/nvBF0jQNwSUA4wbnJxQNd6w6fZshjiCQaoEdIs
         wDrJogh491C7SU5EXNFWf64hHp9Cq/QSyT6HZkM7iVA1+HQX18kGwo4FJEzHftyByZUO
         G5p+SF8WNagvYsakNLb2Zr3aXKL7nmdq0+wevaDtJqJlPTOC+EoslfMi4y62X7Ng6Uf8
         e8PpcDayHbnqyFf1r8Go9Ulpr2d0twVyIogqAqZSWlQ8UsGy7kNCdngMMRaJK1TVlrhd
         3zIQ==
X-Gm-Message-State: AOJu0YwkA3fBMyjaGRpM68juwMTs8brcFQWX70XTRWNgcD+xqF/fW5NK
	72EBrIrZIFVLAY5sGD7Q4ZBQzwnvKV/p5V/bmN3EsgHX7WmqZYLBc9LRm0hfyS/k+g==
X-Gm-Gg: AfdE7cm4fU5VdwQqXK4aQ9mHQdDfQyHiUCJBTspkEQJRx52evhfZl3vXAoyHYakw4ai
	Q1o7yE50fJcolvqs/X08eW7zEUP7jmetnPBU1zfdvU4QnonnFzNvb89jtNvUDvFt7YjU9IKLowS
	n94iHKFdC+2qijM7ypUtssvA3wlnBoRVlDUbRocFuEanJ109vcwN7Ut4EN2ilaSoGsBXHzD8nvF
	CGyJ1KjTMPzwb72bfD88TJejlIXFcxHHOm6g3NZANR1ZoD8sX+GZ2p4kah5683P9wqlCMs7e41U
	leBqQ4r8b40wfMO0AScUXUmNXIS/28Y3P98d5JvZPqiW9JBijqPvROHO+DzfKsYUX2TGCNlbb/w
	UToIrHm4lJFolt63m0FRScf20YqWqJ5HbIXMA7SPTwhPmoTLitIBUBXbdHK78lhYR0yYE+sx5Kh
	x7KzGUrfpC9RCYg1ram7BtIjTM5U30KYLFq4I2Vats4jMhVSxxqoc=
X-Received: by 2002:a05:690c:6e93:b0:81d:5489:a659 with SMTP id 00721157ae682-81dc10ed452mr89759497b3.63.1783703333968;
        Fri, 10 Jul 2026 10:08:53 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bea2114sm51042637b3.3.2026.07.10.10.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:08:53 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:08:47 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 02/25] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <alEnH98wFppYjmnE@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501111928.259252-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_100855_751335_74D0ECC6 
X-CRM114-Status: GOOD (  41.84  )
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

On Fri, May 01, 2026 at 11:19:04AM +0000, Mostafa Saleh wrote:
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can protect and access the MMIO of IOMMUs.
> 
> As donating MMIO is very rare, and we don’t need to encode the full
> state, it’s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner ID
> to prevent the host from mapping the page on faults.
> 
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
> 
> For the error path in IOMMU drivers, add a function to donate MMIO
> back from hyp to host. However, that leaks the hypervisor virtual
> address range which should be acceptable as this is quite rare and
> it matches the behaviour of fix_map/block.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 119 +++++++++++++++++-
>  arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
>  3 files changed, 121 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 3cbfae0e3dda..ff440204d2c7 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -36,6 +36,8 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr);
> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);

Can we have u64 pfn, u64 nr_pages here to match all the other functions?

Also, as this is used by a "module" perhaps a sort of kerneldoc would be nice,
especially to explain this isn't mapped into the hyp idmap range.

>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 28a471d1927c..2fb20a63a417 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -353,6 +353,38 @@ int __pkvm_prot_finalize(void)
>  	return 0;
>  }
>  
> +/* Unmap MMIO region while skipping donated PTEs. */
> +static int host_stage2_unmap_mmio_region(u64 start, u64 size)
> +{
> +	struct kvm_pgtable *pgt = &host_mmu.pgt;
> +	u64 unmap_start = start;
> +	u64 addr = start;
> +	kvm_pte_t pte;
> +	int ret = 0;
> +	u8 level;
> +
> +	while (addr < start + size) {
> +		ret = kvm_pgtable_get_leaf(pgt, addr, &pte, &level);
> +		if (ret)
> +			return ret;
> +		if (!kvm_pte_valid(pte) && pte != 0) {
> +			if (addr > unmap_start) {
> +				ret = kvm_pgtable_stage2_unmap(pgt, unmap_start,
> +							       addr - unmap_start);
> +				if (ret)
> +					return ret;
> +			}
> +			addr += kvm_granule_size(level);
> +			unmap_start = addr;
> +		} else {
> +			addr += kvm_granule_size(level);
> +		}
> +	}
> +	if (addr > unmap_start)
> +		ret = kvm_pgtable_stage2_unmap(pgt, unmap_start, addr - unmap_start);

Ah shame, that's a lot of table walking. I guess we could:

 * create our own custom walker here but that would duplicate a lot of logic
   from pgtable.c. So doesn't look great.

 * Retry kvm_pgtable_stage2_unmap() as long as it return -EPERM... but then we
   it needs to return where it has stopped?

 * Modify kvm_pgtable_stage2_unmap() to just skip the refcounted entries?
   There's already a flag something that looks like this: KVM_PGTABLE_WALK_IGNORE_EAGAIN

I am not so convinced by the first two points but the last one is probably worth
exploring.
 
> +	return ret;
> +}
> +
>  static int host_stage2_unmap_dev_all(void)
>  {
>  	struct kvm_pgtable *pgt = &host_mmu.pgt;
> @@ -363,11 +395,11 @@ static int host_stage2_unmap_dev_all(void)
>  	/* Unmap all non-memory regions to recycle the pages */
>  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
>  		reg = &hyp_memory[i];
> -		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> +		ret = host_stage2_unmap_mmio_region(addr, reg->base - addr);
>  		if (ret)
>  			return ret;
>  	}
> -	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
> +	return host_stage2_unmap_mmio_region(addr, BIT(pgt->ia_bits) - addr);
>  }
>  
>  /*
> @@ -1087,6 +1119,89 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  	return ret;
>  }
>  
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr)
> +{
> +	kvm_pte_t pte;
> +	u64 offset;
> +	int ret;
> +
> +	/* Only before de-privilege. */
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> +		return -EPERM;
> +
> +	if (!PAGE_ALIGNED(addr | size))
> +		return -EINVAL;

Would be nice here to have pfn_range_is_valid() even though this is only
used by modules? (ditto __pkvm_hyp_donate_host_mmio())

> +
> +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);
> +	if (ret)
> +		return ret;

Perhaps better to do it once it's been annotated into the host s2, so that we
don't burn the private range in case of failure.

> +
> +	host_lock_component();
> +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> +		if (addr_is_memory(addr + offset)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> +		if (ret)
> +			goto unlock;
> +		if (pte && !kvm_pte_valid(pte)) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +	/*
> +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +	 */
> +	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> +			      addr, size, &host_s2_pool,
> +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> +unlock:
> +	host_unlock_component();
> +	return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> +{
> +	kvm_pte_t pte;
> +	u64 offset;
> +	int ret = 0;
> +
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> +		return -EPERM;
> +
> +	if (!PAGE_ALIGNED(addr | size))
> +		return -EINVAL;
> +
> +	host_lock_component();
> +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> +		if (addr_is_memory(addr + offset)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> +		if (ret)
> +			goto unlock;
> +		if (!pte || kvm_pte_valid(pte)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}

It should probably verify it is also mapped as we expect into the hyp.


> +		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));

Perhaps we are better of simply zapping the entry and not map it proactively?

And even if we can't "reclaim" the VA-space from the private range, it would be
good to unmap it. I have made a function for that as part of the allocator
series:

https://lore.kernel.org/all/20260706175415.2604046-3-vdonnefort@google.com/

> +unlock:
> +	host_unlock_component();
> +	return ret;
> +}
> +
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 0c1defa5fb0f..b64a50f9bfa8 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1159,13 +1159,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	kvm_pte_t *childp = NULL;
>  	bool need_flush = false;
>  
> -	if (!kvm_pte_valid(ctx->old)) {
> -		if (stage2_pte_is_counted(ctx->old)) {
> -			kvm_clear_pte(ctx->ptep);
> -			mm_ops->put_page(ctx->ptep);
> -		}
> -		return 0;
> -	}
> +	if (!kvm_pte_valid(ctx->old))
> +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
>  
>  	if (kvm_pte_table(ctx->old, ctx->level)) {
>  		childp = kvm_pte_follow(ctx->old, mm_ops);
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

