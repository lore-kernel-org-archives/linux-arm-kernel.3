Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87467CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfWHeFBkMHYJw5QiRGsKUIxVRqYkPAcQ5KBzj6Wt0do=; b=hBn2C6vbln46gDcZScGRkNFy2W
	NJ9Pn11WGEO+PyZtaYPqKlpZfWZvCkLyxVk6SsWaYKqlAxpyb1qLynum0CgVj3vO9ioGn2U7S9s57
	FCsuXAslh3ouOmLrwgNZ/7N/NjCqWs3IOR86XiQ+KOqc7H6mf7o2NyKc+oZDGzpH7tgzof04nZ7TH
	m6p4WmytDzvcbq8WRWYj2JEB5FJhKeB8RH3Ma6I04iCvsghs/tl32EcIVdpsoG8ork929OK3hJrOM
	Y180gzxt8Xy6TI8bao4bedyjYzsX+/y2C7c96/cLwG5hlMT2i8q7rw8pnGM2z+1aMc+RDu0YzpnCE
	1nbfhEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVy6-00000007yUY-3rhO;
	Tue, 16 Sep 2025 13:43:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVy4-00000007yTh-1mQs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:43:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45f30011eceso53825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758030215; x=1758635015; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfWHeFBkMHYJw5QiRGsKUIxVRqYkPAcQ5KBzj6Wt0do=;
        b=EF0BeD6D1vC/qwCBS7OPRgWye7vANtetvEKZkO5JWi/k7zqTZgRYS1W76Y04t1OXm9
         ZZpGN0XHhufWk2RIMpToxKx6UDfIrCdQRwdMtNkZPoFlxdM5m7fmZE4KxbrWIXECzH0V
         TIl8ctP0s3rduR0b50uLkM0WGkxGU1rQaE7yQ90lMRYtkAA+YDBA6rGkEvufA3WIDQ+P
         T+mcFL6SVB77gB3B+yvPjJ26G4eKkr0xp1aUODqY46RHumPJV78wLKfdBQiRuwFQke3l
         8VpuA1auF/fb/GrVErNiqa3bN9M1lB4qZEnIbvoJbd632QN+JmHcdSQ3Hk5w5k7rhbsY
         V9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758030215; x=1758635015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfWHeFBkMHYJw5QiRGsKUIxVRqYkPAcQ5KBzj6Wt0do=;
        b=qyX02qeNlgIJHceTYiDP0T8HS2s/dRDEV/vxtMWHElUbU4NWDU+kir/TGDqkupbu4V
         AxgQDUou3HRe8gA5QY5UN0VkUE3B9i1+PnEbrIo9zGi6TXnotRvSOQH4dF4M4OJPT2ld
         klRZOiS/uoxqiwK43wOCNzNkNFEkM26gJcPymzA2N1DgWgJ3Nat3TixZjrOYBHXtg3g8
         CE0hdm37GlEH2BSHM9S8S8Yy8hUVXLmUsDGQmDwCG5utU5R95iYxIpY+YprDroADWezP
         +quSeJd6y/DWwJir65k1Gk25CdNbGz5nS3grjFR0GVxSr3C7aNNgExesqg+dbRuzht/2
         6Deg==
X-Forwarded-Encrypted: i=1; AJvYcCVEjBQS/e/CNwSQ0f5SCdxTnGUD0UwJeFaY278XqIEU3wvQfgdYjBFH6LysQ4dX4CKt1th9KIh324lC5GvQJXLK@lists.infradead.org
X-Gm-Message-State: AOJu0YzcUUbi9ohaU6Ug/wqYpkIGBA3od0imiYFWhUxUqb/RjgBnuy7m
	v8tbS9DP+yU6wfmTBNTcl+oIRZPSj1TYI8pcziDu/lGXSXjhizmBoZy4XLFR8YLks29cPpfyK9f
	c6RXzhA==
X-Gm-Gg: ASbGnctPxZFquag3RDmmfQMpp5Qo9FfTvg0N+t2u2blIuY79B6Zt2dJ2jv0j/m6D+3R
	5Aa5X73N2kW2Me7ga84OpD1wNu1v9od5vgJ6OVnBzFtAixaePHbijFVSdQtEW2MG3CesQDBK/Tg
	TRw5JAIKVG75Pu/8/wsM2WHmj2A8LM8CtyHsZYf2uta6L7qgSqlw0y4j+fH62vsZ4hedRxalJ24
	CNqjVaC05KcUj6/xoDlbjUV/rKNp6n1oSsjUDOtAX2RpoSjszUKoKM3BVLI+Zusy4WG7Bofnz0w
	MNa6jxdiughtqqUA5mrZ0Zvte0iTVQB2AjxY2jNeGAE5YEjJKzzkkKO5qhD/essWn0CD0aHvGsE
	uFxVWDmm4hi5psnUffSjN2hSiJK5l31H/G7yiZGGDMjOjempAq7Cf73vsgflCeUFxsXRALA==
X-Google-Smtp-Source: AGHT+IHpXz7Rl+QKYOCiUh0stE/LvQiGqQu2cCoRgHmA+CQxnORb4ciGuF1F6j581pn63hwwkNtSVg==
X-Received: by 2002:a05:600c:a10d:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-4601d6b4da8mr520345e9.2.1758030214403;
        Tue, 16 Sep 2025 06:43:34 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a16sm223228305e9.12.2025.09.16.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:43:33 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:43:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aMlpghG9s3hl9G3Q@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-3-smostafa@google.com>
 <aMcoYCcJXjN64cOE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMcoYCcJXjN64cOE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_064336_501793_EDA9DF30 
X-CRM114-Status: GOOD (  38.99  )
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

On Sun, Sep 14, 2025 at 08:41:04PM +0000, Pranjal Shrivastava wrote:
> On Tue, Aug 19, 2025 at 09:51:30PM +0000, Mostafa Saleh wrote:
> > Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> > drivers can use that to protect the MMIO of IOMMU.
> > The initial attempt to implement this was to have a new flag to
> > "___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
> > it was quite intrusive for host/hyp to check/set page state to make it
> > aware of MMIO and to encode the state in the page table in that case.
> > Which is called in paths that can be sensitive to performance (FFA, VMs..)
> > 
> > As donating MMIO is very rare, and we don’t need to encode the full state,
> > it’s reasonable to have a separate function to do this.
> > It will init the host s2 page table with an invalid leaf with the owner ID
> > to prevent the host from mapping the page on faults.
> > 
> > Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> > stage-2 PTEs, as this can be triggered from recycle logic under memory
> > pressure. There is no code relying on this, as all ownership changes is
> > done via kvm_pgtable_stage2_set_owner()
> > 
> > For error path in IOMMU drivers, add a function to donate MMIO back
> > from hyp to host.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 64 +++++++++++++++++++
> >  arch/arm64/kvm/hyp/pgtable.c                  |  9 +--
> >  3 files changed, 68 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 52d7ee91e18c..98e173da0f9b 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -37,6 +37,8 @@ int __pkvm_host_share_hyp(u64 pfn);
> >  int __pkvm_host_unshare_hyp(u64 pfn);
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> >  int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> > +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> > +int __pkvm_hyp_donate_host_mmio(u64 pfn);
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 861e448183fd..c9a15ef6b18d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> >  	return ret;
> >  }
> >  
> > +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> > +{
> > +	u64 phys = hyp_pfn_to_phys(pfn);
> > +	void *virt = __hyp_va(phys);
> > +	int ret;
> > +	kvm_pte_t pte;
> > +
> > +	host_lock_component();
> > +	hyp_lock_component();
> > +
> > +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> > +	if (ret)
> > +		goto unlock;
> > +
> > +	if (pte && !kvm_pte_valid(pte)) {
> > +		ret = -EPERM;
> > +		goto unlock;
> > +	}
> > +
> > +	ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
> > +	if (ret)
> > +		goto unlock;
> > +	if (pte) {
> > +		ret = -EBUSY;
> > +		goto unlock;
> > +	}
> 
> I'm thinking of a situation where both of these checks might be
> necessary.. The first check seems to confirm if the page being donated
> isn't set up to trap in the hyp (i.e. the donor/host doesn't own the
> page anymore). 
> 
> However, the second check seems to check if the pfn is already mapped
> in the hyp's space. Is this check only to catch errorneous donations of
> a shared page or is there something else?

The first check confirms that the host kernel owns the page, so it can
donate it.
The second check checks that the hypervisor doesn't already have something
mapped at this point.

I can't find a case where this happens, I believe the second is mainly a
debug check (similar to __pkvm_host_donate/share_hyp for normal memory.


Thanks,
Mostafa
> 
> > +
> > +	ret = pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE);
> > +	if (ret)
> > +		goto unlock;
> > +	/*
> > +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > +	 */
> > +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> > +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> > +unlock:
> > +	hyp_unlock_component();
> > +	host_unlock_component();
> > +
> > +	return ret;
> > +}
> > +
> > +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> > +{
> > +	u64 phys = hyp_pfn_to_phys(pfn);
> > +	u64 virt = (u64)__hyp_va(phys);
> > +	size_t size = PAGE_SIZE;
> > +
> > +	host_lock_component();
> > +	hyp_lock_component();
> > +
> > +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> > +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> > +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> > +	hyp_unlock_component();
> > +	host_unlock_component();
> > +
> > +	return 0;
> > +}
> > +
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  {
> >  	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index c351b4abd5db..ba06b0c21d5a 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  	kvm_pte_t *childp = NULL;
> >  	bool need_flush = false;
> >  
> > -	if (!kvm_pte_valid(ctx->old)) {
> > -		if (stage2_pte_is_counted(ctx->old)) {
> > -			kvm_clear_pte(ctx->ptep);
> > -			mm_ops->put_page(ctx->ptep);
> > -		}
> > -		return 0;
> > -	}
> > +	if (!kvm_pte_valid(ctx->old))
> > +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
> >  
> >  	if (kvm_pte_table(ctx->old, ctx->level)) {
> >  		childp = kvm_pte_follow(ctx->old, mm_ops);
> > -- 
> 
> Thanks
> Praan

