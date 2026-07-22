Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2213C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvrTKQMuH/eIiqrhZIkhsy/BDXpf6gi3fx2V0TPVyqE=; b=X0vh0UCVQQw91mc+76nxc5Wvbt
	RjhGO7DSTPBb7NgEyOgd7Oy3JtJd578hNM6b5/tMXa5LNy20MlteHCZ1OqOm7G8ExsW83TAdluuKx
	WUY6uxqpZrDTuPl0lpQk4o49OeQrhlv+VnrFsIlWRlVNsLfhqQp+4stzMEmTFrU/YX+yO/1bPdSbv
	/9MDvRBH/X2oJ8L0B6P7xg7AQzDLGwBZcHMr9BwOJ73aEKusOznBr6Uc5+z+d21WPRxEG1F9e7t4j
	2miaYwyNj9oV2oxMVlA/+ytKUs+vp43sUOsABDTYZVbS7bO3UTnxJI0vaVS7+tgc+I/SbUlLvgsVy
	SkxWJRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVUz-0000000BgXC-2Man;
	Wed, 22 Jul 2026 11:52:29 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVUw-0000000BgWh-1sXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:52:28 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rr2Vb98AAYeI4HnJRHboSQHJaICh57Udbg37Gbo1ILK9YJ5Tj/Y2wh6EzR0Gx4q4yU1MCgMmRpP9CqNVlfOb9WM@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784721141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yvrTKQMuH/eIiqrhZIkhsy/BDXpf6gi3fx2V0TPVyqE=;
	b=gWuPtXQO3eLN7iWVoOfUU+EL68sSk52A5wCtsbCUNghtBvHhbf2Pwc4zJaVcNWy0EAHExQ
	Y1MAy1ePOdJ0yVzQJ4fZ5tOE/yI3vrn8358Uty8GwaTysamVICIkcXJqE+LlAp1WaxBS5n
	KjnZezcR7voDsu9fSzp9nL6rY9o1Qiw=
X-Gm-Message-State: AOJu0YwcTbSs/gpngR5mMDsQyLuK1M5wqmk7KonNIamAai5Rnfn+qyuj
	2tzq3ufMf9qelKhzHATp1WY/qcd/YDuFfR3/X/DubO7iGtYGCYqlNI5dSGNNtcFN9DwCe/W7Wkz
	WG4tEFLIyy1eyta+BWhLVXYC6DOudpLi0UY+4KCgk
X-Received: by 2002:ac8:5d14:0:b0:526:d7ae:8eb1 with SMTP id
 d75a77b69052e-527efb1cb7bmr7672571cf.21.1784721132970; Wed, 22 Jul 2026
 04:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260721085646.1660673-1-smostafa@google.com> <86y0f4ejr4.wl-maz@kernel.org>
 <al9HqhO6sp3FFbtQ@google.com>
In-Reply-To: <al9HqhO6sp3FFbtQ@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 22 Jul 2026 12:51:35 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwp6gQDjL5uE+aAJ04yRnPgvABgBaBWe44hyVSMXGQP9w@mail.gmail.com>
X-Gm-Features: AUfX_myxGfq1s8jj6zkDmzja_7hOKzisg2DOisitMb1W1idiDZ-akaduHbBJtgw
Message-ID: <CA+EHjTwp6gQDjL5uE+aAJ04yRnPgvABgBaBWe44hyVSMXGQP9w@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Optimize protected mode and FWB
To: Mostafa Saleh <smostafa@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_045227_007069_2983C626 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, 21 Jul 2026 at 11:19, Mostafa Saleh <smostafa@google.com> wrote:
>
> On Tue, Jul 21, 2026 at 11:10:07AM +0100, Marc Zyngier wrote:
> > On Tue, 21 Jul 2026 09:56:45 +0100,
> > Mostafa Saleh <smostafa@google.com> wrote:
> > >
> > > KVM opportunistically enables FWB if supported by the system for guest
> > > VMs, which allows it to elude cache maintenance for data as they are
> > > forced to be cacheable from stage-2.
> > > In that case, __clean_dcache_guest_page() will immediately return.
> > > However in protected mode, before calling __clean_dcache_guest_page()
> > > it loops over the range and fix_map/unmap it, issuing TLB
> > > invalidations, dsb() and isb() unnecessarily.
> > >
> > > This can be optimized by returning early if FWB is supported,
> > > kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
> > > functions issue dsb() for the unmap path.
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 4e329e39a695..049a09be2bbf 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -261,6 +261,13 @@ static void __apply_guest_page(void *va, size_t size,
> > >
> > >  static void clean_dcache_guest_page(void *va, size_t size)
> > >  {
> > > +   /*
> > > +    * Guest stage-2 uses FWB if available, making it safe to elide CMOs.
> > > +    * In contrast, the host stage-2 never has FWB enabled.
> >
> > Beeeeeeep!!! Since a373930ec9406 ("KVM: arm64: Switch pKVM host S2
> > over to KVM_PGTABLE_S2_AS_S1"), FWB is enabled everywhere when
> > available.
> >
> > Not sure that changes anything, but the comment is factually wrong.
>
> Ah, I see it uses KVM_PGTABLE_S2_AS_S1 in that case, that should not
> change the patch, I will need to update the comment.

Sorry, this confusing is partially my fault. The original comment in v1

>  /* See __clean_dcache_guest_page() */

wasn't very clear to me, since I wasn't sure what I was looking for in
__clean_dcache_guest_page(). Talking to Mostafa in person, he's
referring to the comment _inside_ __clean_dcache_guest_page. I think
the best fix is to rephase as

+  /* See comment in __clean_dcache_guest_page() */

This would save duplication and having to repeat the comment.

Cheers,
/fuad

> Thanks,
> Mostafa
>
> >
> > Thanks,
> >
> >       M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

