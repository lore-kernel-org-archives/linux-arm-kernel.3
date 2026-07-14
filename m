Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4ACC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+fcK+yW+QNwHqaWRgbstmh4tm3jTw4aWDAu42J6kL4=; b=fGIkvs2FO8yfU5BXfvo3wcxx2r
	EbSc7mD3eGzHoCseHq07FSs/kWevFEUiqOZ99aO1Z+bQWZbBny068ttlOblg7i6c0Cb/crxBu1aTa
	10Cs+QhmIVBilpkW1zzovuMPzbwATcfLrSmI2/v4JF/BYU4dxc0R7tTbTUsP02XJZDceoE7rcXAen
	1FR+AQ2U+VskSb+7YyFRBrHAIm8WH5Fbf11POmnsGM6N10LMdrxQkVDtxE+X3uctu5UiG4TUcwu3T
	0CGq581hiwdBsDVD7ID1JI4nv7teRS97GAgabTgIAaNngIq+j1H+Kc02IKwpRQbzaci1/dxrRNxo6
	KuidG1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgU4-0000000Ci9f-1Bdb;
	Tue, 14 Jul 2026 16:59:52 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgU2-0000000Ci9F-0SSE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:59:51 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqAS6KI5d7h8Zf9EyWVMSf+MH5pBVnb22qpM/NqNGcWBBasKe0fiPsWbHiMJjJwtKiwG7yh/8s52seKoJ3QTbYu@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784048385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+fcK+yW+QNwHqaWRgbstmh4tm3jTw4aWDAu42J6kL4=;
	b=nPPrtZO2vYBwPUq6jjMAjMCok3PAw58WGTDoeFIvJcNN15b0Vw5wlJBcb1/tTpf2sgGbIZ
	puEEKbm2YFSq6164EZ9HIP32cPnDcDo5nnYgzLMrg3QBW7B/erfM88Q3QZPPFMZveZJ+T5
	6wGZgMOVljxoTv70rTXKVajqj5jshVI=
X-Gm-Message-State: AOJu0Yw0/gd9WM89UppNzeTxKyxc4mUNKZdsaKlm+BrO93m5K7IZeQf3
	/UQVRrC7S+S4qY2mIeKBxYQyQCWGGTn5MVkHsDVEIt+dFuXX61Iu5J+6L0z47ezImZIegzmMXic
	9DMBRIr6s0ep1DijwQe/Jp5fFzAYtPUVA2MqnSEBr
X-Received: by 2002:ac8:7d03:0:b0:51c:104c:100c with SMTP id
 d75a77b69052e-51d71546a1cmr16511151cf.2.1784048378538; Tue, 14 Jul 2026
 09:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-2-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-2-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 17:59:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy-drTkKuSqJNT1HD2GBn4xNXM2UyvE1zd53uG49suq7w@mail.gmail.com>
X-Gm-Features: AUfX_my1WlQOlgsnQrNZQXkrHk8cUZgVcy2F7Kpqienn2dOS644hLsWwx9GRj_I
Message-ID: <CA+EHjTy-drTkKuSqJNT1HD2GBn4xNXM2UyvE1zd53uG49suq7w@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] KVM: arm64: Add __pkvm_private_range_pa
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095950_421673_EED45C56 
X-CRM114-Status: GOOD (  13.38  )
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
> Mappings in the pKVM private range are not identity mapped, making the
> standard __hyp_pa() unsuitable for translating these addresses.
>
> Introduce __pkvm_private_range_pa() to resolve physical addresses for
> this range by walking the hypervisor page-table. This will be useful for
> the upcoming pKVM heap allocator.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> index 6e83ce35c2f2..d3137c16b632 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> @@ -30,5 +30,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
>                                   unsigned long *haddr);
>  int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
>  int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
> +phys_addr_t __pkvm_private_range_pa(void *va);
>
>  #endif /* __KVM_HYP_MM_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> index 3b0bee496bff..773426a68d2d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> @@ -502,3 +502,17 @@ int refill_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages,
>
>         return ret;
>  }
> +
> +phys_addr_t __pkvm_private_range_pa(void *va)
> +{
> +       kvm_pte_t pte = 0;
> +       s8 level;
> +
> +       hyp_spin_lock(&pkvm_pgd_lock);
> +       WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, &level));

nit: can you pass NULL instead of level?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> +       hyp_spin_unlock(&pkvm_pgd_lock);
> +
> +       WARN_ON(!kvm_pte_valid(pte));
> +
> +       return kvm_pte_to_phys(pte) + offset_in_page(va);
> +}
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

