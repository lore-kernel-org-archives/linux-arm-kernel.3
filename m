Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D6E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lRU9J7xa;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SbYAL8U/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNqEOrEbvKEdZLXsSkH26l7aedkHF5+jRM5uZ/OAFio=; b=lRU9J7xaxr0lFdlH709mfPJrkK
	rFgyjR/zOhKbcJ3Vw9T3HF9imzL/sk1TAL4xehq+wdtYX76ABGAsE0+H13tfuQqCluJrHIRhmWO9Q
	GsWohsdgcHz5irYDdmOKMQLC03yMnavBWSn4SSxr7SBAx2LriSHY1MUe6Fbn4brMoI5r+tGiKHRtt
	lvErRfQDDm6laVPmf8kNrafLCA9VKm7UaF45PoJsYvVu4mDTgy8Mr824VY5l5uiRartr5G3PDkPFe
	2vQK1gdAyvjukDHh5l69KDNfSaPewE5VUB01YSm8vCyc8dlxua+0sF8TzhgwTZc3UrlvXrGNjMW8a
	8lYn6SKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoDT-0000000DfZO-2vXp;
	Thu, 22 Oct 2026 08:32:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoD7-0000000DfTn-0Jq9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:31:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1df146015so12162695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792657898; x=1793262698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNqEOrEbvKEdZLXsSkH26l7aedkHF5+jRM5uZ/OAFio=;
        b=SbYAL8U/AS6xS4XcU5t+Vkv6Vm18Mj51ULnO00oJL3LdY6A8e41vHBvzPMFojHJk9B
         fVRTXlDyhgpZi0IkoEo/3RUdKtusrLkSgpBVIBxs/hDiBVbpy7tWRAj3dYkDBHImvam1
         lsMv9RiP0cnpBN+hpp0Z9ibGfyOP35WcROM2F8HswXeWm3QNjBdOazcNkWCNS9g3Zvj9
         Ha5v5yrvVt5Hu/tmMYKynp2FaehsLljsoRxOeO4u0C93J2sVhvJ8XQJ0PhlYWCfdPuv9
         eYMhagbkt1UyJWuxn+THqQMER0VJwTrTSEMcssQkNxBAF0f2eF6a637aRYrqzqWbQ5J1
         nYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657898; x=1793262698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNqEOrEbvKEdZLXsSkH26l7aedkHF5+jRM5uZ/OAFio=;
        b=D1LKRAZhlfgJmc4boAUOab5Qi5R2+e5WjY2v8bSLvOncsnIYLh8ydUSGeTf8yFwidl
         VAPPHpnqAzLHIo8Mxj/WEuQ8k6omfxeQGwGCMY0MDyfTwfbvvNvyGO+MVklBeId9IqxF
         4Tw9n83BaIRqvW90H5E8Qsv2RG8YYz7iaWYntN0eC54r0IreCr1mbvoLY+1FX6M15VxO
         4+6kx8n3jDkW0NZVivqUvRnzJHCswF3AiCaUpSxwP39339nFENwJMXN/EH88alzvVEfs
         oEDF9/za12pxg2DWlHBKMm5j/fCAMG+c8uISRC2y47sBZ/eyGFXZcU1iIY4VqTupivk2
         sKdA==
X-Forwarded-Encrypted: i=1; AKwUvBwiw0zcL0+Cct3RRM4NJf6rjrFVOxXs+57O7H/fLEMUh39/RisO/apg3YGFIr5QFrH2sTRofAHz4I8yh42pxMNW@lists.infradead.org
X-Gm-Message-State: AFq9FYJN2E/S+L6LCvP1CX+MyL3g0CO6cKsRSRUr4IAGHoCNKe4jXswX
	ybVtN+AbBJr58ly7LT45fL9wfj/e7OXkfplnh4mXiFTYbfPwkHr77jyx0sqvffhzIA==
X-Gm-Gg: AYBFou0GIUmiqqzAIs7ToHi2jXMrB23MC69hBVLxJkAny4a80ZlQ1A95qx3xaKsmS7E
	8WewtIONweKjGyKAuSJbmdVOx//wVaB1LwKDQbcOGJd/bwUzdxoBKycpBL/hqkvw1YKI0Its+VU
	2hgjAyxz4+sO/mo0LqnbiwEijDBpSFtbIUBEjNNNd46/1HBhr9ezekfqpnJAAcU/8EpI1FVWz/8
	owuX0sIELqwhfl2Ig5E+6XZNB8yHyfIlS7FMgwV0XVwyi9hvKqkKBOvbFFrPY1QHanLvGPykl1R
	p5PCQUmQ0GFJBwQSoc9Htj35XjMzyS0jQZMFFIrl4v1p5AC+Y6gMa4neotBj3qh4RK8ePCZhq9M
	zHlsjEwGq82CSIcFMzDqgT4XzG7Qqojuno6/TdYEbAeVMi6nr/bYpRig9JAupZbtWjotb1ZxhdI
	T10nQZ9QKFUQfuTnU2TIp7EnxXZ0sQYqjmo8lOlAEdPwIUG07KTrczV2b7j/UHvj3rrvwEZibiB
	gCdpoPpSfhZg4nkj2B+I2fwq/UXThJGUy0K06wr/QkSeQZf0SYj1PK7ZfJ0WggUur/AGG7/EbWK
	OOdpE8NXeOM/xzWhMqmGT4n8
X-Received: by 2002:a05:600c:34ca:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a1fdd34028mr98581465e9.31.1792657897259;
        Thu, 22 Oct 2026 01:31:37 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0e64esm53407775e9.3.2026.10.22.01.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:31:36 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:31:33 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: will@kernel.org, julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, alexandru.elisei@arm.com,
	andre.przywara@arm.com
Subject: Re: [PATCH kvmtool] arm64: THPs for systems with pages bigger than 4K
Message-ID: <atnJ5RdWkGQ9QZgQ@google.com>
References: <20261019145949.1922019-1-vdonnefort@google.com>
 <16679dd3-c168-4dee-bb9d-da9b0e3416cf@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16679dd3-c168-4dee-bb9d-da9b0e3416cf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_013141_222340_3C7BBDB3 
X-CRM114-Status: GOOD (  32.93  )
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

On Tue, Oct 20, 2026 at 03:43:08PM +0100, Suzuki K Poulose wrote:
> On 19/10/2026 15:59, Vincent Donnefort wrote:
> > The THP support imposes an alignment of the memslot userspace address to
> > the size of a THP (PMD_SIZE). To do so, kvmtool overallocates the RAM
> > size and aligns it. However it assumes PMD_SIZE is 2MiB, which is only
> > true on 4KiB page systems.
> > 
> > Use a huge-page size, based on the system page size. This value can be
> > massive for a 64KiB page system, so skip the alignment if we couldn't
> > even install one THP.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arm64/kvm.c b/arm64/kvm.c
> > index 36b3284e4a92..2c01dc32fa9a 100644
> > --- a/arm64/kvm.c
> > +++ b/arm64/kvm.c
> > @@ -18,6 +18,8 @@
> >   #include <asm/image.h>
> > +#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))
> > +
> >   static struct arm64_image_header *kernel_header;
> >   struct kvm_ext kvm_req_ext[] = {
> > @@ -35,20 +37,23 @@ bool kvm__arch_cpu_supports_vm(void)
> >   void kvm__init_ram(struct kvm *kvm)
> >   {
> > -	u64 phys_start, phys_size;
> > +	u64 phys_start, phys_size, ram_alloc_align = SZ_64K;
> >   	void *host_mem;
> >   	int err;
> >   	/*
> > -	 * Allocate guest memory. We must align our buffer to 64K to
> > -	 * correlate with the maximum guest page size for virtio-mmio.
> > -	 * If using THP, then our minimal alignment becomes 2M.
> > -	 * 2M trumps 64K, so let's go with that.
> > +	 * Allocate guest memory. We must align our buffer to 64K to correlate
> > +	 * with the maximum guest page size for virtio-mmio. If using THP, then
> > +	 * our minimal alignment trumps 64K, so let's go with that.
> >   	 */
> >   	kvm->ram_size = kvm->cfg.ram_size;
> >   	kvm->arch.ram_alloc_size = kvm->ram_size;
> > -	if (!kvm->cfg.hugetlbfs_path)
> > -		kvm->arch.ram_alloc_size += SZ_2M;
> > +	if (!kvm->cfg.hugetlbfs_path) {
> > +		if (kvm->ram_size >= HUGEPAGE_SIZE)
> > +			ram_alloc_align = HUGEPAGE_SIZE;
> 
> There is logic in builtin-run.c to detect the host_ram_size(), could we
> use that instead to decide if we should apply this alignment ? Or retry
> the RAM allocation without the alignment on failure ?

As the mmap() sets MAP_NORESERVE, I believe it is only reserving address space,
I don't think a failure is expected because we increase the size of that
reservation or did I miss anything?

> 
> It doesn't look like a good idea to hard code this based just on the
> requested RAM size.

The idea is just if we know the guest doesn't have enough RAM to install at
least one THP, then there is no need over-mmap. But it isn't saving anything
really so perhaps I may as well drop it?

> 
> Cheers
> Suzuki
> 
> 

Thanks for having a look,

-- 
Vincent

> 
> > +
> > +		kvm->arch.ram_alloc_size += ram_alloc_align;
> > +	}
> >   	if (kvm->cfg.arch.guest_memfd)
> >   		kvm->arch.ram_alloc_start = mmap_guest_memfd(kvm,
> > @@ -63,7 +68,7 @@ void kvm__init_ram(struct kvm *kvm)
> >   		    kvm->arch.ram_alloc_size, errno);
> >   	kvm->ram_start = (void *)ALIGN((unsigned long)kvm->arch.ram_alloc_start,
> > -					SZ_2M);
> > +					ram_alloc_align);
> >   	if (!kvm->cfg.arch.guest_memfd) {
> >   		madvise(kvm->arch.ram_alloc_start, kvm->arch.ram_alloc_size,
> > 
> > base-commit: f67bc0bdae9433a9cfd05e65ea2c1bb6102566d9
> 

