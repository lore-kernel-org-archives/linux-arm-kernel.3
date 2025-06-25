Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B73FC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=; b=uRe29uCUPlYFVidi1FGm02uznj
	VxrWKfrnprB9pCUlqg/CyC+cRDvztEuQerqI06y3TP/izTKZ/oq+FiTvSeTfIeOh5XybO1K5wnmyf
	r/Ie6a0MyNlrYUy84xkYyCIMjlZjBvP6qdhtmako3MiHohXuK+a5/l/WnP84sWWa5Ds3L44Gy22Ym
	EvAeUR0V+8uV60WU44jgK9aoSsEi3KihDG80Eb7ayXhEuoot9I/jQ9klPUzeRkkGMJSyGYmNOmF3a
	psYBSF8ZefF8HzZ2Ce49zMjSxC7BqQk6zhvcNbioKlU5SVMsIRr8FeAVCWGKDsNU2CLvkYaiaVHQV
	EmhsBWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURL2-000000090EV-2b7z;
	Wed, 25 Jun 2025 14:43:00 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO6P-00000008RVF-2WnC;
	Wed, 25 Jun 2025 11:15:43 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-532de49b7e2so683181e0c.0;
        Wed, 25 Jun 2025 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750850140; x=1751454940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=;
        b=b1SsTOsrvga25BsCuwmDlcWxv+o0gBX+ukxLBaXf9uxtYdlkZ+DZLV7reub+K47Smn
         n1rYM2LISa1Sf1S/ONy/1eyn5BJfh7IyumrwBmYkFpF+/gLGOa3T7Jxt17MR+TzcOI2m
         w3AB4MZR/z67n/5kSVtf6lUaJXmoiq9zwRgt6XMdUaqHm3RVCrxCcYtelcktUtqGttZT
         LsBCUnpVjK+/GiI0DRE05g9rYz44Mw/1aZShA55S8a0i2pmbLd0jdsIM/Zv/QX81tWfw
         BeaKCo+oDrauP9GWEnCEOCG/zg8wc32Lxt2XbzjuP4WGf7E3ZIPTwHGIFdZmlYEErEfs
         XXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850140; x=1751454940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=;
        b=losl/VNCBhXYr/aK+GPoOFh2TKNxZTt6pN4BDN296i/mozioIjSd3zoo+VOkhPQwLs
         xzZv6CYbK9wemZ5RfPvKUPBSfRBnDF9mNFkTsGn07Mu8Mjqn+saP1nijGPwg99n574qH
         7WZ/7eP8KidUgSlkuhSafKks76nztlX/v+Qm+75tgzirzG3vxQ68N0gjwCDE9WkXL/QW
         AZSdY29zpGqL3/zHgaN0uG7GBz0gj7lCQDFd2QrhmSK1gMEd3ScKt09Zz/MV9VDlZqMl
         0oKE49+IRIjb3Fc5IZ8QsPaNqPjhbA0fiYUpM+IgUS8QZAQVuGsgHDrkerOalDK5jKz+
         bIvA==
X-Forwarded-Encrypted: i=1; AJvYcCWTprXvgFnT6CHc4PgxD01udZt5XH6eLmmXYPdqcapONylpf3Cz7SHGIFACosDI8Rr+1ZTsf7KEPWfuUUQQvbAs@lists.infradead.org, AJvYcCXV7Erxnqe0++UG3ZIuL9MhfB9hWA4fHgUCC8bMFD1oaO/6xR7dJs0lHRD1VEdyoL72Z+3r+JFkVwS3nIE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw26apd8OyDNshFEgH454z1/jFPjj5a5Ab/AUh5xAD+C95GPKwD
	ypLnHgTVDhH22eDKAxdBX8Y7UVImqg1WiN/P42jztpmzxzrrDykHNbEvsVXpqSOFTqHiWArKSJC
	8A9BljJV1rd+qumyY15JbmK9tPQBvB6A=
X-Gm-Gg: ASbGncvS+/83pKfGvqUo4Xi2L/aRnLZE8i0DcCS3U+5+n6ykooXtck6X7+NpKb3xhyI
	2aatzezV2t8cKbj9aAwPkginmEGWKsI8l4RJS+sL3GoOBcwfEgeN5U/bFh3DlTESElUVafDyAO5
	2Muf+QrRDKWDQXGuAjsFwA0h8JkNpnGGN2qZkc+IRqtG9V6sQU1Pb4cQ==
X-Google-Smtp-Source: AGHT+IHwxdbJNROelzY3OknT3azAp92ywQE88MfIFFnBydzATnoYswUHYfRj+B3vYRzmFHBdJZPqRWnqwsEAdwdY54w=
X-Received: by 2002:a05:6122:1ac9:b0:531:19ee:93ea with SMTP id
 71dfb90a1353d-532ef208beamr1331489e0c.0.1750850140366; Wed, 25 Jun 2025
 04:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
In-Reply-To: <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 23:15:29 +1200
X-Gm-Features: Ac12FXzIwn089IFe1tMYOckn8MZY5eni2aX8dcGFabAwMmxZ1sP0z4GGek9WzJY
Message-ID: <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_041541_642906_1E2E0D5A 
X-CRM114-Status: GOOD (  29.30  )
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

On Wed, Jun 25, 2025 at 11:01=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 12:57, Barry Song wrote:
> >>>
> >>> Note that I don't quite understand why we have to batch the whole thi=
ng
> >>> or fallback to
> >>> individual pages. Why can't we perform other batches that span only s=
ome
> >>> PTEs? What's special
> >>> about 1 PTE vs. 2 PTEs vs. all PTEs?
> >>
> >> That's a good point about the "all-or-nothing" batching logic ;)
> >>
> >> It seems the "all-or-nothing" approach is specific to the lazyfree use
> >> case, which needs to unmap the entire folio for reclamation. If that's
> >> not possible, it falls back to the single-page slow path.
> >
> > Other cases advance the PTE themselves, while try_to_unmap_one() relies
> > on page_vma_mapped_walk() to advance the PTE. Unless we want to manuall=
y
> > modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), whi=
ch
> > to me seems like a violation of layers. :-)
>
> Please explain to me why the following is not clearer and better:

This part is much clearer, but that doesn=E2=80=99t necessarily improve the=
 overall
picture. The main challenge is how to exit the iteration of
while (page_vma_mapped_walk(&pvmw)).

Right now, we have it laid out quite straightforwardly:
                /* We have already batched the entire folio */
                if (nr_pages > 1)
                        goto walk_done;

with any nr between 1 and folio_nr_pages(), we have to consider two issues:
1. How to skip PTE checks inside page_vma_mapped_walk for entries that
were already handled in the previous batch;
2. How to break the iteration when this batch has arrived at the end.

Of course, we could avoid both, but that would mean performing unnecessary
checks inside page_vma_mapped_walk().

We=E2=80=99ll still need to introduce some =E2=80=9Ccomplicated=E2=80=9D co=
de to address the issues
mentioned above, won=E2=80=99t we?

>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 8200d705fe4ac..09e2c2f28aa58 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,31 @@ void folio_remove_rmap_pud(struct folio *folio, s=
truct page *page,
>   #endif
>   }
>
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
> +               pte_t pte)
>   {
>          const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIR=
TY;
> -       int max_nr =3D folio_nr_pages(folio);
> -       pte_t pte =3D ptep_get(ptep);
> +       struct vm_area_struct *vma =3D pvmw->vma;
> +       unsigned long end_addr, addr =3D pvmw->address;
> +       unsigned int max_nr;
> +
> +       if (flags & TTU_HWPOISON)
> +               return 1;
> +       if (!folio_test_large(folio))
> +               return 1;
> +
> +       /* We may only batch within a single VMA and a single page table.=
 */
> +       end_addr =3D min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma-=
>vm_end);
> +       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
>
> +       /* We only support lazyfree batching for now ... */
>          if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -               return false;
> +               return 1;
>          if (pte_unused(pte))
> -               return false;
> -       if (pte_pfn(pte) !=3D folio_pfn(folio))
> -               return false;
> -
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> -                              NULL, NULL) =3D=3D max_nr;
> +               return 1;
> +       return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_f=
lags,
> +                              NULL, NULL, NULL);
>   }
>
>   /*
> @@ -2024,9 +2032,7 @@ static bool try_to_unmap_one(struct folio *folio, s=
truct vm_area_struct *vma,
>                          if (pte_dirty(pteval))
>                                  folio_mark_dirty(folio);
>                  } else if (likely(pte_present(pteval))) {
> -                       if (folio_test_large(folio) && !(flags & TTU_HWPO=
ISON) &&
> -                           can_batch_unmap_folio_ptes(address, folio, pv=
mw.pte))
> -                               nr_pages =3D folio_nr_pages(folio);
> +                       nr_pages =3D folio_unmap_pte_batch(folio, &pvmw, =
flags, pteval);
>                          end_addr =3D address + nr_pages * PAGE_SIZE;
>                          flush_cache_range(vma, address, end_addr);
>
>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry

