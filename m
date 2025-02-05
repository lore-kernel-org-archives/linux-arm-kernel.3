Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C25C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 04:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=; b=PBV22xc1fY51eokF+6XarP3GRq
	EphkYsVvsl64Ui13/ROwXGaFtzf7RGNQIw4aEdG3lzaCCv6tIM08rLIspNsic2JUgfqY5t+gJLEMd
	KICph+FfcVN8XnBcv5P9EkRkRUPpTvv5oHp9NISGRC/O1s9EghCtZSl0AFGSMvP7HwW0sdrvIVu5K
	Z4STK88Z8AHLIFFr+iBlFGEEUBHHzYya+UnjuHDfbKKkq3QBpiEtJnjovxXzkdFuuEzpXxfNK8834
	H47HFvRVotfHqecdG2Ze8S6UAaNYRdFpE2rVG5UE/9l7nrkguaJEjBp4yVe19ao4sbs0EF1qfx+zo
	10FMlt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXIc-00000002Iqr-2NB3;
	Wed, 05 Feb 2025 04:46:06 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWCs-00000002EI7-0x3x;
	Wed, 05 Feb 2025 03:36:07 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5174db4e34eso309926e0c.0;
        Tue, 04 Feb 2025 19:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738726564; x=1739331364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=;
        b=JiNbkttkMKVqxoJnYjS5Ut5O+u1Ph0Jxt9aeSo9F1zbThTpm7FBCnaXY12KINa0RPR
         ViMkXZwLnZZAtafQBExYzFJEgveBknLRxdzlloyBpdIbfh+kTKzUyYM+g8wFvMaRNy/S
         R2GzskRe2J5UrqBPJ+u2dPVuLYk5mp9L7GIdwHqNBNUQtz/PwGWN1PXwXlLi5GaMiz15
         uP5LeP8PIe7cbaNQFbtBCYFn2VMHHM9vBZd+EOlLT2bEsLdzmIYGlNRd8Fo3MRUI/lyY
         XbubzjZUbVFOWLfdcruMnxZ6zxMgYe/AYDkQLqitz1Uw5Izql6dXyvxiBP8OiKXGcboS
         5FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738726564; x=1739331364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=;
        b=oUrZbAqGVVQvMepDxU/na2nc6vJ37Qn+GCb5tjuHcJ/6snAM15aWmGnVwpYj4dK2CN
         EXDe1u3mSGX17yxYVnjYK1eu7G9u5qDt3W7oL2KqvCgn56IfslpZXBG7pNVoyeC0IYv4
         KfObcCCQIweFnyJ+KgHgQL29oSVtrE9Upej+CzkmGYq6dIFaRaUlcGhHmG1E3xFmGdLt
         v29K7sEXx7kTfL3nyGZ50FKYix0A16HuOFX1LK9ePXa+E4ev+0JUEGvz+x+Y27o2kEUM
         4KevIWopt9WRG2VEJ+o+a2Yg/fsvk3kMSwYqtNUE/iVWNVCQvdp76FsH6WJcWNCeK+t1
         07Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZjSrOVi4HaSjGuSx5+EPBARsnEApQqyVRmXQRt8/9m+JYI26GiuW4Wx+M4KO3z0le6vdAVXHVBQhbLU=@lists.infradead.org, AJvYcCXtZwAGD1I/OdTCywJnRCXTbl+d939nu62A0GciKrafH9CNG4UG6LZbkdSvR+yy2BAoyoaoFV6VXQLBxJTueIko@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4tW4mPYPXojfOHErGHNT+pTfJ7OgNPKnckC1XcOwJCqzB//M
	i/4JvxiTIdYltZeuLu+n2c5rVD/om1ISKwzsuCr3p0DPEgDZrwHyGBTjUunySVqxFFFKcAvWn3t
	8bu2e84Xss+FRTNJSxMTYTKJdVZ4=
X-Gm-Gg: ASbGncvPVD41duBCUd+I4mXBMrkJfHO1k0s0psHEq9JN7sufOuzLBNmf88ki8mG1VdE
	anm2ubW4RGmvm5ElQDM/A57AcLJScMoUmAvmJnzXM+BoXBnc1SwgtTSvk0cqHxU7dWyxgz8/YCJ
	Fprlu7DQwzKYY8t6i0iZ/IusXlV2JHxqg=
X-Google-Smtp-Source: AGHT+IGP4WsgiqUVX5HyqOYtIvh4Hq32IEZYHctOrR7MFUBGMBkylUMFNIOHuXx97Yh2py0mo+lW5Gea5XZG/gxtO2A=
X-Received: by 2002:a05:6122:2217:b0:516:1b30:8779 with SMTP id
 71dfb90a1353d-51f0c93d1fcmr880863e0c.6.1738726564404; Tue, 04 Feb 2025
 19:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-4-21cnbao@gmail.com>
 <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
In-Reply-To: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 5 Feb 2025 16:35:53 +1300
X-Gm-Features: AWEUYZnXwE_m5JMhkeEf-s_y5Z5EWucY3F69kva5tUuQ06iIfAx7YdL3KdTzTZE
Message-ID: <CAGsJ_4wFp5e3DkP2dk_Zar7Feu-LrAyqLG6X1181UeRHCh1pVw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_193606_267818_F828B203 
X-CRM114-Status: GOOD (  16.26  )
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

On Wed, Feb 5, 2025 at 12:38=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> Hi,
>
> >       unsigned long hsz =3D 0;
> >
> > @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >                               hugetlb_vma_unlock_write(vma);
> >                       }
> >                       pteval =3D huge_ptep_clear_flush(vma, address, pv=
mw.pte);
> > +             } else if (folio_test_large(folio) && !(flags & TTU_HWPOI=
SON) &&
> > +                             can_batch_unmap_folio_ptes(address, folio=
, pvmw.pte)) {
> > +                     nr_pages =3D folio_nr_pages(folio);
> > +                     flush_cache_range(vma, range.start, range.end);
> > +                     pteval =3D get_and_clear_full_ptes(mm, address, p=
vmw.pte, nr_pages, 0);
> > +                     if (should_defer_flush(mm, flags))
> > +                             set_tlb_ubc_flush_pending(mm, pteval, add=
ress,
> > +                                     address + folio_size(folio));
> > +                     else
> > +                             flush_tlb_range(vma, range.start, range.e=
nd);
> >               } else {
>
> I have some fixes [1] that will collide with this series. I'm currently
> preparing a v2, and am not 100% sure when the fixes will get queued+merge=
d.
>
> I'll base them against mm-stable for now, and send them out based on
> that, to avoid the conflicts here (should all be fairly easy to resolve
> from a quick glimpse).
>
> So we might have to refresh this series here if the fixes go in first.

I assume you're referring to "[PATCH v1 08/12] mm/rmap: handle
device-exclusive entries correctly in try_to_unmap_one()". It looks
straightforward to resolve the conflict. If your patch is applied first,
I'll send a rebase.

>
> [1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com
>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry

