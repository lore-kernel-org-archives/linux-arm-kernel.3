Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325AEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 05:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuBzISU5VFPAjsRkdsiFIlUcNiX/+1PtQJcrEZX9csg=; b=g/7//QYVgh8AE2i7B0c1bowSYZ
	drqZQgmPn1ijJ1rHfc7WGs7OVhQgCN0iIpq+UkeTr6jV7aWuzRjXLr3hdzWei7v+eEKJyxak9ZIOg
	7B+qcP2VdMSemknj6SISLBQw5+TbTkJWu2KdzrKqf+e+Ke4+eHVAqslO8i6XOSacfnFesKFk9bAMh
	k32gF5ikM9TbbGTMJkp5bedAKzlJkaVLOYC3i6xAHxoKLUBcRjx1I3n0l9AENqzMCm4TnwgAHPQE5
	9M47VS985GaTPZ60qWIDEG9dk3IexbJJNo7Z0NanDOrOJspWWeb1/DW+QpSy1N2u1diG+1TsU0+q1
	vw6ISAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwC0-0000000Ai8L-0RCm;
	Wed, 15 Jan 2025 05:43:52 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwAk-0000000Ai3A-1a5w;
	Wed, 15 Jan 2025 05:42:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso906633966b.2;
        Tue, 14 Jan 2025 21:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736919753; x=1737524553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuBzISU5VFPAjsRkdsiFIlUcNiX/+1PtQJcrEZX9csg=;
        b=ed1YRSqgRaWZJzIisPRdx11i0pbxCCHaVddaoSZ347H0ORUHelvwI2BXlhgY6pyGvz
         bY9kdjtZSn/i0m/GdEnaraNwK6HBDbs/ArC4igW38jwpwK2ZJ7d90/EtOYK2F2qzLFov
         D02cCHeyRy0HpncHWxa/yQQVtPG9eE1AcVuOHzcnacPRgLP2u1VgiDiKlcbm9nNtGAE9
         9rBe5pJppM3YjaudPfM+wj/Ib1OKf2bikPzwdgRuvrSjtoA44kfP8PsBhJvRnKY/GTpp
         f/2o0IIOHS/+GwzKZdvlaYb9zeLlidmfHAzt9t8KxUwfuPuovbp8nnAJB3j0yehN+ZZ2
         DlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736919753; x=1737524553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuBzISU5VFPAjsRkdsiFIlUcNiX/+1PtQJcrEZX9csg=;
        b=hgMK/L6yomRfDRitHUBiWsrnQgkO3t+8HashUynMvOqQfxYCvhNOiRq/Ek/DTuOfHY
         nQWchi5fIl8jxA64ZidI0JMFo6Bt3kpK5rRZinNJBqFxf3AiPcvjJwN0FxqwBWxU54bk
         lFvTDCZrEvOuUwc286e0Iya6nyHs0o147kLaeUEdWGXldqHdS60DYFQuoBWl59bpkygG
         YpzK/oC/Gwhw9zCbObVIRpOsyMNuaX/FemCxu2EO+2nTsYl5Y4VdzGs8xItqHUHdC9Zd
         fx409wSagkcne4KWpt2j1idxLodUyQ9tMLkwNQYToxY+U4hQETY7Jf1+siyO9wzcipd3
         yvOw==
X-Forwarded-Encrypted: i=1; AJvYcCUbvkbudpHki/8o2VNUExlPLnYyoWNu068J8/KnR6dMzzc2dV9uFusIwKJXZOdyIvYBLQF3SQ4FaPJpIrg=@lists.infradead.org, AJvYcCWHCKkCp85vkvPElxfq7oh/GNTw+e+0qERxjs9fCHwrPlWQwP8pwqtjPczDQkU8/Kmck0kDj7Uh9kFzHzB078oq@lists.infradead.org
X-Gm-Message-State: AOJu0Yys6emLu6q/ey0wG5TdkON8h3gvoqk+cpBOSfFFlLfxLgUK3NqO
	J6NY3EKsR7zhVCtydOv9+G42MVfEHlrOXR9LHjSYLdv4WOb4xG4CQWZo7T05mmu2y2nFfhkkrKa
	Zqcc96bO/YNrhlCTGZsFPBJMLVVQ=
X-Gm-Gg: ASbGncv5ZsYFGqZd5wGBu6/ybrSWxKB7/eBSlU/oF0zTcdwFmWaEwioimF5yurZ30QQ
	F/H1ZEIJh1vSRqkSnLKjNTnr5K6/RT4rNAzi+vg==
X-Google-Smtp-Source: AGHT+IFPndA0UnHuFvKNHji3gtntOaWwA5e+Fc7f8rILAQ7wRnmjAYYDRlAaokCLMY9u4f9Tm0Y1CgsH6jrpedhqsmg=
X-Received: by 2002:a05:6402:35ca:b0:5d0:d818:559d with SMTP id
 4fb4d7f45d1cf-5d972e0b954mr70203434a12.11.1736919752505; Tue, 14 Jan 2025
 21:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
 <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com> <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com>
In-Reply-To: <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 15 Jan 2025 13:41:56 +0800
X-Gm-Features: AbW1kvbgJbBDZ9E1MWxWALOwnicXwxZfzPZ7oAIJcXasjZxKMd8HDROy6TEL6hE
Message-ID: <CAK1f24=9P7uz5q4GiB9Az4xebMLzqw_+YVX2Z9rG8fLVozcrQg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_214234_418250_8387803F 
X-CRM114-Status: GOOD (  31.00  )
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

On Wed, Jan 15, 2025 at 1:09=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Wed, Jan 15, 2025 at 6:01=E2=80=AFPM Lance Yang <ioworker0@gmail.com> =
wrote:
> >
> > On Wed, Jan 15, 2025 at 11:38=E2=80=AFAM Barry Song <21cnbao@gmail.com>=
 wrote:
> > >
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > The try_to_unmap_one() function currently handles PMD-mapped THPs
> > > inefficiently. It first splits the PMD into PTEs, copies the dirty
> > > state from the PMD to the PTEs, iterates over the PTEs to locate
> > > the dirty state, and then marks the THP as swap-backed. This process
> > > involves unnecessary PMD splitting and redundant iteration. Instead,
> > > this functionality can be efficiently managed in
> > > __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> > > improving performance.
> > >
> > > The following microbenchmark redirties folios after invoking MADV_FRE=
E,
> > > then measures the time taken to perform memory reclamation (actually
> > > set those folios swapbacked again) on the redirtied folios.
> > >
> > >  #include <stdio.h>
> > >  #include <sys/mman.h>
> > >  #include <string.h>
> > >  #include <time.h>
> > >
> > >  #define SIZE 128*1024*1024  // 128 MB
> > >
> > >  int main(int argc, char *argv[])
> > >  {
> > >         while(1) {
> > >                 volatile int *p =3D mmap(0, SIZE, PROT_READ | PROT_WR=
ITE,
> > >                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > >
> > >                 memset((void *)p, 1, SIZE);
> > >                 madvise((void *)p, SIZE, MADV_FREE);
> > >                 /* redirty after MADV_FREE */
> > >                 memset((void *)p, 1, SIZE);
> > >
> > >                 clock_t start_time =3D clock();
> > >                 madvise((void *)p, SIZE, MADV_PAGEOUT);
> > >                 clock_t end_time =3D clock();
> > >
> > >                 double elapsed_time =3D (double)(end_time - start_tim=
e) / CLOCKS_PER_SEC;
> > >                 printf("Time taken by reclamation: %f seconds\n", ela=
psed_time);
> > >
> > >                 munmap((void *)p, SIZE);
> > >         }
> > >         return 0;
> > >  }
> > >
> > > Testing results are as below,
> > > w/o patch:
> > > ~ # ./a.out
> > > Time taken by reclamation: 0.007300 seconds
> > > Time taken by reclamation: 0.007226 seconds
> > > Time taken by reclamation: 0.007295 seconds
> > > Time taken by reclamation: 0.007731 seconds
> > > Time taken by reclamation: 0.007134 seconds
> > > Time taken by reclamation: 0.007285 seconds
> > > Time taken by reclamation: 0.007720 seconds
> > > Time taken by reclamation: 0.007128 seconds
> > > Time taken by reclamation: 0.007710 seconds
> > > Time taken by reclamation: 0.007712 seconds
> > > Time taken by reclamation: 0.007236 seconds
> > > Time taken by reclamation: 0.007690 seconds
> > > Time taken by reclamation: 0.007174 seconds
> > > Time taken by reclamation: 0.007670 seconds
> > > Time taken by reclamation: 0.007169 seconds
> > > Time taken by reclamation: 0.007305 seconds
> > > Time taken by reclamation: 0.007432 seconds
> > > Time taken by reclamation: 0.007158 seconds
> > > Time taken by reclamation: 0.007133 seconds
> > > =E2=80=A6
> > >
> > > w/ patch
> > >
> > > ~ # ./a.out
> > > Time taken by reclamation: 0.002124 seconds
> > > Time taken by reclamation: 0.002116 seconds
> > > Time taken by reclamation: 0.002150 seconds
> > > Time taken by reclamation: 0.002261 seconds
> > > Time taken by reclamation: 0.002137 seconds
> > > Time taken by reclamation: 0.002173 seconds
> > > Time taken by reclamation: 0.002063 seconds
> > > Time taken by reclamation: 0.002088 seconds
> > > Time taken by reclamation: 0.002169 seconds
> > > Time taken by reclamation: 0.002124 seconds
> > > Time taken by reclamation: 0.002111 seconds
> > > Time taken by reclamation: 0.002224 seconds
> > > Time taken by reclamation: 0.002297 seconds
> > > Time taken by reclamation: 0.002260 seconds
> > > Time taken by reclamation: 0.002246 seconds
> > > Time taken by reclamation: 0.002272 seconds
> > > Time taken by reclamation: 0.002277 seconds
> > > Time taken by reclamation: 0.002462 seconds
> > > =E2=80=A6
> > >
> > > This patch significantly speeds up try_to_unmap_one() by allowing it
> > > to skip redirtied THPs without splitting the PMD.
> > >
> > > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Suggested-by: Lance Yang <ioworker0@gmail.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >  mm/huge_memory.c | 24 +++++++++++++++++-------
> > >  mm/rmap.c        | 13 ++++++++++---
> > >  2 files changed, 27 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 3d3ebdc002d5..47cc8c3f8f80 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(st=
ruct vm_area_struct *vma,
> > >         int ref_count, map_count;
> > >         pmd_t orig_pmd =3D *pmdp;
> > >
> > > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> > > +       if (pmd_dirty(orig_pmd))
> > > +               folio_set_dirty(folio);
> > > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE=
)) {
> > > +               folio_set_swapbacked(folio);
> > >                 return false;
> > > +       }
> >
> > If either the PMD or the folio is dirty, should we just return false ri=
ght away,
> > regardless of VM_DROPPABLE? There=E2=80=99s no need to proceed further =
in that
> > case, IMHO ;)
>
> I don't quite understand you, but we need to proceed to clear pmd entry.
> if vm_droppable is true, even if the folio is dirty, we still drop the fo=
lio.

Ah, you're right, and I completely got it wrong ;(

Thanks,
Lance

>
> >
> > Thanks,
> > Lance
> >
> > >
> > >         orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
> > >
> > > @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(st=
ruct vm_area_struct *vma,
> > >          *
> > >          * The only folio refs must be one from isolation plus the rm=
ap(s).
> > >          */
> > > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> > > -           ref_count !=3D map_count + 1) {
> > > +       if (pmd_dirty(orig_pmd))
> > > +               folio_set_dirty(folio);
> > > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE=
)) {
> > > +               folio_set_swapbacked(folio);
> > > +               set_pmd_at(mm, addr, pmdp, orig_pmd);
> > > +               return false;
> > > +       }
> > > +
> > > +       if (ref_count !=3D map_count + 1) {
> > >                 set_pmd_at(mm, addr, pmdp, orig_pmd);
> > >                 return false;
> > >         }
> > > @@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_str=
uct *vma, unsigned long addr,
> > >  {
> > >         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
> > >         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> > > +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> > > +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
> > >         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
> > >
> > > -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
> > > -               return __discard_anon_folio_pmd_locked(vma, addr, pmd=
p, folio);
> > > -
> > > -       return false;
> > > +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio=
);
> > >  }
> > >
> > >  static void remap_page(struct folio *folio, unsigned long nr, int fl=
ags)
> > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > index be1978d2712d..a859c399ec7c 100644
> > > --- a/mm/rmap.c
> > > +++ b/mm/rmap.c
> > > @@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *fol=
io, struct vm_area_struct *vma,
> > >                 }
> > >
> > >                 if (!pvmw.pte) {
> > > -                       if (unmap_huge_pmd_locked(vma, pvmw.address, =
pvmw.pmd,
> > > -                                                 folio))
> > > -                               goto walk_done;
> > > +                       if (folio_test_anon(folio) && !folio_test_swa=
pbacked(folio)) {
> > > +                               if (unmap_huge_pmd_locked(vma, pvmw.a=
ddress, pvmw.pmd, folio))
> > > +                                       goto walk_done;
> > > +                               /*
> > > +                                * unmap_huge_pmd_locked has either a=
lready marked
> > > +                                * the folio as swap-backed or decide=
d to retain it
> > > +                                * due to GUP or speculative referenc=
es.
> > > +                                */
> > > +                               goto walk_abort;
> > > +                       }
> > >
> > >                         if (flags & TTU_SPLIT_HUGE_PMD) {
> > >                                 /*
> > > --
> > > 2.39.3 (Apple Git-146)
> > >

