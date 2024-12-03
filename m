Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7954E74AD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOE+GL2RYQwSxGLRhynIRvYFvV8pa/FyZRyb22lYOio=; b=uoQYHKouE9fnL9cnaCDugJI4o+
	M5OgOYJMupzSqNrHgLiu9cuwQbvgTDx7DAunsrMjIDfvFO3U68Ue9fw3/8DgFQGNx7ic9alohlpxa
	isOsTfhIgmPaQsptAsmkjq2nm3mf2Qy7PlsfwAAR5r8IOEyD+N9UrsEy539RJRlt4Ma14+hXGPjjN
	x0d+FhCZW7rT2RmW4AdGe4SUQoDMCkf8ATvp3dKavojoN927eaq1hBsc2mbL9LbMWQPgwksfM7gHE
	pUQq7VrWDwwv7GmaewHvIlsh6MaC/rF243rY2/nIvHEts8kVClEvnQViyBqY13Q2f8n2WjYlaKyQE
	XZZjoGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIa13-0000000Ak4A-1YMR;
	Tue, 03 Dec 2024 21:01:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIa00-0000000AjwJ-12Gp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=HOE+GL2RYQwSxGLRhynIRvYFvV8pa/FyZRyb22lYOio=; b=dZ
	wZxKuMdDCaqU7yBCFPkoBbgx2n0hhuLvqxbhD2ofciMC2XyeFKHwXZgeE7los0PWA8cJdm8u6qI84
	gpb3zsTqBSSv4m6+BdIZ5QXuaIgm7QQCoCuhcd6qgs/tTEsTefhsELchO4HubH5NREOKt2PDUC/IW
	ZpXngVenO9qsYCU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIZzw-00F8O6-OJ; Tue, 03 Dec 2024 21:59:56 +0100
Date: Tue, 3 Dec 2024 21:59:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when
 compile-testing
Message-ID: <44126f2f-92ce-412b-ad9d-e0e0ea28d36d@lunn.ch>
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
 <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
 <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_130000_288447_9C484054 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Dec 03, 2024 at 09:29:02PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 3, 2024 at 9:13 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> > > Merely enabling compile-testing should not enable additional
> > > functionality.
> >
> > Sorry for being dumb, but i don't actually see what is wrong here.
> >
> > There are 4 GPIO drivers which have
> >
> >         def_bool y
> >
> > COMPILE_TEST is about building as much as possible, in order to find
> > build bugs. So i don't get what you mean by additional
> > functionality. No additional functionality within the MVEBU driver
> > gets enabled by COMPILE_TEST.
> >
> >         Andrew
> 
> No, Geert is right. I have been yelled at by Linus Torvalds already
> for too eagerly enabling too many options. COMPILE_TEST is really
> about making it possible to build more things with make allmodconfig,
> not necessarily defaulting to y for everything.

So are you saying COMPILE_TEST should allow something to be enabled,
but should not actually enable it?

	Andrew

