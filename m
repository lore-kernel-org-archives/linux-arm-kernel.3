Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9792C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 05:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fbYeVovEpQNPEsVr+R1bXLYLSrZasFYAhkIJyzquyg=; b=XIp/7XsztOCSzc9G6kc9lUq4LX
	ceOXUice8A2l+1EhhthnVyZE8QFwHZ8XvKQ8gJYanHb2YZskrZTniC47O9lw9g4pb3wyOROajg+9s
	3MYllbTcqPBzlDN7yieq0OHz7LFOLTgB88EzXUr6C0REyKXXjZHCdEhyCIB838+WOqPmM4kAVhQaf
	xvB91XT7bTrvpaMUUwBxdEa6F39cmoWtqHpYpIyJ9P0ulP9BlSDrfbP8xiNkH+JXk2jP0SuFKeVue
	wgwZbsokv68luVCqETzg/MunmNuMyC+xh68Jd2H9FEd6VSDrkra3+ElHkqRFyGV2yWiokzlpelbQK
	I8Ly+7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXvfp-0000000AfAx-0Hgz;
	Wed, 15 Jan 2025 05:10:37 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXveY-0000000Af27-3ImE;
	Wed, 15 Jan 2025 05:09:20 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5189a440a65so3736735e0c.1;
        Tue, 14 Jan 2025 21:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736917757; x=1737522557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fbYeVovEpQNPEsVr+R1bXLYLSrZasFYAhkIJyzquyg=;
        b=Ab5Yaqdh543xmw4QQV0wTnLgQH/mBWzxAAIJnzeXyqTJQCsJrsJrU+nm3Ldig6QLiw
         cUiEQKzOe3Iq4PqaIoLSmYjjEWgeSzJApVwgySnoSn08IulLdzY32QdOKo0RhD56jaR4
         087cCHBc9S64TEhQexjStYS3TX22YDvKErkjWiuEVRBoSgJMkx6xy9HuZUYrRt6fDWKZ
         88Ycxm9FYRfTKsj2idrzxIK7feZPSBDnTqw8sgJ82SXnmeAmDBDTUmMol1ItW9iz5TNa
         +YOcaLOrrmdv5z0brmMYFNehYy2POg7FTwZ9zLtbYtW/5BtdYKdjAhkz7GWSP0WFht+C
         lHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736917757; x=1737522557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fbYeVovEpQNPEsVr+R1bXLYLSrZasFYAhkIJyzquyg=;
        b=LAB8daJZzymhIQTds5++Lnq4xYLaajRrKBFj510V32ryHo8+bMLSIK5/hpoD888Ukb
         7J7rXZvbCsW2rE3Hy1jTIlmbazpFQ9Pyx0g8VGfbIbuDW0Np4pvwRpUXV2xE2W8dl4Ta
         zof08BgAiPlI8gT5ukvc+aOxUGhjUwVKOY3CcnH1//46nY66/AHc9cMpTa7qDYkjiOIn
         dLYcOh4mM/sO+WmuAKunp70mYlcK46u0JlWExUmj/RyiTLlmD4au5MC3aA9LrzenkPkM
         /ceyNuF1nYhVs+ANJBnVq7HOaPOsX5cwN6lwSVYqf8uuVAnvfmo95ZmWN7Jp4Q5nm6Ke
         Sv8A==
X-Forwarded-Encrypted: i=1; AJvYcCVI9Sr3NpuHFwM1eUjLBIEWwNfDJAV+RCGKGoX+1db3IEaCC+J4MX78yOjcMZqydZ3MG7sYZpQUxkEAJ+A=@lists.infradead.org, AJvYcCXiVAoBhcDYltlflsvTM0RNwqRT+b+wQ9gSDGSBcbq1/03+Z6udFbGjDO3Dl1uSoF8pHzQ9dc+J6kr3wrMRUvHy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6gtnERwGb2JOWCmoM5UuUGhDzdMQev+U69X1oIwdxclDHAIEp
	rm5ZV5qg6zBzEX1T4Whe7a37xMtcUgSLWe82C3TEL+X+m9KvOn4afbXS8Bp2nrAG1tmsrefMUS9
	qZa3a1l3QCUMnqDAZQvtwRnx//NA=
X-Gm-Gg: ASbGncvdlxCgRihfAhzxnuplJcV8kPZizjzXhisBUvuGp4pso38O/VaQYDYOcRbSKP2
	8WMGnwLoKe+fhJu9V+WhhJVimfh8S2u0zhihdC84e0gN6jcjuSdGbRefBCdGPFicEaUhxaLZ/
X-Google-Smtp-Source: AGHT+IFmGID4K5/mSLF+58XoWNncJOLjS/s8UHg4Zw0rlCGx0x3SqpLH1MDphU6XepLnS3F8aO89CUrWhzG2ruK/a3M=
X-Received: by 2002:a05:6102:2b85:b0:4b1:f3e:882f with SMTP id
 ada2fe7eead31-4b3d0d76129mr25986421137.1.1736917757021; Tue, 14 Jan 2025
 21:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
 <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com>
In-Reply-To: <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 15 Jan 2025 18:09:06 +1300
X-Gm-Features: AbW1kva4ytoolAfPhuEb-stEXQYisWCWfd6yD_9BD8lvXUvBT6PE0IiICJf-Oqs
Message-ID: <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_210918_832106_220584BC 
X-CRM114-Status: GOOD (  28.10  )
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

On Wed, Jan 15, 2025 at 6:01=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> On Wed, Jan 15, 2025 at 11:38=E2=80=AFAM Barry Song <21cnbao@gmail.com> w=
rote:
> >
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > The try_to_unmap_one() function currently handles PMD-mapped THPs
> > inefficiently. It first splits the PMD into PTEs, copies the dirty
> > state from the PMD to the PTEs, iterates over the PTEs to locate
> > the dirty state, and then marks the THP as swap-backed. This process
> > involves unnecessary PMD splitting and redundant iteration. Instead,
> > this functionality can be efficiently managed in
> > __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> > improving performance.
> >
> > The following microbenchmark redirties folios after invoking MADV_FREE,
> > then measures the time taken to perform memory reclamation (actually
> > set those folios swapbacked again) on the redirtied folios.
> >
> >  #include <stdio.h>
> >  #include <sys/mman.h>
> >  #include <string.h>
> >  #include <time.h>
> >
> >  #define SIZE 128*1024*1024  // 128 MB
> >
> >  int main(int argc, char *argv[])
> >  {
> >         while(1) {
> >                 volatile int *p =3D mmap(0, SIZE, PROT_READ | PROT_WRIT=
E,
> >                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> >
> >                 memset((void *)p, 1, SIZE);
> >                 madvise((void *)p, SIZE, MADV_FREE);
> >                 /* redirty after MADV_FREE */
> >                 memset((void *)p, 1, SIZE);
> >
> >                 clock_t start_time =3D clock();
> >                 madvise((void *)p, SIZE, MADV_PAGEOUT);
> >                 clock_t end_time =3D clock();
> >
> >                 double elapsed_time =3D (double)(end_time - start_time)=
 / CLOCKS_PER_SEC;
> >                 printf("Time taken by reclamation: %f seconds\n", elaps=
ed_time);
> >
> >                 munmap((void *)p, SIZE);
> >         }
> >         return 0;
> >  }
> >
> > Testing results are as below,
> > w/o patch:
> > ~ # ./a.out
> > Time taken by reclamation: 0.007300 seconds
> > Time taken by reclamation: 0.007226 seconds
> > Time taken by reclamation: 0.007295 seconds
> > Time taken by reclamation: 0.007731 seconds
> > Time taken by reclamation: 0.007134 seconds
> > Time taken by reclamation: 0.007285 seconds
> > Time taken by reclamation: 0.007720 seconds
> > Time taken by reclamation: 0.007128 seconds
> > Time taken by reclamation: 0.007710 seconds
> > Time taken by reclamation: 0.007712 seconds
> > Time taken by reclamation: 0.007236 seconds
> > Time taken by reclamation: 0.007690 seconds
> > Time taken by reclamation: 0.007174 seconds
> > Time taken by reclamation: 0.007670 seconds
> > Time taken by reclamation: 0.007169 seconds
> > Time taken by reclamation: 0.007305 seconds
> > Time taken by reclamation: 0.007432 seconds
> > Time taken by reclamation: 0.007158 seconds
> > Time taken by reclamation: 0.007133 seconds
> > =E2=80=A6
> >
> > w/ patch
> >
> > ~ # ./a.out
> > Time taken by reclamation: 0.002124 seconds
> > Time taken by reclamation: 0.002116 seconds
> > Time taken by reclamation: 0.002150 seconds
> > Time taken by reclamation: 0.002261 seconds
> > Time taken by reclamation: 0.002137 seconds
> > Time taken by reclamation: 0.002173 seconds
> > Time taken by reclamation: 0.002063 seconds
> > Time taken by reclamation: 0.002088 seconds
> > Time taken by reclamation: 0.002169 seconds
> > Time taken by reclamation: 0.002124 seconds
> > Time taken by reclamation: 0.002111 seconds
> > Time taken by reclamation: 0.002224 seconds
> > Time taken by reclamation: 0.002297 seconds
> > Time taken by reclamation: 0.002260 seconds
> > Time taken by reclamation: 0.002246 seconds
> > Time taken by reclamation: 0.002272 seconds
> > Time taken by reclamation: 0.002277 seconds
> > Time taken by reclamation: 0.002462 seconds
> > =E2=80=A6
> >
> > This patch significantly speeds up try_to_unmap_one() by allowing it
> > to skip redirtied THPs without splitting the PMD.
> >
> > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Suggested-by: Lance Yang <ioworker0@gmail.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  mm/huge_memory.c | 24 +++++++++++++++++-------
> >  mm/rmap.c        | 13 ++++++++++---
> >  2 files changed, 27 insertions(+), 10 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 3d3ebdc002d5..47cc8c3f8f80 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(stru=
ct vm_area_struct *vma,
> >         int ref_count, map_count;
> >         pmd_t orig_pmd =3D *pmdp;
> >
> > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> > +       if (pmd_dirty(orig_pmd))
> > +               folio_set_dirty(folio);
> > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE))=
 {
> > +               folio_set_swapbacked(folio);
> >                 return false;
> > +       }
>
> If either the PMD or the folio is dirty, should we just return false righ=
t away,
> regardless of VM_DROPPABLE? There=E2=80=99s no need to proceed further in=
 that
> case, IMHO ;)

I don't quite understand you, but we need to proceed to clear pmd entry.
if vm_droppable is true, even if the folio is dirty, we still drop the foli=
o.

>
> Thanks,
> Lance
>
> >
> >         orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
> >
> > @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(stru=
ct vm_area_struct *vma,
> >          *
> >          * The only folio refs must be one from isolation plus the rmap=
(s).
> >          */
> > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> > -           ref_count !=3D map_count + 1) {
> > +       if (pmd_dirty(orig_pmd))
> > +               folio_set_dirty(folio);
> > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE))=
 {
> > +               folio_set_swapbacked(folio);
> > +               set_pmd_at(mm, addr, pmdp, orig_pmd);
> > +               return false;
> > +       }
> > +
> > +       if (ref_count !=3D map_count + 1) {
> >                 set_pmd_at(mm, addr, pmdp, orig_pmd);
> >                 return false;
> >         }
> > @@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_struc=
t *vma, unsigned long addr,
> >  {
> >         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
> >         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> > +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> > +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
> >         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
> >
> > -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
> > -               return __discard_anon_folio_pmd_locked(vma, addr, pmdp,=
 folio);
> > -
> > -       return false;
> > +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
> >  }
> >
> >  static void remap_page(struct folio *folio, unsigned long nr, int flag=
s)
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index be1978d2712d..a859c399ec7c 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >                 }
> >
> >                 if (!pvmw.pte) {
> > -                       if (unmap_huge_pmd_locked(vma, pvmw.address, pv=
mw.pmd,
> > -                                                 folio))
> > -                               goto walk_done;
> > +                       if (folio_test_anon(folio) && !folio_test_swapb=
acked(folio)) {
> > +                               if (unmap_huge_pmd_locked(vma, pvmw.add=
ress, pvmw.pmd, folio))
> > +                                       goto walk_done;
> > +                               /*
> > +                                * unmap_huge_pmd_locked has either alr=
eady marked
> > +                                * the folio as swap-backed or decided =
to retain it
> > +                                * due to GUP or speculative references=
.
> > +                                */
> > +                               goto walk_abort;
> > +                       }
> >
> >                         if (flags & TTU_SPLIT_HUGE_PMD) {
> >                                 /*
> > --
> > 2.39.3 (Apple Git-146)
> >

