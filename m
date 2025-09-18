Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A77CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EH9giSpZMfR77wwHdiCIsexZ2AcufjY7Wc4xPwqnI1M=; b=MYplMDa1h3gkXhVKfXdUzfKrZK
	ul2krWi77Pc5c7nSnZzojLX9XhwLYcwafGt6jrq7aw32eZiJXOdJPdtWGYeMp4gyOrXkh7sdZEBiz
	XgRjhn4AhqjIJgBfNyAg4sR+PhMYs4dzuzgXc0nhwx+ZZgxsXjML3VaXR7OOz+G/Ot0mKCCWGSwv4
	qGBvWhi3IQSIFQSVdJqOUslOoaGGZ8FF18pBGh3cjRP9yIqfJElJbtn16YLhUwROHNuHrC7HF65+L
	BdAWiJnJ3oJM+05JDZhWkiu5SwJrFgv8LSM40Pf9qYmB/f6MpbqM0ghjYpQScnQOsfG9wPL1lbq6r
	gK+Zia3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDiO-0000000HOdt-3iR2;
	Thu, 18 Sep 2025 12:26:20 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDiM-0000000HObI-09fL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:26:19 +0000
X-Forwarded-Encrypted: i=1; AJvYcCWbNglXvo5rpq3k70fHommGQxDNzoWNTJydYuZl6DWF/SCe3sbcF98GNRFlOAUrCLp0gezVpJb6sBLyHlPFSPLS@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758198375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EH9giSpZMfR77wwHdiCIsexZ2AcufjY7Wc4xPwqnI1M=;
	b=T6x4fXfwrKFQ351hVVVAFrIV5wwlLU2ydLEwR9WNgEh/iQ31q7jGJAPxNZArAYcSieUNXi
	M6HjdHU2hv/KLS/FAYGECE8tDdika8F9aNlsbKaf0qU0ShU9RCzSQVzE1dX6k73fbk1C9T
	bJJIh6kwVKi3oMeXKWFOfKOOWnX7pac=
X-Gm-Message-State: AOJu0YxFSyrxnTAk4wblnL3aEjW9IM8MaSd0X/MjGbK8vmg+hHzKzfRS
	WvD3OfxWJc3OFGNSirlv/tqOrmdMBKnZuHINEineOAikJVagGWPW7Ykxbjmzh+vrqu2LnDU30E8
	VWngjEdh89misHyY1tuHjR4r2Is3Bs4s=
X-Google-Smtp-Source: AGHT+IGGP31ziNtgQqklBwMARCMOLiDiCC/zUBb/4ZbQjX3VBvk8Am/kuZmLkz9fixDfq7zDeYHVtGHCAOqyXDThVPM=
X-Received: by 2002:a05:620a:3903:b0:816:492c:875a with SMTP id
 af79cd13be357-831165425abmr540175985a.78.1758198373516; Thu, 18 Sep 2025
 05:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240830100438.3623486-1-usamaarif642@gmail.com>
 <20240830100438.3623486-3-usamaarif642@gmail.com> <a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com>
 <434c092b-0f19-47bf-a5fa-ea5b4b36c35e@redhat.com> <CABzRoyYWQMFTGYgfC7N=cWMnL_+5Y05=jrMhFjBf1aKOGxzq5g@mail.gmail.com>
In-Reply-To: <CABzRoyYWQMFTGYgfC7N=cWMnL_+5Y05=jrMhFjBf1aKOGxzq5g@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
Date: Thu, 18 Sep 2025 20:25:36 +0800
X-Gmail-Original-Message-ID: <CABzRoybFEdtXFktqMgKbjHW7S_Usp-ugSpXFSBJHMO+1Q3Qi-Q@mail.gmail.com>
X-Gm-Features: AS18NWB_1fTc7ZEWvJsWWzqg_bBpxb7vwlhX7CM5LekBeNlQSfsQCuVdouIUXxY
Message-ID: <CABzRoybFEdtXFktqMgKbjHW7S_Usp-ugSpXFSBJHMO+1Q3Qi-Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] mm: remap unused subpages to shared zeropage when
 splitting isolated thp
To: Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "usamaarif642@gmail.com" <usamaarif642@gmail.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "yuzhao@google.com" <yuzhao@google.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	=?UTF-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>, 
	"npache@redhat.com" <npache@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>, 
	"willy@infradead.org" <willy@infradead.org>, "kernel-team@meta.com" <kernel-team@meta.com>, 
	"roman.gushchin@linux.dev" <roman.gushchin@linux.dev>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"cerasuolodomenico@gmail.com" <cerasuolodomenico@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ryncsn@gmail.com" <ryncsn@gmail.com>, 
	"surenb@google.com" <surenb@google.com>, "riel@surriel.com" <riel@surriel.com>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	=?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	=?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"baohua@kernel.org" <baohua@kernel.org>, "kaleshsingh@google.com" <kaleshsingh@google.com>, 
	"zhais@google.com" <zhais@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_052618_530763_546FBC08 
X-CRM114-Status: GOOD (  41.39  )
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

On Thu, Sep 18, 2025 at 8:22=E2=80=AFPM Lance Yang <lance.yang@linux.dev> w=
rote:
>
> On Thu, Sep 18, 2025 at 5:21=E2=80=AFPM David Hildenbrand <david@redhat.c=
om> wrote:
> >
> > On 18.09.25 10:53, Qun-wei Lin (=E6=9E=97=E7=BE=A4=E5=B4=B4) wrote:
> > > On Fri, 2024-08-30 at 11:03 +0100, Usama Arif wrote:
> > >> From: Yu Zhao <yuzhao@google.com>
> > >>
> > >> Here being unused means containing only zeros and inaccessible to
> > >> userspace. When splitting an isolated thp under reclaim or migration=
,
> > >> the unused subpages can be mapped to the shared zeropage, hence
> > >> saving
> > >> memory. This is particularly helpful when the internal
> > >> fragmentation of a thp is high, i.e. it has many untouched subpages.
> > >>
> > >> This is also a prerequisite for THP low utilization shrinker which
> > >> will
> > >> be introduced in later patches, where underutilized THPs are split,
> > >> and
> > >> the zero-filled pages are freed saving memory.
> > >>
> > >> Signed-off-by: Yu Zhao <yuzhao@google.com>
> > >> Tested-by: Shuang Zhai <zhais@google.com>
> > >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > >> ---
> > >>   include/linux/rmap.h |  7 ++++-
> > >>   mm/huge_memory.c     |  8 ++---
> > >>   mm/migrate.c         | 72 ++++++++++++++++++++++++++++++++++++++--=
--
> > >> --
> > >>   mm/migrate_device.c  |  4 +--
> > >>   4 files changed, 75 insertions(+), 16 deletions(-)
> > >>
> > >> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > >> index 91b5935e8485..d5e93e44322e 100644
> > >> --- a/include/linux/rmap.h
> > >> +++ b/include/linux/rmap.h
> > >> @@ -745,7 +745,12 @@ int folio_mkclean(struct folio *);
> > >>   int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages,
> > >> pgoff_t pgoff,
> > >>                    struct vm_area_struct *vma);
> > >>
> > >> -void remove_migration_ptes(struct folio *src, struct folio *dst,
> > >> bool locked);
> > >> +enum rmp_flags {
> > >> +    RMP_LOCKED              =3D 1 << 0,
> > >> +    RMP_USE_SHARED_ZEROPAGE =3D 1 << 1,
> > >> +};
> > >> +
> > >> +void remove_migration_ptes(struct folio *src, struct folio *dst, in=
t
> > >> flags);
> > >>
> > >>   /*
> > >>    * rmap_walk_control: To control rmap traversing for specific need=
s
> > >> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > >> index 0c48806ccb9a..af60684e7c70 100644
> > >> --- a/mm/huge_memory.c
> > >> +++ b/mm/huge_memory.c
> > >> @@ -3020,7 +3020,7 @@ bool unmap_huge_pmd_locked(struct
> > >> vm_area_struct *vma, unsigned long addr,
> > >>      return false;
> > >>   }
> > >>
> > >> -static void remap_page(struct folio *folio, unsigned long nr)
> > >> +static void remap_page(struct folio *folio, unsigned long nr, int
> > >> flags)
> > >>   {
> > >>      int i =3D 0;
> > >>
> > >> @@ -3028,7 +3028,7 @@ static void remap_page(struct folio *folio,
> > >> unsigned long nr)
> > >>      if (!folio_test_anon(folio))
> > >>              return;
> > >>      for (;;) {
> > >> -            remove_migration_ptes(folio, folio, true);
> > >> +            remove_migration_ptes(folio, folio, RMP_LOCKED |
> > >> flags);
> > >>              i +=3D folio_nr_pages(folio);
> > >>              if (i >=3D nr)
> > >>                      break;
> > >> @@ -3240,7 +3240,7 @@ static void __split_huge_page(struct page
> > >> *page, struct list_head *list,
> > >>
> > >>      if (nr_dropped)
> > >>              shmem_uncharge(folio->mapping->host, nr_dropped);
> > >> -    remap_page(folio, nr);
> > >> +    remap_page(folio, nr, PageAnon(head) ?
> > >> RMP_USE_SHARED_ZEROPAGE : 0);
> > >>
> > >>      /*
> > >>       * set page to its compound_head when split to non order-0
> > >> pages, so
> > >> @@ -3542,7 +3542,7 @@ int split_huge_page_to_list_to_order(struct
> > >> page *page, struct list_head *list,
> > >>              if (mapping)
> > >>                      xas_unlock(&xas);
> > >>              local_irq_enable();
> > >> -            remap_page(folio, folio_nr_pages(folio));
> > >> +            remap_page(folio, folio_nr_pages(folio), 0);
> > >>              ret =3D -EAGAIN;
> > >>      }
> > >>
> > >> diff --git a/mm/migrate.c b/mm/migrate.c
> > >> index 6f9c62c746be..d039863e014b 100644
> > >> --- a/mm/migrate.c
> > >> +++ b/mm/migrate.c
> > >> @@ -204,13 +204,57 @@ bool isolate_folio_to_list(struct folio *folio=
,
> > >> struct list_head *list)
> > >>      return true;
> > >>   }
> > >>
> > >> +static bool try_to_map_unused_to_zeropage(struct
> > >> page_vma_mapped_walk *pvmw,
> > >> +                                      struct folio *folio,
> > >> +                                      unsigned long idx)
> > >> +{
> > >> +    struct page *page =3D folio_page(folio, idx);
> > >> +    bool contains_data;
> > >> +    pte_t newpte;
> > >> +    void *addr;
> > >> +
> > >> +    VM_BUG_ON_PAGE(PageCompound(page), page);
> > >> +    VM_BUG_ON_PAGE(!PageAnon(page), page);
> > >> +    VM_BUG_ON_PAGE(!PageLocked(page), page);
> > >> +    VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
> > >> +
> > >> +    if (folio_test_mlocked(folio) || (pvmw->vma->vm_flags &
> > >> VM_LOCKED) ||
> > >> +        mm_forbids_zeropage(pvmw->vma->vm_mm))
> > >> +            return false;
> > >> +
> > >> +    /*
> > >> +     * The pmd entry mapping the old thp was flushed and the pte
> > >> mapping
> > >> +     * this subpage has been non present. If the subpage is only
> > >> zero-filled
> > >> +     * then map it to the shared zeropage.
> > >> +     */
> > >> +    addr =3D kmap_local_page(page);
> > >> +    contains_data =3D memchr_inv(addr, 0, PAGE_SIZE);
> > >> +    kunmap_local(addr);
> > >> +
> > >> +    if (contains_data)
> > >> +            return false;
> > >> +
> > >> +    newpte =3D pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
> > >> +                                    pvmw->vma->vm_page_prot));
> > >> +    set_pte_at(pvmw->vma->vm_mm, pvmw->address, pvmw->pte,
> > >> newpte);
> > >> +
> > >> +    dec_mm_counter(pvmw->vma->vm_mm, mm_counter(folio));
> > >> +    return true;
> > >> +}
> > >> +
> > >> +struct rmap_walk_arg {
> > >> +    struct folio *folio;
> > >> +    bool map_unused_to_zeropage;
> > >> +};
> > >> +
> > >>   /*
> > >>    * Restore a potential migration pte to a working pte entry
> > >>    */
> > >>   static bool remove_migration_pte(struct folio *folio,
> > >> -            struct vm_area_struct *vma, unsigned long addr, void
> > >> *old)
> > >> +            struct vm_area_struct *vma, unsigned long addr, void
> > >> *arg)
> > >>   {
> > >> -    DEFINE_FOLIO_VMA_WALK(pvmw, old, vma, addr, PVMW_SYNC |
> > >> PVMW_MIGRATION);
> > >> +    struct rmap_walk_arg *rmap_walk_arg =3D arg;
> > >> +    DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr,
> > >> PVMW_SYNC | PVMW_MIGRATION);
> > >>
> > >>      while (page_vma_mapped_walk(&pvmw)) {
> > >>              rmap_t rmap_flags =3D RMAP_NONE;
> > >> @@ -234,6 +278,9 @@ static bool remove_migration_pte(struct folio
> > >> *folio,
> > >>                      continue;
> > >>              }
> > >>   #endif
> > >> +            if (rmap_walk_arg->map_unused_to_zeropage &&
> > >> +                try_to_map_unused_to_zeropage(&pvmw, folio,
> > >> idx))
> > >> +                    continue;
> > >>
> > >>              folio_get(folio);
> > >>              pte =3D mk_pte(new, READ_ONCE(vma->vm_page_prot));
> > >> @@ -312,14 +359,21 @@ static bool remove_migration_pte(struct folio
> > >> *folio,
> > >>    * Get rid of all migration entries and replace them by
> > >>    * references to the indicated page.
> > >>    */
> > >> -void remove_migration_ptes(struct folio *src, struct folio *dst,
> > >> bool locked)
> > >> +void remove_migration_ptes(struct folio *src, struct folio *dst, in=
t
> > >> flags)
> > >>   {
> > >> +    struct rmap_walk_arg rmap_walk_arg =3D {
> > >> +            .folio =3D src,
> > >> +            .map_unused_to_zeropage =3D flags &
> > >> RMP_USE_SHARED_ZEROPAGE,
> > >> +    };
> > >> +
> > >>      struct rmap_walk_control rwc =3D {
> > >>              .rmap_one =3D remove_migration_pte,
> > >> -            .arg =3D src,
> > >> +            .arg =3D &rmap_walk_arg,
> > >>      };
> > >>
> > >> -    if (locked)
> > >> +    VM_BUG_ON_FOLIO((flags & RMP_USE_SHARED_ZEROPAGE) && (src !=3D
> > >> dst), src);
> > >> +
> > >> +    if (flags & RMP_LOCKED)
> > >>              rmap_walk_locked(dst, &rwc);
> > >>      else
> > >>              rmap_walk(dst, &rwc);
> > >> @@ -934,7 +988,7 @@ static int writeout(struct address_space
> > >> *mapping, struct folio *folio)
> > >>       * At this point we know that the migration attempt cannot
> > >>       * be successful.
> > >>       */
> > >> -    remove_migration_ptes(folio, folio, false);
> > >> +    remove_migration_ptes(folio, folio, 0);
> > >>
> > >>      rc =3D mapping->a_ops->writepage(&folio->page, &wbc);
> > >>
> > >> @@ -1098,7 +1152,7 @@ static void migrate_folio_undo_src(struct foli=
o
> > >> *src,
> > >>                                 struct list_head *ret)
> > >>   {
> > >>      if (page_was_mapped)
> > >> -            remove_migration_ptes(src, src, false);
> > >> +            remove_migration_ptes(src, src, 0);
> > >>      /* Drop an anon_vma reference if we took one */
> > >>      if (anon_vma)
> > >>              put_anon_vma(anon_vma);
> > >> @@ -1336,7 +1390,7 @@ static int migrate_folio_move(free_folio_t
> > >> put_new_folio, unsigned long private,
> > >>              lru_add_drain();
> > >>
> > >>      if (old_page_state & PAGE_WAS_MAPPED)
> > >> -            remove_migration_ptes(src, dst, false);
> > >> +            remove_migration_ptes(src, dst, 0);
> > >>
> > >>   out_unlock_both:
> > >>      folio_unlock(dst);
> > >> @@ -1474,7 +1528,7 @@ static int unmap_and_move_huge_page(new_folio_=
t
> > >> get_new_folio,
> > >>
> > >>      if (page_was_mapped)
> > >>              remove_migration_ptes(src,
> > >> -                    rc =3D=3D MIGRATEPAGE_SUCCESS ? dst : src,
> > >> false);
> > >> +                    rc =3D=3D MIGRATEPAGE_SUCCESS ? dst : src, 0);
> > >>
> > >>   unlock_put_anon:
> > >>      folio_unlock(dst);
> > >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > >> index 8d687de88a03..9cf26592ac93 100644
> > >> --- a/mm/migrate_device.c
> > >> +++ b/mm/migrate_device.c
> > >> @@ -424,7 +424,7 @@ static unsigned long
> > >> migrate_device_unmap(unsigned long *src_pfns,
> > >>                      continue;
> > >>
> > >>              folio =3D page_folio(page);
> > >> -            remove_migration_ptes(folio, folio, false);
> > >> +            remove_migration_ptes(folio, folio, 0);
> > >>
> > >>              src_pfns[i] =3D 0;
> > >>              folio_unlock(folio);
> > >> @@ -840,7 +840,7 @@ void migrate_device_finalize(unsigned long
> > >> *src_pfns,
> > >>                      dst =3D src;
> > >>              }
> > >>
> > >> -            remove_migration_ptes(src, dst, false);
> > >> +            remove_migration_ptes(src, dst, 0);
> > >>              folio_unlock(src);
> > >>
> > >>              if (folio_is_zone_device(src))
> > >
> > > Hi,
> > >
> > > This patch has been in the mainline for some time, but we recently
> > > discovered an issue when both mTHP and MTE (Memory Tagging Extension)
> > > are enabled.
> > >
> > > It seems that remapping to the same zeropage might causes MTE tag
> > > mismatches, since MTE tags are associated with physical addresses.
> >
> > Does this only trigger when the VMA has mte enabled? Maybe we'll have t=
o
> > bail out if we detect that mte is enabled.
>
> It seems RISC-V also has a similar feature (RISCV_ISA_SUPM) that uses
> the same prctl(PR_{GET,SET}_TAGGED_ADDR_CTRL) API.
>
> config RISCV_ISA_SUPM
>         bool "Supm extension for userspace pointer masking"
>         depends on 64BIT
>         default y
>         help
>           Add support for pointer masking in userspace (Supm) when the
>           underlying hardware extension (Smnpm or Ssnpm) is detected at b=
oot.
>
>           If this option is disabled, userspace will be unable to use
>           the prctl(PR_{SET,GET}_TAGGED_ADDR_CTRL) API.
>
> I wonder if we should disable the THP shrinker for such architectures tha=
t
> define PR_SET_TAGGED_ADDR_CTRL (or PR_GET_TAGGED_ADDR_CTRL).

SET_TAGGED_ADDR_CTRL or GET_TAGGED_ADDR_CTRL

File: kernel/sys.c 114
#ifndef SET_TAGGED_ADDR_CTRL
# define SET_TAGGED_ADDR_CTRL(a) (-EINVAL)
#endif
#ifndef GET_TAGGED_ADDR_CTRL
# define GET_TAGGED_ADDR_CTRL() (-EINVAL)
#endif

Cheers,
Lance

>
> Cheers,
> Lance
>
> >
> > Also, I wonder how KSM and the shared zeropage works in general with
> > that, because I would expect similar issues when we de-duplicate memory=
?
> >
> > --
> > Cheers
> >
> > David / dhildenb
> >
> >

