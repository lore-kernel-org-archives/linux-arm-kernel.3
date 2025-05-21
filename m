Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A72C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9Amn0RucSvTHHaAFINgxAlBo7m4LcDD945k6yjqb4s=; b=hz2tj2PpbwZJzUf3QLcl37VAOr
	1XccvErv92lPT1gBrf1GBcI4Y1eB55rbeJFkSOxhihFkUOx3GsMibCqxi6Y7xlpng7cIClWg//a4Y
	RFLe/T0XAUxCLJ7LT1oDI+CjFLuJr93a/5N0TEniG1/zqB6cmifKI6XMgX9RcFZG7FQMPL819ionl
	4l9/w7UXHZLJNGcmh5Cqz7nmeX3NRmsFE+gfTguXAQ9VZcR4MNoE79fKa1DnVsygc9KjcP+FwrkWy
	CGFg+JxHvxhr7ReL6Wq0/CKuS0YKvagtEUyXW2ytkH90hJGqSIPXHC5ierngSsDXESelHn8sdCbUl
	fNyA/2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfYE-0000000FHBh-1NNV;
	Wed, 21 May 2025 09:15:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfR0-0000000FG6Y-4BKU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:08:24 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA0836AF;
	Wed, 21 May 2025 11:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747818476;
	bh=sB5RyFlPKQXQPAB6Y7MA+1Acpk+Y/cYdpz5UXJLlmvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2G1vF0TZ/WjsiAHckeKBEdQId+aGXFCSDmA1SMi8m6KdCY0MMn9+uVHcCpK3BP3r
	 PVmANSxmH27L3Iag+bUcqp/4w6PTaaKcJa8ZO1eEVkwyL+APNJ/V4+LOuCd6+avxWO
	 P5Z61U2FKjnd/xIe4Uq0xAbREkyw2bESpl6kwLzA=
Date: Wed, 21 May 2025 11:08:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Message-ID: <iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
References: <m3h61u9jy2.fsf@t19.piap.pl>
 <20250509103733.GE28896@pendragon.ideasonboard.com>
 <m3o6vn8np5.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3o6vn8np5.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_020823_272637_8AF6307D 
X-CRM114-Status: GOOD (  39.88  )
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

Hi Krzysztof, Laurent
On Tue, May 20, 2025 at 02:35:18PM +0200, Krzysztof Hałasa wrote:

> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

Nit: the patch subject should be something like

media: imx-mipi-csis: Enable DT filerting

>
> >> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> >> @@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >>       val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> >>       val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> >>       val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> >> -     if (csis->info->version == MIPI_CSIS_V3_3)
> >> -             val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> >> +     val |= MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT */
> >
> > The condition was added because the CSIS in the i.MX8MM doesn't
> > implement the INTERLEAVE_MODE field. We can't remove it unconditionally.

However the i.MX8MP does implement INTERLEAVE_MODE, and it's anyway
marked as V3.6.3, so DT filtering is there disabled as well. I guess
this is intentional, see below...

>
> Is this confirmed (and not just an incidental omission from the docs)?
> Same version (3.6.3), and even earlier version (3.3) has it... It would
> mean MM can't work with those sensors producing extra packets.
>
> I wonder what version is shown in the #0 register on 8MM (8MP shows
> 3060301).
>
> > You mentioned i.MX8MP, that's a platform where I'd like to see proper
> > support for *capturing* embedded data, not just dropping it. Have you
> > looked at how this could be implemented ?
>
> I had a brief look at it, but a) the embedded data is not very
> interesting in case of my IMX290, b) I don't want to interleave it with
> my image data (DMA buffers and what not) and I don't see a way to store
> it independently.
>
> If you want to store it along the image, the currect code does that -
> more or less correctly. This is the problem.
>
> The RM says "13.5.2.6.6 Null and Blanking Data
> For both the null and blanking data types CSIS V3.6.3 ignore the content
> of the packet payload data." which is half-truth, e.g. it needs the
> MIPI_CSIS_CMN_CTRL_INTER_MODE to do that, otherwise it messes it up.

Embedded data != null and blanking
They have DT=0x12 and not 0x10 or 0x11

>
> Several CSIC registers are named XXXXXn, suggesting more than one
> register, but the docs say only #0 exists. Nevertheless, the actual
> hardware seems to contain 3 packs of registers (the 4th one is weirder)

some registers like 32E4_000C are not listed in the peripheral memory
map, so you're probably reading an invalid memory area there

>
> 32E40000:  3060301     4705    F0000 DEADCAFE

I presume these are:

32E4_0000 = version ? (not documented in my version of TRM)
32E4_0004 = (MIPI_CSI1_CSIS_COMMON_CTRL)
32E4_0008 = ((MIPI_CSI1_CSIS_CLOCK_CTRL))
32E4_000C = invalid address


> 32E40010: FFFFFFFF        0        0        0


> 32E40020:       F0  900001F DEADCAFE DEADCAFE
> 32E40030:      1F4        0        0        0
> 32E40040:       B0  4380780        0 DEADCAFE <<< ISP_CONFIG0

If you're capturing RAW12 in 1920x1080 these two registers are

32E40040: (MIPI_CSI1_ISP_CONFIG_CH0) = 0xb0
32E40044: (MIPI_CSI1_ISP_RESOLUTION_CH0) = 0x4380780
32E40048: (MIPI_CSI1_ISP_SYNC_CH0) = 0
32E4004c: invalid


> 32E40050:      8FD 80008000        0 DEADCAFE <<< ISP_CONFIG1
> 32E40060:      8FE 80008000        0 DEADCAFE <<< ISP_CONFIG2
> 32E40070:      8FF 80008000        0 DEADCAFE ???

All of these are invalid registers

etc etc

> 32E40080:       B0  4380780        0 DEADCAFE <<< SHADOW_CONFIG0
> 32E40090:      8FD 80008000        0 DEADCAFE <<< SHADOW_CONFIG1
> 32E400A0:      8FE 80008000        0 DEADCAFE <<< SHADOW_CONFIG2
> 32E400B0:        0        0        0 DEADCAFE
> 32E400C0:        0 7FFFFFFF        0       E4
> 32E400D0:        0        0        0 DEADCAFE
> 32E400E0: DEADCAFE DEADCAFE DEADCAFE DEADCAFE
> 32E400F0: DEADCAFE DEADCAFE DEADCAFE DEADCAFE
> 32E40100:     22E1     22E1     22E1        0 <<< FRAME_COUNTER*
> 32E40110:        0        0        0        0 <<< LINE_INTERRUPT_RATIO*

> 32E40120:        0 DEADCAFE DEADCAFE DEADCAFE
>
> This is the first CSI. The 3 frame counters are visibly active as well.
>
> The manual states (MIPI_CSIx_ISP_CONFIGn) "NOTE: Not described types are
> ignored" and even if not, I can't see what could we do with this extra
> data.

The ISP filtering register only supports image formats, not embedded
data.

>
> Perhaps the CSIC internally has 3 output ports, but only the first one

The CSIS seems to have multiple channels indeed, but at the moment
only #0 seems to be supported.

We have been using 8mp extensively with sensors that produce embedded
data and afaict ED are not in the final image.

My understanding is that the gasket that connects the CSIS to the ISI
and the ISP has a filtering register has well, and there is where ED
gets discarded. Could you maybe check the value of register GASKET_0_CTRL
to confirm this ?

In particular the "Gasket 0 data type" is programmed in
drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c with the data
type of the first stream reported by the sensor with get_frame_desc().
In your case, assuming RAW12 you should have 101100b in that register.

Now, I think the idea was to use the gasket for filtering ED (and
other non-image data) to be able to route them to the ISI for capture,
while images are sent to the ISP for processing. This is currently not
implemented and there are some unclear parts in the documentation
about this, but overall my expectation is that ED are filtered by the
gasket so you shouldn't need to enable DT filtering on the CSIS.

Let's find out why this doesn't happen...

> is connected to ISI and ISP?
> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
>

