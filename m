Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5BBC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/13cZeUrOLEzs/U0VXbyufzLI/X+a7vJxST3/Q9H/g=; b=HTCkO8lJ0Lzq/Geyud1YDhdqbg
	h2f96Yczcy15D1FMqOKT7DAtd6fMadEgWfXqbhI2Yi0u8Rg0PlgbzVDDJ34ykbrC3UHPTT+07BW/r
	m9X1k8M+edFdRevgimZHYO5UjMXAtiG5SHceHo0HYnJfejEOxBJrMQ7FZv2TFJXxZFaIhVYsSrUIH
	f63WjSDa/HZU0rnIc8F/YXQ7c0LzUkuFBFnKG1pTG39vy0RcISQgZv2M1fC4NIxF4pIZQnLyfWwax
	W/3U+3pEpsftZqYR8/oZMeNNm3R473wFjDaYqzbo7RVveanK7rnd7IBonXAFwiDM4zrMaDhykdBVM
	g5U1LhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RuC-0000000DY6f-00EE;
	Fri, 18 Sep 2026 06:17:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RuA-0000000DY6E-39uG;
	Fri, 18 Sep 2026 06:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 497FC40743;
	Fri, 18 Sep 2026 06:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3305D1F000FF;
	Fri, 18 Sep 2026 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712222;
	bh=B/13cZeUrOLEzs/U0VXbyufzLI/X+a7vJxST3/Q9H/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hC+VO2FtDKbfS2UHZn7KsHJfhAMbfycfRebcPAyoit5um1I4sEqs1B3s/d7QsmYOx
	 /uPdeYvBgduMlrxD/q5Qx/yZmnVjrncmd9Y9Pju17LeWasqH1HIMdlKoWQt5U+07Hz
	 itUI4J2CpMvUEEBQ/TG3dnLcJuv6Ss41jE5ltAkW2SHN1CaJfJtBo8gwaiEDocZ2u/
	 4YSO3SLQuAartQeYdD1llGHXlMPFhoAhE1udDqkdlpPAbhR3AS4sCi+2T9sNWXk37m
	 4u2pFM2ozWD9atAEq6/Rf2uBnfPTpaGO4ftBf4KHUAopzadDfZD5zCYKSdh+cDicgJ
	 SHLy28DKe56aw==
Date: Fri, 18 Sep 2026 08:16:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maud Spierings <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Message-ID: <20260918-futuristic-mindful-waxbill-21fa2d@quoll>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
 <20260917-mutant-chamois-of-competence-46ca77@quoll>
 <DLI0QTP0NUHS.DAFYGACKWKWO@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLI0QTP0NUHS.DAFYGACKWKWO@ubuntu.com>
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

On Thu, Sep 17, 2026 at 08:34:18PM -0400, Joshua Peisach wrote:
> On Thu Sep 17, 2026 at 2:51 AM EDT, Krzysztof Kozlowski wrote:
> > On Tue, Sep 15, 2026 at 05:32:09PM +0200, Michal Wilczynski wrote:
> > > Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
> > > 
> > > This device is a child of the starfive,jh7110-hdmi-subsystem node. It
> > > functions as both a PHY provider for the controller and as a clock
> > > provider for the variable pixel clock (hdmi_pclk), which it generates
> > > from its refoclk.
> > > 
> > > Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> > 
> > While I appreciate other people looking at this, I don't think review
> > here applies. It was a blanket tag, given to the entire series, with
> > exception that it is from newbie, thus I want to ask: was this binding
> > REALLY reviewed by Joshua?
> > 
> > Are the rest of the patches actually reviewed or just "looks good to
> > me"? I see no comments from Joshua on v3, v2 and v1, which is usual sign
> > of doing review.
> > 
> > 
> I commented on v3 saying that I would test if I could. I don't just

Testing has nothing to do with reviewing.

> throw "Reviewed-by" on everything I look at.
> 
> If anything, I've been trying to be more honest in reviews, and only
> review ones that I actually care about[1].

You gave blanket tag for entire series, so I do not get this argument.

> 
> If reviewing patches isn't a good way for newbies to start getting
> familiar with the kernel code (especially a NEW driver), then I don't
> know what is.

Writing code and receiving review is something for newbies to start
with. If you do not know kernel code or bindings, why do you think
your review is applicable? If I try to review design of a post-tension
concrete bridge, I would probably learn something. Would my
review apply? No.

Best regards,
Krzysztof


