Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1494C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrKOZNSqaZlbN58D6xqbea+e1XVfSTF4kSC0uBKMAdQ=; b=kFxZUwzqdQfxrAr4Z1KnGJoxlg
	tEbaW9icWgpPyvBUzSkRrIbiit0N8ft1VQ9vy9VZqKWPVlwk9QUarXiR0RD9mF2Lt16aFiykqji4h
	2uIjHGTxw0Kv88Az4s1rXuhubQO4OLnFXFJuW9wMB9lYd3JBXWc9qbuPM1bnsA45YVpJwf710GRYo
	WzCM0fNywy02PdXut+o50HJZYJZSX29l3ciBkwjt3kHz4JuE1HkeFz+bVEaKoknNcFf+mPPtTgK1w
	MKoUror6UeQYQyHjeGbZ0aCR0PmObQ2rKVco3UGpcyT3kgt89pk6bX81dUm3iKllw4BImQsRh1U/7
	xYb/iMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxKK-00000000KhB-0B0p;
	Fri, 30 May 2025 10:51:04 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxIA-00000000KXy-0E85
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 10:48:52 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id D12B4C405A45;
	Fri, 30 May 2025 12:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl D12B4C405A45
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva <rmfrfs@gmail.com>,
  Martin Kepplinger <martink@posteo.de>,  Purism Kernel Team
 <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <2fd6wgsiwfx4raharcrpmmtayhkipjnz64u2cbprhsxkna3lhv@yshftexhmgns>
	(Jacopo Mondi's message of "Fri, 30 May 2025 09:56:32 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl>
	<jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
	<m3o6vb64hv.fsf@t19.piap.pl>
	<2fd6wgsiwfx4raharcrpmmtayhkipjnz64u2cbprhsxkna3lhv@yshftexhmgns>
Date: Fri, 30 May 2025 12:48:38 +0200
Message-ID: <m3frgm5q7t.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_034850_256877_15C5F44B 
X-CRM114-Status: GOOD (  21.02  )
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

Jacopo,

> Let me recap all of this.
>
> With:
>
> - MIPI_CSIx_CSIS_COMMON_CTRL[11:10]
>  "Select Interleave mode" =3D 0x00 =3D CH0 only, no data interleave
>
> - MIPI_CSIx_ISP_CONFIGn[7:2]
>   "Image Data Format" =3D 0x2c =3D RAW12
>
> Embedded data and OB pixels are filtered (which means we're filtering
> on DT even if MIPI_CSIx_CSIS_COMMON_CTRL[11:10] =3D 0x0x would suggest
> filtering is not enabled)
>
> However corrupted pixels are still sent through.

Right.

But there is more: there are 3 separate "DT filters":

0x32E40040       0xB0 ISP Configuration Register (ISP_CONFIG_CH0)
   DT 2Ch (RAW12)
0x32E40044  0x2D00500 ISP Resolution Register (ISP_RESOLUTION_CH0) =3D> 128=
0 * 720

0x32E40050       0xDC ISP Configuration Register (ISP_CONFIG_CH1)
   DT 37h (User Defined 8-bit Data Type 8)
0x32E40054  0x2D00500 ISP Resolution Register (ISP_RESOLUTION_CH1) =3D> 128=
0 * 720

0x32E40060       0x48 ISP Configuration Register (ISP_CONFIG_CH2)
   DT 12h (Embedded 8-bit non Image Data)
0x32E40064  0x2D00500 ISP Resolution Register (ISP_RESOLUTION_CH2) =3D> 128=
0 * 720

The 4th set looks the same, but doesn't appear to have its SHADOW
register set, so I'll ignore it for now. I'm ignoring the SYNC registers
as well (offsets ...0x58) - they are zeroed.

It appears the 2 LS bits of ISP_CONFIG_CH* are the number of some output
port. #0 goes to ISP, not sure about the others. Will have a look.

I.e., I can disable CH0 and use CH1 or CH2 to feed image data do ISP -
it works.

MIPI_CSIx_CSIS_COMMON_CTRL:
Bits 18, 17 and 16 respectively reload SHADOW registers for CH2, CH1 and
CH0. For these tests, I have to use
"devmem write 32-bit CSIS_COMMON_CTRL 0x7xxxx" instead of 0x1xxxx so that
all 3 shadow sets are updated (and not only #0, the one in the docs and
used by the drivers).

0x32E40080       0xB0 Shadow Configuration Register (SHADOW_CONFIG_CH0)
   DT 2Ch (RAW12)
0x32E40084  0x2D00500 Shadow Resolution Register (SHADOW_RESOLUTION_CH0) =
=3D> 1280 * 720
0x32E40090       0xDC Shadow Configuration Register (SHADOW_CONFIG_CH1)
   DT 37h (User Defined 8-bit Data Type 8)
0x32E40094  0x2D00500 Shadow Resolution Register (SHADOW_RESOLUTION_CH1) =
=3D> 1280 * 720
0x32E400A0       0x48 Shadow Configuration Register (SHADOW_CONFIG_CH2)
   DT 12h (Embedded 8-bit non Image Data)
0x32E400A4  0x2D00500 Shadow Resolution Register (SHADOW_RESOLUTION_CH2) =
=3D> 1280 * 720

Also:
0x32E40100     0x5F10 Frame Counter (FRAME_COUNTER_CH0)
0x32E40104     0x57C4 Frame Counter (FRAME_COUNTER_CH1)
0x32E40108     0x33CF Frame Counter (FRAME_COUNTER_CH2)

Data selected by all 3 sets is somehow fed to the ISP. Now the data
isn't simply appended to the previous fragment. It seems the DT 37h
lines (which appear before the actual image data on the MIPI bus)
somehow overwrite (only) the first line of the image. I'm looking at
it.

INTERLEAVE_MODE =3D 0 or 2 =3D> only CH0 is used, the first 32 bit in the i=
mage
		on CSI1 are corrupted.
INTERLEAVE_MODE =3D 1 =3D> all 3 CHannels are used, no corruption

There appear to be some subtle differences between 0 and 2, and 1 vs 3.

> If you
>
> - MIPI_CSIx_CSIS_COMMON_CTRL[11:10]
>  "Select Interleave mode" =3D 0x01 =3D DT (Data type) only
>
> Embedded data and OB pixels are still filtered, and your corrupt
> pixels are filtered as well.

Right.

> Now, why are "corrupted pixels" filtered away by enabling this option ?
>
> As far as I understand bad pixels are corrupt in their data values,
> the CSI-2 packet header which contains the DT is correct. Is my
> understanding correct ?

I think so. Maybe the corruption happens after the packets are received,
on the 32-bit internal bus maybe.

> It would be nice to actually understand what it does before enabling
> it unconditionally.

Still trying :-) Next Monday, maybe.

Especially I don't know how do I receive multiple DT types, including
12-bit RAW pixels and 8-bit user data. I know it wasn't probably
designed for this, but nevertheless.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

