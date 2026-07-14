Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNZSBmfBDNmYrRJyHxAOlhjiIPet8aW1LhhHhsLWuDI=; b=lnSxOWWeuzcw2nar1ukiBIca0y
	kK6gCFIiCSu3lzkROph6/eTXlB4EMm0stmfyAFMU3n6EABoJO9bMsqDVddbromsADPR80tSNAv0/x
	w1kl+AnkLzSKOL2c4amhU2AHiQWAfJbQVSupARM3u1D1i5n2zonQqEGfi0iTR9kAXK8YdBomNvmn3
	jekojsvd8RMqICijNHqirNl1XSWGOzPtj0OvVKjfZZEacS0oIy9lNRGir5B1MxLeSYwsjlzqmVXS9
	Lm0cLB0U0nhlqG/hf5/6wmHGHx0KHuTNnjqhaVaE+GY+ZBPDGnz9M0cgd3bVaHN+rT6d9FdyMXdi+
	2yoL1Diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji04-0000000CtSC-0scp;
	Tue, 14 Jul 2026 18:37:00 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wji00-0000000CtRJ-1ono
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:36:59 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrNjH8/eVk6tdI58PFFgO3WydE7RK47ntQKcIpNEgMJUHsFIVLHHA/RE7nktHTuIeKsLhmFuyPog+A2jq8sYE7r@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784054214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNZSBmfBDNmYrRJyHxAOlhjiIPet8aW1LhhHhsLWuDI=;
	b=AChZlWkQv3EduffqEegfbniFAcnyReVV6SucH86/wc24ME9Ge8mdWb/tn07b9Xmi6dO9aD
	b8nDKBB4F+19GdBc2cyHGQ++Bg4OiatntzY9zXOWRO97LeC82WBeZqN0yzj7HVEkZ/QoJN
	S7eT76LB8d2CQh3CTu70Ij2YZw3qxwk=
X-Gm-Message-State: AOJu0YweWnm/gP6tFD8MXjMM2QLbIMY4GeySoCpYyURGlj5rD17Az8O4
	oXOYKzF0Km9GI14YthPUd4CdTy6JU5grrK09TUYh0F0W8y54r1I/ccI1f3BB33S0UvaiTNOuXAE
	Eoc8dX4WOP+tJ/Uz960Ca4ti/5De4zG084WqR7DaH
X-Received: by 2002:a05:622a:5811:b0:516:d25f:f038 with SMTP id
 d75a77b69052e-51d7bcdc629mr19496341cf.10.1784054209379; Tue, 14 Jul 2026
 11:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-5-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-5-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 19:35:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzbQukkKpNfdTHKS5aAPCn4hnCxu+EHnm6OWpW=mTS+Gw@mail.gmail.com>
X-Gm-Features: AUfX_mwujOVFYFITNMrHijW4eH9F2RFdyBeop_XKVBPHf6u1glhbNBh1Runw6Wo
Message-ID: <CA+EHjTzbQukkKpNfdTHKS5aAPCn4hnCxu+EHnm6OWpW=mTS+Gw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] KVM: arm64: Add a heap allocator for the pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_113656_678645_558D7F5B 
X-CRM114-Status: GOOD (  15.36  )
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

...

> +static u32 chunk_hash_compute(const struct chunk_hdr *chunk)
> +{
> +       u32 hash = 0;
> +
> +       BUILD_BUG_ON(sizeof(*chunk) != 16);
> +
> +       hash ^= hash_64(*(const u64 *)chunk, 32);
> +       hash ^= hash_32(chunk->__unmapped, 32);

Could you state the threat model in the commit msg? The VA range is
hyp-private and the hash is unkeyed (anything that can write EL2
memory recomputes it), so this only catches _accidental_ corruption,
i.e. a debug aid.

Since that's the goal, should it be gated on CONFIG_NVHE_EL2_DEBUG
like the other checks here? As written it's O(n) hashing per
hyp_alloc(), in production, for a check that only fires on a hyp bug.
And a plain XOR/additive checksum would be cheaper and just as good
for accidental corruption.

> +       return hash;
> +}
> +

...


> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 75b00c323310..1c10cf78c869 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -10,6 +10,7 @@
>  #include <asm/kvm_pgtable.h>
>  #include <asm/kvm_pkvm.h>
>
> +#include <nvhe/alloc.h>
>  #include <nvhe/early_alloc.h>
>  #include <nvhe/ffa.h>
>  #include <nvhe/gfp.h>
> @@ -363,6 +364,10 @@ int __pkvm_init(phys_addr_t phys, unsigned long size, unsigned long *per_cpu_bas
>         if (ret)
>                 return ret;
>
> +       ret = hyp_alloc_init(SZ_128M);

Where does 128M come from? A comment would help.

Cheers,
/fuad



> +       if (ret)
> +               return ret;
> +
>         update_nvhe_init_params();
>
>         /* Jump in the idmap page to switch to the new page-tables */
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

