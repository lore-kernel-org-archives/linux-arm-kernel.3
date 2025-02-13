Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D43C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckSrf4EBJgXJcd3YFg0677RSKuWZoZHGyIsIhJjN8tY=; b=Cbo2sz5wKwu0Q47xODPq/p1qcN
	92xBCkXQIc8HznTnbUeuZq14godiiPCoXn8FIE/ox279qIxravpW3KKI3rbHWtwoKefQ2geclM458
	0CpRUWYlRNnnQmY+5RfObpqcECYUdajShVYfxIb9lKWKepvABJJSwt6rCKzsV1iX1ElcifVakFcZd
	bFzWDpctQmwU972vcqOk0rHJW3NN3XJaLxQDU0N3/btUtZ/js1Zc4Q/Sfx4FvFDClHpdWt7J1EEEW
	nttq2qwiOFZFpdiarGbuPrnzN2jED4tLfwWznPLQ13kwwQ+ZYbtUvyzcsZXd+HcU3OD1t+fRa083d
	SO47ANZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiT29-00000009zWD-1xO3;
	Thu, 13 Feb 2025 06:49:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiT0i-00000009zGv-3QK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:47:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tiT0P-0007gj-8H; Thu, 13 Feb 2025 07:47:25 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tiT0O-000hzs-1x;
	Thu, 13 Feb 2025 07:47:24 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tiT0O-00CmQq-1c;
	Thu, 13 Feb 2025 07:47:24 +0100
Date: Thu, 13 Feb 2025 07:47:24 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Message-ID: <20250213064724.kbmxsk5szpxwclj6@pengutronix.de>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
 <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
 <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
 <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
 <e45411df-1b8b-4f21-878d-d52e1112e62d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e45411df-1b8b-4f21-878d-d52e1112e62d@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_224744_854873_ACF6D503 
X-CRM114-Status: GOOD (  26.91  )
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

Hi Laurentiu, Daniel,

On 25-02-12, Laurentiu Mihalcea wrote:
> 
> On 2/12/2025 2:38 PM, Mark Brown wrote:
> > On Wed, Feb 12, 2025 at 12:11:49PM +0200, Daniel Baluta wrote:
> >> On Wed, Feb 12, 2025 at 11:38 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >>> On 25-02-11, Laurentiu Mihalcea wrote:
> >>>> +    const: fsl,imx95-cm7-sof
> >>> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
> >>> add the -sof suffix instead of -audio or so? SOF is a software project
> >>> but you can clearly run different software on the audio-copro as well.
> >> Sure you can run a different software project on the audio DSP but
> >> you will need a way to distinguish between the different projects.
> >> There might be different mailbox, memory configurations. So you will  need
> >> to invent another suffix specific to the new project.
> >> We can make  const: fsl,imx95-cm7-audio as the one used with SOF
> >> and think about a different name later for when another project will
> >> want to use the DSP.
> > I think the point here was that the DT should stay the same even if the
> > DSP firwmare changes, just as how changing the main OS shouldn't affect
> > the DT.
> 
> It's rather unfortunate but based on the experience from the 8 series
> (imx8qm, imx8qxp, imx8mp), the programming model can differ quite
> a bit (e.g: remoteproc vs SOF) even if the core is the same (i.e: DSP core).
> 
> The different programming models also required different DT configurations
> (e.g: dif. mboxes as Daniel mentioned, some extra properties (i.e: reg-names), etc...)
> 
> The "-sof" suffix was chosen here instead of the more generic "-audio" (or whatever else
> alternative) because the DT configuration is specific to SOF's programming model. Other
> audio applications running on the same core may have dif. configurations (e.g: use
> DTCM/ITCM for memory instead of DDR, dif. mbox count, etc...). I suppose this kind of thing
> is bound to happen to some degree since the DT node doesn't just describe the CM7 core
> (but, rather, it also encompasses information on the memory, mboxes, etc. used)
> but perhaps I'm wrong?

Time will tell if there will be any other user except for SOF for the
DSP but and this is what I wanted to point out: the DTS should abstract
the HW. IMHO The CM7-Audio node should contain all properties required
to turn power and reset the core (e.g. clocks, reset, pm-domains). I get
your point regarding different configs but please have a look at
mt8183-kukui.dtsi. Here the rpmsg config is a subnode of the actual
system-control-proc. This makes much more sense to me since the HW part
is part of the generic core-node and all the software config goes into a
separate subnode.

Regards,
  Marco

