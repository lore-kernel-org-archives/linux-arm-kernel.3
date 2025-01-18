Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5099CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 14:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5Ncz7Bxl1wX7x3ew3KillHOsMDgvXJZ57rbyfOomAo=; b=On3Pm5ZubX7TtzmDnenEDZnbuQ
	geaxedTzEDyhJ28JHLpFOE4fLBG2kDnEmkRnyh+E94KoZ1ijtYKp73wn4/bVQu81OaHe23+r3hEpg
	RLIRE7mcv69VehcEqxauZf3FhoJGFUQ5rhsJJOvS/xdW2Sa6O6Jc7g1bfaukikjhwcdCc8vW2p5KK
	Byxzl90cuIDAQcRSptC3TlsEsdk9ydlx9hI15pG4QxP5ErwZFxIeu4F1BNCH3h6pPlIKCx5TR00QG
	X3btYKzQlIOaK4m47FmrHPbgvXdrADxAp+AOWHJM9FbkvozdTwNQTPb9iHoNheuUr1Ino7o8eXQvl
	9a67qqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9P7-00000002V9t-4BZV;
	Sat, 18 Jan 2025 14:02:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9Nm-00000002V2q-3mgv;
	Sat, 18 Jan 2025 14:01:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso5265005a12.1;
        Sat, 18 Jan 2025 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737208860; x=1737813660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5Ncz7Bxl1wX7x3ew3KillHOsMDgvXJZ57rbyfOomAo=;
        b=LuNSUy8Zp1irr0EUs78lUJTp3RUKPmOhnt3OdV93xioqZhmlpbxfwUjLKzq1oiM0tl
         WB/TpTHj0xivyeqZx8D7wzBVLtaqm+ERROEWYuiYZZuwbD/Usbntmfq3CayHSDv/CQmE
         h1Q3Hfk2AdmN96R5bPakkYJTMVZrn3cgXxKmFePeUdqXp9/223qwMm4pmw+W+kJdZAAQ
         u0Ir+vFzv0g9R1Hq1DHLKv68PqRcSvZf4n8dTMFpzx1eyrPPa+3ckyME8n7dCk1sxQ8j
         pREqhsfk5ePF2N5Ql1tzQF/o49+d0MkxUjpsbcpXxRUXfP///KQCVBp7z6TbynbJL2qs
         0VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737208860; x=1737813660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5Ncz7Bxl1wX7x3ew3KillHOsMDgvXJZ57rbyfOomAo=;
        b=cLZWQDy5Ym3KuBnc1nttQsFXh/L64NDSZyD9T0orPBBqR4x2945w44hSxPDEt3w455
         kmErmIPR4hOuwqz7tshiB63za8d7RxkmBrVNGqkTrl13JMx7hIqz5POwyYwdlKTDJL0x
         xoTDSVfUzmAaKGuToq0889GZRr06+G/BVOGhmfKKbCJBnXcWiQxRLEsPd9w9Q8O5PpjT
         eGFpoT3r1qnZ9vZD+HSeelbYfli3SjtxDnBFdm2h3RJj26FaECqsrIgZ255gBoyklhrh
         rtREeOCTywbjFy2CA2Jc7R18uF0aPn0Lxtz0iGBEawl6VSitSZlEdRBKRcPKtxx37LnT
         kFwA==
X-Forwarded-Encrypted: i=1; AJvYcCUqOdtg02umnTOjJCm8MzKPlbDRPAFq0Z98UlBHWazXmnFD2jYNL2sRvncMuRV/HPzpAyQT838zX+ZhFoA=@lists.infradead.org, AJvYcCWUNOkMliF3tKii+ePyhVJEatxekj8KR2MSsiIEkMtw3Jnd7ErElbW4rYIwMum6oMJUjY6/ulsPDNtfCcjSDwFr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+eH4wpDNId8Trit42SRGktiR0E7B0Hr7UYXfzEeo8k4nzWeAR
	okZz9Y6fcfxNtXKotB4I85NJyR9EC2JoexrlNyeUubBwytRyb9zIm0HgxgHNT6qgvXDNr+LMgtv
	sw3qCx5xQaPXPCTVkDzjOaHF2/iI=
X-Gm-Gg: ASbGncsg0wmabrNHLxEKfRsw7W+mohU50x7Achv8KkuXzrNdtBOgfQnnqS0UNcYc5/P
	PnZie/0USULZxfRU4FvI9vMRv3zhXTWJQGlp0lzDTRgMq284AplY=
X-Google-Smtp-Source: AGHT+IHNAfuAK8994nkwhg6Wt99bPeGNvNepOjVlWh8x98JZEznSvYFUgVX4sYBVi65KoRqUZ9KIDlTqBtnF2d5qFyU=
X-Received: by 2002:a05:6402:524b:b0:5da:ba6:3a3e with SMTP id
 4fb4d7f45d1cf-5db7d2e2824mr6191678a12.7.1737208859349; Sat, 18 Jan 2025
 06:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
In-Reply-To: <20250115033808.40641-5-21cnbao@gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Sat, 18 Jan 2025 22:00:23 +0800
X-Gm-Features: AbW1kvYjQCDr-u2COSl7npp1goqlYdnZjBQY9OgGXZ_qkX7FxgvyjF0NuNi-6mg
Message-ID: <CAK1f24kcsxO8HrAGYxcWFpQ-uX04LUs6tmsuKC_Pb_TJJj=vtA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250118_060102_965403_4D23E38C 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed, Jan 15, 2025 at 11:38=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> The try_to_unmap_one() function currently handles PMD-mapped THPs
> inefficiently. It first splits the PMD into PTEs, copies the dirty
> state from the PMD to the PTEs, iterates over the PTEs to locate
> the dirty state, and then marks the THP as swap-backed. This process
> involves unnecessary PMD splitting and redundant iteration. Instead,
> this functionality can be efficiently managed in
> __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> improving performance.
>
> The following microbenchmark redirties folios after invoking MADV_FREE,
> then measures the time taken to perform memory reclamation (actually
> set those folios swapbacked again) on the redirtied folios.
>
>  #include <stdio.h>
>  #include <sys/mman.h>
>  #include <string.h>
>  #include <time.h>
>
>  #define SIZE 128*1024*1024  // 128 MB
>
>  int main(int argc, char *argv[])
>  {
>         while(1) {
>                 volatile int *p =3D mmap(0, SIZE, PROT_READ | PROT_WRITE,
>                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
>                 memset((void *)p, 1, SIZE);
>                 madvise((void *)p, SIZE, MADV_FREE);
>                 /* redirty after MADV_FREE */
>                 memset((void *)p, 1, SIZE);
>
>                 clock_t start_time =3D clock();
>                 madvise((void *)p, SIZE, MADV_PAGEOUT);
>                 clock_t end_time =3D clock();
>
>                 double elapsed_time =3D (double)(end_time - start_time) /=
 CLOCKS_PER_SEC;
>                 printf("Time taken by reclamation: %f seconds\n", elapsed=
_time);
>
>                 munmap((void *)p, SIZE);
>         }
>         return 0;
>  }
>
> Testing results are as below,
> w/o patch:
> ~ # ./a.out
> Time taken by reclamation: 0.007300 seconds
> Time taken by reclamation: 0.007226 seconds
> Time taken by reclamation: 0.007295 seconds
> Time taken by reclamation: 0.007731 seconds
> Time taken by reclamation: 0.007134 seconds
> Time taken by reclamation: 0.007285 seconds
> Time taken by reclamation: 0.007720 seconds
> Time taken by reclamation: 0.007128 seconds
> Time taken by reclamation: 0.007710 seconds
> Time taken by reclamation: 0.007712 seconds
> Time taken by reclamation: 0.007236 seconds
> Time taken by reclamation: 0.007690 seconds
> Time taken by reclamation: 0.007174 seconds
> Time taken by reclamation: 0.007670 seconds
> Time taken by reclamation: 0.007169 seconds
> Time taken by reclamation: 0.007305 seconds
> Time taken by reclamation: 0.007432 seconds
> Time taken by reclamation: 0.007158 seconds
> Time taken by reclamation: 0.007133 seconds
> =E2=80=A6
>
> w/ patch
>
> ~ # ./a.out
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002116 seconds
> Time taken by reclamation: 0.002150 seconds
> Time taken by reclamation: 0.002261 seconds
> Time taken by reclamation: 0.002137 seconds
> Time taken by reclamation: 0.002173 seconds
> Time taken by reclamation: 0.002063 seconds
> Time taken by reclamation: 0.002088 seconds
> Time taken by reclamation: 0.002169 seconds
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002111 seconds
> Time taken by reclamation: 0.002224 seconds
> Time taken by reclamation: 0.002297 seconds
> Time taken by reclamation: 0.002260 seconds
> Time taken by reclamation: 0.002246 seconds
> Time taken by reclamation: 0.002272 seconds
> Time taken by reclamation: 0.002277 seconds
> Time taken by reclamation: 0.002462 seconds
> =E2=80=A6
>
> This patch significantly speeds up try_to_unmap_one() by allowing it
> to skip redirtied THPs without splitting the PMD.
>
> Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Suggested-by: Lance Yang <ioworker0@gmail.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Nothing jumps at me ;)

LGTM. Feel free to add:
Reviewed-by: Lance Yang <ioworker0@gmail.com>

Thanks,
Lance

> ---
>  mm/huge_memory.c | 24 +++++++++++++++++-------
>  mm/rmap.c        | 13 ++++++++++---
>  2 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 3d3ebdc002d5..47cc8c3f8f80 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(struct=
 vm_area_struct *vma,
>         int ref_count, map_count;
>         pmd_t orig_pmd =3D *pmdp;
>
> -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> +       if (pmd_dirty(orig_pmd))
> +               folio_set_dirty(folio);
> +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> +               folio_set_swapbacked(folio);
>                 return false;
> +       }
>
>         orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
>
> @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(struct=
 vm_area_struct *vma,
>          *
>          * The only folio refs must be one from isolation plus the rmap(s=
).
>          */
> -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> -           ref_count !=3D map_count + 1) {
> +       if (pmd_dirty(orig_pmd))
> +               folio_set_dirty(folio);
> +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> +               folio_set_swapbacked(folio);
> +               set_pmd_at(mm, addr, pmdp, orig_pmd);
> +               return false;
> +       }
> +
> +       if (ref_count !=3D map_count + 1) {
>                 set_pmd_at(mm, addr, pmdp, orig_pmd);
>                 return false;
>         }
> @@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_struct =
*vma, unsigned long addr,
>  {
>         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
>         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
>         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
>
> -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
> -               return __discard_anon_folio_pmd_locked(vma, addr, pmdp, f=
olio);
> -
> -       return false;
> +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>  }
>
>  static void remap_page(struct folio *folio, unsigned long nr, int flags)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index be1978d2712d..a859c399ec7c 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, =
struct vm_area_struct *vma,
>                 }
>
>                 if (!pvmw.pte) {
> -                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw=
.pmd,
> -                                                 folio))
> -                               goto walk_done;
> +                       if (folio_test_anon(folio) && !folio_test_swapbac=
ked(folio)) {
> +                               if (unmap_huge_pmd_locked(vma, pvmw.addre=
ss, pvmw.pmd, folio))
> +                                       goto walk_done;
> +                               /*
> +                                * unmap_huge_pmd_locked has either alrea=
dy marked
> +                                * the folio as swap-backed or decided to=
 retain it
> +                                * due to GUP or speculative references.
> +                                */
> +                               goto walk_abort;
> +                       }
>
>                         if (flags & TTU_SPLIT_HUGE_PMD) {
>                                 /*
> --
> 2.39.3 (Apple Git-146)
>

