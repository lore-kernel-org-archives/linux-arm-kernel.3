Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E2606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xaz5ZYJC;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FCzsCRY4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6CgjKg/3/psOIxUuK5q285w2IQi6C1pf40CdYrOsTT8=; b=xaz5ZYJCJZ+DA+WZuZDnvdr9VX
	gFkuCiXJfcKYODefpd70y8F1LXXtVj65wKfVMJs8aJneekrZDWLLQox06D4HEVCnanNii+xjRolHs
	GvUxZqxw5A8eE533Ccv3TDovghr+FV28U4iU3OTIodEk/AcKJBVoQlhvC3siL0OMba+SJPTQeAx6x
	fhiD2zw76Y0j5jWpu5Ax6pIRIx1ZgJ/EbQUGslvWHn2tNIfXF34pa7EMZyf6BMZVdyBSm/mgkmVqQ
	JzrpTM2Riq6/tB3fpSozqvi/Gj5U9EK/K4g8YUNpzHf3mynKXnbScmmQNpySjRgFNVSm2UkqYVme6
	DropnNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsvh-0000000Gm95-266M;
	Mon, 02 Nov 2026 14:22:33 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsve-0000000Gm7A-2Tel
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:22:31 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23195575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793629347; x=1794234147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6CgjKg/3/psOIxUuK5q285w2IQi6C1pf40CdYrOsTT8=;
        b=FCzsCRY4u1NvprxV3NOUViJyQRZ3K62LEbhsXHwa1ngJE9VYOkizqIhsdRyNikD2wS
         YysSBbUyzmgjKZapu8/GOIMWKCOvEegnJ0BNzgji7ePodZn7R7LzjT8hm2b3aGRsH2fM
         3MRusS+mU08ODQELP68H9vAgr3NQwyR0iOGuxtREh7n4dFCEs3pJJJXnpZzpEIjI0YeQ
         nYrHQbQGNcjI9fg6PWgjKT8zlwTWfHyKZUi27iZBr4W6oo3Rq2AjE+956f6ZO04UFLNA
         MKLXsc11s7CGN7qMzidfMeBA/xMoNSxLrdM6Oi116w3AQ58RImcWn2zhdQjtVGdsJyai
         Xmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629347; x=1794234147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CgjKg/3/psOIxUuK5q285w2IQi6C1pf40CdYrOsTT8=;
        b=Ld8UicLZLR554xHhyer1Hyqy8y9V5owfLscEM6zZAzTQW3+EzLnmFXdk5gwgwtJnkJ
         SZmqxRW7i3eVfTk/Rpfurvv/spi5oXAxPEZDiKxR9SWOYu/stRWtLQnGKH3H9obGg1Oj
         MXvMLbPmIXf7AZJIPhXA80kBBfybR40dyxMpJEItN4CKV9IwblQUxlmwrxwhVOIU9RSk
         tVNNtXnV/XynbjrlYAqhOL3znI8GcCA9zqR+FpgxKnIrVj3wxPWYlYMIb3J8quX2YXVE
         csAgBnlQBJw/iHeG6PMdSa0V4Hn+8PArMUngm5VxbgeK9T9nbK2AqlMZFS/1U7aJ6WTd
         PUfA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ7IJ8Q6TsUReNvqQLXEdANNAhOjFlSwuMsVeztmjGgiZOEe7ZBxnJzA7zXeMjsgqwY+fQHAALS/LjyOvDwXuZ@lists.infradead.org
X-Gm-Message-State: AFq9FYI25wzp8OnLr86ptUGyxZyK5QPJxb4FkdR2ANRLqqH1YZHqRCnP
	LzsC2V4bcpZFu/6ODvN7xWVFfMiKuQIm2GA54wUaGbizHlzylzcvefkCKqc8YqnYzQ==
X-Gm-Gg: AYBFou3GISGbFYk6oum+tz6oJNxJlFSNPaxSiusddjwy4Q/1Ym33K/yVpgWnfB2rS27
	eEBEfhq05Hw8l8R7m2ZceRjUVUcJVuHeSYgoBCGJcv/4ERUzRLNBnb7dgZhhA109rRoWJCrmlfZ
	EJLWxNcY1ylFNS2HElWzr+OWrF1orlazwnfWM/vkjEjMEZn/00zwTsRVpRfoz9TkSUmVtBUYIdr
	K4ytOySYzG8iLXh+Ea4D055dFF8vJLoKRnUMlMlur76s0TYRwgliHxbJFRdDIgoRmz2NZm0vCuh
	JKonEPSDdlvgPafcqDX1B/u84//ePC+/ZFq5l5O2ziEiCpMnrbSiVtSI0ZNSGdmwd4Fw+8StD8m
	QN3whbWpl6tem3oLjZB8n+qZtQNrSNtthzqdX3Fmru+24zlmYr+TDm4zMtVnsaTKkmZLZ42sqL4
	GZ8iElZepQi0C/laFWPK7aTbJjR9SfEmzHJbF6CxI9sgVLAwgIZ4HK1m70TaBhLx0R6v5iD/oYs
	AlFvbpGugSfQK4PXkFgUCoXdHaI6RCV60g93QLTgg+PRFhCay3VNzqXzTxLrZ8EscxM8VkuKyVB
	8q126AUPxZwqN6uxuZo8VKytXfLVtjAp/ed27zBn9WgcneLbCSakhWPeSuA8kULw
X-Received: by 2002:a05:600c:a4c:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4ac17d16ba4mr230939115e9.9.1793629346820;
        Mon, 02 Nov 2026 06:22:26 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm377375025e9.13.2026.11.02.06.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:22:26 -0800 (PST)
Date: Mon, 2 Nov 2026 14:22:23 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com, weilin.chang@arm.com, tabba@google.com
Subject: Re: [PATCH v2 22/22] KVM: arm64: Stage-2 huge mappings for protected
 VMs
Message-ID: <auicn7PMiw-gezy0@google.com>
References: <20260911135053.146435-1-vdonnefort@google.com>
 <20260911135053.146435-23-vdonnefort@google.com>
 <20261029152959.3552746-1-fuad.tabba@linux.dev>
 <auNw0iXzwKkOSJAa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auNw0iXzwKkOSJAa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_062230_682274_B3E75768 
X-CRM114-Status: GOOD (  35.43  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 04:14:10PM +0000, Vincent Donnefort wrote:
> On Thu, Oct 29, 2026 at 03:29:59PM +0000, Fuad Tabba wrote:
> > Hi Vincent,
> > 
> > On Fri, 11 Sep 2026 14:50:53 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > [...]
> > > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > [...]
> > > @@ -513,17 +512,23 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > [...]
> > > +                /*
> > > +                 * If a huge mapping overlaps an existing PAGE_SIZE one,
> > > +                 * then the VMM has played games with the stage-1. Abort.
> > > +                 */
> > > +                if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
> > > +                        return -EFAULT;
> > 
> > A guest can hit this on its own, without the VMM touching its stage-1.
> > I ran into it while porting your unposted v3 to android18-7.3, and v3
> > has the same race. A pVM shares one page of a 2M block, and another
> > vCPU touches the block during the split's break-before-make. The host
> > sizes that fault at 2M from the THP, but under the mmu_lock it finds
> > the split's PAGE_SIZE mappings.
> 
> Nice catch!
> 
> > 
> > I made the following change in the android18-7.3 port. It maps just
> > the faulting page, since retrying alone re-faults forever if the VMM
> > puts a fresh THP behind a partly mapped block. If you're happy with it,
> > can you fold it into v3?
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 70b002eb17e05..72fc2577f51cd 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1921,6 +1921,7 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >  	struct mm_struct *mm = current->mm;
> >  	struct kvm *kvm = vcpu->kvm;
> >  	void *hyp_memcache;
> > +	u64 size;
> >  	int ret;
> >  
> >  	hyp_memcache = get_mmu_memcache(vcpu);
> > @@ -1936,13 +1937,21 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >  	if (ret)
> >  		goto unpin;
> >  
> > +	size = s2vi.vma_pagesize;
> >  	kvm_fault_lock(kvm);
> >  	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
> >  		ret = -EAGAIN;
> >  	} else {
> > -		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), s2vi.vma_pagesize,
> > +		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), size,
> >  					      __pfn_to_phys(s2vi.pfn), KVM_PGTABLE_PROT_RWX,
> >  					      hyp_memcache, 0);
> > +		/* The block may hold PAGE_SIZE mappings from a split: map the page alone. */
> > +		if (ret == -EAGAIN && size > PAGE_SIZE) {
> > +			size = PAGE_SIZE;
> > +			ret = pkvm_pgtable_stage2_map(pgt, ALIGN_DOWN(s2fd->fault_ipa, size), size,
> > +						      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
> > +						      hyp_memcache, 0);
> > +		}
> 
> I do not believe the retry does anything, this would just hit the "if (mapping)"
> path in pkvm_pgtable_stage2_map().
> 
> And in any case, the split will remap the entire range at PTE-level. This is
> just transient and it is safe to return EAGAIN.
> 
> To keep the return -EFAULT, I could eventually mark the mapping as "split in
> progress". 

I convinced myself the retry is actually interesting for the case where the VMM
is playing with the stage-1 mappings. The non-protected case supports it, so
there's no reason for the protected one to not. And actually it does support
directly into pkvm_pgtable_stage2_map(). So I believe that's where any sort of
retry should happen.

So I will try to refactor this path to avoid discrepancy between protected and
non-protected.

-- 
Vincent

> 
> -- 
> Vincent
> 
> >  	}
> >  	kvm_fault_unlock(kvm);
> >  	if (ret) {
> > @@ -1953,6 +1962,9 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >  		goto unpin;
> >  	}
> >  
> > +	if (size != s2vi.vma_pagesize)
> > +		account_locked_vm(mm, (s2vi.vma_pagesize - size) / PAGE_SIZE, false);
> > +
> >  	return 0;
> >  unpin:
> >  	unpin_user_page(s2vi.page);
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 8a74df9f9fec3..6b5df4595f6a6 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -650,14 +650,8 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  			return -EINVAL;
> >  
> >  		/*
> > -		 * If a huge mapping overlaps an existing PAGE_SIZE one,
> > -		 * then the VMM has played games with the stage-1. Abort.
> > -		 */
> > -		if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
> > -			return -EFAULT;
> > -
> > -		/*
> > -		 * We either raced with another vCPU or the guest PTE
> > +		 * We either raced with another vCPU, a block overlaps the
> > +		 * PAGE_SIZE mappings of a guest-driven split, or the guest PTE
> >  		 * has been poisoned by an erroneous host access.
> >  		 */
> >  		if (mapping) {
> > 
> > Cheers,
> > /fuad
> 

