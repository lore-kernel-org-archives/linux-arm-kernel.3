Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C162BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGFD+TEQmheZhWqHvHH/h1FUuzjuW8fcVIkD9mNsloo=; b=3HE4FGUE3Oc2htt7woOeWP7dmO
	74KpVzUHw2rKjflapSIIcE3hL/5AGNVPE6/Uvt6tp4UgXV+OHHF5mR9BRBuBCUId+LWyZl3YZTTKT
	QBJpm/ac0CjgQqBMCd0rqiZZVyHqpBirpLYjySj5LQGDD2HTdI9yu2MOkP/mJn+fPJP7MlLBtReZd
	wMYsePvDaPnz0SQZ/cVwe1c3ESqAjPLuknufXCf5/nP5dVV53IjSVfVM1/6PWTv8/BOebwPVvSXvC
	csVips08NTPAiu60JQD93PNMR/G14elQFPXoel4Clxg19102gt731pBRhtkv3ZeH6CJAU0U5Fy3o5
	c0L3W6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpMp-000000044zM-1MuH;
	Mon, 23 Jun 2025 22:10:19 +0000
Received: from www637.your-server.de ([168.119.26.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTl4m-00000003ZiG-23BR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mGFD+TEQmheZhWqHvHH/h1FUuzjuW8fcVIkD9mNsloo=; b=G1Uv5dqB5EuWkcfS4CSlHkTc4G
	3IwxfpnGtWhHQxIrHjkqdFul2xigJfuo+PMSnRonHmQMif3Il9vFKBt4F/hUDuEjhYhgIg4d/w3s2
	fbqq0TlaafplRZ02zoi6d8bIrst/zs6h1AQ6xpGtUBrKXR0Z6uDraQVohKkAkKaScAhod7xiVOCdq
	QMV8z5VzxTmiLUCh8YJX8hBr+EUeupmu/oLYCrjKAK5qviCIhoyrrv3sqsSB/6Hg73teOqqFqcibo
	L2JRnF3fBcjq9Al2+WOMvwgDP116B7EsvYbl+yzxKL0WAQcmUxQO4QxzUHbbhtL+uvuOI0RcUghxt
	3jhPTARA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uTl4c-0005Et-0z;
	Mon, 23 Jun 2025 19:35:14 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uTl4b-0001FO-22;
	Mon, 23 Jun 2025 19:35:13 +0200
Message-ID: <c243b93675f8136e30abb7608b58badf4b1ada35.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Ricardo Ribalda
	 <ribalda@chromium.org>, Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 23 Jun 2025 19:35:12 +0200
In-Reply-To: <aFk-yTSOqzmEW1sz@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
	 <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
	 <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>
	 <aFk-yTSOqzmEW1sz@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27678/Mon Jun 23 10:34:34 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103524_823798_BF918366 
X-CRM114-Status: GOOD (  18.24  )
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

Hi Sakari,

Am Montag, dem 23.06.2025 um 11:47 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Mon, Jun 23, 2025 at 01:34:03PM +0200, Andr=C3=A9 Apitzsch wrote:
> > Hi Sakari,
> >=20
> > Am Montag, dem 23.06.2025 um 06:50 +0000 schrieb Sakari Ailus:
> > > Hi Andr=C3=A9,
> > >=20
> > > On Sat, Jun 21, 2025 at 11:37:24AM +0200, Andr=C3=A9 Apitzsch via B4
> > > Relay
> > > wrote:
> > > > The imx214 driver currently supports only a 24 MHz external
> > > > clock.
> > > > But
> > > > there are devices, like Qualcomm-MSM8916-based phones, which
> > > > cannot
> > > > provide this frequency. To make the sensor usable by those
> > > > devices,
> > > > add
> > > > support for additional clock frequencies.
> > > >=20
> > > > This series supersedes
> > > > https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-4=
67a4c083c35@apitzsch.eu/
> > >=20
> > > Is there a difference in this set from the v4 you posted
> > > previously?
> >=20
> > There is no difference to the v4 posted previously. This is a
> > resend because there was no activity in the original v4.
>=20
> It's not useful to resend patches, especially those that already have
> been merged somewhere. Please ping people instead.

I wasn't aware that patches already had been merged. Maybe I missed it,
when checking=C2=A0https://git.linuxtv.org/sailus/media_tree.git
Next time I'll ping.

Best regards,
Andr=C3=A9

