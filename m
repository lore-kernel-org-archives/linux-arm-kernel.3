Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B282CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDtD1RuEvO0usfXj2x7thtiRxuzLJn150R30ry9M7hc=; b=NoeKHQ3LU5CIOd8c0/cwvGM1MQ
	9rIrhL2RJv3IJic4/E6U1gkEnwbRQXOQlmPQlnpaHSY/WNBncziFj4/SDw0BxVJUg3IFmyWxGsbNA
	31dzG68QncYXHpoLN/RqDQR3lAKhWi8U8x2stnucLqHg5XfWWXtT5rsf4YFDjSlbWqGLJTiIVTJJL
	i+eE9c3KWDmsrSlhtr/falIStjhr2PyGxRlQHfrQ9vCyLC7+kX8NOcFQf7X8NEZijvmCRgQtfMmU0
	+pxQ5nW6/g+Jwvt46v77MQbvAEUIOBjV4dfOyMkBgtO3VOBi7fddkNVaI048QmXsnFfTJjJCxc6HQ
	rVAHKDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0N-0000000AttP-0toz;
	Fri, 02 Oct 2026 07:48:31 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY0K-0000000AtsZ-2ERS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:48:29 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2C98D240107
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 09:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790927302;
	bh=TDtD1RuEvO0usfXj2x7thtiRxuzLJn150R30ry9M7hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=LkNO0LWfhS3/tZymvtKqSFt3Ttbdc5qZUXCH9BnuTQpxYKANnCe4R1xRX4+WwJy9p
	 JoeE5JOd8wQyqL6MMHzy4o6IUlMkqVM4Iw3LdSKBD0IJLRNTcwxJhtT97Pzj/RdEvS
	 +E6TmAQkQsPu7KMRWnNkjWmTuaOEDBJTilM+JxqufApE85NDMe8LhlRuV5y5DZLgrE
	 6F7eBVg+gq9o6m+y+KPPzeYbvPss83zO4dR0Ms5kcewTaiRbH3AV05F1/PD9BLEQYL
	 RESPuZWCkTBFw3hIUHLY/hw/55HVyDARYIUmztqgXjKAgPLhfCqQv1P28h8aC6x130
	 vHSqQHE03j6zA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hx19Y3Xh3z6twQ;
	Fri,  2 Oct 2026 09:48:17 +0200 (CEST)
Date: Fri, 02 Oct 2026 07:48:21 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, Bastian
 Germann <bage@debian.org>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware
 spinlock
Message-ID: <20261002094816.64349979@posteo.net>
In-Reply-To: <20261002-matted-tux-5b4059bc305a@wendy>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
	<20260927132707.5f484946@posteo.net>
	<20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
	<20260930160541.040ccc0e@posteo.net>
	<20261002-matted-tux-5b4059bc305a@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_004828_904405_C5E75875 
X-CRM114-Status: GOOD (  38.74  )
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

On Fri, 2 Oct 2026 08:32:51 +0100
Conor Dooley <conor.dooley@microchip.com> wrote:

> On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > On Wed, 30 Sep 2026 20:02:21 +0700
> > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> > 
> > > Hi Wilken,
> > > 
> > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> > > > file accordingly?
> > > 
> > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> > > more at the naming. I'd like to keep the A31 fallback: it's the usual
> > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > prefers a driver entry instead, I'm fine to change it.
> > 
> > Yeah, Conor was a bit quick to act here, such things happen often with patchsets
> > made out of documentation/devicetrees and code. Though, the get clock and resets
> > patch is fine. The driver could use some modernization.
> 
> I dunno, was I too quick to act? The patched looked correct to me, since
> it was using a fallback to a device that it appears to be compatible
> with. Had the series done what you're suggesting, my review feedback
> would have been to tell the Tien to add a fallback.

I'm just not sure how to actually do it right, because so many SoCs include that
feature. That is why I asked how you would do it having more insight as a
subsystem maintainer. It just looks incomplete to me. In the past I actually
verified it working with H2, H2+ and H3, none of them being
"allwinner,sun6i-a31-hwspinlock".

> > > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hwspinlock"
> > > string or add all the possible combinations like
> > > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinlock".
> > > I mean, it is just a naming game and there are 10+ SoCs supporting this
> > > spinlock register file
> 
> All devices compatible with the a31 should use the a31 as a fallback.
> 
> > 
> > > > Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.
> > > 
> > > That would be great. You don't need FreeRTOS for it: I tested with a
> > > small Linux module that takes each lock and checks the status
> > > register. I can clean it up for the single-core D1 and send it.
> > 
> > Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses the entire
> > point of the primitive. A hwspinlock arbitrates between two independent agents,
> > in this case, Linux running on the C906 core and FreeRTOS running on the HiFi
> > DSP, both sharing the same memory bus and other hardware. If Linux is the only
> > one who ever takes the locks, it is simultaneously writer and reader of the status
> > register, so the test cannot fail even for a broken (or fake) implementation. That
> > would basically test nothing at all, well, maybe it would be some kind of bring-up
> > test, but overall quite useless.

