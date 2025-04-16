Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F7C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVhWTY3ZFGzqPEDO/W0joy8kVqG5wUzwKkcXtfAPvCY=; b=YFqL0mimCNlTJuox/yzeinCib7
	8DMjit81dbKDuOifJ4fMtF5VQaDqUvry1XDviWLDGC7pqosLeSKEWhonWemX94OvOAaAfSXy40K1w
	KwmImB4BEshOBPvzo2iA+WntqJSWhDAx26vIkhYoYrQhImgWx1g2gDosr3gopUuVEUqhUf85QIs1E
	6EpeP0JSw+oPxCO0Ht2PcTc30JpUCuvbjKyE8aocAhtWYiGXfHvBxe7PHiehw+t1vgJ19gPxQb41G
	u+1qIQQdYeW8zefy8/NkCNrFc3A3yrXEnyiyRzN/PpXZpSsDlYhl4s9tDworWceIlTrJDXLeAe3DN
	YUEdYJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u596M-0000000Am5A-3dDW;
	Wed, 16 Apr 2025 20:11:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u594V-0000000Aloa-0yn3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 20:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65AAD5C4D50;
	Wed, 16 Apr 2025 20:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EE1C4CEE2;
	Wed, 16 Apr 2025 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834161;
	bh=pCQdOvo4laUHf7dQwDu8+NqQcri7JEdKnymIyq99jkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAdeEAmuon9/vsZ60kDxHnAVHe3K9UHfeEPMgTodwRVWyu0vBQMReQ/G+JYguUv2T
	 HvMYz8VW5+3VAykUadq3Ns+OuqXJfJnfPwADjMISIV5Hhty5oa/1Su8VrJNBbJphLT
	 etufmg6zplKq6ZlN6Md9FIGRj8sUg/3UgvmcWw/Fbd/xnM6axYOyRl6wFR6wiHtfkG
	 Ka2gUyS55p6Zs8sY2eRxz13LBQg0/8KH4ozJMt0IBL/WAmsAbXFzFd1aJArcz1gIv7
	 xGwnVyApmtGIqPIOvF5zfpYA0DY/I7eVgaGokKpGdDRXMo+vN/3anERyK44APXUMb1
	 12z4vJN+GnE0A==
Date: Wed, 16 Apr 2025 15:09:19 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
Message-ID: <20250416200919.GA3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416155442.GA3255418-robh@kernel.org>
 <CABjd4YyPzZoX98=FMwr91BG2RhYc0r5=9P-2GGAbR0s043duPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABjd4YyPzZoX98=FMwr91BG2RhYc0r5=9P-2GGAbR0s043duPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_130923_372247_64EA0695 
X-CRM114-Status: GOOD (  25.12  )
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

On Wed, Apr 16, 2025 at 10:55:52PM +0400, Alexey Charkov wrote:
> On Wed, Apr 16, 2025 at 7:54 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Apr 16, 2025 at 12:21:25PM +0400, Alexey Charkov wrote:
> > > Convert some more VT8500 related textual DT binding descriptions to
> > > YAML schema, do minor dts correctness fixes, and add a DT for the
> > > board I'm actually testing those on (VIA APC Rock).
> > >
> > > While at that, also describe the PL310 L2 cache controller present on
> > > WM8850/WM8950.
> > >
> > > Note that this series is based upon Krzysztof's linux-dt/for-next
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > > Alexey Charkov (13):
> > >       dt-bindings: i2c: i2c-wmt: Convert to YAML
> > >       dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YAML
> > >       dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
> > >       dt-bindings: net: via-rhine: Convert to YAML
> > >       dt-bindings: pwm: vt8500-pwm: Convert to YAML
> > >       dt-bindings: timer: via,vt8500-timer: Convert to YAML
> > >       dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
> > >       ARM: dts: vt8500: Add node address and reg in CPU nodes
> > >       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
> > >       ARM: dts: vt8500: Use generic compatibles for EHCI
> > >       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
> > >       ARM: dts: vt8500: Add VIA APC Rock/Paper board
> > >       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> > >
> > >  Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
> > >  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
> > >  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 +++++++++++++++++
> > >  .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
> > >  .../interrupt-controller/via,vt8500-intc.yaml      | 47 +++++++++++++++++
> > >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> > >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
> > >  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 +++++++++++++++
> > >  .../devicetree/bindings/net/via-rhine.txt          | 17 ------
> > >  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 +++++++++++++++
> > >  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
> > >  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
> > >  .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
> > >  MAINTAINERS                                        |  7 ++-
> > >  arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
> > >  arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
> > >  arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
> > >  arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
> > >  arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
> > >  arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
> > >  arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
> > >  arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
> > >  arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
> > >  arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
> > >  27 files changed, 386 insertions(+), 165 deletions(-)
> > > ---
> > > base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b
> >
> > I could not apply this series for testing. What base is this? It is
> > unknown to anything I have. Please use most recent rc1 unless you have
> > a dependency then use recent linux-next or a branch in it.
> 
> It's based on Krzysztof's linux-dt/for-next [1] as mentioned in the
> cover letter above - it hasn't yet been pulled into today's
> linux-next. Specifically, this patch [2] from Wolfram is a dependency
> for patch 10/13 in this series - the rest should apply cleanly on top
> of 6.15-rc1

Unfortunately tools can't read cover letters other than defined tags 
like base-commit.

I would suggest you send each binding patch separately and then just the 
.dts changes as a series. Then it is split-up by which trees these all 
get applied to as bindings are applied by the subsystems typically.

Rob

