Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBE5C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 21:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFOUdSvHwil/K0FhFzOket4pw49ZzFhiG+QLBkwjfts=; b=gwq55xczYE8VhkkuZHfbrJdrjJ
	zEUCLUpk1242GmqmL7anQ4KSTme917nhiwvbtKje3kX0zxABXkkly6NejxzLQaZ7qHEGSCCpWvJ5i
	IjR2IEi8YTQ1B8kiF/fDja0mBtokRsZUfSS2iLR3IvnUIh8aiqLeA+7UfxIuXFNgPDswIF8tLKuKa
	66ysbJts5e0yKIddp+KkWeQOrCU/NoI1yyiscBUnrqt/6Gm/bA148eSHhd4BB+TxG8R2AK9vsvUtr
	DzFpLcKMh3V9P32N1Fv7rKE5nnI6KC4LgSFSrhXmZcJNAAYA3C/qgQZEoaOnHasE39gp1ozDZNdna
	mDcw1QhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9URD-00000009ZBN-1WSb;
	Wed, 23 Sep 2026 21:23:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9URB-00000009ZB4-40Qq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 21:23:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E32143E97
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 21:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459611F00899
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 21:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790198613;
	bh=pFOUdSvHwil/K0FhFzOket4pw49ZzFhiG+QLBkwjfts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l2NXnhWk5v24WehMq4tSpmYi+d5xm5L5yI8aFPMPz4HayjF3RJ4ct2hxFlSr6eGvJ
	 0Dtw3flW+pOGjBESMhPfV/DI6fLstSCno88OFAUOcih9X39nhGNIm+VpXZpUCynB5X
	 +D7okYDBr1ytqcLJCoruXi0yL6W3PylDaJ4luGmUZJF5UlIpJep2khrcvpacTDYim7
	 IT05Utcze2c06jhGz6rpyFOWDLNJd1LCpKETbFh+ZE4BggMJqtOZYAweaXhTF8C/pj
	 MBU8+1dE75n0Jan3UlAQY4zyyjUWmsOME/jxXvmE57pTuE7aDqGqKM9u4ELTtwB8wP
	 qgVVtkJxP0phQ==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ad20d4so135881085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0cfQRp25K7SzOd1bdGGNnHqvPurdueaJBEqM85aqr/mp4b3xS6nQAAGALuPIOCnbgusIuLNM7KTNCbWplSJNX@lists.infradead.org
X-Gm-Message-State: AFuF++msVpendr70KW3yqHfYUYWW5xN5pqiMSCZ8GOcL3zMHPO/Qil29
	c/7qZQvHzjBR71FfiT0CBCyMQWImSuZyqBm8g/DBcpfdOgt2tzOLtE3+Q3M7Et0m+R5IrkBRTMu
	sp+22HWCar9WlDkawbO6UHNX4SpQvUV0=
X-Received: by 2002:a05:620a:2a04:b0:93b:d7a1:ba0d with SMTP id
 af79cd13be357-93c346ca45amr66989285a.56.1790198612443; Wed, 23 Sep 2026
 14:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-5-jiangwen6@xiaomi.com>
In-Reply-To: <20260923062832.479455-5-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:23:20 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3SC4QSs5Q4aQ@mail.gmail.com>
X-Gm-Features: AcwNN1U6u4upYBVse70ygcbBam77nB0znlsjMQqKiWEExUFJn-qljmWnP0sSc0Y
Message-ID: <CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3SC4QSs5Q4aQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 23, 2026 at 2:29=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
> was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
> pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).
>
> Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
> longer a caller of set_huge_pte_at() on arm64. The only remaining
> callers passing &init_mm are in arch/powerpc, which uses its own
> implementation. Remove the dead branch.
>
> No functional change.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

LGTM. Please see the comments below.

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  arch/arm64/mm/hugetlbpage.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa6..ce247b06fe03d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
>         for (i =3D 0; i < ncontig; i++, addr +=3D pgsize, ptep++)
>                 __ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
>
> -       if (mm =3D=3D &init_mm)
> -               flush_tlb_kernel_range(saddr, addr);
> -       else
> -               __flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF=
_NOWALKCACHE);
> +       __flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKC=
ACHE);


For the vmap case, we are not mapping over a valid mapping, so there is no
case where `pte_present()` can be true. But I guess we can strengthen the
check in patch 1 by adding a `VM_WARN_ON()` for `pte_valid()` and some
comments.

/* For vmap, there is no valid -> valid transition */
VM_WARN_ON (pte_valid(__ptep_get(ptep)));

Best Regards
Barry

