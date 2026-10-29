Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF043606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B0zyGJUr;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BRwF1IbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PoVbrwCfEjEF6sp4WaMxqKx0B+uh55PhpThxxt4vZZ4=; b=B0zyGJUrjF+3YpwPaW0VOFnGuG
	idsLHqUTCHytR5wJB1T74wjhL/5eoxpRLIrhoS4do57rEycI71erOBVxNHg5oDMT6CBEcHE3A59E6
	uZMPrSKAdecrDQKV5jE1+Iu7rgBx6mgOWQJ81EbwAUsUZpRp3DjzUdiQg2PBKEL6ufW8xwUa6pFIW
	5e6qcPMEgxW4lJg4WKIarQKt1y96swITz1hVx35gSSfbGlPOPk6YIsWpGf7BHrhv1Sz7VwKfaVKkh
	Sl4SYMKZxd8wXkDYcUD0uy0/80O7igyQe/LO51YzsQa8L5xQior9U/v1s37PqLI1gNjoL/2kHlpUc
	qkXUdqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSlj-00000009m8u-09sC;
	Thu, 29 Oct 2026 16:14:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSlf-00000009m8M-3yJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:14:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so25984315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793290457; x=1793895257; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PoVbrwCfEjEF6sp4WaMxqKx0B+uh55PhpThxxt4vZZ4=;
        b=BRwF1IbSf1I16oatAuYP1vsRGxzC2WUN9QufweeiBfNkLAIsKpUNbLIlIbAuRYe5/O
         AsP3OE1bdy69WcjUb21j3fX/A2E21MHNuQwx+4yyKzDqLhFfA7UrUhMhA1TasSNuVCl+
         tu4yoFREfC26VXI9PQn3PRS0ShbN5orxkS3pj5+W3SOWsd1KBi/EaI7uSYtqDxzMYyMd
         Wti6hfAaDFe4MIukTqZn2dF8yaRikGHPJBgTnoaaWwKAyjCBlXE+40srRTE3hjGTNd5S
         SaBABshf8GoyTDSj1RFGVBlPUjDRRU8grQ/V/Xc7PGY1SU2nxw4c0RCT0ENQxkJ3aTV0
         GA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290457; x=1793895257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoVbrwCfEjEF6sp4WaMxqKx0B+uh55PhpThxxt4vZZ4=;
        b=y4Bjmee2hRz4J0f0DnmkvZDr0Fc7fuFULSO2ixoJnQL52wg/iDU+Nah69OofdO8hRK
         bVTA9Z+qMCgFm/HdMuM5ra39onONWS/2robZAHn6FUr5WsVNplwVUxthJoKZ2nbnogQt
         GVmHAGHPVhB5hpXxokJA28VyG+lPZ4YPlPG5z9irvQVDmaXO/2y2cU+FguuIOzlJYb5Q
         7jPQQfdyMGH1dpk2+GzexP8mJIr0JqqmUpTyt+OAX6EeiqkLCtDOx9e4tMpII13am3Kg
         jU3EgsKaATHsCsEQF5EGDeA6HEFtXreyvQ/Pf/ksjIG041YQgMNy8RhON6/jxMQ0R51V
         jSPg==
X-Forwarded-Encrypted: i=1; AKwUvByUL7gSkfsc6FpGYemJNQNQHDHLqtjXQXkFRIzPab4O4fJzLbtsPLD+gIeOTfsDk80s5lC6GEiuWX65ZzckdxWK@lists.infradead.org
X-Gm-Message-State: AFq9FYIqtKQuJuuqt3BKo8pMannS4HjSIsjjyfc4RN8N0ifj2J+80WXN
	5TsZDs3NBGP6fP7a77Cz7Huur53sDuNdXUWpjL+fI/1+gsTSMq3W6vhwf13xUzOXvg==
X-Gm-Gg: AYBFou3b8mZoOFgb/Fm/Bw6dTcpbsGQ4vIMNWVynjzFilTI1TaSZxlil4PreKcS2Cdt
	3t7OmwTGeFhAaL27J4sPXU45z2y32zVDjN3KBwvgcqfLBbDHaub0Gqt2WpUOsquo1lbSjm19IcB
	zBZjb3KpTWaNasNL4rE/8UjQamyLgiQ/YYp7hPirYSclxMF72gWDUysuZTTyyY4aUVh5RGZx1gW
	PQeh/r8X7xbZC+3m8euKmfFNW9XyKeYhxl1i0uswFXLv8m4OsFH7/3ECBdk2FbDKZ+7iAdM3qkA
	mQ04hf4/NdpVy5xLu8lkxKMVnGfp42GCNTWNyM3SuQFSdhmy/x1f5vwYiumkTh4YKzdNJeN1W8Q
	u7L9doN18NZ8GHWQTOtN5KCHHT6V3+YXxIZS4WVPR4/f4ibK8c8jPX9y/IRz9FMP836HqGNzSXK
	UbSIrWa/UexfZ8GpavH+Cdh45VKdsAsWTnhleyWbulUHYRRxlSR6unNWCFdd5TGzSlcW/lgXNTG
	lN7CIEgpyoEYmYgm/W1nlP0ydc0ugTTd29EjsrkzzRhuiSh7KHn6FISdJGWgNVBeI/Ii41wP1z4
	+0eRTHTZKg1IW+hp1zK4vt7FtuQr0Xs3r4PgqMEzSdRjZMdmL+nR3JiUJubuF02uKQ==
X-Received: by 2002:a05:600c:1913:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a96552db88mr133139285e9.0.1793290456110;
        Thu, 29 Oct 2026 09:14:16 -0700 (PDT)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm118585755e9.1.2026.10.29.09.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:14:14 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:14:10 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com, weilin.chang@arm.com, tabba@google.com
Subject: Re: [PATCH v2 22/22] KVM: arm64: Stage-2 huge mappings for protected
 VMs
Message-ID: <auNw0iXzwKkOSJAa@google.com>
References: <20260911135053.146435-1-vdonnefort@google.com>
 <20260911135053.146435-23-vdonnefort@google.com>
 <20261029152959.3552746-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029152959.3552746-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_091420_031721_A37B7DFF 
X-CRM114-Status: GOOD (  29.37  )
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

On Thu, Oct 29, 2026 at 03:29:59PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 11 Sep 2026 14:50:53 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> [...]
> > @@ -513,17 +512,23 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> [...]
> > +                /*
> > +                 * If a huge mapping overlaps an existing PAGE_SIZE one,
> > +                 * then the VMM has played games with the stage-1. Abort.
> > +                 */
> > +                if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
> > +                        return -EFAULT;
> 
> A guest can hit this on its own, without the VMM touching its stage-1.
> I ran into it while porting your unposted v3 to android18-7.3, and v3
> has the same race. A pVM shares one page of a 2M block, and another
> vCPU touches the block during the split's break-before-make. The host
> sizes that fault at 2M from the THP, but under the mmu_lock it finds
> the split's PAGE_SIZE mappings.

Nice catch!

> 
> I made the following change in the android18-7.3 port. It maps just
> the faulting page, since retrying alone re-faults forever if the VMM
> puts a fresh THP behind a partly mapped block. If you're happy with it,
> can you fold it into v3?
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 70b002eb17e05..72fc2577f51cd 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1921,6 +1921,7 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	struct mm_struct *mm = current->mm;
>  	struct kvm *kvm = vcpu->kvm;
>  	void *hyp_memcache;
> +	u64 size;
>  	int ret;
>  
>  	hyp_memcache = get_mmu_memcache(vcpu);
> @@ -1936,13 +1937,21 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	if (ret)
>  		goto unpin;
>  
> +	size = s2vi.vma_pagesize;
>  	kvm_fault_lock(kvm);
>  	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
>  		ret = -EAGAIN;
>  	} else {
> -		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), s2vi.vma_pagesize,
> +		ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), size,
>  					      __pfn_to_phys(s2vi.pfn), KVM_PGTABLE_PROT_RWX,
>  					      hyp_memcache, 0);
> +		/* The block may hold PAGE_SIZE mappings from a split: map the page alone. */
> +		if (ret == -EAGAIN && size > PAGE_SIZE) {
> +			size = PAGE_SIZE;
> +			ret = pkvm_pgtable_stage2_map(pgt, ALIGN_DOWN(s2fd->fault_ipa, size), size,
> +						      page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
> +						      hyp_memcache, 0);
> +		}

I do not believe the retry does anything, this would just hit the "if (mapping)"
path in pkvm_pgtable_stage2_map().

And in any case, the split will remap the entire range at PTE-level. This is
just transient and it is safe to return EAGAIN.

To keep the return -EFAULT, I could eventually mark the mapping as "split in
progress". 

-- 
Vincent

>  	}
>  	kvm_fault_unlock(kvm);
>  	if (ret) {
> @@ -1953,6 +1962,9 @@ static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  		goto unpin;
>  	}
>  
> +	if (size != s2vi.vma_pagesize)
> +		account_locked_vm(mm, (s2vi.vma_pagesize - size) / PAGE_SIZE, false);
> +
>  	return 0;
>  unpin:
>  	unpin_user_page(s2vi.page);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8a74df9f9fec3..6b5df4595f6a6 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -650,14 +650,8 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  			return -EINVAL;
>  
>  		/*
> -		 * If a huge mapping overlaps an existing PAGE_SIZE one,
> -		 * then the VMM has played games with the stage-1. Abort.
> -		 */
> -		if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
> -			return -EFAULT;
> -
> -		/*
> -		 * We either raced with another vCPU or the guest PTE
> +		 * We either raced with another vCPU, a block overlaps the
> +		 * PAGE_SIZE mappings of a guest-driven split, or the guest PTE
>  		 * has been poisoned by an erroneous host access.
>  		 */
>  		if (mapping) {
> 
> Cheers,
> /fuad


