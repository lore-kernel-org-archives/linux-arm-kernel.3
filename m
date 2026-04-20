Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D9EF5581E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lO4PmKnC7RtL96EuNz/CUFLMcVWEDBDKT8ymENGeBy8=; b=DA20fsytOcPgx+IGzNmzVQe+1A
	bHp003zMCDpeUwVphshqlbE01MINNUwDXh0uXENcNQ/ObXhggk1ja+K4cXetrd3Fd/33IsjxKqInJ
	02Ke8Uv0FE66yFLS8HH/S+QFnoHXghOC12qIArYPAcn5XghxDvSXy9scXiBMLuc3XsMsoS7YbjzHU
	9aw5FmDxjFhLBAN3p/9f/U37PhAkugVj2pQDfxOOy7M99b4wVkyDPjNXhu6soSwIfuiRrn9memiGI
	/mWseCwc5IKnCbdm4M7kIFqlgd4UwS71x3bmgATG//2h42DILPXrj79uzmu9YAJc/IHFWXTRrGzL/
	ARd/jgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmmr-00000006nOv-3ryj;
	Mon, 20 Apr 2026 11:27:33 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmml-00000006nN9-2xlZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 11:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lO4PmKnC7RtL96EuNz/CUFLMcVWEDBDKT8ymENGeBy8=; b=ganxum9CGyKdrKnobefLwPs3nx
	va8yFYln0i0wQg6n/sHQ19tQfPRRCnupjhBrO4YdLQwVlAGw7gbQraA1DarMjNvJ9fcBIlmuFm2On
	778xQ/pKUhz5t274zVlvWqCZU7SZE/rdyZ29hpLlTbG4lqUkmCUjXlQiedNK1mrb5qOgiPAADOZrr
	Y+FWjpRb5D8LcdAuwqB4uCra2Exprf3C0dAe/wta6V4qVG+BKin9w4wLLyCfs0L8CHg5W8tuM33cw
	aBCGiLSPBe1Yshx6XRTmgnhg1AS0H7X2GlF+4iHaaWKn/5WTwm1KcOCiaqfjs7bSS5C0bEfhhTfhU
	hA8VH00g==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wEmmh-00000000c32-1qL8;
	Mon, 20 Apr 2026 13:27:23 +0200
Date: Mon, 20 Apr 2026 13:27:20 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
 <20260419225539.718367e0@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419225539.718367e0@ryzen.lan>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_042728_494543_FD53AC0A 
X-CRM114-Status: GOOD (  27.28  )
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

On Sun, Apr 19, 2026 at 10:55:39PM +0200, Andre Przywara wrote:
> On Sun, 19 Apr 2026 14:46:06 +0200
> Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
> 
> Hi Michal,
> 
> > Add support for Allwinner H616 high speed timer in sun5i hstimer driver
> > and describe corresponding nodes in dts for H616 and T113-S3.
> > 
> > H616 uses same model as existing driver except register shift compared
> > to older variants. 
> > 
> > Added register layout abstraction in the driver, extended the binding
> > with new compatibles and wired up dts nodes for H616 and T113-S3 which
> > uses H616 as fallback compatible.
> 
> Can you say *why* we need this? IIUC Linux only ever uses one clock
> source, and selects the (non-optional) Generic Timer (aka arch timer)
> for that? So can you say what this hstimer clock source adds? I guess
> higher resolution, but what is your use case, so why would you need the
> 200 MHz? And does this offset the higher access cost of an MMIO
> access, compared to the arch timer's sysreg based access? Also, IIUC,
> people would need to manually select this as the clocksource, why and
> when would they do so? (Given they even know about it in the first
> place).
> Also the hstimer hasn't been used since the A20, so nobody seemed to
> have missed it meanwhile?
> 
> Cheers,
> Andre
>
I took the table from https://linux-sunxi.org/Linux_mainlining_effort as
a todo list and wanted to help with it. I do not have own use case for
this timer. If it is not needed then I will spin v2 to include your
comments and abandon it.

Michal

> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > Michal Piekos (4):
> >       dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
> >       clocksource/drivers/sun5i: add H616 hstimer support
> >       arm64: dts: allwinner: h616: add hstimer node
> >       arm: dts: allwinner: t113s: add hstimer node
> > 
> >  .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
> >  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
> >  drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
> >  4 files changed, 78 insertions(+), 7 deletions(-)
> > ---
> > base-commit: faeab166167f5787719eb8683661fd41a3bb1514
> > change-id: 20260413-h616-t113s-hstimer-62939948f91c
> > 
> > Best regards,
> 
> 

