Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D35C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5H3llY72enjkEdNIToGWJYvPuL2qq4dnT9xlwtzu20=; b=SoQheIqAyVXMtMjdq7OKVHfqX1
	/rogVseTkvilfUtWo5RGS4+BlkRkSZ7eVkOn1cMk+wDdqTvSXc8Ij5UFuhkzFr6T21cNgZF8K6eHh
	hDYQdcDeILMgYm7BhIxD7icgFxMgUnBxcUHHrcKB4KwjOTBFhdimqBYHu1kHk8oZqJBSuGxXGYTFc
	+jx+7NF6fga/YcuSz7W2zGEQdrOfgt8vsA+CrUz5Odtc4Z2nQ2a2qXITNsVLrtR0rFmns8y/x8dpq
	QSnDmE6gCbOZtHapUx5OSLs1figrFMm77bkNmU7tN4fYVvY7TmCFX8bCVANW9tyIssjOhI2o8M05M
	rmBjfqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYDl-00000007jTt-3Gzd;
	Tue, 17 Jun 2025 15:27:33 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXCK-00000007Wyq-2PYe;
	Tue, 17 Jun 2025 14:22:01 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7d3900f90f6so622950085a.1;
        Tue, 17 Jun 2025 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750170119; x=1750774919; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5H3llY72enjkEdNIToGWJYvPuL2qq4dnT9xlwtzu20=;
        b=OPJCcfdzPYXycOaaR6rMRkg/jV4UdMttFpmBo1esr6vEPBql55Q0WNc1Io6akn8+zt
         ihGnMadGrkXUCgRrzGFsksXHONsjrLui02bTZN/pP6OTKjuKjHTWKM5LIO1aQ9nbBp3d
         zndfYOUQubBLRlZWWQ64jt/j+3LMt9i/gfCis0wtbUPmHyBpMzKH9B3IhIZEtj9obsFN
         Qr9JL6zpf1P0n6ZLkxABHYf3oTN3f4EQaWqUFI91uT4iqUFsZRB12rUswWzizZrvLXro
         ZsynRKLQhlKTw7Qcdx6qzT85LPm3hQk4gTgrHz3ZjPYdQhErSyg6sVAfA1Uz3IWwgYqo
         j5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170119; x=1750774919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5H3llY72enjkEdNIToGWJYvPuL2qq4dnT9xlwtzu20=;
        b=jLbkOud3mF/BBpV7NrhCphEn8oPcOx0fuWslNyLnZimLByi1JFpqQ/q3he92gZX9mY
         FRDjzFBzWp6SyPcAWa8cl0I+mJgzoROfc/PJ7cZVPnIuzb04uMwFtPDsr3rhFqgazfoR
         2k66ZJT4K5tD3ulZh8b111U810UiLCfv3SQKVXV3B6bryPKla6x9qCrN/+0QskWcFyAP
         AeTSdthr0W6cUCekp0NyV8w/UZCqegZK18rdOEVeXTGHnJ+cG705V1kx2M1BOP9Wt5TM
         fiRBh72QIIzZiQKDuHLuesXi+skENuPzvXVAo++8wuKmcwcKm+xeWELzp+ckHJ7fFsXZ
         XwyA==
X-Forwarded-Encrypted: i=1; AJvYcCUuTw7ayTg0hj49Wk6aGArWajE5S/wQo0XWxG9H0jmT3095ubzPNSUPzYCTqzqka7tw9jfhipibkKLZqP5OnUuW@lists.infradead.org, AJvYcCVUimBkD62knzkh8lwNWgPdvfzsQlOzt8SEMKLG7ktuwPCHgp7Y/eA+Zd+ffyyzyUoGNe56i4VLez6l8GSdRwI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAlBEfAtjnCIYPpBWDeKjkByGcIn66rgH1r7UJWqrfRKE9ZlHn
	uDtYhVX3QkCONN4Dn/F7SSMAFKd9Sac5TNd5lbSA78KL5ID/dGDpVAEc96f7byYGR4UpUyUO9Ie
	MRS2NY0NFaevGZ5WHzNqNaOG5t1d/W2c=
X-Gm-Gg: ASbGncswm3yX/sRoj0VI83NlCl+PW4eENoK0jfcDS8Igltu63dmO+DvJN5EOkzWI55P
	kC+satbfO5OOrvCNas/vfwXcs0NHtLQlA6oKk8aMGXuzrzjw1o2i86Fpac8xDATQDtCJ0ckWriR
	lxE76HJ0OClTbFmj4qw/pPFWVvXQ3HXz64sv4WgUMA2w==
X-Google-Smtp-Source: AGHT+IHYNkrCgtJHt2hFgEP+iYzHoZb39T53y/Gl2gXFOZbEhw0D+9micgfKOfZ2G95P3OgJvLkG2Kh/Ej/C/K4Aaj4=
X-Received: by 2002:a05:6214:5b04:b0:6fa:fcb0:b88d with SMTP id
 6a1803df08f44-6fb4777844amr254933506d6.28.1750170118787; Tue, 17 Jun 2025
 07:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
 <20250616034106.1978-1-21cnbao@gmail.com>
In-Reply-To: <20250616034106.1978-1-21cnbao@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 17 Jun 2025 07:21:47 -0700
X-Gm-Features: AX0GCFsLfKaP0pe5rAQXmN-MLD8Oy91foKqjJyGMkrVUvROAKlnJQR793e_ehyQ
Message-ID: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: hannes@cmpxchg.org, akpm@linux-foundation.org, andrew.yang@mediatek.com, 
	angelogioacchino.delregno@collabora.com, casper.li@mediatek.com, 
	chinwen.chang@mediatek.com, james.hsu@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, 
	matthias.bgg@gmail.com, minchan@kernel.org, qun-wei.lin@mediatek.com, 
	rppt@kernel.org, senozhatsky@chromium.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072200_617639_3B3EAEB3 
X-CRM114-Status: GOOD (  23.64  )
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

On Sun, Jun 15, 2025 at 8:41=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> Hi Nhat, Johannes,
>
> >> The way you implemented this adds time-and-space overhead even on
> >> systems that don't have any sort of swap compression enabled.
>
> I agree =E2=80=94 we can eliminate the time and space overhead by refinin=
g the
> code to hook kcompressed only when zswap or zram is enabled.
>
> >>
> >> That seems unnecessary. There is an existing method for asynchronous
> >> writeback, and pageout() is naturally fully set up to handle this.
> >>
> >> IMO the better way to do this is to make zswap_store() (and
> >> zram_bio_write()?) asynchronous. Make those functions queue the work
> >> and wake the compression daemon, and then have the daemon call
> >> folio_end_writeback() / bio_endio() when it's done with it.
>
> > +1.
>
>
> But,
> How could this be possible for zswap? zswap_store() is only a frontend =
=E2=80=94
> we still need its return value to determine whether __swap_writepage()
> is required. Waiting for the result of zswap_store() is inherently a
> synchronous step.

Hmm, I might be misunderstanding either of you, but it sounds like
what you're describing here does not contradict what Johannes is
proposing?

>
> My point is that folio_end_writeback() and bio_endio() can only be
> called after the entire zswap_store() =E2=86=92 __swap_writepage() sequen=
ce is
> completed. That=E2=80=99s why both are placed in the new kcompressed.

Hmm, how about:

1. Inside zswap_store(), we first obtain the obj_cgroup reference,
check cgroup and pool limit, and grab a zswap pool reference (in
effect, determining the slot allocator and compressor).

2. Next, we try to queue the work to kcompressd, saving the folio and
the zswap pool (and whatever else we need for the continuation). If
this fails, we can proceed with the old synchronous path.

3. In kcompressed daemon, we perform the continuation of
zswap_store(): compression, slot allocation, storing, zswap's LRU
modification, etc. If this fails, we check if the mem_cgroup enables
writeback. If it's enabled, we can call __swap_writepage(). Ideally,
if writeback is disabled, we should activate the page, but it might
not be possible since shrink_folio_list() might already re-add the
page to the inactive lru. Maybe some modification of pageout() and
shrink_folio_list() can make this work, but I haven't thought too
deeply about it :) If it's impossible, we can perform async
compression only for cgroups that enable writeback for now. Once we
fix zswap's handling of incompressible pages, we can revisit this
decision (+ SJ).

TLDR: move the work-queueing step forward a bit, into the middle of
zswap_store().

One benefit of this is we skip pages of cgroups that disable zswap, or
when zswap pool is full.

>
> The use of folio_end_writeback() and bio_endio() was the case for zRAM
> in Qun-Wei's RFC.
>
> https://lore.kernel.org/linux-mm/20250307120141.1566673-3-qun-wei.lin@med=
iatek.com/
>
> However, the implementation tightly coupled zRAM with reclamation logic.
> For example, zRAM needed to know whether it was running in the kswapd
> context, which is not ideal for a generic block device =E2=80=94 the role=
 zRAM
> is supposed to play. Additionally, the code was not shared between zswap
> and zRAM.
>
> Thanks
> Barry

