Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F11EE2082
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOfHMKbNXy3MxrUvKuYFlc2euBi7oH7iiv3EqWTkTe0=; b=Hf/7MQiUYJUDKyRLB5c2CYjJ2b
	9Qx8BHhG3NSChwk1hFZC7tHgBxa6OWJ/cc7rdj3UDOkU04t/2GPZNpOZwLajbBSgmptURVrl+AGr2
	P3gX9YLAaDVsCbpvB2aWUFM1Y02LcrU2ayoN3vLvZ4J0AQj7j710ZFjCAFi3iPLP1IP77hQ5AMERz
	xkMMaUAjQCsymR+iOdkRtRRxYzaiVdmvE2WPizBDnTuRPCSdAedXmLhVMiN04g6yFPRQa0NWdM7EG
	vrt6oUEWMuBGZpVOBVyGNAEVkxD5D+lNODYfRsUgBNp4UmMx4Xc4toAAr2OIcVy++i5gPo6hv89MX
	uKjcGhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJ1j-0000000BB4C-3Iae;
	Fri, 06 Feb 2026 10:25:27 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJ1g-0000000BB1e-3wcW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 10:25:26 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f6qwK2Bl2z9tp0;
	Fri,  6 Feb 2026 11:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770373505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOfHMKbNXy3MxrUvKuYFlc2euBi7oH7iiv3EqWTkTe0=;
	b=Q+guTtENwgC5TbwQgdx1Frin7BHRBTLNH+jgV8zl/vj7XoqV/IVMLIGrfcA1N7f0zodGNf
	f1SOpF8U8TqIwqcLPhN7MwDaaV3nLmuYFalA5LwH9nG5QgWkaGr8ibG1uiM49PAJCo1FRc
	1UebMpyjMe0IkZjc9VhNpLJTyl4VKbpL82p+GkYxXoqUvLBd9Y7sBAxfusunf+U4aJM7ih
	6imcTswZXvX/En7KJXYxP7bH01uL3d516agiwxtsNvHrNtmZJZmcsdQ7Y34BAwHL8svGUB
	CHxNTfBJVKnmMQr0txQQe9v5OJCpX5gX88MCrPhurOeHz9X3aNhrRmcLVSYsXA==
Date: Fri, 6 Feb 2026 11:24:54 +0100
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
Message-ID: <20260206112454.2e9a686f@wsk>
In-Reply-To: <20260205182805.196fd832@kernel.org>
References: <20260204232135.1024665-1-lukasz.majewski@mailbox.org>
	<20260204232135.1024665-3-lukasz.majewski@mailbox.org>
	<20260205182805.196fd832@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: db1cc35f512114a3232
X-MBO-RS-META: w9x5nk7bybc1tfbnhh3ap1diw3eq7r7n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_022525_120316_19C09148 
X-CRM114-Status: GOOD (  19.46  )
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

> On Thu,  5 Feb 2026 00:21:30 +0100 Lukasz Majewski wrote:
> > This patch series provides support for More Than IP L2 switch
> > embedded in the imx287 SoC.
> >=20
> > This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> > which can be used for offloading the network traffic.
> >=20
> > It can be used interchangeably with current FEC driver - to be more
> > specific: one can use either of it, depending on the requirements.
> >=20
> > The biggest difference is the usage of DMA - when FEC is used,
> > separate DMAs are available for each ENET-MAC block.
> > However, with switch enabled - only the DMA0 is used to
> > send/receive data to/form switch (and then switch sends them to
> > respecitive ports).
> >=20
> > Signed-off-by: Lukasz Majewski <lukasz.majewski@mailbox.org>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch> =20
>=20
> Transient build failure here:
>=20
> drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1072:32: warning:
> variable =E2=80=98priv=E2=80=99 set but not used [-Wunused-but-set-variab=
le] 1072 |
>       struct mtip_ndev_priv *priv; |
> ^~~~
>=20
> I sent out the AI code reviews while at it, without looking at them.
> So please approach them with caution..

IMHO, issues pointed with AI review have been at discussed and
(to my best knowledge) addressed.

Shall I prepare next version of this patch set?

--=20
Best regards,

=C5=81ukasz Majewski

