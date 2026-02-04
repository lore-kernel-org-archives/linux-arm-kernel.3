Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8CDE95396
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCualjpzLBrdwCPJv0gUmlcf7nSDxWmIfVGRzvs7nek=; b=NWpfohdSsAy+ZzQQOP3TCHTiR/
	Nu1B71fmJscBFyu5Ce1k8uQbkh8XNDX0u7NYv921eCIe0ltuTR9C5+s3xMeP5eLt9n6Z4uF7zFRB+
	qIkjUf/vBhTO65yeBktHL/kowikucj2jUyEIwkfjn6O81QFGIt8X7JW6PeD3io+yWWNgDID/dqxwb
	wPtxzoguOeSaARDU1RQsUMv5lL/bpVptf55a+djRxU33p/ItzhSIKxM8c5Ia0+79anYhcjaRZpSjS
	NpbXllcR6Gu4P9sTEZSGipf9CqonWxard7XcUTh8YxTF+rQF0e7Qqofz/Fh5wJeIPff6f7JYJABkb
	yzdzwBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndBi-00000008XGq-2YjY;
	Wed, 04 Feb 2026 13:44:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndBg-00000008XGQ-1L7T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:44:57 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5hQX5fT2zHnGkY;
	Wed,  4 Feb 2026 21:43:48 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 3273A40086;
	Wed,  4 Feb 2026 21:44:50 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 13:44:48 +0000
Date: Wed, 4 Feb 2026 13:44:47 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Linus Walleij <linusw@kernel.org>
CC: Yushan Wang <wangyushan12@huawei.com>, <alexandre.belloni@bootlin.com>,
	<arnd@arndb.de>, <fustini@kernel.org>, <krzk@kernel.org>,
	<linus.walleij@linaro.org>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<xuwei5@hisilicon.com>, SeongJae Park <sj@kernel.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <20260204134447.00000afd@huawei.com>
In-Reply-To: <20260204134020.00002393@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
	<20260203161843.649417-2-wangyushan12@huawei.com>
	<CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
	<20260204134020.00002393@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_054456_679857_7E9DE172 
X-CRM114-Status: GOOD (  43.42  )
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


Fixed linux-mm address that got added a few emails back.

On Wed, 4 Feb 2026 13:40:20 +0000
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Wed, 4 Feb 2026 01:10:01 +0100
> Linus Walleij <linusw@kernel.org> wrote:
>=20
> > Hi Yushan,
> >=20
> > thanks for your patch!
> >=20
> > On Tue, Feb 3, 2026 at 5:18=E2=80=AFPM Yushan Wang <wangyushan12@huawei=
.com> wrote: =20
> > >
> > > The driver will create a file of `/dev/hisi_l3c` on init, mmap
> > > operations to it will allocate a memory region that is guaranteed to =
be
> > > placed in L3 cache.
> > >
> > > The driver also provides unmap() to deallocated the locked memory.
> > >
> > > The driver also provides an ioctl interface for user to get cache lock
> > > information, such as lock restrictions and locked sizes.
> > >
> > > Signed-off-by: Yushan Wang <wangyushan12@huawei.com>   =20
> >=20
> > The commit message does not say *why* you are doing this?
> >  =20
> > > +config HISI_SOC_L3C
> > > +       bool "HiSilicon L3 Cache device driver"
> > > +       depends on ACPI
> > > +       depends on ARM64 || COMPILE_TEST
> > > +       help
> > > +         This driver provides the functions to lock L3 cache entries=
 from
> > > +         being evicted for better performance.   =20
> >=20
> > Here is the reason though.
> >=20
> > Things like this need to be CC to linux-mm@vger.kernel.org.
> >=20
> > I don't see why userspace would be so well informed as to make decisions
> > about what should be locked in the L3 cache and not?
> >=20
> > I see the memory hierarchy as any other hardware: a resource that is
> > allocated and arbitrated by the kernel.
> >=20
> > The MM subsytem knows which memory is most cache hot.
> > Especially when you use DAMON DAMOS, which has the sole
> > purpose of executing actions like that. Here is a good YouTube.
> > https://www.youtube.com/watch?v=3DxKJO4kLTHOI =20
> Hi Linus,
>=20
> This typically isn't about cache hot.  It it were, the data would
> be in the cache without this. It's about ensuring something that would
> otherwise unlikely to be there is in the cache.
>=20
> Normally that's a latency critical region.  In general the kernel
> has no chance of figuring out what those are ahead of time, only
> userspace can know (based on profiling etc) that is per workload.
> The first hit matters in these use cases and it's not something
> the prefetchers can help with.
>=20
> The only thing we could do if this was in kernel would be to
> have userspace pass some hints and then let the kernel actually
> kick off the process. That just boils down to using a different
> interface to do what this driver is doing (and that's the conversaion
> this series is trying to get going)  It's a finite resource
> and you absolutely need userspace to be able to tell if it
> got what it asked for or not.
>=20
> Damon might be useful for that preanalysis though but it can't do
> anything for the infrequent extremely latency sensitive accesses.
> Normally this is fleet wide stuff based on intensive benchmarking
> of a few nodes.  Same sort of approach as the original warehouse
> scale computing paper on tuning zswap capacity across a fleet.
> Its an extreme form of profile guided optimization (and not
> currently automatic I think?). If we are putting code in this
> locked region, the program has been carefully recompiled / linked
> to group the critical parts so that we can use the minimum number
> of these locked regions. Data is a little simpler.
>=20
> It's kind of similar to resctl but at a sub process granularity.
>=20
> >=20
> > Shouldn't the MM subsystem be in charge of determining, locking
> > down and freeing up hot regions in L3 cache?
> >=20
> > This looks more like userspace is going to determine that but
> > how exactly? By running DAMON? Then it's better to keep the
> > whole mechanism in the kernel where it belongs and let the
> > MM subsystem adapt locked L3 cache to the usage patterns. =20
>=20
> I haven't yet come up with any plausible scheme by which the MM
> subsystem could do this.
>=20
> I think what we need here Yushan, is more detail on end to end
> use cases for this.  Some examples etc as clearer motivation.
>=20
> Jonathan
>=20
> >=20
> > Yours,
> > Linus Walleij
> >  =20
>=20


