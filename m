Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E044CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohvDP8osKuunTpp4VuXEGFMj1lvZubJde5NjZIldsbA=; b=TwDzMxU2wUZCVXIhEtRFLWMdNZ
	yyVCkVgB/0gDq3S2lb93+0GL5z/XxYeUiIOByTRlQPtD3aH7F96263iMfCWtKINQ0sMSLmHA+lBu1
	4Wu3YZwTLuBsmytWofdSbaO5Vge+4Le/yJKz1TmJzn/QIo0FJenD1qZyjG13MVXPMPVAHRPzr7Rzf
	fohq2C4dnGBMTYSlxs3SX11L9lPR0UOVYy4yy8jvuWE29qEmiV6Y7cJUyoJBq/RenFoc+j2Uke9NP
	ApiEXrW+/3lHMqpg6kDFfQb2Qt3W8MYpPOkiddqbJjoi+ULQhiD6f4Wd/50UACiVOnh4R9+olER70
	gQ+T0zMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7C7-00000003rr0-1gzp;
	Mon, 15 Sep 2025 11:16:27 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7C5-00000003rpF-1LYw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:16:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 24470240028
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 13:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757934981; bh=ohvDP8osKuunTpp4VuXEGFMj1lvZubJde5NjZIldsbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=K7vfPwISWJeGstETrsisogZitylUltFgYycUs+NfpNXRum8X83Iep9fJvcfHDi+Vo
	 xyu1SYj+Ecfwwy6cm5CNS80i8HvaQ4hzFhFI9/1wDb19qnqpaX0qzpQMXbMIXqom8d
	 hH3RruzJvEK7eKMZtgq04OTiv3KyMplTyH/woUtTJyVu2Z+T4F04SSYHgdBToztQSj
	 UyFIPs+lvNF2DCDDcQV52uo/kg8a5rJ8Ti96zTutF2FaQWAbx21ft3clC5QseMlb14
	 ElmBRNGK6brttRs+G1YBNDmT+tVDAdV64YyVCibvZPhvXKqWCYNLsoWy1CL/4AbMkw
	 RN7+n973g6YoA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cQMst0r15z6twB;
	Mon, 15 Sep 2025 13:16:17 +0200 (CEST)
Date: Mon, 15 Sep 2025 11:16:19 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
Message-ID: <aMf1gYbEfWerO7_J@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912-x96q-v1-2-8471daaf39db@posteo.net>
 <aMPftsaf4x61-bGY@probook>
 <CAGb2v66khAeP5pCq6RCrPUwQr=tDqJ6O6cs0gokbMNjpTejuvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66khAeP5pCq6RCrPUwQr=tDqJ6O6cs0gokbMNjpTejuvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_041625_499545_4AF5516B 
X-CRM114-Status: GOOD (  12.37  )
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

On Fri, Sep 12, 2025 at 04:56:36PM +0800, Chen-Yu Tsai wrote:
> On Fri, Sep 12, 2025 at 4:54 PM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Fri, Sep 12, 2025 at 01:52:10AM +0200, J. Neuschäfer via B4 Relay wrote:
> > > From: "J. Neuschäfer" <j.ne@posteo.net>
> > >
> > > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> > > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > > output, and infrared input.
> > >
> > >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> > [...]
> > > +&gpu {
> > > +     mali-supply = <&reg_dcdcc>;
> > > +     status = "okay";
> > > +};
> >
> > Note for v2: The GPU gets stuck in probe deferral, and I forgot to
> > investigate why.
> 
> You are probably missing the GPU power domain driver?

Indeed, with CONFIG_SUN50I_H6_PRCM_PPU=y the GPU probes successfully:

[    1.396826] panfrost 1800000.gpu: clock rate = 432000000
[    1.396859] panfrost 1800000.gpu: bus_clock rate = 200000000
[    1.400125] panfrost 1800000.gpu: clock rate = 432000000
[    1.400158] panfrost 1800000.gpu: bus_clock rate = 200000000
[    1.403263] panfrost 1800000.gpu: clock rate = 432000000
[    1.403297] panfrost 1800000.gpu: bus_clock rate = 200000000
[    1.406582] panfrost 1800000.gpu: clock rate = 432000000
[    1.428046] panfrost 1800000.gpu: bus_clock rate = 200000000
[    1.442411] panfrost 1800000.gpu: clock rate = 432000000
[    1.455175] panfrost 1800000.gpu: bus_clock rate = 200000000
[    1.466484] panfrost 1800000.gpu: mali-g31 id 0x7093 major 0x0 minor 0x0 status 0x0
[    1.476828] panfrost 1800000.gpu: features: 00000000,000027f7, issues: 00000000,00000400
[    1.493284] panfrost 1800000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000209 Mem:0x1 MMU:0x00002821 AS:0xff JS:0x7
[    1.493297] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    1.506114] [drm] Initialized panfrost 1.4.0 for 1800000.gpu on minor 0


Thanks,
J. Neuschäfer

