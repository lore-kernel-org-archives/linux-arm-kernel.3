Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34147F33817
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPG9b6sTgW+oJ3eIimAqMr0YAdkk+1g/3lYm5QU7ZR4=; b=zZreDuXyLW7UWsuIE34xdrLhwZ
	yBBVIVvLwkTXXKe+kD7JJslCn71ycZ7MhZmKEFmzXGbEdPSqoZ5SYAEngKpYBvu+VtmHg+ViItif5
	uMH/QxD4WWU0p5P3T7WoA1UlaIF3l9vthCOxNnlU/Tq0cnOI8/iP49Ok3xadwXaT9clE0PZIypTZ7
	YfW0DYnCjnNppqAQ1y3MDiooQpOsnhyyK6bP82J6kwuHn2c3h4ThdO6NnH/Xws2uxeFh1d+AN1JT0
	sh4ZM5SEIv3Y9rJfMvkY7XITMUO5ATkGvh3oHLvGx8JUkSFdGiEJDxL4u53kKpGjaxP5lZaqELtnX
	aiBSdsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q3Z-00000005knj-0wB2;
	Tue, 17 Mar 2026 08:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q3Y-00000005knV-0ain;
	Tue, 17 Mar 2026 08:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aPG9b6sTgW+oJ3eIimAqMr0YAdkk+1g/3lYm5QU7ZR4=; b=TAs33nmaXLWerVIz9HedZec9rm
	ndsvcVTvViK924HXmNk/Yx9kZ0hrbgyNDgEyWJBsF2WH44lWpwdK3Ti9fuv1ogm7WuaGipbf8rNhT
	g66ZP3MgziC8sNuPLPlChOyef4oeBxnkvmggUoRxSu977gcA0X6q5NeLCtUKuLEZ/DvHlxhFh+YHH
	9WslFGQke6fm4G3te4AWv0ajW+YfIsnsv/SWN5r23b6S9Fs9ProSPFfNPR2yNu2rVsXe11R2/j9IQ
	lSRt7Q92VgoN+2Zyrnk28qmlEHyY9U+93+KKwLglyJd9adFwdE8keJ3mIrCeVN1hu/84cucNQ3Oyj
	P4joeVgg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q3T-00000008RPn-3nf7;
	Tue, 17 Mar 2026 08:45:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A1FB44366;
	Tue, 17 Mar 2026 08:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01724C4CEF7;
	Tue, 17 Mar 2026 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737132;
	bh=4hTToIr/78vfvHkQPMhwZI2Lj0uD6bto/uR5S2TlSDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/2Ge6/rbt4hz59fzOGAAiuf6hOLhMx5Cs7IDW1WGBgKnGFS48CdZuHdAHFI/Po68
	 PWZFpCsGTOwmsQQ9SPvjP3oohpLTH0RqjPVOFO13zJGD9AwwjyQWriz1CCOpbiwCtZ
	 5qX1DqL0+0NeZJjxaqRGrcdwVQt3YLqSqrOcR5USaK7dSbO5lTNP8rBt01x+nE+A2G
	 Kfgk2ONDpjbpWqRx6YcJX56bhe9JmOhUXq936nFyEJaxIRVj8F6czkoxoLl3ftHPYa
	 10ROh8A+K65bwc7TIw8LfzyLT89mFIWaUWf08NHkREBqKf4nhNTQgAils4AQqjHj8b
	 Ss/IAVBLGqJPQ==
Date: Tue, 17 Mar 2026 09:45:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
Message-ID: <20260317-clever-flat-wolverine-313a4c@quoll>
References: <5055064.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5055064.GXAFRqVoOG@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_084536_395348_EE031FDD 
X-CRM114-Status: GOOD (  18.18  )
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

On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
> Hi SoC maintainers,
> 
> please find a below some Rockchip fixes for the current 7.0 release-cycle.
> And in the next PR, even one driver-fix this time.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1
> 
> for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:
> 
>   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03-12 20:52:53 +0100)
> 
> ----------------------------------------------------------------
> A big number of changes fixing dt-schema issues on the ARM32 side,
> fixes for the Gameforce-Ace to make the hardware work properly
> (including thermals) as well as fixing issues both on Beelink A1 (spdif)
> and Pinebook Pro (Wifi) by reverting the commits that created the issues
> 
> ----------------------------------------------------------------
> Chris Morgan (2):
>       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
>       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
> 
> Fabio Estevam (11):
>       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
>       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036 boards
>       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
>       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
>       ARM: dts: rockchip: Remove invalid regulator-property from rk3288-veyron

Not a fix.

>       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron

Not a fix. This is a pure style change. Fixes for current cycle means
either important issues being fixed or errors introduced in current
cycle.

Changing style from one to another is not a fix.

>       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
>       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk3288-phycore-rdk
>       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload

Not a fix. Style of node name is not a bug, otherwise describe user
visible (not "internal tools" visible) impact.

>       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
>       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk

Several other are questionable as well, since they were in DTS for long
time. Please also read Linus' explanation here from some time ago - if
the issue is for long time and no one cared, then changing it is a normal
development.

Several changed pieces here look like 3 or more years old, so does not
fit criteria of current cycle fix at all.

Please split the pull.

Best regards,
Krzysztof


