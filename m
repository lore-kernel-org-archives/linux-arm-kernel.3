Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C2BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmz5eXxPx0qgl3ng7iAKomOvPAZo+1HLYOuh5tFme5I=; b=g+0U0UIcJprgI4knte0kT73Bh+
	VR03bFpSiaYmxx/vcf0vsELD0DRnebb8vwEa6kuhzhFOCVVdTmgSVXWBS/0xnIfDDbqU/VhDXHM3C
	cbxyic3q91PRoQIcqORViE+3WRR/Hj8rxEX457LZxfTiu2Lb5zBHCWdcwxQ/BPeJUeANdfk9F4OKl
	iDJjVuCtxzYYU8OKI+nUwg1RnlDHLkQNnjOl/Z88vxa4B90c7p9EGefBLbYjgtqic5eVFVUJrpKuX
	V4k6r9k3JFSC6yjZk0y2TpvR1cwGnNyhuq4dSNN49A7zhskDCk7qKnDcl3VjKtyQWccHqgBmO/EUi
	U4pqMAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhFl-0000000Cojw-40Qd;
	Tue, 14 Jul 2026 17:49:09 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhFj-0000000CojS-0gSx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:49:08 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rq+pMWbi6r/vhKBrk7kbU7vnTtd0mMqHq0lRvaIhRI9I4gpkv3kyu98iskQO8ELnSsD+LhocNNA60nko5N5dTVY@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784051344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cmz5eXxPx0qgl3ng7iAKomOvPAZo+1HLYOuh5tFme5I=;
	b=xt3tRkR24sjoB+QTn4CtoJEeLLc4Djfuryj/jiebVrGtE66PfYoadnVC7j+lk8o2S7Hyoj
	VjPVnsmi/XVL1BDXCh1uWqcJWyLKz342qeN2wdLXpsX8cUFvxYG9co7J6L5NtGwBf82vhZ
	d0MLxFdI0RKBPdGHSbJc6ydISuJF7ek=
X-Gm-Message-State: AOJu0YzlaCa+paKNTcDiL6CwEENij30xkobosCuvllFEs9Yht/JYaOfP
	1vLoFhWqr4pxXohqhe14fzuR1GN++WbDQpQ81PrJGi+3UYxxcn7n1y4/+zZc7ju9BnEGvxSTaGS
	79XHSiQ0aPubCOKDpAsJBGICwRjejNxnDHtTkE5CF
X-Received: by 2002:ac8:7d0b:0:b0:51c:7a90:a797 with SMTP id
 d75a77b69052e-51d83845eafmr17464581cf.23.1784051329702; Tue, 14 Jul 2026
 10:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-3-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-3-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 18:48:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwAs6C1Yes4faiGkEo_0ryW4Vr-3e_q0xxKpWpuuS4pmg@mail.gmail.com>
X-Gm-Features: AUfX_myKMm_rXrImC7y2DgTClP124-2IwTOiSDsHgDt8Uxb8A98F_Li2Irk5mZA
Message-ID: <CA+EHjTwAs6C1Yes4faiGkEo_0ryW4Vr-3e_q0xxKpWpuuS4pmg@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] KVM: arm64: Add pkvm_remove_mappings
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_104907_510897_5BA5B901 
X-CRM114-Status: GOOD (  12.77  )
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
> Add the counterpart to pkvm_create_mappings(), allowing previously
> mapped ranges to be removed. This will be useful for the upcoming pKVM
> heap allocator to manage its private mappings.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> index d3137c16b632..725bb0fb941d 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> @@ -25,6 +25,7 @@ int hyp_back_vmemmap(phys_addr_t back);
>  int pkvm_cpu_set_vector(enum arm64_hyp_spectre_vector slot);
>  int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
>  int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot);
> +void pkvm_remove_mappings(void *from, void *to);
>  int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
>                                   enum kvm_pgtable_prot prot,
>                                   unsigned long *haddr);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> index 773426a68d2d..ec59da1322a7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> @@ -146,6 +146,20 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
>         return ret;
>  }
>
> +void pkvm_remove_mappings(void *from, void *to)
> +{
> +       u64 size;
> +
> +       to = PTR_ALIGN(to, PAGE_SIZE);
> +       from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
> +       size = (u64)to - (u64)from;
> +       WARN_ON(from > to);
> +
> +       hyp_spin_lock(&pkvm_pgd_lock);
> +       WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
> +       hyp_spin_unlock(&pkvm_pgd_lock);
> +}
> +
>  int hyp_back_vmemmap(phys_addr_t back)
>  {
>         unsigned long i, start, size, end = 0;
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

