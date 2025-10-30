Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE64CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoSpIHesXav88BpAbWZAt/l5Rnoii11g5rgxnEXc2kk=; b=4zVGHiV6g1ZN6MD2EkmkopgcoT
	1gcvX04yeDTwm7g4ttWrBepQGnQNLM+xxZ7/CcWNWBj5rzxlPxgwZPqT0o6HwsBuiUEn7VJwB2Tpf
	p1OSdno9HPhwzNYdm2DSwY8r2w/Ib+E9d9pxwaZgHfRP8KaylncdyQfMvRwkq8leoxyK5bflaOO8B
	8lVYNhMmz3Mgf8jqt5aXMo0g05i3NVZX2CHDxvmngOjdO2FHMdmnShtVBaCeGnYFUAzLd9JmCFTnC
	JJtsROdqFYePLJd1UrcYTMYEI9g/WizU2FookebHBpVHRlYI/gXiiH8nn+Gy4w9l/9xbcO/oY2bHw
	79i8r/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERKH-000000044yZ-1mN8;
	Thu, 30 Oct 2025 12:00:21 +0000
Received: from dd54918.kasserver.com ([85.13.167.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERKC-000000044y6-1VhG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202509031142; t=1761825608;
	bh=KoSpIHesXav88BpAbWZAt/l5Rnoii11g5rgxnEXc2kk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TJzJ511Kau45mJR/ckFCA6l46qxr2CBDpYPyYYz1OOpWhPc020ANMEuudO8sjC08G
	 sM9XS3m5lGQ3xQfyCiiGSX5oSe5TQ2vjth86959tI4HZk9+d3HvaVHAx6Hj5nAvK9v
	 dJX/coXRd4466/s0/mW4KrTYGl/jViyWqeGdJnTUuwM5krD+q8aL3fJWURaOv0Gqsm
	 gajocVQfdWpacLTtC62WNP0lKarL4Aag6vDPFaQO9gGu+/YiBBBt4aSF9qzX12cgmZ
	 1L/xK8IMiIbABbkK6L7S/Z9JVT9PjWNR00XTIghNyFX5ruaLOcvtWad1vV6GNF3wJA
	 ZvTEQs1n8pzXw==
Received: from karo-electronics.de (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id E53F9772C542;
	Thu, 30 Oct 2025 13:00:07 +0100 (CET)
Date: Thu, 30 Oct 2025 13:00:06 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Maud Spierings <maudspierings@gocontroll.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
Message-ID: <20251030130006.0221957a@karo-electronics.de>
In-Reply-To: <26fc62bb-3484-4812-b576-6640eef72c49@gmail.com>
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
	<20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
	<a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
	<65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
	<938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
	<20251029081138.2161a92a@karo-electronics.de>
	<4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
	<20251029104838.44c5adcf@karo-electronics.de>
	<d05c62c9-7ed7-46e4-aa4d-27172741b5ee@gmail.com>
	<0667e026-99f3-4233-b3f6-e38273961d49@gocontroll.com>
	<20251030095434.1dc06df2@karo-electronics.de>
	<26fc62bb-3484-4812-b576-6640eef72c49@gmail.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: /
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_050016_866565_EB334CCE 
X-CRM114-Status: GOOD (  31.74  )
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

Hi,

On Thu, 30 Oct 2025 13:01:52 +0200 Matti Vaittinen wrote:
> On 30/10/2025 10:54, Lothar Wa=C3=9Fmann wrote:
> > Hi,
> >=20
> > On Wed, 29 Oct 2025 16:35:25 +0100 Maud Spierings wrote: =20
> >> Hi Matti,
> >>
> >> On 10/29/25 11:05, Matti Vaittinen wrote: =20
> >>> On 29/10/2025 11:48, Lothar Wa=C3=9Fmann wrote: =20
> >>>> Hi,
> >>>>
> >>>> On Wed, 29 Oct 2025 10:42:17 +0200 Matti Vaittinen wrote: =20
> >>>>> On 29/10/2025 09:11, Lothar Wa=C3=9Fmann wrote: =20
> >>>>>> Hi,
> >>>>>>
> >>>>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote: =20
> >>>>>>> On 10/28/25 13:42, Maud Spierings wrote: =20
> >>>>>>>> On 10/28/25 13:15, Matti Vaittinen wrote: =20
> >>>>>> [...] =20
> >>>>>>>>> Could/Should this be described using the:
> >>>>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
> >>>>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
> >>>>>>>>> correctly, that might allow the driver to be able to use correc=
tly
> >>>>>>>>> scaled voltages.
> >>>>>>>>>
> >>>>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
> >>>>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108 =
=20
> >>>>>>>> =20
>=20
> // snip
>=20
> >>>>>
> >>>>> If real voltages aren't matching what is calculated by the driver, =
then
> >>>>> the voltages requested by regulator consumers will cause wrong volt=
ages
> >>>>> to be applied. Debug interfaces will also show wrong voltages, and =
the
> >>>>> safety limits set in the device-tree will not be really respected.
> >>>>>
> >>>>> I think this would be well worth fixing.
> >>>>>    =20
> >>>> Before doing the real-life test I did the same calculation that's do=
ne
> >>>> in the driver to be sure that it will generate the correct values:
> >>>> bc 1.07.1
> >>>> Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017
> >>>> Free Software Foundation, Inc.
> >>>> This is free software with ABSOLUTELY NO WARRANTY.
> >>>> For details type `warranty'.
> >>>> fb_uv=3D0
> >>>> r1=3D2200
> >>>> r2=3D499
> >>>> min=3D800000
> >>>> step=3D10000
> >>>> # default voltage without divider
> >>>> min+30*step
> >>>> 1100000
> >>>> min=3Dmin-(fb_uv-min)*r2/r1
> >>>> step=3Dstep*(r1+r2)/r1
> >>>> min
> >>>> 981454
> >>>> step
> >>>> 12268
> >>>> # default voltage with divider
> >>>> min+30*step
> >>>> 1349494
> >>>>
> >>>> Probably we need to use this value rather than the nominal 135000 as
> >>>> the target voltage in the DTB. =20
> >>>
> >>> Yes. When the driver calculates the voltages which match the actual
> >>> voltages, then you should also use the actual voltages in the device-=
tree.
> >>>     =20
> >> =20
>=20
> // snip
>=20
> >>
> >> Then setting 1349494 as the actual voltage makes it fully work.
> >> Otherwise it complains:
> >> buck6: failed to apply 1350000-1350000uV constraint: -EINVAL
> >>
> >> Final debug output now:
> >> [    0.327807] rohm-bd718x7 0-004b: buck6: old range min 800000, step =
10000
> >> [    0.327813] rohm-bd718x7 0-004b: new range min 981454, step 12268
> >> [    0.327819] rohm-bd718x7 0-004b: regulator 'buck6' has FB pull-up
> >> configured
> >>
> >> I will add this fix to the next version of this patchset and include
> >> your requested change in the dts.
> >> =20
> > Does it also work with min/max settings in the DTS that are taken from
> > the designated value +/- 5% tolerance margin, so that the DTS contains
> > reasonable values determined by the HW requirements, rather than some
> > artificial number that is enforced by the SW behaviour? =20
>=20
> I am unsure what you mean by "artificial number that is enforced by the=20
> SW behaviour"?
>=20
The nominal voltage that is required by the consumer is 1.35 V. That's
the voltage I would expect to set as target for the regulator.
If that voltage cannot be achieved exactly, I would prefer to have the
intended voltage listed explicitly rather than listing a value that
accidentally can be achieved by the regulator but has nothing to do with
the requirements of the consumer.

> I don't know why there should be two different min values? Assuming the=20
> latter should be max - I have no problem seeing a range of allowed=20
>
My copypaste is obviously spoiled... ;)


Lothar Wa=C3=9Fmann

