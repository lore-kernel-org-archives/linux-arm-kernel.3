Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2313C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QTHVErjQ8xeLIe3NUqxIk/8SXxlth+JV5nZQMI2kDg=; b=OdVzcG8V+odusOqVnoCbFBUQiO
	TZsVa6ApCakFC2evsAcaDHjbTE05itVwPQcpLy7J6YaD26dHn53bTVwLFoJKMXlOl/uuWMmcbiDWl
	A0IYjwIQIXQumYw7w3PXBW9FJPRiawwMRRnZilgUnKVPszVxcsf3sK5LFyBogX5v2gnUaCIXoCBP5
	hgz0464QxWSeRTAOiof8kB8pMEmf1qcOmLlZHcrAqkbEoCbx16s0D0PWlmeka90g1hfcG1uQTlpmv
	zbXQzi1jz7+tdWX48fYKXj7btszhon5Eojb8foLqIYVVZCsbpNfCpOEfyWELA+5tvSDqpDTxqehaH
	+2yUwXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwt0-0000000AmkA-16Ww;
	Wed, 15 Jan 2025 06:28:18 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwrj-0000000AmQs-3RGT;
	Wed, 15 Jan 2025 06:27:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso12214703a12.3;
        Tue, 14 Jan 2025 22:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736922417; x=1737527217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QTHVErjQ8xeLIe3NUqxIk/8SXxlth+JV5nZQMI2kDg=;
        b=OxC+ZrxY4ymZREB5YuB/DNy7p1RT71zyYGPerlNmZgVaREEki/u190TE0U2SIdOTVE
         jQ+lnnSTDWQpKQa3UDpoAFE0HFDweQZOylPNOxBT0A6iWGUwSt33hFlxc7RJE1Sy9Vgu
         TPn4a2pmb0DcMo3EM921h2skr/e7k7jVqoEpcryGGL65g4ZhDdlqEcYKDU+oipasvqoJ
         RFqnCkD68JUd7/qHPG86xi9AvHR3IrKN+nrNA4oYTOTTh1p3kMuNWUw3rugihUJc9RAm
         SQyAxQ2PaoljtQg2d27DqYLwUB3zakOvYttyVybPePR1jRtmHO+DW848eCjkOlaA+l3p
         AWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922417; x=1737527217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QTHVErjQ8xeLIe3NUqxIk/8SXxlth+JV5nZQMI2kDg=;
        b=KqFeCXCk62relyGJpe8LWZqdjSpIepkqGfwOuP5gRoA285qpq8tRn7rHI70AM7hOZv
         xCFBGbyG9DJairQf7KmBDDjtQiAQA/15lov1bihXVcIA/svjnuctUhPWpNBfmG0fIyAv
         qGQjZFjKtUHnvUAOhg47rC6i44LvbV1O61Wstprb1tzXbekaR6t13TDbRGGun43iYm/J
         eIiCtz0MF/8Urofa3bnCsnYylXYZwkZWRkp+FyOYV1LgxN+IazNR2VS2z0VlC6u0jy8i
         F5Ap5/DYQzE93Idi9fAcXratq6CBncrBFHOtstudWjswrEE8I9NzomrBLut42o2lrguA
         B1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUc4P7t+VXOust4jNoDr7cyPiFWNkN/eyfrjSIFPiCtLyZrJegjQdpHGJxdxy80qhJLYrAGj48lDMd6MsDNMjw2@lists.infradead.org, AJvYcCV7KO7iLTtAcuSf+xqh9ilXNWMxe49MoKg/mp6CTTXIv7RqIS2WfNTqTysPMSeXxOaxXsU7JukisFa1xFg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6KZeGy0u7M7WIhwGR/H5h5ojNrBxS7xxEBg4HEvrFGSbxBuyx
	ZouQi0HC9Kr7mgYXTjjGyymBczbqwZJW/s5TMMRWZ45bEqiCQkDIZlDmFP8PWJAh7Nxmkt/ZVDY
	Z6IJcA9JnoB/zTLtJaGjn4ZschiU=
X-Gm-Gg: ASbGncvgrE1yFMjHJ0PKr0J1ecyuGZcpnle8lFcLMhyqhUyR+aSS14KUv8vKg7J52oq
	t9QmHJaOueMjPrLYADuth9YcUlw+zUEnWCquhJw==
X-Google-Smtp-Source: AGHT+IGHWO4sDuakKEdHqUvfE3Z3gW5fp1poivDXuCJtfBJKYZ5Who81+3H48NTj/ik4DCaoT89yf2ZxFGDe0IRR18s=
X-Received: by 2002:a05:6402:2105:b0:5d0:bf27:ef8a with SMTP id
 4fb4d7f45d1cf-5d972e4eeb6mr25379610a12.26.1736922417310; Tue, 14 Jan 2025
 22:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
 <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com> <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com>
In-Reply-To: <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 15 Jan 2025 14:26:19 +0800
X-Gm-Features: AbW1kvaPPmdSXN8eYcUNyJXVUpQa-l4-ZCcODmUNmLPk-TO5q5n5IpLZt77WFRA
Message-ID: <CAK1f24mCYF4Ew0hHr2+a=98RbxmmHwXv8KeFARyMvnLi99c2fQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250114_222659_861455_4ABF07A8 
X-CRM114-Status: GOOD (  33.31  )
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

Hey barry,

One thing I still don=E2=80=99t quite understand is as follows:

One of the semantics of VM_DROPPABLE is that, under memory pressure,
the kernel can drop the pages. Similarly, for MADV_FREE, one of its
semantics is that the kernel can free the pages when memory pressure
occurs, but only if there is no subsequent write (i.e., the PMD is clean).

So, if VM_DROPPABLE is true, we still drop the folio even if it's dirty. Th=
is
seems to conflict with the semantics of MADV_FREE, which requires the
folio or PMD to be clean before being dropped. wdyt?

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

