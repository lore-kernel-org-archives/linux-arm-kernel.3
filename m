Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96A7C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14J+e5VuAf8KWTYGvfdl7Up5l3cKOJfv7HHosoMS/QI=; b=WFewY3VAijK1fS5IPh6vJzlAVo
	zW432KiM5lD1uWZGyLpby+oSzjAb0P3H9TVQ9C797eGbrskol+U3l7KPjmEoGScH1mXjFvRieJNDa
	+u9uCnCYycU422VPhc2V6yDGGIEDcwqIsbJYe49oDnZdm3/e2PHUkKPFRIIWdpB3zQsFe2kaL8pyN
	a7m74/Siv9istzwArlcJvvCxlVWNEux+mnnQkJizPbdYo+3svwRw9G50keGnLg300pq+bFiczss/M
	a0lfBnwQY69pc09WPxCRaCNRLs7j/kKefjc+B0uhdfCz3n2M1UxKKKis34+N2bQXP67fpVJce5/vE
	JYPnxVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru12-00000004pSP-2s2p;
	Tue, 11 Mar 2025 07:27:04 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trtzN-00000004pDp-3Pao;
	Tue, 11 Mar 2025 07:25:22 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-51eb181331bso2361447e0c.0;
        Tue, 11 Mar 2025 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741677920; x=1742282720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14J+e5VuAf8KWTYGvfdl7Up5l3cKOJfv7HHosoMS/QI=;
        b=AZ8s1rLE/W9sQ1xKxfyJDH40LNuqY46nU0xyAhBOYDmZtKvoliD2FSNxEC/NKiR0uT
         CR6e1U5g1tuWOWn8CEInhyrlhiHyydbjx5V4nmZhHnbRn3Yf8FxKAoQuQ0B60omhkeod
         OgFWdq9/nB5YE95s61w7yMSxWvS020v3S6P8sRx4Nk+XO7F2ZYvgF9WJ/enZ6zfAlWGp
         EfKo9jqbXOjxH3e3j4y0q8eO9A+EZ7mNHTfTCoWXs0CZb2i5tst0oEsnllw7HCSbPWrD
         K00K3u0nXYeYANd/b6PFQzm2EG34SYyBVEE1zes6OC2OeHHqU9G2xTKF7mb/TU7UnyK6
         G6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741677920; x=1742282720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14J+e5VuAf8KWTYGvfdl7Up5l3cKOJfv7HHosoMS/QI=;
        b=KNa8fcrP1MLx+P7eZ54vzQj7RJFL/H+Ad/bdlQHgi2uuQ8k8jIpmnpwzIqObOE7yEM
         UdmfGK7iTvDe7dh8xfHUQ34jrd1LJGlNug2TB7xGLBHKiz/AgACbjv0MiYd810b1H+BP
         +wuRmlwi3aGi/WVuDxMVcoglW2BIxACByxxKwhOIkvyIYuyINWDn40/6pmEPk8cr6ueu
         rk/2j+ZBpQdbhemq6cgstKlgmJjiRsBaJrwZ5Sc9W1qjGfVFvA6EwcvlGn0DqBT7zoot
         BzAD61+8U/YxI5Fz7uLhtSUTuMEc+sg9f70cOjOay6Kk4MWNhgoTMlCkkxTtAtlRqwzJ
         Ko5w==
X-Forwarded-Encrypted: i=1; AJvYcCUCVxz8xrP2rfmG4qXjqcxiRZldfJ82opiY0bOiarxHUbBJDi7m02Mi2ULK5AcPf8aw31ub18g731ZFUdpJ6S0=@lists.infradead.org, AJvYcCW+j4csb9ELgLggMgIFmoW0XaSQCy9bUOweds7/IOiOy5uk5AF82wZ8wAyvn5xCjYKakCY8pt0mpCWsiqJXT2bF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe/warlQQAMiYGlNexGJLGB4uj1d+158X8sRZ5qbtEFdQkGVBy
	K8COM8U4O0lKuN3Cupg2pn6ZaoYdthB6eSWVsazXeYB0CWY45d2qQeK3FJcOfncnMJQDMh1ZAHN
	LsMic7qbjyDSrXv9l/SFMlmXG/t4=
X-Gm-Gg: ASbGnct2aZNSZpNVoASudSTFrtUsT2OmRCZ9BqKfVa+CZYYiJy/0ddpJhTQ9ibIAcpj
	Imhsg3cHK/JqFQFCGbGpAIrqEgGjleYFejrYg/N+hkViPlcFQHR/hWE/bo5DgoZTDSPzdkX7DJ6
	EBabDb8G/wJ1NS9xK6oL5d7In0RQf+XWeFW25B
X-Google-Smtp-Source: AGHT+IFsyBlzqjw152fKM+F/V/k1af7P7Im6Vh9k8Vu1jHuGXnkPe4wU95quHjQWRTZpr4F4NdrxAPjlRVLxhAwp+VQ=
X-Received: by 2002:a05:6122:2189:b0:520:5a87:6708 with SMTP id
 71dfb90a1353d-523e3d9bfbfmr8599088e0c.0.1741677920409; Tue, 11 Mar 2025
 00:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <20250307120141.1566673-3-qun-wei.lin@mediatek.com> <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com>
 <7938f840136165be1c50050feb39fb14ee37721b.camel@mediatek.com> <CAGsJ_4zzZdjbr2DbRybHYDmL2EuUBohOP1=ho7fjx1XWoKDDGw@mail.gmail.com>
In-Reply-To: <CAGsJ_4zzZdjbr2DbRybHYDmL2EuUBohOP1=ho7fjx1XWoKDDGw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 11 Mar 2025 20:25:09 +1300
X-Gm-Features: AQ5f1JpKxaLImM0wsAF8CYe72YVs87H6q9d9biQ7imNBdrvywmaFTR6ikJ3uks4
Message-ID: <CAGsJ_4yuyJc_-Ods-um_jtAgFFJ_qJi1=b8Kf-_ngU0UHjMQYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kcompressd: Add Kcompressd for accelerated zram compression
To: =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
Cc: =?UTF-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>, 
	=?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>, 
	"chrisl@kernel.org" <chrisl@kernel.org>, =?UTF-8?B?SmFtZXMgSHN1ICjlvpDmhbbolrAp?= <James.Hsu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"dave.jiang@intel.com" <dave.jiang@intel.com>, 
	"schatzberg.dan@gmail.com" <schatzberg.dan@gmail.com>, 
	=?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"minchan@kernel.org" <minchan@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "kasong@tencent.com" <kasong@tencent.com>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"ying.huang@intel.com" <ying.huang@intel.com>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, 
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_002521_856653_484BBA85 
X-CRM114-Status: GOOD (  41.16  )
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

On Tue, Mar 11, 2025 at 8:05=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Tue, Mar 11, 2025 at 2:26=E2=80=AFAM Qun-wei Lin (=E6=9E=97=E7=BE=A4=
=E5=B4=B4)
> <Qun-wei.Lin@mediatek.com> wrote:
> >
> > On Sat, 2025-03-08 at 08:41 +1300, Barry Song wrote:
> > >
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > >
> > >
> > > On Sat, Mar 8, 2025 at 1:02=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@media=
tek.com>
> > > wrote:
> > > >
> > > > Introduced Kcompressd to offload zram page compression, improving
> > > > system efficiency by handling compression separately from memory
> > > > reclaiming. Added necessary configurations and dependencies.
> > > >
> > > > Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> > > > ---
> > > >  drivers/block/zram/Kconfig      |  11 ++
> > > >  drivers/block/zram/Makefile     |   3 +-
> > > >  drivers/block/zram/kcompressd.c | 340
> > > > ++++++++++++++++++++++++++++++++
> > > >  drivers/block/zram/kcompressd.h |  25 +++
> > > >  drivers/block/zram/zram_drv.c   |  22 ++-
> > > >  5 files changed, 397 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/block/zram/kcompressd.c
> > > >  create mode 100644 drivers/block/zram/kcompressd.h
> > > >
> > > > diff --git a/drivers/block/zram/Kconfig
> > > > b/drivers/block/zram/Kconfig
> > > > index 402b7b175863..f0a1b574f770 100644
> > > > --- a/drivers/block/zram/Kconfig
> > > > +++ b/drivers/block/zram/Kconfig
> > > > @@ -145,3 +145,14 @@ config ZRAM_MULTI_COMP
> > > >           re-compress pages using a potentially slower but more
> > > > effective
> > > >           compression algorithm. Note, that IDLE page recompression
> > > >           requires ZRAM_TRACK_ENTRY_ACTIME.
> > > > +
> > > > +config KCOMPRESSD
> > > > +       tristate "Kcompressd: Accelerated zram compression"
> > > > +       depends on ZRAM
> > > > +       help
> > > > +         Kcompressd creates multiple daemons to accelerate the
> > > > compression of pages
> > > > +         in zram, offloading this time-consuming task from the
> > > > zram driver.
> > > > +
> > > > +         This approach improves system efficiency by handling page
> > > > compression separately,
> > > > +         which was originally done by kswapd or direct reclaim.
> > >
> > > For direct reclaim, we were previously able to compress using
> > > multiple CPUs
> > > with multi-threading.
> > > After your patch, it seems that only a single thread/CPU is used for
> > > compression
> > > so it won't necessarily improve direct reclaim performance?
> > >
> >
> > Our patch only splits the context of kswapd. When direct reclaim is
> > occurred, it is bypassed, so direct reclaim remains unchanged, with
> > each thread that needs memory directly reclaiming it.
>
> Qun-wei, I=E2=80=99m getting a bit confused. Looking at the code in page_=
io.c,
> you always call swap_writepage_bdev_async() no matter if it is kswapd
> or direct reclaim:
>
> - else if (data_race(sis->flags & SWP_SYNCHRONOUS_IO))
> + else if (data_race(sis->flags & SWP_WRITE_SYNCHRONOUS_IO))
>            swap_writepage_bdev_sync(folio, wbc, sis);
>   else
>             swap_writepage_bdev_async(folio, wbc, sis);
>
> In zram, I notice you are bypassing kcompressd by:
>
> + if (!nr_kcompressd || !current_is_kswapd())
> +        return -EBUSY;
>
> How will this work if no one is calling __end_swap_bio_write(&bio),
> which is present in swap_writepage_bdev_sync()?
> Am I missing something? Or is it done by zram_bio_write() ?
>
> On the other hand, zram is a generic block device, and coupling its
> code with kswapd/direct reclaim somehow violates layering
> principles :-)
>
> >
> > > Even for kswapd, we used to have multiple threads like [kswapd0],
> > > [kswapd1],
> > > and [kswapd2] for different nodes. Now, are we also limited to just
> > > one thread?
> >
> > We only considered a single kswapd here and didn't account for multiple
> > instances. Since I use kfifo to collect the bios, if there are multiple
> > kswapds, we need to add a lock to protect the bio queue. I can revise
> > this in the 2nd version, or do you have any other suggested approaches?
>
> I'm wondering if we can move the code to vmscan/page_io instead
> of zram. If we're using a sync I/O swap device or have enabled zswap,
> we could run reclamation in this separate thread, which should also be

Sorry for the typo:
s/reclamation/__swap_writepage/g

> NUMA-aware.
>
> I would definitely be interested in prototyping it when I have the time.
>

Thanks
Barry

