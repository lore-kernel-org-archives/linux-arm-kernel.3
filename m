Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D31606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLJ+SOFr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cEvVYd0Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhQTHhRDxrb17zR175fyiocPa+1wRm/9Uxlolic7thk=; b=FLJ+SOFrMQD3HBEPGIbIYS1a3f
	tU8kMfCXuhGITKKqQ+BcwCBCgU9itEB/s9pKayvGS95OZKdnmJVoelSzqivgSFfd9voKaLCLGPljA
	32dDyALU4nlFYI7siXju8GycjO/PntZN4/WEpU47cFsCbcyO/Y3eRwwtnTkwQUqjFJx03mkeMchj0
	wc5NOP8ExuJVbq0tJX8Z4cT5CwEqMZHymAHyLWYXpddpeRfwijN/YvEvcWdpOCoPgObv+7OaNn7BC
	R90Php/18341Edq+qzfuRX+bHLe2ZClaDFX11OrDxJb8X5SV+ktCua3JH3OE40kQxbBD2vE67H//d
	PGvwa0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9ji-00000009lvt-0dH7;
	Tue, 20 Oct 2026 13:18:38 +0000
Received: from out-212.mta1.migadu.com ([2001:41d0:203:375::d4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9jg-00000009lul-2JTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:18:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3yy/71fTKQCgcgYM/XB0wovh4NMYwl9+gtTV2Y2B9rQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792502313; v=1; x=1793107113;
 b=cEvVYd0Zw1fBVx2I/J2sIItGv75BdUqwT8GoVlIqLyaLvrqtaNKGI92X4oSQ3NiGLPMWArTj
 B4S/FfWG37R4mmPFXt64SdhI3vNd4x9V4vyGz1RZ2qx9WBN7mC44V3DIe5meT1hvdu62Aula2rk
 tUGZcPZqi8jCGN5TN1P5eTZ4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d91aa9937100fc82;
	Tue, 20 Oct 2026 13:18:33 +0000
X-Mizu-Trace-ID: d91aa9937100fc82
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6866e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByB7Xp+CbAFYK+dqUvH7ldATG//ABK/Reww4CV8PmzGtPE+F2CMGY3bqVLy+mk+wiq1gf0yhDJBLF+PYLTYsonb@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2FnNUOKee4OkApLl+GtccYaWf6YtJ3TR4MYQWXxFzNlW3zFnH
	dds5V0wrlW5iMjYQ2W4zE3FT2LAqu2ElKP8g62qx5TRQDDVrBW1BlIMedLDz+DmNxV35OXuvOCd
	+tGvA00BkBaKxdPjD+HM5pTKdCJpo8SHRPsuas84P
X-Received: by 2002:a05:6512:10ca:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5be66f2d62fmr148849e87.12.1792502311357; Tue, 20 Oct 2026
 06:18:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-4-fuad.tabba@linux.dev> <atdXdtXXTH-6DWVt@gremlin>
In-Reply-To: <atdXdtXXTH-6DWVt@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:17:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzH_GA=Vigd_nDXKDFAPCJStcANFFLeLXvsh3UqpjOpCQ@mail.gmail.com>
X-Gm-Features: AclHuK-euDF0wuuv5pnt6Njq_PrWwxGpuc1BgLKpLexvwAe-pbj6xoTqUlxrbHk
Message-ID: <CA+EHjTzH_GA=Vigd_nDXKDFAPCJStcANFFLeLXvsh3UqpjOpCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Sanitise MTE tags when a permission fault
 installs a mapping
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Price <steven.price@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_061836_736585_6EACF403 
X-CRM114-Status: GOOD (  16.50  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Tue, 20 Oct 2026 13:14:01 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -2060,7 +2060,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
> >                  }
> >          }
> >
> > -        if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
> > +        if (mapping_size != perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
>
> So 'translation fault or permission fault if this will install a mapping' rather
> than 'translation fault' alone right?

Right.

> Just after this code you have:
>
>         if (mapping_size == perm_fault_granule) {
>                 ...
>         } else {
>                 ...
>         }
>
> So you could put
>
>                 if (!s2vi->map_non_cacheable && kvm_has_mte(kvm))
>                         sanitise_mte_tags(kvm, pfn, mapping_size);
>
> In the else branch? Seems neater and clearer.

Agree, I'll move it there in v2.

> Also I wonder if the !s2vi->map_non_cacheable && kvm_has_mte(kvm) check could be
> abstracted?
>
> E.g.:
>
> static bool is_mte_fault(const struct kvm *kvm,
>                          const struct kvm_s2_fault_vma_info *s2vi)
> {
>         return !s2vi->map_non_cacheable && kvm_has_mte(kvm);
> }
>
> Then could be:
>
>         if (is_mte_fault(kvm, s2vi))
>                 sanitise_mte_tags(kvm, pfn, mapping_size);

I'd rather leave that out: the fix doesn't change that part of the
condition, and it only appears twice.

Thanks,
/fuad

