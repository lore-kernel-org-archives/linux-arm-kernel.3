Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0F8C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucJkPKtW7Pg719flpv7obuaScxhby2iCUB5MbPa/kpk=; b=p4ikJYA8xR0rn9sPdPdDuvM2OB
	RHq3dXAnugeiFPleMNQb9fIrU0ZzacoSpg8LRd+bBSkJMPO24ctZzrbpQYWqzQguf7SDEBYbm/t4I
	tumMR0/XPt+MHNSl9O+bpjlCnXAdnoYVcxi2mMISgIauXKf8qqGUU4dFIdcGi16ImuCtKPZtqTUz0
	QV50H0rIyjLcNNIHJiA/NpBfcaG0oJnBI670YDFQY9NK4jVmUCW0AI20Toyj2ID9fXWvfk7NBx1+P
	vDjMeehOow9Du4/L11crtKe5KI+Qulkwo5IIt/Y/vBGD4R/PB1WYMwJctzy7RA6vAAX0v073/fjXl
	9BbNfOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVIQS-0000000G0fZ-2e16;
	Fri, 27 Jun 2025 23:24:08 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVIO9-0000000G0YX-36J4;
	Fri, 27 Jun 2025 23:21:46 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a44e94f0b0so36049671cf.1;
        Fri, 27 Jun 2025 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751066504; x=1751671304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucJkPKtW7Pg719flpv7obuaScxhby2iCUB5MbPa/kpk=;
        b=Cp7HzT5EtN7mcTIcJG6YIcoOjlO4n+mNhbHvoz4fD1con42KWtnASB9ATNa9HgoBOD
         k0ZIPOpYtjiC40cYbwnZ5NP2JGiJerV5BozIv5/G2R2BhODpgK169ey8uQfpXlZ0D/xH
         HrGwa2wFGJNIbE5pxDkGDXhBURTiZ0nkO1zNR8w50qHDv33VdP+q4ZhN2YWtRZ4BPFBv
         V7RGnGYFav3YNYIN25WErPZLWmW1sO9cwFwVqiPcMGfiTZjfYer6nf5gTdrBF/kZIJ7B
         m+njrlslxvclyKcf8VE871/N+XoGZe/QO1nqaKz51ctgiCEuy1TeJJKxrWH8LVnm7YYz
         CvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066504; x=1751671304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucJkPKtW7Pg719flpv7obuaScxhby2iCUB5MbPa/kpk=;
        b=KoVUkpeZnXzuvFOBALoei0f+zNB149wITJMnnDPmoGo4vjmxCi+UIf19MPorYIp1rB
         xbyUeVCp4oQfJQV3vT4WKNELMr4WUr/lnFI78uJ/JZeqtR8kLeIdL160k48QMBYuHmSJ
         ykn0cHenTEwcZh+kmGBxGUxOZMPqO7THgPL2IfuLALs779X8E96QARQWzE2rO4ymofoy
         zxI7SKCTnwas6MDblgBTWlmkNAQXqLwFSaqjZdUzkKTdveb94XlDrWwcbY4rN86kwWil
         gHZQUaFFinQ2uLvLI6/IvMHx1MUPQypnEsBpSpxv+bIfs82wSpwgi8Jnq6Yv2UlxdScQ
         4IyA==
X-Forwarded-Encrypted: i=1; AJvYcCUeYX35fDaxLsEbeLB9t5zPyIEjxJc8pmVpyFOmN3+L+e0kRDLsZd02A0y6WvoNcukUpvieb+oXkZFtOZnYA8GE@lists.infradead.org, AJvYcCXhvDgI44InVldL+u7+Cl1zDfzO7/k7PRicHQ2jzjhkrakU8Kk0Nops/2vhjxFSmnY6pBd96F7vt4TF5FBkk9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjQUNYyuAhQk1FLpwaoUJu9kuVdF7NAwqXYPNH83OYcXIEpfxV
	PLl0xpHRx8Fn7cFLMdWJFN1XZAajkigaoGIK6jF9gJap4VszlqffVmxd4PY8WcmAtEt7x6KJzxZ
	GimyzE8RBHBB7rsg8V4odIUbtf9xuu3I=
X-Gm-Gg: ASbGncv1km6V8C0nkTYmYHVkffdHzEEGIQ3AXB1UE5QdPESnFKJGLJJHTFMYBpltJIQ
	THS/bHlW573es1+4SaKf91kpHjA2esvXNhxf7w8hg2pHY27wRE/NkkJoxGitstcEWWpqIYwHteo
	nDD28ENHH0C+Q1bqx6jQoN0tyTT5hCSq+NhCXY7VD4QVs=
X-Google-Smtp-Source: AGHT+IHt7Bnl1QDdVB6cTrkscdZrmsp2tuuy01YtS0lHhra3cCiP4pdY5RNPLzOZWdY2wMvLK7r6ZqOWRGCudJ2pzN8=
X-Received: by 2002:a05:6214:19e2:b0:6e4:2dd7:5c88 with SMTP id
 6a1803df08f44-70005d01547mr81865596d6.38.1751066503861; Fri, 27 Jun 2025
 16:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
 <20250623051642.3645-1-21cnbao@gmail.com>
In-Reply-To: <20250623051642.3645-1-21cnbao@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 27 Jun 2025 16:21:32 -0700
X-Gm-Features: Ac12FXw9SLcgHLB1-sjIGFMt6c57r8Qm130o6AnwRJ48KBb5RI23RH4t3Y7AL0Q
Message-ID: <CAKEwX=MTuxSbbSWaKOwdjAgdar2=D83UW-j9mV3qDSg+ZHHwkA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, andrew.yang@mediatek.com, 
	angelogioacchino.delregno@collabora.com, casper.li@mediatek.com, 
	chinwen.chang@mediatek.com, hannes@cmpxchg.org, james.hsu@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, 
	matthias.bgg@gmail.com, minchan@kernel.org, qun-wei.lin@mediatek.com, 
	rppt@kernel.org, senozhatsky@chromium.org, sj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_162145_780234_D493D38F 
X-CRM114-Status: GOOD (  41.17  )
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

On Sun, Jun 22, 2025 at 10:16=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> Hi Nhat,
>
> On Wed, Jun 18, 2025 at 2:21=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Sun, Jun 15, 2025 at 8:41=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> > > >>
> > > >> That seems unnecessary. There is an existing method for asynchrono=
us
> > > >> writeback, and pageout() is naturally fully set up to handle this.
> > > >>
> > > >> IMO the better way to do this is to make zswap_store() (and
> > > >> zram_bio_write()?) asynchronous. Make those functions queue the wo=
rk
> > > >> and wake the compression daemon, and then have the daemon call
> > > >> folio_end_writeback() / bio_endio() when it's done with it.
> > >
> > > > +1.
> > >
> > >
> > > But,
> > > How could this be possible for zswap? zswap_store() is only a fronten=
d =E2=80=94
> > > we still need its return value to determine whether __swap_writepage(=
)
> > > is required. Waiting for the result of zswap_store() is inherently a
> > > synchronous step.
> >
> > Hmm, I might be misunderstanding either of you, but it sounds like
> > what you're describing here does not contradict what Johannes is
> > proposing?
>
> It seems contradictory: Johannes proposes that zswap could behave like zR=
AM
> by invoking `folio_end_writeback()` or `bio_endio()`, but this doesn=E2=
=80=99t align
> with actual behavior since zswap_store might not end `swap_writeout()`=E2=
=80=94it may
> still proceed to `__swap_writeback()` to complete the final steps.
>
> Meanwhile, Qun-wei=E2=80=99s RFC has already explored using `folio_end_wr=
iteback()` and
> `bio_endio()` at the end of `__swap_writepage()` for zRAM, though that ap=
proach
> also has its own issues.


Hmm OK. I'll let Johannes comment on this then :)

>
> >
> > >
> > > My point is that folio_end_writeback() and bio_endio() can only be
> > > called after the entire zswap_store() =E2=86=92 __swap_writepage() se=
quence is
> > > completed. That=E2=80=99s why both are placed in the new kcompressed.
> >
> > Hmm, how about:
> >
> > 1. Inside zswap_store(), we first obtain the obj_cgroup reference,
> > check cgroup and pool limit, and grab a zswap pool reference (in
> > effect, determining the slot allocator and compressor).
> >
> > 2. Next, we try to queue the work to kcompressd, saving the folio and
> > the zswap pool (and whatever else we need for the continuation). If
> > this fails, we can proceed with the old synchronous path.
> >
> > 3. In kcompressed daemon, we perform the continuation of
> > zswap_store(): compression, slot allocation, storing, zswap's LRU
> > modification, etc. If this fails, we check if the mem_cgroup enables
> > writeback. If it's enabled, we can call __swap_writepage(). Ideally,
> > if writeback is disabled, we should activate the page, but it might
> > not be possible since shrink_folio_list() might already re-add the
> > page to the inactive lru. Maybe some modification of pageout() and
> > shrink_folio_list() can make this work, but I haven't thought too
> > deeply about it :) If it's impossible, we can perform async
> > compression only for cgroups that enable writeback for now. Once we
> > fix zswap's handling of incompressible pages, we can revisit this
> > decision (+ SJ).
> >
> > TLDR: move the work-queueing step forward a bit, into the middle of
> > zswap_store().
> >
> > One benefit of this is we skip pages of cgroups that disable zswap, or
> > when zswap pool is full.
>
> I assume you meant something like the following:
>
> bool try_to_sched_async_zswap_store()
> {
>         get_obj_cgroup_from_folio()
>         if (err) goto xxx;
>         zswap_check_limits();
>         if (err) goto xxx;
>         zswap_pool_current_get()
>         if (err) goto xxx;
>
>         queue_folio_to_kcompressd(folio);

Something like this, yeah. Can queue_folio_to_kcompressd() fail? If
so, we can also try synchronous compression on failure here
(__zswap_store() ?).


>         return true;
>
> xxx:
>         error handler things;
>         return false;
> }
>
> If this function returns true, it suggests that compression requests
> have been queued to kcompressd. Following that, in kcompressd():
>
> int __zswap_store(folio)
> {
>         for(i=3D0;i<nr_pages;i++) {
>                 zswap_store_page();
>                 if (err) return err;
>         }
>         return 0;
> }
>
> kcompressd()
> {
>         while(folio_queue_is_not_empty) {
>                 folio =3D dequeue_folio();
>                 if (folio_queued_by_zswap(folio)) {
>                         if(!__zswap_store(folio))
>                                 continue;
>                 }
>                 if ((zswap_store_page_fails && mem_cgroup_zswap_writeback=
_enabled()) ||
>                     folio_queued_by_zram) {

If !mem_cgroup_zswap_writeback_enabled(), I wonder if we can activate
the page here?

>                         __swap_writepage();
>                 }
>         }
> }
>
> In kswapd, we will need to do
> int swap_writeout(struct folio *folio, struct swap_iocb **swap_plug)
> {
>         ...
>         if (try_to_sched_async_zswap_store(folio))
>                 return;
>         if (is_sync_comp_blkdev(swap)) {
>                 queue_folio_to_kcompressd(folio);
>                 return;
>         }
>         __swap_writepage();
> }
>
> To be honest, I'm not sure if there's a flag that indicates whether the
> folio was queued by zswap or zram. If not, we may need to add a member

I don't think there is.

> associated with folio pointers in the queue between kswapd and kcompressd=
,
> since we need to identify zswap cases. Maybe we can reuse bit 0 of the
> folio pointer?
>
> What I mean is: while queuing, if the folio is queued by zswap, we do
> `pointer |=3D BIT(0)`. Then in kcompressd, we restore the original folio
> with `folio =3D pointer & ~BIT(0)`. It's a bit ugly, but I=E2=80=99m not =
sure
> there=E2=80=99s a better approach.

I think this approach is fine.

We can also hack struct zswap_entry, but that would require an extra
xarray look up. OTOH, if we can assume that zram users will not enable
zswap, we might optimize that lookup away? Not sure if it's much
cleaner than just pointer tagging though.

>
> Thanks
> Barry

