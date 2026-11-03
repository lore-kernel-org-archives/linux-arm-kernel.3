Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09734606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ULE/61hv;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nXXoVKG0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CWv72uCOCqMYoLAg7IauldxNcJXBuFWTSZgkJBhwQnA=; b=ULE/61hvlk8GAE1ipX1Z9/nZOS
	QuKzkwo5RoAXbUltWDGpP1/Drul6pP4+2xO6nXIEV0BKnwMTv77bZ2vLVg1TOOYJJlWiUxnjQ/YJ+
	gzEhPwJiBUccGUMzEctQqxQHNhk80PpHqktVGXiiHLVNAAspBnu8O7Y+vb/ANY9CkrJzaiG7pzEYI
	3TndbDhBR2FEKh+/gKxfKFLr05vXClkhwRfFs8LK+ywWdzi5RxKBy97pnY/Abj2Oyw/qwcsBJ0C8S
	UiS7G1g2SEMpM6nl33lpzMS4jQayI/HLR2zg17S4nPtpp2UDtLLXgXbXmsd2PfctoWsHmxDkjVPlb
	gnAByx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHWQ-00000003AF7-1VCB;
	Tue, 03 Nov 2026 16:38:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHWO-00000003ADJ-0k1q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:38:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df54150dfso2244610f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723882; x=1794328682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWv72uCOCqMYoLAg7IauldxNcJXBuFWTSZgkJBhwQnA=;
        b=nXXoVKG0ekFwtpal88ZgbSTDnfLoZ6b0gxx8FrQhhVSBmARrGQL7qqJCXZuScEGuHO
         DwPzHoNRFsLX6pvWlyPgiUK4X6VQyjtmjfQp1QWzS+SwrjG8q3mFKvIQ4p9BNdc6HKPx
         qw+1CcSXSEDoaU2s7Y1TZUCtrjEeeoThSm6aGa5k0oT7fLYO+CcmOeuyuxybFLz1qgtk
         a4HAvxHehChlIzzjPgTTAbAArTspWyicm4HQ8B1M5vRWb+m3X6A6pTy33sBhzdXbSy9P
         SKGVqyXaAeZZIykPmCvRAPWA/b8JkE4gNR3bVFMDs1iOh4iRuarArMeR3d9hs3gaovDt
         LJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723882; x=1794328682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWv72uCOCqMYoLAg7IauldxNcJXBuFWTSZgkJBhwQnA=;
        b=h3wX/uBZ1t+2J+5Cu8LFKFQN+Grc2oLMO8qbXB+6uQ2eK6pIWBt/htt9u8D8tKgBod
         5u0XmH6WxaFVLYAsplgk6dcxB2na6Mrs/4eNAw8qRvmFW5DHIqxEvHj4h0qyUCNdUUe+
         mrT/4B31Qtg6eAm3Rb2NEaYWPePtecSfbXWa8l1b+uY41MQ03N/d3Kv+SuVH3B85XOn0
         kkelyrd7E7ZJSxaZ30DqabM0etrQMaemGM+Pn3I+qvVr9urD29Of8eKlZ7vSOivo4bJo
         YOiuI5o3tS2rjlWRCW+mKMx90rj5m6R72Y+i5uoPMUmA7mhxPfTax2L2Jg4w66Vz9Ek0
         6eYA==
X-Forwarded-Encrypted: i=1; AKwUvByejDBuTOnCeNkyYkcp7iG3qni8Dbr4NNxpI2StOLaVHcgwtVB2WnMiVyXgkTIgiOYNTQx3xmjmoeHlJhP1+UPK@lists.infradead.org
X-Gm-Message-State: APuU4Z8q0GjUa88/QtMuUJjGfBItkA7ZYhxtI+M3ud9C5aqetJU0oHD9
	FCpPCNfJMhqV/C1ACMmC26+gkL269Mjlq/6D2BESoUxwmsXHuRp7O+yTHBp/5IfAhQ==
X-Gm-Gg: AYBFou0vCCoVCpP8zAKv1YDdxTKzveMqXQZY9YL5t3UHXCwFZ/TiL5an/iHieHpbyo+
	L3V5naMhzCruGQT1trzkvNH1R53fET4B1jjBg7m3YPFvd+u3JGpKj8CkZj9C6QarfsR3gFw+eSb
	8BCZbYe7CLudfKFVmWIpBF3NItly2tNfpxYxyT6IMk4d22FtBLmiob9jtUdXx4TxXtUg391qzR6
	7uD8FPYi3UAtcL9EJbq7kUtnECSDHWC8v0nV4ntAD1lY1uKhmJBkE1BnJ4o70pR2ADrJJC8yq2z
	7dbkG1cf4YE+o+7ZLQozt5KDfBVGEtAtpY7k7yOHqUWYltT1Btp3NNriy6PuWCIa+7BU5l61/29
	zLJX/MFfgPZ+Zg7Wlzj2wq3FdRRHMkoxj2mWb/fTMaeqbdDBXy3WeVh0y00yX5oxF2HQ84vbBcx
	H2Z+ReeuNs+JDZi5rwH8LotEFA5jKafIduB3cbsPDAJ/7lgR2TM5fKpxEXQmx5AQdLmw+nGuCnD
	DsHyCWlJ5vyXS3xOuGHUtIseyxhYPOYQtPZsPyRnHUe2GmK5vpXWjIuZU9Aowc/9j/Q8g+qV7Aq
	0dr1Z0YmqmuCI6zan7heWYnxdmfr+L6K20q749Tuw9iHwSYQQo+5SG0Zdi5hn/cegQ==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33055012f8f.46.1793723880548;
        Tue, 03 Nov 2026 08:38:00 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a84esm28271412f8f.39.2026.11.03.08.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:58 -0800 (PST)
Date: Tue, 3 Nov 2026 16:37:54 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
Message-ID: <auoN4h8iloqPuepc@google.com>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084742.1302597-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083804_240341_E3999678 
X-CRM114-Status: GOOD (  23.94  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 08:47:40AM +0000, Fuad Tabba wrote:
> Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
> destroying the stage-2 page-tables"), kvm_stage2_destroy() steps through
> the IPA space in block-sized chunks, and with pKVM each chunk is a
> lookup in the VM's mapping tree. However, pKVM gives every VM the host's
> IPA limit, so with LPA2 a teardown makes 2^27 lookups with 16K pages
> (2^22 with 4K), nearly all of them for empty space.
> 
> Walk the mapping tree once instead, and reschedule after passing each
> mapping to the reclaim or unshare helper. The unshare helper can't
> reschedule itself, as the map and unmap paths call it under the
> mmu_lock. A failed unshare now leaves only its own mapping behind, not
> the rest of its chunk.
> 
> Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/mmu.c  |  7 ++++++-
>  arch/arm64/kvm/pkvm.c | 17 +++++++++++++----
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1db10d8d6db73..42977cf8a7f5d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1022,7 +1022,12 @@ static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>  {
>  	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
>  
> -	stage2_destroy_range(pgt, 0, BIT(ia_bits));
> +	/* pKVM walks its mapping tree, not the IPA space, and reschedules per mapping */
> +	if (is_protected_kvm_enabled())
> +		pkvm_pgtable_stage2_destroy_range(pgt, 0, BIT(ia_bits));
> +	else
> +		stage2_destroy_range(pgt, 0, BIT(ia_bits));
> +
>  	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
>  }
>  
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 016997288fd23..992ed3ca6bdd9 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -504,6 +504,7 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> +	struct pkvm_mapping *mapping;
>  
>  	if (!handle)
>  		return;
> @@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  		kvm->arch.pkvm.is_dying = true;
>  	}
>  
> -	if (kvm_vm_is_protected(kvm))
> -		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
> -	else
> -		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> +	/* Called once for the whole IPA space, so reschedule between mappings */
> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> +		u64 start = __pkvm_mapping_start(mapping);
> +		u64 end = __pkvm_mapping_end(mapping) + 1;
> +
> +		if (kvm_vm_is_protected(kvm))
> +			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
> +		else
> +			__pkvm_pgtable_stage2_unshare(pgt, start, end);
> +
> +		cond_resched();
> +	}
>  }

Just thought that it is a bit weird that pkvm_pgtable_stage2_destroy_range()
does cond_resched() while kvm_pgtable_stage2_destroy_range() does not.

How about instead kvm_stage2_destroy() refines start/end with some accessors
calling in pkvm.c pkvm_mapping_iter_first() / pkvm_mapping_iter_last()?

>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 
> 

-- 
Vincent

