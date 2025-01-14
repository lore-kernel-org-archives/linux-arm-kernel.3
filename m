Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6FFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/HT78sRahP5ulxdNOkZtrsKmU33SZDp38yP+gXDzbs=; b=xvlosGHCOQoUs8qPCXO+ae8JfC
	S7tlHBz7yFXnGZ9NFyANj3y4GJ6gejvLRgHixt6M2oeNmxBdziM66doAmIvZ9Gs+hiyueOsWOtPGN
	8ryhj9pxF3P8/He7pNNy3xpyMnh6l/1X/I102UY3UfoQOOF2p8V19XBLqgKEWrOtNx8Y9Mg1yxSAD
	l6NjSOkyJdbKbHSZqEn6+yO1ove9a0fW+9lZ7A5GfZw6dpTg6+U0NpBRuYfXTRb6bXscsraU0oOQQ
	+JBRBSqfnMN27b3ai1gYUfhYkyUH1Agta6JTzzYWxh7u48TtVBKV8A01eT5I+K97Ny+JvQaHkR/6M
	/sKDh2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeMD-000000088J9-14Jd;
	Tue, 14 Jan 2025 10:41:13 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeIw-000000087gg-2X9n;
	Tue, 14 Jan 2025 10:37:51 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso1349520241.2;
        Tue, 14 Jan 2025 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736851069; x=1737455869; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/HT78sRahP5ulxdNOkZtrsKmU33SZDp38yP+gXDzbs=;
        b=bai2P86K/S1xxBBaeTTSUtBaTzLxmWEhxuQfNMcestth+So7X5F1rQkisc02YnMyGf
         W0kNLPaEM+SYFIArUbqqnWMI39XXl4PwqwXG9BGV7EJgt8AnDzcyjBf29k7vmDlq4m1K
         MoW1ctYeMrIJ2IKE39XB6ew0aQZ8LeFfC3mPOG/I+oR6ev4je7fqUGYQB4UDURkICRWz
         R77GMul/xIY9B+6p4QbyXyj1ny22gvryaQc5iSSuVZO2USeD4GHLHZxP8c0S1ofr9fue
         IMCM2Zctz05cDVuzvS/HeUyEZFEYA7gyZYEP9teZaTEmBaLUOfTcdnvGh3BBDc5UbiBZ
         CD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851069; x=1737455869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/HT78sRahP5ulxdNOkZtrsKmU33SZDp38yP+gXDzbs=;
        b=ACyKQAUtHu9ThzHOnSQZhxM/kuPIGgq+hs8Ltjw6ODD4Of8sboPnn7BPimP7QnszDN
         qYH8/5VyocZpqieyUR+f+bDijSSyHD0WotCPCNxnA5TGG1B7S24DMmdxsakKPu8H5uMl
         6KckFGvmarG+leBzZ9gZ+sNwVQM6IuOASAAbQ6ofkfKKcmc1OofyzoUzhDgjHaLxl6sn
         ti9tmxntBOkIIiYX4C4pta9J9TapOCdv7i2ipuEa6pCEz0OWdJD4rM6Qo0K6joWAjWxF
         jvU5w0Kcf9wapuUz5EJCZNh9/KXN7ua0rxXscxuT/HDumzDDTa0k8pVWV97q1sGrJOsn
         loVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7OkmD+e2lDLzf1GoecTpYA8FhAJqrI1qHxJ+aGtQoKYNEljsDFnym6jE/kqvW0BDtH8S8h92Fqopf0tE=@lists.infradead.org, AJvYcCWy8nxZNTe9SSqWZpqCgX8vhaPF4af5gk3YFUr7vNxd+gOhGMksEW4TJnYnN1JebfxvYm0+BkgQOMRuAxvqgM3G@lists.infradead.org
X-Gm-Message-State: AOJu0YwTuLRA+9ZXdIEGAsNh2uM8foXIaQwL/v2lkz8IsA5r2D932unT
	5bDWz6kYamldjSuOwOOq61rSIBQdi0PflXnn/FB4g3e3Utuywdxw0d7sFAfiOhQcu6DADDFlMmE
	fqXEAti5HdSTKE16IrbEbgQuvkIY=
X-Gm-Gg: ASbGncsSUzah0PMf4O2u17QeX7u6ZMZNcqnhr/3eXsNu9I6NdIF9CGamzoKijllmCLM
	fEE1gF1w4iEN2BAeUMNb/TraglAPWuEknb8bAtESvmLY6uGwjArnMEV1dfFxgRuTx1RdPUo71
X-Google-Smtp-Source: AGHT+IHI2AkOM8Hk95tvTRn7haGosukJN9wvnMrwUWz32Bwljqr7HCbWbJWPleVqx7F/PaKwYeTCyUr8eVtGz6JR8qY=
X-Received: by 2002:a05:6102:3ca0:b0:4b2:5c4b:5186 with SMTP id
 ada2fe7eead31-4b3d0fe692emr21832774137.23.1736851069161; Tue, 14 Jan 2025
 02:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20250113033901.68951-1-21cnbao@gmail.com> <20250113033901.68951-3-21cnbao@gmail.com>
 <f50b59ad-3b15-4ca8-9390-17319d441ed8@redhat.com>
In-Reply-To: <f50b59ad-3b15-4ca8-9390-17319d441ed8@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 14 Jan 2025 23:37:38 +1300
X-Gm-Features: AbW1kvb9zzKL_PAv-K0B9SXy-8Bp_Lg8h_lTkXYhRj7eUJYcRuyixwa4RAHqIWw
Message-ID: <CAGsJ_4zTK853D7m7F0ekeJULhnXxTbAJz8SknH+33gobg9mFVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm: Support tlbbatch flush for a range of PTEs
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com, 
	zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Gavin Shan <gshan@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yosry Ahmed <yosryahmed@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023750_647597_E43FE89E 
X-CRM114-Status: GOOD (  34.03  )
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

On Tue, Jan 14, 2025 at 10:52=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 13.01.25 04:38, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > This is a preparatory patch to support batch PTE unmapping in
> > `try_to_unmap_one`. It first introduces range handling for
> > `tlbbatch` flush. Currently, the range is always set to the size of
> > PAGE_SIZE.
>
> You could have spelled out why you perform the VMA -> MM change.

Sure, I=E2=80=99ll include some additional details in v3.

>
> >
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Shaoqin Huang <shahuang@redhat.com>
> > Cc: Gavin Shan <gshan@redhat.com>
> > Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Lance Yang <ioworker0@gmail.com>
> > Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > Cc: Yosry Ahmed <yosryahmed@google.com>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: Yicong Yang <yangyicong@hisilicon.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++------------
> >   arch/arm64/mm/contpte.c           |  2 +-
> >   arch/riscv/include/asm/tlbflush.h |  3 ++-
> >   arch/riscv/mm/tlbflush.c          |  3 ++-
> >   arch/x86/include/asm/tlbflush.h   |  3 ++-
> >   mm/rmap.c                         | 12 +++++++-----
> >   6 files changed, 28 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm=
/tlbflush.h
> > index bc94e036a26b..f34e4fab5aa2 100644
> > --- a/arch/arm64/include/asm/tlbflush.h
> > +++ b/arch/arm64/include/asm/tlbflush.h
> > @@ -322,13 +322,6 @@ static inline bool arch_tlbbatch_should_defer(stru=
ct mm_struct *mm)
> >       return true;
> >   }
> >
> > -static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unma=
p_batch *batch,
> > -                                          struct mm_struct *mm,
> > -                                          unsigned long uaddr)
> > -{
> > -     __flush_tlb_page_nosync(mm, uaddr);
> > -}
> > -
> >   /*
> >    * If mprotect/munmap/etc occurs during TLB batched flushing, we need=
 to
> >    * synchronise all the TLBI issued with a DSB to avoid the race menti=
oned in
> > @@ -448,7 +441,7 @@ static inline bool __flush_tlb_range_limit_excess(u=
nsigned long start,
> >       return false;
> >   }
> >
> > -static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma=
,
> > +static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
> >                                    unsigned long start, unsigned long e=
nd,
> >                                    unsigned long stride, bool last_leve=
l,
> >                                    int tlb_level)
> > @@ -460,12 +453,12 @@ static inline void __flush_tlb_range_nosync(struc=
t vm_area_struct *vma,
> >       pages =3D (end - start) >> PAGE_SHIFT;
> >
> >       if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> > -             flush_tlb_mm(vma->vm_mm);
> > +             flush_tlb_mm(mm);
> >               return;
> >       }
> >
> >       dsb(ishst);
> > -     asid =3D ASID(vma->vm_mm);
> > +     asid =3D ASID(mm);
> >
> >       if (last_level)
> >               __flush_tlb_range_op(vale1is, start, pages, stride, asid,
> > @@ -474,7 +467,7 @@ static inline void __flush_tlb_range_nosync(struct =
vm_area_struct *vma,
> >               __flush_tlb_range_op(vae1is, start, pages, stride, asid,
> >                                    tlb_level, true, lpa2_is_enabled());
> >
> > -     mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, en=
d);
> > +     mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
> >   }
> >
> >   static inline void __flush_tlb_range(struct vm_area_struct *vma,
> > @@ -482,7 +475,7 @@ static inline void __flush_tlb_range(struct vm_area=
_struct *vma,
> >                                    unsigned long stride, bool last_leve=
l,
> >                                    int tlb_level)
> >   {
> > -     __flush_tlb_range_nosync(vma, start, end, stride,
> > +     __flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
> >                                last_level, tlb_level);
> >       dsb(ish);
> >   }
> > @@ -533,6 +526,15 @@ static inline void __flush_tlb_kernel_pgtable(unsi=
gned long kaddr)
> >       dsb(ish);
> >       isb();
> >   }
> > +
> > +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unma=
p_batch *batch,
> > +                                          struct mm_struct *mm,
> > +                                          unsigned long uaddr,
> > +                                          unsigned long size)
> > +{
> > +     __flush_tlb_range_nosync(mm, uaddr, uaddr + size,
> > +                              PAGE_SIZE, true, 3);
> > +}
> >   #endif
> >
> >   #endif
> > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > index 55107d27d3f8..bcac4f55f9c1 100644
> > --- a/arch/arm64/mm/contpte.c
> > +++ b/arch/arm64/mm/contpte.c
> > @@ -335,7 +335,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_s=
truct *vma,
> >                * eliding the trailing DSB applies here.
> >                */
> >               addr =3D ALIGN_DOWN(addr, CONT_PTE_SIZE);
> > -             __flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
> > +             __flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PT=
E_SIZE,
> >                                        PAGE_SIZE, true, 3);
> >       }
> >
> > diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm=
/tlbflush.h
> > index 72e559934952..7f3ea687ce33 100644
> > --- a/arch/riscv/include/asm/tlbflush.h
> > +++ b/arch/riscv/include/asm/tlbflush.h
> > @@ -61,7 +61,8 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, =
unsigned long start,
> >   bool arch_tlbbatch_should_defer(struct mm_struct *mm);
> >   void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batc=
h,
> >                              struct mm_struct *mm,
> > -                            unsigned long uaddr);
> > +                            unsigned long uaddr,
> > +                            unsigned long size);
>
> While we're at it, can we just convert this to the "two tabs"
> indentation starting on second parameter line" way of doing things? Same
> for all other cases. (at least in core code, if some arch wants their
> own weird rules on how to handle these things)

Sure.

>
> [...]
>
> >       struct tlbflush_unmap_batch *tlb_ubc =3D &current->tlb_ubc;
> >       int batch;
> > @@ -681,7 +682,7 @@ static void set_tlb_ubc_flush_pending(struct mm_str=
uct *mm, pte_t pteval,
> >       if (!pte_accessible(mm, pteval))
> >               return;
> >
> > -     arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
> > +     arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
> >       tlb_ubc->flush_required =3D true;
> >
> >       /*
> > @@ -757,7 +758,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm=
)
> >   }
> >   #else
> >   static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pte=
val,
> > -                                   unsigned long uaddr)
> > +                                   unsigned long uaddr,
> > +                                   unsigned long size)
>
> I'll note that mist tlb functions seem to consume start+end instead of
> start+size, like
>
> flush_tlb_mm_range()
> flush_tlb_kernel_range()
>
> So I'm wondering if this should be start+end instead of uaddr+size.

For some reason, I can=E2=80=99t recall why I originally named it "uaddr" i=
nstead
of "address" at:
https://lore.kernel.org/lkml/20220707125242.425242-4-21cnbao@gmail.com/

The name seems a bit odd now.

It's probably because the arm64 functions listed below are using "uaddr":

static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
 unsigned long uaddr);
static inline void flush_tlb_page(struct vm_area_struct *vma,
                                  unsigned long uaddr);

At that time, we only supported a single page for TLB deferred shootdown.

Regarding set_tlb_ubc_flush_pending(), I=E2=80=99m fine with either approac=
h:
1. start, size
2. start, end

For option 1, it is eventually converted to (start, start + size) when call=
ing
__flush_tlb_range_nosync().

But if we convert to (start, end), it seems to align with

static inline void flush_tlb_range(struct vm_area_struct *vma,
                                   unsigned long start, unsigned long end);

So if there is no objection from Will, I will move to (start, end)
in v3.

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry

