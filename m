Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FB5CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfkXHdpcpLPKxJAFSi3EJTz5mjIUGnvIy8zdj94PVfs=; b=2j5JUtw5HhYsuLxhQxhztwbjQa
	Qag3FD8Sqer53ITmBhbE9rLZDELS+6GDQ/GRcRxzAQO8YjI96TMU1t8yPw8PU7jFpDVesjzlTS35P
	0GYCeVJiFKsHby2ZOAStfQc7c7rY4xk978aJk6azjsDicU3lYpMU2LzSOBPlt0KAit5/AoEWnCz04
	vU4n2jixP5u94xAlZz4ZDU1zvoWjQx3ImBZ7CUPQygE9P30SnZ3AWZaiXehgRrVpNGBy0QohltRqh
	dS55GK8bftb1FzsDXjGpQRcOe1dSDWbOrGnDCt1+wVaF1P9666ugLwdiPHs7Gk4P38+/LRY9EyirJ
	LE5DV/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFD06-00000006bcI-1zbV;
	Fri, 09 Oct 2026 15:59:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFD04-00000006bcA-3TLN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:59:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0622A60DC7;
	Fri,  9 Oct 2026 15:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542351F000FF;
	Fri,  9 Oct 2026 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561551;
	bh=WfkXHdpcpLPKxJAFSi3EJTz5mjIUGnvIy8zdj94PVfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/oUPf8/UhNiR9fonQpaCJkjH2g0S3nU7rilibnrJa6zwwksFbp3Br4FusMFursCA
	 LwSxDZkXmRB3Z+KMKD2Ab8atR38BG0mQt8yze1hNq1M6LLPcbOhJi0wuWXFUBULjeJ
	 +pL6RU8y60/xBk4PghdJXi2hoVVrtz6+Np/RcS4VDSXkoghR7M99mkaCg3dijCdx4e
	 ROqAf5pqJ7PuL1c3fP1fjQSPWppKpdIMz0EJs0OxuHM/ZEMQ1cOkhKT9iMmoXZIyYP
	 qulXlC0vVWH0/naN2ZG4/jSe9RCaARnlcHBvEgAXK0RxnfONM5iZVppKdiZLoFZBVu
	 8jb0bPazWalXg==
Date: Fri, 9 Oct 2026 17:59:06 +0200
From: Brian Masney <masneyb@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner Clock Changes for 7.4
Message-ID: <askPSvFT1uDZ9sLm@x1g10>
References: <asZYyy4D2PkhjE3q@home.wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZYyy4D2PkhjE3q@home.wens.tw>
User-Agent: Mutt/2.4.2 (2026-08-30)
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

On Wed, Oct 07, 2026 at 10:35:55PM +0800, Chen-Yu Tsai wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-7.4
> 
> for you to fetch changes up to 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16:
> 
>   clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock (2026-09-20 17:32:54 +0800)
> 
> ----------------------------------------------------------------
> Allwinner Clock Changes for 7.4
> 
> Allwinner sunxi-ng clk library's single divider clk type gained support
> for the update bit, and various single divider clks in the A523 driver
> are converted to correctly use the single divider type.
> 
> The "wait for lock" helper is changed to use atomic MMIO polling, as it
> could be used when timekeeping is not available yet, and *sleep() doesn't
> work correctly
> 
> ----------------------------------------------------------------
> Alastair D'Silva (1):
>       clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock
> 
> Junhui Liu (4):
>       clk: sunxi-ng: div: Add feature support to M clock macro
>       clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
>       clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
>       clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
> 
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 ++++-----
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 128 ++++++++++++++-----------------
>  drivers/clk/sunxi-ng/ccu_common.c        |   2 +-
>  drivers/clk/sunxi-ng/ccu_div.h           |  18 ++++-
>  4 files changed, 89 insertions(+), 96 deletions(-)

Merged into clk-next.

Brian

