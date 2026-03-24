Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3A2E9A762
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ2jUllXMrSnGG0Eo+HND4zIczab9TgMkKrI+S1FtAQ=; b=VWud3bCjw6KT5FXuzqXbmOUJtv
	vlxm2vAEco1/LleR5OugTk8sCsiafBaCgWhar/wBPmwhtko/XnmK/2YPLGgl2Pb981gNDP34FCXy/
	pTZVTI7CLZ55YLqtBDTdAuzi3yzUWeXxeaxnjkQQImIWWX7nL9Km9vxDILOh3yVp4WmrRdsZDfLG7
	E+5UMvS4p9eIvCERB9rpsGnzW+9vBOh/ZNkrlgy0TmYU8B+pkPgFXZswxXubUaWWV95RkATo74bIQ
	NC/Ir2MNkV0jfnEISLQK1zY1JooOnxHwrxb2oO7nlYbm37uZzup/svOM22nU2G8I3gh7/cuDLKwiW
	WDCAxytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zAL-00000001Dxf-2BK8;
	Tue, 24 Mar 2026 10:39:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zAI-00000001Dwo-2VSp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:39:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43b3f91a7abso689920f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774348753; x=1774953553; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZ2jUllXMrSnGG0Eo+HND4zIczab9TgMkKrI+S1FtAQ=;
        b=qfP1sdzRnAp6oQHVjdNtXNkxYkXz8cPl4HF6sxi/oajiqG3yZnP05rDig7mxzak4op
         yI1I9iQvY3SnodnJnMk1aUPW+yfzyGoq0tlALwQRmpn2yTN+po7osaE+1xmLwpigHvG1
         Ut+I3IkDWV2lOtUnT5Ar67ZWLEkKF3wdwT+XcXLfIfkdlU1WveXD8gMI4nyTv4FPN6h7
         iVJ53raBlGU72KOwIZZIG9ZlqwtqCmZbEmMF8wwGmV0jtcft5y9WVk1N5oX3ZSeV5uRB
         5pK4f2PTxCpqTrM9rJdh659S2ZsyHp4c1zZ47a8PnuMyXRIEnlECxjFk9eO3OM73iYuW
         tIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348753; x=1774953553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ2jUllXMrSnGG0Eo+HND4zIczab9TgMkKrI+S1FtAQ=;
        b=b1nqxW92uU7Z6+pBRBNDui6A1j+55ODDPgDSYiRhJSEhxDz1V8/wTHsyQfqFnBhbBY
         /Z0Wq23J4DYNsYSY2CFmuhQ1gRST4llbkvX7Fw7k0Q7YKMXj1XuJSgoStRpVqzkuY00R
         uVOuDQBTCGSSZaV6Q6BdiRRlJ53QcQSjwnpS6dZT4BW1JZ8oiu7yiwpV05Lrt972Lww2
         +t3Y/9EOvOR+0rVakZY96XzYURxftpnaMbkxXi2CIJf95GnjoQNcryTiF5TODpqngV67
         aGeDMGaoicpZGN4SLbTVm3GYysDKzJbFzZF8bIXsqLw7OMrDG9iFuies2plOcCBfy595
         szow==
X-Forwarded-Encrypted: i=1; AJvYcCXVdhpfF6mgOaexB+rd1yWvQ7XrupZAIWeMIUeH7JwAsYlDTogCqmmOUR+ZzdFHsnMHTqFHPHE44SgneKIXNcZi@lists.infradead.org
X-Gm-Message-State: AOJu0YzSMs357qlfZOPPvgaITJ/T0/wiF/V1dsf5qh2XtReGFyRF4Nag
	yWEuDWQNPz9cDot5ALWl4AjUtnQ6NhHi1ORpRrQtF9vBS4mlO+Km+eR6WLgwedel7g==
X-Gm-Gg: ATEYQzxD7vBWsmeDkUih70RvJyLaUujHRnM4SApnqxGYUug5xI8VndggaHehcEphYZK
	S6qcoY7BBfqJrhLRDXHSvJcoC1hgEIPZq6S1gAInAfFAc9+P9DEoh0TFpVbLvi/WsWeQ/SPZ6BA
	1npmez9IABmntnCKqpO/hsvTFBamMeU6rVJAemTquKEnU3XprbdQOJBfy4fQHQTi70nCDl8a36C
	jsOg9feVeE0LY85ORsd29gtnVnyAW957Vu1yqIoNgVbDQtsfwvlfq7nZtDA7XyBcNUCgWr9zz09
	1sjHIaOSgQ3lU1tXXEQqiMNpbhWPwah2AK/6tTJiDE2ZPeSyCymCB3Xk9NgolAi3Rcd0fLGgIVM
	fkg7+f2wqdNTfHDHF+Dn5+U1HrHTwyH1JLzBXf+lSWs3RylC3M7BLAewbl8o8d/KsV9EJPMjWYE
	fSCMHfEBm+zDsj6j1FNsv4Krrj1l+6Guk00OXK27TFPeHRfrGPQP0I31nL7GXH4WND14E=
X-Received: by 2002:a05:6000:2c07:b0:43b:4582:e90d with SMTP id ffacd0b85a97d-43b64287104mr22929928f8f.42.1774348751978;
        Tue, 24 Mar 2026 03:39:11 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd0dcsm36469256f8f.11.2026.03.24.03.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:39:11 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:39:07 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@kernel.org, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 01/14] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <acJpy7unwLbRahPL@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310124933.830025-2-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_033914_676953_A1B9842A 
X-CRM114-Status: GOOD (  32.35  )
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

On Tue, Mar 10, 2026 at 12:49:20PM +0000, Sebastian Ene wrote:
> From: Mostafa Saleh <smostafa@google.com>
> 
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can use that to protect the MMIO of IOMMU.
> The initial attempt to implement this was to have a new flag to
> "___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
> it was quite intrusive for host/hyp to check/set page state to make it
> aware of MMIO and to encode the state in the page table in that case.
> Which is called in paths that can be sensitive to performance (FFA, VMs..)
> 
> As donating MMIO is very rare, and we don’t need to encode the full
> state, it’s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner ID
> to prevent the host from mapping the page on faults.

I am not sure I agree here:

* Differentiating between MMIO and Memory is just a fast binary search into the
  memory regions.

* host_donate_hyp isn't a fast path even for memory regions anyway.

* Having common functions for changing ownership is more and more helpful (see the
  SME dvmsync workaround).

* There's nothing preventing from having a range here which is safely handled
  already by host_donate_hyp()

> 
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
> 
> For error path in IOMMU drivers, add a function to donate MMIO back
> from hyp to host.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 90 +++++++++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c                  |  9 +-
>  3 files changed, 94 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 5f9d56754e39..8b617e6fc0e0 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -31,6 +31,8 @@ enum pkvm_component_id {
>  };
>  
>  extern unsigned long hyp_nr_cpus;
> +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> +int __pkvm_hyp_donate_host_mmio(u64 pfn);
>  
>  int __pkvm_prot_finalize(void);
>  int __pkvm_host_share_hyp(u64 pfn);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 38f66a56a766..0808367c52e5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -784,6 +784,96 @@ int __pkvm_host_unshare_hyp(u64 pfn)
>  	return ret;
>  }
>  
> +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> +{
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	void *virt = __hyp_va(phys);
> +	int ret;
> +	kvm_pte_t pte;
> +
> +	if (addr_is_memory(phys))
> +		return -EINVAL;
> +
> +	host_lock_component();
> +	hyp_lock_component();
> +
> +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +
> +	if (pte && !kvm_pte_valid(pte)) {
> +		ret = -EPERM;
> +		goto unlock;
> +	}
> +
> +	ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +	if (pte) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
gg> +	ret = pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE);
> gg+	if (ret)
> +		goto unlock;
> +	/*
> +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +	 */
> +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> +unlock:
> +	hyp_unlock_component();
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> +{
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	u64 virt = (u64)__hyp_va(phys);
> +	size_t size = PAGE_SIZE;
> +	int ret;
> +	kvm_pte_t pte;
> +
> +	if (addr_is_memory(phys))
> +		return -EINVAL;
> +
> +	host_lock_component();
> +	hyp_lock_component();
> +
> +	ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +	if (!kvm_pte_valid(pte)) {
> +		ret = -ENOENT;
> +		goto unlock;
> +	}
> +
> +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +
> +	if (FIELD_GET(KVM_INVALID_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
> +		ret = -EPERM;
> +		goto unlock;
> +	}
> +
> +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> +unlock:
> +	hyp_unlock_component();
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 9b480f947da2..d954058e63ff 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1152,13 +1152,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
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
> 2.53.0.473.g4a7958ca14-goog
> 

