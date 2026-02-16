Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7D6E63F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2vy6a1Meu+skf7rOG8rJ02x19jQsoOB+N+i06OG6jo=; b=t3CZfk0IObqB+CIYwWuRbKcDKn
	Scm4JL0fh8jTZZtw67NcDvFJBEOnqEeNh8oTH+Ehl8209r3DbRpEWbo+nUFZfUL02xg7qX/LGbXGa
	fZsNxaVse8tyVthi5wxOonRNHr5T+KHucngLBTp8deeEDIuCrt2MV275hkIQuR4SPD79LrvA5cJxJ
	yHxUeAOUzJWGpKZaGnZpHRAv3IuFohK5vM6+Dnbfs+E5ZrrFiSh+U30n5E2l81//7g06cmGt4vH6G
	8eSG45DApqvdXIV+rjiABPzkh257T10Xmd1HzCeWvx3TEVSJNdhV0rWfb/c/u0/CcQXneN4jjpBr0
	bDNGCWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruqB-00000006GgI-2zV8;
	Mon, 16 Feb 2026 09:24:27 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruq9-00000006Gfw-0dI2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 09:24:26 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fDy5R1Rxqz9tVQ;
	Mon, 16 Feb 2026 10:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1771233851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2vy6a1Meu+skf7rOG8rJ02x19jQsoOB+N+i06OG6jo=;
	b=VATDK8RJSlC2sJH92HI3+Xk72/x56bq1logEqJaAjaGfbVTFDoqdqEEVJyGNMxIZoODhNy
	c3eE1WaySM1Kdvks+bvwiLBIt9hjoBmJTXLZEESlvEhzNvu/OB5vTVGbsCzqr779/j+UPn
	YRaVzcu1RhRq2oZ4qOkJFJPKi3kFtpZnPfTUMNC8wdmqg9yY2ajeEu1+OuwQBIcHD5qNRI
	uIIqfutbvd6YMH892tkQqrw4Ynka/UNeLGJjanx7RLglG+XMkzwDPe2Zzs7zZjXtZAggj5
	lCNYEA3j+Alg39iq6OAVvW8AgSULz3cGOrXSmU7r+tkPHjPnqSBLhBmYahv35w==
Date: Mon, 16 Feb 2026 10:23:59 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v23 2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20260216102359.37586219@wsk>
In-Reply-To: <20260206112454.2e9a686f@wsk>
References: <20260204232135.1024665-1-lukasz.majewski@mailbox.org>
	<20260204232135.1024665-3-lukasz.majewski@mailbox.org>
	<20260205182805.196fd832@kernel.org>
	<20260206112454.2e9a686f@wsk>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: 251ff2ea1f4baad21a7
X-MBO-RS-META: z4bao4g3s7pd9hey7cm8gwcj5wtksdmj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_012425_350784_3D743CB1 
X-CRM114-Status: GOOD (  23.18  )
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

Hi Jakub,

> Hi Jakub,
>=20
> > On Thu,  5 Feb 2026 00:21:30 +0100 Lukasz Majewski wrote: =20
> > > This patch series provides support for More Than IP L2 switch
> > > embedded in the imx287 SoC.
> > >=20
> > > This is a two port switch (placed between uDMA[01] and
> > > MAC-NET[01]), which can be used for offloading the network
> > > traffic.
> > >=20
> > > It can be used interchangeably with current FEC driver - to be
> > > more specific: one can use either of it, depending on the
> > > requirements.
> > >=20
> > > The biggest difference is the usage of DMA - when FEC is used,
> > > separate DMAs are available for each ENET-MAC block.
> > > However, with switch enabled - only the DMA0 is used to
> > > send/receive data to/form switch (and then switch sends them to
> > > respecitive ports).
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukasz.majewski@mailbox.org>
> > > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>   =20
> >=20
> > Transient build failure here:
> >=20
> > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1072:32: warning:
> > variable =E2=80=98priv=E2=80=99 set but not used [-Wunused-but-set-vari=
able] 1072 |
> >       struct mtip_ndev_priv *priv; |
> > ^~~~
> >=20
> > I sent out the AI code reviews while at it, without looking at them.
> > So please approach them with caution.. =20
>=20
> IMHO, issues pointed with AI review have been at discussed and
> (to my best knowledge) addressed.
>=20
> Shall I prepare next version of this patch set?
>=20

I'm a bit confused regarding the next steps for this driver.

There was no reply regarding my last question - and I don't know how I
shall proceed...

--=20
Best regards,

=C5=81ukasz Majewski

