Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB275C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=; b=G9qy9idTDfha0l50kQ/9xTGS5P
	3kkpDrUtLH+C3FtaUEoKjvy5tWaB9qP3Et1gX/heGOEXN08d3OiFXTeyQPnMw0f/MRmGxrkvqohJM
	jUXKEsfke7FvKm0c/d/c/oBtecEz+5iHIyHkmlAcEOssMhhsy4/V51ISFkFICkXdJzY96i2A5t/JO
	lY3NLB3Fj/CIz123ofARh/n1sQbbLUMQzaWugHribjffJ81puKAQDiy+LIc51xEoQ5V2KjNLmthxn
	9aTbpa1q9kKUZQ3ZpujfwMaYgNlwj8awW2UGi0zk78U3E/v9jp4m9zqZq+aVFR6kzH0OHFWCsmI6B
	9moLepxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x7f-00000009Jle-2IWs;
	Tue, 08 Sep 2026 14:48:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x7e-00000009JlA-1PHh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=; b=ZlFpaSxnGPLTPJVScNtvK5pdHi
	vHxNJyXTv9R38llZ48k4IyigVd4pi4S/GP6TnUffPDrs3ZCEOOWxR4M+t916FY0Su642XAt7PwBZY
	RjYL/Kcpo9Ct81jEXlcUAc1amMd6JptLSJ2WyFasi/b/cStClgO6Rg/FNxk+2kPFQh7Urp2wkmAjS
	ePQ3dXnZ2X6YeVuqJ2X+ULMAO+e9qkH+fcU3c9bKNAVOsnRxSuEwtcsrIgxoJS+uRYDsVIvgznBFW
	sJdq4hMHTGYwcjEWsWhN/6xOPN3z0xbR6DxPI5DKNizeLvU0voI/qy0SuJFgXD8q5uCeHnEgGtxH2
	MOMpLM/w==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3x7Y-0000000HYed-41v9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:48:29 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843703c170so325983f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788878904; cv=none;
        d=google.com; s=arc-20260327;
        b=Cw4CQG9PVA6dLsWFUob0kz7xJyH1AJqtykKkL3H8zxhL38kc5oyTcq6INIW4lPC5X3
         bQHO4joF5FkdXMWBawKekTSZC1a2tMCPpbudOtMY83yHc0/LC3VDrmon1pyxIxuS6rxl
         lLBfSBZniwzaly4asWDOKSDwxxBirvRlIBLcxHUah1tLmsm8Z+r7gOr9xDd4PkKBRuG+
         VvAjp1Oqyb2qe3HMnGtc3goUsmSA6Q5det414E076nGYtx/TOWZauE4eS+4+P94oYrga
         yiYlSsNFhfQhdYM7GigrXlaevgrDdx8Pp9mzibmnaf8MJHDTwT26YfEpk4mSySd6gJT+
         6+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=;
        fh=DFo/O43K4cvmKUBmNYpID77WZX+Ika/RGB0OLhazYMA=;
        b=Y2/YbCMTkdrOvDH8p1EzKPX+dWTJz8I+v1qWGlTaoXnBnsaQw87UzWB2VYEoeZIVsK
         tRrLV+xwo/zUXsjRdM9fQwChBy+WR+8bc+z1xfIyn7w2H/rj64U0D6lJOd8dbgCQl+xo
         RZrscWwpErVbyI8RsUqpEUF8dCf+J6uqMuYpVAUgVlkP6EaOtZ4ctCI1hBg3sI7nqvey
         /5xIldS5XrxiEik1MkvOOD3BxRT5/CWlm9OhmhfwpVgtcDVdghDHEjarfp0b+2tIKZN7
         jUWr1p82km1qaA+tFzqpkVEJ2GIMDEjpUVLsqRYacbH5j7R8e5yMzOXtFMlK8EItGwqm
         4N6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788878904; x=1789483704; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=;
        b=NC7qjLuzG9ZdSwev17v7Ni9Kbh4WRi0s46CGceKcKYKeNfi8jqD0WiECrkWkqDNYqz
         Yt1lAl4AuACS/NS7YrgcJF1XiWAEYLUJi9WPca5/TXUNoJ+N7J69JQlnGt4DUAZH2xAu
         nDKBjDES11T5tl12GPOoYQY5RXmkKxrxlsTpUgJkqAJOHt5c4T2pZIuTMqYTYzSkYVKs
         RvnvIJu7ZzQjrW2J89P6/tr6vvkQvXTmlunM3rrVqZc9vlHki2WhM2NjTg3ufrIfPIGu
         awqwUTHBudxQZO7OkQte2PF95sLNfDr136dz5ThOAV9EF7ZHTujqCCeV2RAiUUjokc+n
         KRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878904; x=1789483704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NYcqD9fW2oLParj8320kOSOxI0m9dJtpaA9HezT2S8=;
        b=CDpylQ8opAnE77k6dBauPSsk+Ev0DUhU7O1QVEuNvOlxseGQGUHRrLqsk90fcz/FXl
         iTLePmDSYeLe5hXSlWHVObSdWSPJ0o0nacUA3f2g5OCq0vUqKl+Rz1rAg3C6hGtoWq9w
         Az1sFFt5AYrCgHMHJJuaMK2GnKKcEg9ilVF1tntUCecVcc7a11ph34hPv8oI8OYnE1tb
         FUR4oxLWL0pPVpxCtFZMuTM3COLQgtoUCw2pEuXWtNu4Bg+10d2+TaV4tXYGXLz/PlRN
         6W2UKxh3i432+/GQNXcom8qkvdCh54NgljkzVnSivQu4DQxwFk3iT1uz+ZXAYHQrh3Dc
         0sHg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ0TIm8BtG8ycR6otmVFR5UjTGXBZfDKwHCrDmHFxuAhBCgl+lRvikPd1DSHSC6lnIYS1N1xEQJaQjUR1xZUDm@lists.infradead.org
X-Gm-Message-State: AFuF++mPT1tyVqgsFrtKeV+4K7+7uZ790QkNrj8dOhu+GcbqskH1hS4T
	Vwl2chLtGJg4GQl4/lzVzLqPVv4xc06fqdq/fexkcrwCNuFAPDNjJTqJualjh5lkbUJe6p7YJTz
	DBuPuKZ0X99WMh/gX8UOw+zIrLRl/oNA=
X-Gm-Gg: AYBFou070b860DmDHY5OplL5NgH6auo3JfYgMlTcGTjsnSNzHA0fQVAyngLujG84mZk
	lEC8gGhCR5km9Qe4pUu9XCbyuxc25o/bXSYYvmVpq5pthXM3rcRbdR/6gIPHY/b6BkAzQciazHd
	x63MFpiVSajb0e6INpD8ngQ9iXruRxTchhOluUo5XojXmBDulA7YXXqGYDAuq7CnIdgYSapgjxo
	qRIKL+mk7UD0odEXe9+bD2WiefFA2x44swMu8kVyy0A+a/2SJBIHHy7zxZIcVSUAM7fhzFphJ4t
	njwEH84+fePwuetcxFCGuyKMO0w5G0SlnbOwOVLkYqOpQKz8hc4/fJ4NmelFTj9d+TYH1nbR6Ue
	9Fb1s5259e/k+euk8jAJX++FHmnoTiOU=
X-Received: by 2002:a5d:5e0a:0:b0:484:3200:b7a6 with SMTP id
 ffacd0b85a97d-485907ec2c3mr20932696f8f.4.1788878903312; Tue, 08 Sep 2026
 07:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
In-Reply-To: <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Tue, 8 Sep 2026 22:48:11 +0800
X-Gm-Features: AcwNN1W4h4jJ4-flD89PVNlVIy_4xMFWj1BYld6srQf6ZceGKY-mFk9Pv3akMZI
Message-ID: <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, usama.arif@linux.dev, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, rppt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_154825_036247_C8FB496A 
X-CRM114-Status: GOOD (  28.89  )
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

On Tue, Sep 8, 2026 at 4:30=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 9/1/26 17:18, Xueyuan Chen wrote:
> > The persistent huge zero folio is shared globally and should stay zero
> > after initialization. As Jann Horn pointed out [1], kernel bugs have
> > ended up writing to pages that were meant to be read-only, including in
> > security-sensitive cases. Making the folio read-only in the direct map
> > turns such writes into faults instead of silent zero-page corruption.
> >
> > Add a page-based helper consistent with the existing direct-map interfa=
ces.
> > Handle TLB invalidation in the architecture implementation; unsupported
> > architectures retain their current behavior.
> >
> > Protect the folio after initialization. Skip highmem folios, which have=
 no
> > permanent direct-map mapping.
> >
> > Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > discussion [3] with Yang Shi.
> >
> > Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@=
google.com [1]
> > Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@ke=
rnel.org [2]
> > Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9E6dL=
OULohnhBguvi9A@mail.gmail.com [3]
> >
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  include/linux/set_memory.h | 17 +++++++++++++++++
> >  mm/huge_memory.c           | 13 ++++++++++---
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > index 3fe293cfed8c..ed9ce04b18a1 100644
> > --- a/include/linux/set_memory.h
> > +++ b/include/linux/set_memory.h
> > @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> >  #endif
> >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >
> > +#ifndef set_direct_map_ro
> > +/**
> > + * set_direct_map_ro - make a direct-map range read-only
> > + * @page: first page in the direct-map range
> > + * @nr: number of pages in the range
> > + *
> > + * Make the direct-map range starting at @page read-only and invalidat=
e stale
> > + * writable translations before returning.
> > + *
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +static inline int set_direct_map_ro(struct page *page, unsigned int nr=
)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_X86_64
> >  int set_mce_nospec(unsigned long pfn);
> >  int clear_mce_nospec(unsigned long pfn);
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 54494c3fa983..742283b36d74 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/pgalloc_tag.h>
> >  #include <linux/pagewalk.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/set_memory.h>
> >
> >  #include <asm/tlb.h>
> >  #include "internal.h"
> > @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> >       huge_zero_folio =3D alloc_huge_zero_folio();
> >       if (!huge_zero_folio) {
> >               pr_warn("Allocating persistent huge zero folio failed\n")=
;
> > -     } else {
> > -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > +             return 0;
> >       }
> > +
> > +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > +
> > +     /* Highmem folios have no permanent direct-map mapping to protect=
. */
> > +     if (!folio_test_highmem(huge_zero_folio))
> > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_P=
MD_NR);
>
> Assuming we keep the page-based approach, can't we just move the highmem =
test in
> there?

Hi David,

We can move the check into set_direct_map_ro(). However, on x86,
set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
also expect callers to exclude highmem pages.

Would it make sense to make highmem a documented no-op for those
helpers as well, so the direct-map APIs handle it consistently?

Thanks,
Xueyuan
>
> --
> Cheers,
>
> David

