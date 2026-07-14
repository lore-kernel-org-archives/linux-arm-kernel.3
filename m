Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A69BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7jEdnPHOZYySDOHtLiyemt7b8AC13rHzDaBDc2anI4=; b=1XIzEBcyf0P/C6lBxuD2OAUCcA
	cY3o15zkL0MqEnN/xaDwexDXwlXUYhCaSIOt8l6kKROMa+6wjPGx+d7rvhglWhEJMh977hv8+YXe+
	SNUNTr/Yy6PlLN8vhGnBLbfGvx5wrQ5yQMzLfB1CXpIkIuIUStegtyY5F8J/RmG6x6zfiJnZMSaQv
	7jhW4yPv8gcGFgCoy98U8yE8R5v36Gn9uwCkjJ3l6m5uQS5yerPw/1EaKmRiJ5DqhXOvtjY76+KOg
	8bp70PIuZI4uh3Dt0LsDQzIwtJehed2oIL0lgLI0DzoXeU83jWq+eUJLJGjYIL1aIcziJJIO6mrFx
	A86FZYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiO9-0000000CyhB-2Sd2;
	Tue, 14 Jul 2026 19:01:53 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiO6-0000000CygT-3JfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:01:52 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqoDkYigoQtv3rvlwQzL/UFy1aT8W4HbhuP9XWav2/jvKUq8IellkvxT0yoSKYu0+KNCVZazhG1t2zZF05sMrzB@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784055707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C7jEdnPHOZYySDOHtLiyemt7b8AC13rHzDaBDc2anI4=;
	b=k1zOBoQCTavijxW2sXKTCqbZdaWNi7DqQwZ0Uf3m5MEmQU/1De+EkvuP8FCgPUYphMi5U0
	LMBNVIPkejpAa8hlyXehb9Vuzl15vhie6x+AWNKYlfPgCExO8aZtyIqFjPcSk9pUshs49w
	kU4KB7dxDq+T9UocDYnl9mxLhjVxaz0=
X-Gm-Message-State: AOJu0YxgA0CVjuvQcH4BZyow7LSts5IDyIZ+GqlCgsrmahKMkHBpHcBA
	UaIFVa4dVnl4Kb0Hn4YiNd7JvKJb6BDaFuXxfUOXDA2bZ5SvAeG80vHovkJX8zQe2M42mpCuEG7
	RnzCOZmrkIe8fCIkp8rWSnse/NgEHWmIpy4ekEXB+
X-Received: by 2002:a05:622a:1803:b0:51b:fd21:c077 with SMTP id
 d75a77b69052e-51d7bd8c7aemr18055221cf.21.1784055687763; Tue, 14 Jul 2026
 12:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-6-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-6-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 20:00:50 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwzsZ7NjT3ojabPbe43U+Dev6gFzYM_x0rEA+teVqO0mA@mail.gmail.com>
X-Gm-Features: AUfX_mzct80YiNWPh-7YCP4I0LagY0Zs3bKOU46mwa5A199ZA6btE8cxlulEIMM
Message-ID: <CA+EHjTwzsZ7NjT3ojabPbe43U+Dev6gFzYM_x0rEA+teVqO0mA@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] KVM: arm64: Allow kvm_hyp_memcache usage outside
 of stage-2
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_120151_183752_9F39CB34 
X-CRM114-Status: GOOD (  20.07  )
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
> Although currently limited to guest stage-2 page-table allocations,
> struct kvm_hyp_memcache is a useful primitive for passing a list of
> discontiguous pages between host and hypervisor.
>
> Introduce init_hyp_memcache() to initialise a generic hyp memcache, and
> init_hyp_stage2_memcache() for stage-2 specific memcaches. The generic
> initialiser will be used to top up the upcoming pKVM heap allocator.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5..caea8e9986d1 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -91,9 +91,22 @@ struct kvm_hyp_memcache {
>         struct pkvm_mapping *mapping; /* only used from EL1 */
>
>  #define        HYP_MEMCACHE_ACCOUNT_STAGE2     BIT(1)
> +#define        HYP_MEMCACHE_ACCOUNT_KMEMCG     BIT(2)
>         unsigned long flags;
>  };
>
> +static inline void init_hyp_memcache(struct kvm_hyp_memcache *mc)
> +{
> +       memset(mc, 0, sizeof(*mc));
> +       mc->mapping = ZERO_SIZE_PTR; /* Prevent allocation, solely useful for stage2 memcache */
> +}
> +
> +static inline void init_hyp_stage2_memcache(struct kvm_hyp_memcache *mc)
> +{
> +       memset(mc, 0, sizeof(*mc));
> +       mc->flags = HYP_MEMCACHE_ACCOUNT_STAGE2 | HYP_MEMCACHE_ACCOUNT_KMEMCG;
> +}
> +
>  static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
>                                      phys_addr_t *p,
>                                      phys_addr_t (*to_pa)(void *virt))
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6c941aaa10c6..fb38821f2037 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1159,9 +1159,11 @@ static void hyp_mc_free_fn(void *addr, void *mc)
>  static void *hyp_mc_alloc_fn(void *mc)
>  {
>         struct kvm_hyp_memcache *memcache = mc;
> +       gfp_t gfp = (memcache->flags & HYP_MEMCACHE_ACCOUNT_KMEMCG) ?
> +                   GFP_KERNEL_ACCOUNT : GFP_KERNEL;
>         void *addr;
>
> -       addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
> +       addr = (void *)__get_free_page(gfp);

Generic memcaches are not accounted anymore. That looks intentional
and right since heap pages are hyp-global, not attributable to the
topup'ing task. Maybe worth a line in the commit message confirming
this is deliberate?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>         if (addr && memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
>                 kvm_account_pgtable_pages(addr, 1);
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 053e4f733e4b..8324a6a1bc48 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -111,7 +111,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
>         void *hyp_vcpu;
>         int ret;
>
> -       vcpu->arch.pkvm_memcache.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
> +       init_hyp_stage2_memcache(&vcpu->arch.pkvm_memcache);
>
>         hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
>         if (!hyp_vcpu)
> @@ -172,7 +172,7 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
>                 goto free_vm;
>
>         kvm->arch.pkvm.is_created = true;
> -       kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
> +       init_hyp_stage2_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
>         kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
>
>         return 0;
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

