Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116F60A5BD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQapKz3P;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U1fbVLzr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WaOsrEmAYoqVhViGwTJTcykgEVpjZAmCdFfMPnWGgSQ=; b=zQapKz3PhX0qO1TQDiwWBu95E5
	lI3/Le40kTMoDECb8q4zi8PUdvt8DbWlhYK1V28+WdQHQrPejvlOsUD6Cnl1zQPqgk0/3/cORJrvT
	uy0nlaKkxEvaV79a+wx0ZDf5f6yRDOZnr3wUdsWacCyS/D0D2B9tU+Jh13Lshf58WpuvtbeDWy81i
	gX5FTqUJ/526jFqLspFUheYHxVrF9K4WxvutRZivNiReyk6zAa/xYZc2l6BeSodenBIeD/T1J1lPf
	qBrDGLFICXr9XLSQbQo0cgssyuysqg8spkGwPVDoMeq6417sMN/NwZF9VjqccIRkCJldafr1UScFj
	yiBLfShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFsg-00000002ny6-0DQc;
	Tue, 03 Nov 2026 14:52:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFsR-00000002nle-1Cgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:52:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so36363345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793717561; x=1794322361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaOsrEmAYoqVhViGwTJTcykgEVpjZAmCdFfMPnWGgSQ=;
        b=U1fbVLzrD3rbFR/x21CjkE4qp6bZm+zunKozgMNnfoD/Hz1GDIPkV/kjZXIwrE9liF
         qAinmHJaOSVnXThBCb7ebjAdWcAvQ0cFoxc/c/E0e5jpbk/uqEbmitqV4d7Ap13Jr3JX
         Dl3Mpd+JSxrtqbFu2SGwaYTVnXV2/sL8UYHQ6xldGhCsxFVrpEcQaEOi5DuEFpoNRlaj
         bmthrAGsRqNQ8gS/9pMqqvuBh87ruEXFQXKKOhfQDMySk7zVAi1khiHPawhmtnQK5ZeH
         pX+3+R+O4Aseke1xOU8KCTNl9O4FBbrIY5y+BGxTWDzhj847KMCrXXmbe1chZSMjTNtf
         /G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717561; x=1794322361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaOsrEmAYoqVhViGwTJTcykgEVpjZAmCdFfMPnWGgSQ=;
        b=OE0YhPh3VmYRl21mr9NRH/ou9PZzI4VORF05yPwerZBqBeEnsPuKKyg0Ge+45rFMrL
         btHPLku71L5qGVYu/gIWsj+IrOJWYWfYLHKoTZjGSq5vzISoFNdty7NJKROb5Ow8zGr5
         cDi3xdOMH8N/YXCEFquwBoqnnjn5TxhyYGHSXW5sG9GXuR347/Fihh2IDWDVWuvHY6QC
         ZG/CHFOM5wdNqXd8IXEqlFtf+sALZ2h62YPgcbDpBnX18wlW9VSBk9i57vOTqIDPnywb
         RnmVPsnBSYIWwFJH7Q7gbXbjuZQwf0Rz+3aXJnfuW0Ux4Y5gnJBjHkj3EqjzNQ6zTb9r
         7Pdw==
X-Forwarded-Encrypted: i=1; AKwUvBzHqOnO3VRgZ5jn2R3B3gH5wUkWKrVL7ZzThu/mh5AUBRCHe/hrAgRfXUNJzsDH29u3b6euzp7ncmTrT+MTskbz@lists.infradead.org
X-Gm-Message-State: APuU4Z8BX+2Z5LGO08JnRXLnMxmW2MKFGUuoOix+qLs7BozdBPw2IoyP
	EsXeTl3v98cCRlp+vAvPpDlcROeRT+UBNL7EDV/whEhCEuBRD96vCQIASV+LHKUDf4to1ZCATU9
	vLCZbYg==
X-Gm-Gg: AYBFou2fGtI46f0AEsyfHUQWzR5HVKIuIuFWRuMHxuyUkYYTpwsi81lQJYuQFrHDblq
	2ab0jQrwfMI01eG0u+Nn/oxSXjP+6qroxhhdy83TGWuWIAhh+mTzFcwk9DBGrXJ5xRx8Ww96Jha
	gjvUgPoFGhIJp+MYEfIPoqd/pdWweLNp+qwAy27LCq5TX6dr1O+EDv+nPmCeDtFdRfMsrd0sSdM
	06WlusnLpNrhquYaEEgP2oL/Lb5hvo61EJzHwxgiMGxQ9kyQR0ryL4a9ieRUv0a0dKmryTY6njx
	5vZUpILvatuPvvLw4rz8yPw9HCmNlfcMkLtdNilWmrOGecBCpm+JQFFWpIm9Kjyzu2J+9IZFdrh
	r+qz2zvyIa6o7fEFWkSkOgPvw4VMB0u/VoaYI52m/TZcx9/tzKYQQVNWQgjxz8XnMj4Mnl8AU/f
	rbr7yeBn7wjqbQfpnKT6fZzzZ9NWNhGcS/jSevhCFUGiERyjkZ3nQSwTcN2uKOjVuGnqiZTTkLx
	6R+Pv7K21m8BV705X+l+0K7zoa293ynsWUiEEbDyuWNxMOWn2+MVFcXttDNXqKjpx+AnAcz5HRf
	+bDcTq9c8R11/OuU3+aAb90WKBLwY3RP4RTmVZrZnFC06ekfRn6qPXSM7G0oo+wr
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr312931635e9.18.1793717560966;
        Tue, 03 Nov 2026 06:52:40 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm69647405e9.0.2026.11.03.06.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:52:40 -0800 (PST)
Date: Tue, 3 Nov 2026 14:52:36 +0000
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
Message-ID: <aun1NJNtnOeSL4oc@google.com>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084742.1302597-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_065246_270073_266BA816 
X-CRM114-Status: GOOD (  25.38  )
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

Not a problem now, but don't we make the device assignment story harder?

> 
> Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")

Isn't it an optimisation?

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

__pkvm_mapping_* are rb-tree internals. I think it is better to use explicitly:

  start = gfn_to_gpa(mapping->gfn);
  end = start + (mapping->nr_pages * PAGE_SIZE)

Also, I wonder if we'd better WARN if the mapping isn't aligned with the
destroyed range?

-- 
Vincent

> +
> +		if (kvm_vm_is_protected(kvm))
> +			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
> +		else
> +			__pkvm_pgtable_stage2_unshare(pgt, start, end);
> +
> +		cond_resched();
> +	}
>  }
>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 
> 

