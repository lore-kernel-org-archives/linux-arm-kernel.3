Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A93C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10VT7gL+lmA+QIPWzvdgixXz8JOFpc48OxM2n67zUxY=; b=w7+SStynm0kkw3iowzdpjOU6Wx
	9Feox109bTl5O+unR/xpXQ52sgAJu3HEHJQDcYU+keT1AjVfm7pOodN+1R3szC5gKVIBnkqRguxJo
	DRnIk+AyYskyNlJaTEho9LnwTmbKRRYIBESG9905qbVgcZvKQiVIC0uDh4bh+/AEYU0IPDsDY1Nxd
	ANMJwDX0aCkRMvcwkQ8Qv4e5pqbrmGC5Fd7oizWRB3Q3vspTyp6sT9cVokQL2rTndgxARXgBQjK5z
	D7uzJYG/DenCUSeKC3pBPenR0hypFtrKOtCHm1npTAh6nKplDMj70RPb6Scp58aa1cGSBR/QnCDN+
	+sS8dy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhLC-0000000Cp2Y-2kIv;
	Tue, 14 Jul 2026 17:54:46 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhL9-0000000Cp2A-2Dyk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:54:45 +0000
X-Forwarded-Encrypted: i=1; AHgh+Roch5HiHa2iNStuY0YRH4IZtFO61OoqmOsopcpfJ2zxEJC/Nok2TfZdaOFcNxhFDLlphjUJ+7Hak27SHDMmGTN3@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784051680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10VT7gL+lmA+QIPWzvdgixXz8JOFpc48OxM2n67zUxY=;
	b=EInFboKSS6t7lN7tXtrJS2NJ7G0H0bGIQqiNvt/bMGnbvfVtEcsQg76CafB0fVYf2eAQEZ
	Pa7o3BCCme0PhZ8GqqnGai+h1tB28aePT2Mr8hhJ2plbUYNAI2g0pg7NQzK7Q7zBDLI2CM
	ITBs8yjz1RsB14tgKKMPLTSKEro7kYg=
X-Gm-Message-State: AOJu0YzXnFFj2z/MRXHgSA5e7v/TUCN5EVyBmgF8Y2DypTRtSj0tk4zq
	NWU+bewweRfx2/aaeRpYYzJkKHvwbyYkqRlPesBeu/8M609QYVd+TgqCAbkHfjYEioxRcd6o3ct
	pZ8KwzrnBCGqaJF8h0ksXiSrdVwLe/Wmg7AU23/9M
X-Received: by 2002:a05:622a:4d47:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-51d7bc5094cmr17035731cf.10.1784051672252; Tue, 14 Jul 2026
 10:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-4-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-4-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 18:53:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwMz+Ojq18Fq9USJqz_pZmemryNhy99Sw36sOejtpaf4w@mail.gmail.com>
X-Gm-Features: AUfX_mx9lqp3kjAw6qAWT5YzHWzZHDucv8goST7s8ZDRn3t91Ab_Li535_XJs6w
Message-ID: <CA+EHjTwMz+Ojq18Fq9USJqz_pZmemryNhy99Sw36sOejtpaf4w@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] KVM: arm64: Add __hyp_allocator_map for the pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_105444_159357_2B3EA197 
X-CRM114-Status: GOOD (  13.47  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In preparation for the pKVM heap allocator, introduce __hyp_allocator_map()
> to map a single physical page to a given virtual address in the hypervisor
> stage-1 page-table.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> index 725bb0fb941d..98a7774b541c 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> @@ -32,5 +32,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
>  int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
>  int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
>  phys_addr_t __pkvm_private_range_pa(void *va);
> +int __hyp_allocator_map(void *va, phys_addr_t phys);
>
>  #endif /* __KVM_HYP_MM_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> index ec59da1322a7..c1c01f81ac5f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> @@ -160,6 +160,11 @@ void pkvm_remove_mappings(void *from, void *to)
>         hyp_spin_unlock(&pkvm_pgd_lock);
>  }
>
> +int __hyp_allocator_map(void *va, phys_addr_t phys)
> +{
> +       return __pkvm_create_mappings((unsigned long)va, PAGE_SIZE, phys, PAGE_HYP);
> +}
> +

nit: __hyp_allocator_map() is named for its caller rather than what it does
(map a single hyp page). Its siblings here (pkvm_create_mappings,
pkvm_remove_mappings) are named for the operation. Consider a name like
pkvm_map_page() so it reads as a generic primitive.

That said, naming is hard:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>  int hyp_back_vmemmap(phys_addr_t back)
>  {
>         unsigned long i, start, size, end = 0;
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

