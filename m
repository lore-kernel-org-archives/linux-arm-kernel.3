Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0582D109E550
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCaEAJNhTo2UqbKFUufVu1cRos+o9lEhWFxuFYsDYtk=; b=yAJcXuihS1/uDCe9zSmjMLpaM0
	C6Iq6rNCjiK7lZuJuCXDMblrt6mVnhqNN0+AeAduaMOY+XyTro74izuO93iDdGPFjcedDXfvX2Phe
	OTgvPy+iWEn7xndjuGJ49FK715LMGq/in3EcZ7qtPjSPM1X6yFutlgaSzFdim+tRnhm1B1cJoSKXO
	htKxVE8qepb7vCwGSrSxfoZ9YZvAgEwhDXAGuuU9wbNPaJX7uKcE1A1Ig/tOTWIuBB52LaV0P/hk+
	5M25G5RmHNO+6h68HmYBdGR2edNd9T/nic64ryKkPaKHIMrYf5uhZhdVMiQeZvTXojQTN+b3HsiST
	8PjIZQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dJQ-00000004k8W-2Hh4;
	Thu, 26 Mar 2026 05:31:20 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dJN-00000004k88-2Omk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:31:18 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-509134ab2d2so5807031cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 22:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774503076; cv=none;
        d=google.com; s=arc-20240605;
        b=fS3HYN7OObHUTMaJiKWN8o0kc2zH99VLDk0m1zkxzBAVjPiOLKZ8n71mEkfKjyE9Zf
         mrQUFmB4zOlXjBPAUuB3GdIAAIS1cZ+rqEH/LE4quQHhYrajyD0vK3Sv68A3/w8xeWal
         YoU+ubTI8nLmIDwrixrDoytvYWWgPAJdB8N8S2XuwaCrRXR3VTlJYkzzcTBQEq/R0zZR
         q4XlM6Pn7VhBpb2UYTZ10GVZyes9fWf3N3n0EhwIUHQjn5kBGPa2zQXQS9aJrcieA/2T
         PoqMQAR3fzUDDU/l9UypTX+5qbZvp+bG60/jDXWaS/rrnr6nkiYcelgb53mAT1uw5WcI
         uBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SCaEAJNhTo2UqbKFUufVu1cRos+o9lEhWFxuFYsDYtk=;
        fh=fmgJthVu+W2UGU5OWaIOMll+QPvpTCy3hSh7IKkQlns=;
        b=Au/GT0n2xMV+kOAmcnYnsR2nwXUAKTm0B54LvOeufQ2fvIhbM89q6RyGZLChuN3HOh
         xmRRCj6SGjA7QuX+YEb/y9+rSHQRyw05gP0W/wcGeSjt1BesEy7b3BUgc6sHZHHyP6dr
         gChKZC9Cxk/gIlOBadTp51SjVXTZYlTJxCU7rq08M1Ue7mwOac4Xk/04OgdoNQPAX96T
         QQa8InOjYuFH2PAVf5eWSx4HkZ0LHscDn7umZjc4bHbtaj39lG8b10bI1bwS/9jHIdNb
         wNYlq1yF9Xl0BpGnhbLhl4kv6LWnnaEaC7lvcRc58I76uQi7GhVvKf6eUT2Czi8PT/rJ
         nZVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774503076; x=1775107876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCaEAJNhTo2UqbKFUufVu1cRos+o9lEhWFxuFYsDYtk=;
        b=f1kRle8/Ml2/SaTgbhhlBqs/wc5iIdso7IpNBX0wiA1nfr1NZhBuyyLP313Aavrwsh
         20sJTPFWWgV9sHUwPqU/Rllpfb+iKjHOeG/QZ8VArtbr39tK8M2JHYJw67q0UJ+skmZu
         afCjFkF6SqDISxAQldlqtTzBSjDUEXjIKSQiDX+9NxsfkeKWkQmGKTkC/QE4A27ELtG6
         eu13BRRINP5UcucPp0nsksziiUHjbtLjjiaFzWvW3EQ1Qd2+Y1FAunZrZVYFW/Lv0LXw
         fdzdZBchRJEDS9lPQ3PB7/JFZMVlgJjDO8+gBqPKXyWUhnb8PVtl8m+yGQf6P85FQz6A
         xmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503076; x=1775107876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SCaEAJNhTo2UqbKFUufVu1cRos+o9lEhWFxuFYsDYtk=;
        b=R1GHvxqTC3iBOQ3/RvDrxmXHv8NCH34GecTgzjAlyAn/LhV8wUIT2omtQATE4dM5M1
         ER4phhPzd5WUWhbFkr1PZ3j2s/B1oZJmRbkrytTsW9LY5wK9jX5yAUX3GFrxTZ5tCERV
         mDUxbgK7paTUqLGCKzrASj7fiiqZeZJxdctDpvLWtR2N9dBXJBgzvZrXR7AREl9gOX35
         zL8T6Dhko20994uUtxiMibOlwkmMvMhv98d6OF0CCgaX7uyucTuePQ6x1pVfFWkHIsq/
         OX2zgFr3g7nTJIgF7vweIxpW+77LJvJ+M9dyOdActwCzSDSF16RGpa4JBB8+CWBiPMI0
         FwNg==
X-Forwarded-Encrypted: i=1; AJvYcCVdDO3z+0GffYBNMT/tsr7gCTgYuQdsFc5D8VIFc3kBt2rWpU5tjbPK/oNlMMDmTRmNN7LOV6e07PATjnBFDhH+@lists.infradead.org
X-Gm-Message-State: AOJu0YwaoMpViD85a8r41ly31Ie6BQ4ePssfO7BRA962pAiUujMVCXZm
	dXGCYA28QK5jrkfgqU5gZ1hEmuQvPSEWBtEs5gB9Cd0FnjhX4wTzbbvwkgHEy90+p9YOKjVgefX
	A8NFoprzHEART6yHDwHV+YzcYhkiczRA=
X-Gm-Gg: ATEYQzxhNLGXQxL8FVzdIc3ojHEa8a8wGggsOzF8MNMNx0T+PXOZfkUxyr0PSy4b/FS
	skPNu2WGWdVD20aF3OxNYNpPaRSiWluQNiwl8R446hi+ik/suDHbefyGEzubcAaPAAihH4+hEdI
	QYMqbZCsyo8cNgEGLatqNgDdr3HZNTrqX6JjOM6ffXIuqyRqcjrPd5ob2zxB0rO/wSSn/VSYhl2
	G/OHx8UZLEdyYFmW3Dsc6FQbVE9bhkkzOfAIQduKYhqY8TeSq5xNm5lGVR40i6yjXUkN9s9Ondb
	l0qUi/lcIbMFOr8ezNzX8nXOvsQRXJHGpZK8S0UC2exFXWKm+WyLRRGDLvGQL2ljVaJscdtNmg=
	=
X-Received: by 2002:a05:622a:649:b0:50b:4537:2e21 with SMTP id
 d75a77b69052e-50b80e31f63mr88188291cf.45.1774503075181; Wed, 25 Mar 2026
 22:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com> <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com> <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com> <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
 <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local> <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
 <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local> <bfd282b1-523d-4945-97a0-ec30fe1df577@linux.alibaba.com>
In-Reply-To: <bfd282b1-523d-4945-97a0-ec30fe1df577@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 26 Mar 2026 13:31:03 +0800
X-Gm-Features: AQROBzCIiNeStZAQ0EbA6A6QH1SNX_HIcZ_FnWTDII6KaQNjc7QCXZELtVpC91U
Message-ID: <CAGsJ_4xL8Rm929oXG54TRXeL8LoHqMYM76rGUc8eKWwC_iPZKA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com, 
	harry.yoo@oracle.com, jannh@google.com, willy@infradead.org, dev.jain@arm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_223117_629273_4C889557 
X-CRM114-Status: GOOD (  23.14  )
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

On Thu, Mar 26, 2026 at 9:47=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 3/25/26 11:06 PM, Lorenzo Stoakes (Oracle) wrote:
> > On Wed, Mar 25, 2026 at 03:58:36PM +0100, David Hildenbrand (Arm) wrote=
:
> >> On 3/25/26 15:36, Lorenzo Stoakes (Oracle) wrote:
> >>> On Mon, Mar 16, 2026 at 03:15:18PM +0100, David Hildenbrand (Arm) wro=
te:
> >>>> On 3/16/26 07:25, Baolin Wang wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> Sure. However, after investigating RISC=E2=80=91V and x86, I found =
that
> >>>>> ptep_clear_flush_young() does not flush the TLB on these architectu=
res:
> >>>>>
> >>>>> int ptep_clear_flush_young(struct vm_area_struct *vma,
> >>>>>                 unsigned long address, pte_t *ptep)
> >>>>> {
> >>>>>      /*
> >>>>>       * On x86 CPUs, clearing the accessed bit without a TLB flush
> >>>>>       * doesn't cause data corruption. [ It could cause incorrect
> >>>>>       * page aging and the (mistaken) reclaim of hot pages, but the
> >>>>>       * chance of that should be relatively low. ]
> >>>>>       *
> >>>>>       * So as a performance optimization don't flush the TLB when
> >>>>>       * clearing the accessed bit, it will eventually be flushed by
> >>>>>       * a context switch or a VM operation anyway. [ In the rare
> >>>>>       * event of it not getting flushed for a long time the delay
> >>>>>       * shouldn't really matter because there's no real memory
> >>>>>       * pressure for swapout to react to. ]
> >>>>>       */
> >>>>>      return ptep_test_and_clear_young(vma, address, ptep);
> >>>>> }
> >>>>
> >>>> You'd probably want an arch helper then, that tells you whether
> >>>> a flush_tlb_range() after ptep_test_and_clear_young() is required.
> >>>>
> >>>> Or some special flush_tlb_range() helper.
> >>>>
> >>>> I agree that it requires more work.
>
> (Sorry, David. I forgot to reply to your email because I've had a lot to
> sort out recently.)
>
> Rather than adding more arch helpers (we already have plenty for the
> young flag check), I think we should try removing the TLB flush, as I
> mentioned to Barry[1]. MGLRU reclaim already skips the TLB flush, and it
> seems to work fine. What do you think?
>
> Here are our previous attempts to remove the TLB flush:
>
> My patch: https://lkml.org/lkml/2023/10/24/533
> Barry's patch:
> https://lore.kernel.org/lkml/20220617070555.344368-1-21cnbao@gmail.com/
>
> [1]
> https://lore.kernel.org/all/6bdc4b03-9631-4717-a3fa-2785a7930aba@linux.al=
ibaba.com/

x86: ptep_clear_flush_young does not perform any TLB
invalidation. simply, calling ptep_test_and_clear_young()

RISC-V: follows the exact same behavior as x86.

S390:
simply, calling ptep_test_and_clear_young()

powerpc:
simply, calling ptep_test_and_clear_young();

parisc:
set_pte + __flush_cache_page
but ptep_test_and_clear_young() doesn't need __flush_cache_page()

arm64:
ptep_test_and_clear_young() followed by
flush_tlb_page_nosync() can still be expensive,
based on my previous observations.

others:
ptep_test_and_clear_young + flush_tlb_page

revisiting the comment for x86:
        /*
         * On x86 CPUs, clearing the accessed bit without a TLB flush
         * doesn't cause data corruption. [ It could cause incorrect
         * page aging and the (mistaken) reclaim of hot pages, but the
         * chance of that should be relatively low. ]
         *
         * So as a performance optimization don't flush the TLB when
         * clearing the accessed bit, it will eventually be flushed by
         * a context switch or a VM operation anyway. [ In the rare
         * event of it not getting flushed for a long time the delay
         * shouldn't really matter because there's no real memory
         * pressure for swapout to react to. ]
         */

At least I feel this also applies to ARM64?
Maybe Ryan, Will, or Catalin can clarify why ARM64 requires a
nosync TLBI, whereas x86 does not?

Thanks
Barry

