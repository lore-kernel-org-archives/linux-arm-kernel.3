Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B7AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=; b=yJDOD6dcaHUIDukUwhyAw7qqDb
	adeQT57OsPhEdQeYyCpv5MYas2XRzEsUkV5FK2ne662MNZgOUsvvcHsNSvInLIwx976v4oTp+4XEq
	EZTyyRM3OcaWrZIKUh1Unj3FhD8vq1bB/prAgBGgNEVlKLEU3Fsy5jZCLVv0cN4WamzrH08TrsHzq
	4/MyMt0XvAN/VCJr9Yox9mhwI1s6yHSnGasLyKv1SVgWapT9OSrW7tOGoFIx2A01XKUdddwCK4QV8
	0jF+UzZ1t3wZ6Z02Ej2c66+tVlbGjtv2Ax+AjYEeYI0rq34jKfw7JPenLWLspZ3YjhkdMq6nuFt1H
	NMlNUPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPB5-00000008cCL-2cpJ;
	Wed, 25 Jun 2025 12:24:35 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNhj-00000008Mpq-0bh0;
	Wed, 25 Jun 2025 10:50:12 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so1797475137.1;
        Wed, 25 Jun 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848610; x=1751453410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=;
        b=AjOLgAzzUte4GrQ+Wclc4VzU2uWJCTvANWcqPTGuB6073PzEUYMgm8ilv9TWCU6zaa
         GDAQiWhBcHNy2wKo+qr53X4HhWN6OhbPvs+kqdH33lN85QTOcWsa/4FjKrrkYUm0iRSE
         5Xs5QAg+Vd88Pa9wW4l5uELl3WMOaKGFPLP7Gt7CUrneEY6cgbvbE+2ZEFusi4FgY2KJ
         MypSNPnx0qDwIUlc9/QPb5/kTrid+wSWCcvdAxE0CAoed+xuXAi+u8o138yIpkYug9h7
         9hMaJaKYhYBfWZ41G0LzOKygWJEIIVe6ae4XtNmRa6Oj4BB7eGPQBsaL001Ml5yc+7x8
         knrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848610; x=1751453410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=;
        b=fQrAFACJUatQNt0VNyIBMBKKxhHBtplTfjPRUHFk+T6Zpynv3FWSRNEZaG04JfTwV8
         /MpyrTgSpxsyqeHGOL2oUnSoqoP5tRwQcj4JibA3ndgW0lsIQu8rJnC3UxKuqwIWngQm
         Oich0r+sv+8VZxtzKNHI/JQQ9nCJhqhokYBw4TuSv4q8pxtZWP9FcYpOsUtqkBfxHjqD
         Kvkt33R1wk6DvKCAKIbMz5hGcdwfS37ZHcs3h+B/qSK3f7pY16L5+23+VErImCn/1J5d
         +i7x4jkFDYr7PJVFFAwjeS/ZmhF6vGPWTb6qqS0PfKEd319mgKqnlbe6nYbgNmycY864
         gcWg==
X-Forwarded-Encrypted: i=1; AJvYcCVoHc/gFRKWS544H1xcKEjAtSb1gWTGjawDyJ4jYJPcOIHkcEcFIbtfMJpZYCyFMe20j6lGELtLWjL5qb4a4Bu4@lists.infradead.org, AJvYcCWuVP8nFUiVC2xkF5hvzN65gQlIYIUJqQrzc4aX7+IyBpWeSNzJqPt9uUWJ6JHVUX2QNW3IABy9He/T4OU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyXBuY11SfpY+uSk5jWZbeIIoIuiAmP027Ol4kW+mOF0S0QlOM
	z4wJqPdDrSOZPsxYLVEvsGP5ls38AL0XBI4VCLvLn4/nlDEIhzeNG50FDMsBBDbuDw4z9DWwOO7
	GrN8hAQdiQt2G0/6M8G6ZvDu4IZBmTHY=
X-Gm-Gg: ASbGncviihgxZzKflzPA98z+rXYTtnbs3veWaSyiuwWVgdhxtVPa9F2XglNzSQ0hqMl
	MWm2o9bumJ1ITwbLBuAKYAsW+/86B9T+fLQ6nrqE2gXY8tPlM6+dBhd0XjoJC+TRAwlvkalrrUW
	LlPfPxEzp3A5eQ+gRbBavsNOhW0VyvRV0/y+ESRnrzfpk=
X-Google-Smtp-Source: AGHT+IFIGWbS74JzjCEZUb4i5VKaQ/aFUR/LkXTomtH2wQ2EWDeymwBSyFo8o2yIrCkV5HClVkxBQa8gvmUemUzz4AI=
X-Received: by 2002:a05:6102:4193:b0:4e9:968b:4416 with SMTP id
 ada2fe7eead31-4ecc76a9296mr1213988137.24.1750848609825; Wed, 25 Jun 2025
 03:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com> <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
In-Reply-To: <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:49:57 +1200
X-Gm-Features: Ac12FXxMNCsiYUkQXXJTm07hkaCKzJuFJqJgjEbwhAVFd_yNyGUFpCyPyMLyoy8
Message-ID: <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035011_191826_C3BE2D7F 
X-CRM114-Status: GOOD (  26.00  )
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

On Wed, Jun 25, 2025 at 10:43=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 12:38, Barry Song wrote:
> >>> diff --git a/mm/rmap.c b/mm/rmap.c
> >>> index fb63d9256f09..241d55a92a47 100644
> >>> --- a/mm/rmap.c
> >>> +++ b/mm/rmap.c
> >>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *foli=
o, struct page *page,
> >>>
> >>>    /* We support batch unmapping of PTEs for lazyfree large folios */
> >>>    static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> >>> -                     struct folio *folio, pte_t *ptep)
> >>> +                                           struct folio *folio, pte_=
t *ptep,
> >>> +                                           struct vm_area_struct *vm=
a)
> >>>    {
> >>>        const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_D=
IRTY;
> >>> +     unsigned long next_pmd, vma_end, end_addr;
> >>>        int max_nr =3D folio_nr_pages(folio);
> >>>        pte_t pte =3D ptep_get(ptep);
> >>>
> >>> +     /*
> >>> +      * Limit the batch scan within a single VMA and within a single
> >>> +      * page table.
> >>> +      */
> >>> +     vma_end =3D vma->vm_end;
> >>> +     next_pmd =3D ALIGN(addr + 1, PMD_SIZE);
> >>> +     end_addr =3D addr + (unsigned long)max_nr * PAGE_SIZE;
> >>> +
> >>> +     if (end_addr > min(next_pmd, vma_end))
> >>> +             return false;
> >>
> >> May I suggest that we clean all that up as we fix it?
> >>
> >> Maybe something like this:
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index 3b74bb19c11dd..11fbddc6ad8d6 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio=
, struct page *page,
> >>    #endif
> >>    }
> >>
> >> -/* We support batch unmapping of PTEs for lazyfree large folios */
> >> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> >> -                       struct folio *folio, pte_t *ptep)
> >> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> >> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flag=
s,
> >> +               pte_t pte)
> >>    {
> >>           const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT=
_DIRTY;
> >> -       int max_nr =3D folio_nr_pages(folio);
> >> -       pte_t pte =3D ptep_get(ptep);
> >> +       struct vm_area_struct *vma =3D pvmw->vma;
> >> +       unsigned long end_addr, addr =3D pvmw->address;
> >> +       unsigned int max_nr;
> >> +
> >> +       if (flags & TTU_HWPOISON)
> >> +               return 1;
> >> +       if (!folio_test_large(folio))
> >> +               return 1;
> >> +
> >> +       /* We may only batch within a single VMA and a single page tab=
le. */
> >> +       end_addr =3D min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), v=
ma->vm_end);
> >
> > Is this pmd_addr_end()?
> >
>
> Yes, that could be reused as well here.
>
> >> +       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >>
> >> +       /* We only support lazyfree batching for now ... */
> >>           if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >> -               return false;
> >> +               return 1;
> >>           if (pte_unused(pte))
> >> -               return false;
> >> -       if (pte_pfn(pte) !=3D folio_pfn(folio))
> >> -               return false;
> >> +               return 1;
> >> +       /* ... where we must be able to batch the whole folio. */
> >> +       if (pte_pfn(pte) !=3D folio_pfn(folio) || max_nr !=3D folio_nr=
_pages(folio))
> >> +               return 1;
> >> +       max_nr =3D folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr=
, fpb_flags,
> >> +                                NULL, NULL, NULL);
> >>
> >> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_fla=
gs, NULL,
> >> -                              NULL, NULL) =3D=3D max_nr;
> >> +       if (max_nr !=3D folio_nr_pages(folio))
> >> +               return 1;
> >> +       return max_nr;
> >>    }
> >>
> >>    /*
> >> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >>                           if (pte_dirty(pteval))
> >>                                   folio_mark_dirty(folio);
> >>                   } else if (likely(pte_present(pteval))) {
> >> -                       if (folio_test_large(folio) && !(flags & TTU_H=
WPOISON) &&
> >> -                           can_batch_unmap_folio_ptes(address, folio,=
 pvmw.pte))
> >> -                               nr_pages =3D folio_nr_pages(folio);
> >> +                       nr_pages =3D folio_unmap_pte_batch(folio, &pvm=
w, flags, pteval);
> >>                           end_addr =3D address + nr_pages * PAGE_SIZE;
> >>                           flush_cache_range(vma, address, end_addr);
> >>
> >>
> >> Note that I don't quite understand why we have to batch the whole thin=
g or fallback to
> >> individual pages. Why can't we perform other batches that span only so=
me PTEs? What's special
> >> about 1 PTE vs. 2 PTEs vs. all PTEs?
> >>
> >>
> >> Can someone enlighten me why that is required?
> >
> > It's probably not a strict requirement =E2=80=94 I thought cases where =
the
> > count is greater than 1 but less than nr_pages might not provide much
> > practical benefit, except perhaps in very rare edge cases, since
> > madv_free() already calls split_folio().
>
> Okay, but it makes the code more complicated. If there is no reason to
> prevent the batching, we should drop it.

It's not necessarily more complex, since page_vma_mapped_walk() still
has to check each PTE individually and can't skip ahead based on nr.
With nr_pages batched, we can exit the loop early in one go.

Thanks
Barry

