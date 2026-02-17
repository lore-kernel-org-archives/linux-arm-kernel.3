Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0133EE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+Pmq0Kx0ANwrko4EDIqnIGkUBuJb5ZZnPGKG3XYy7A=; b=QpYZfuth6xTRMibRa0LPulUf7b
	Hz/6HXPEAkbHE/ZAisS6O+zWjs5Ac62PR+DsJePjUCZDaeLshudO6sX7t4XEAagheQEbJTmPX5aB0
	vTu0WG+iq/uuAHqwDYXtdNaRJhv9B0ejNFm2GJ4Wx1aOPCe0NinfQSG3QH36STdF8gPuemgmlx+nK
	5MtVOJrKMukM4bE2X55qsc3WMuB1eVjR4pFnY8Th0LaFTuxWVoYFORdY2UNSvxKjKvcIOCuJL8qxt
	llGX1Xykaj+RbcA1IbFNKfUWbb8kysp+oVu61vsJEeUgutdPlIYfuGzhz4ChmXDW9teCiBidrR2QU
	IESDPH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsT70-00000008xKV-3j9H;
	Tue, 17 Feb 2026 22:00:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsT6x-00000008xK4-2Wik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 22:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47B3F440AB;
	Tue, 17 Feb 2026 22:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A1C4CEF7;
	Tue, 17 Feb 2026 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771365602;
	bh=1KFybEk9QuwRToTqNIi6MYrhV9F6EZyrTfHdFSJR2ls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W9QfSzp3ldumQT1aE8LOijpEvQAALFIwANolJ7sdxMavTJcN0uMXFxnmM9MAd05Xw
	 cXa29f74Lk/r8uGv1DK1LoIrAU+1Eb8KfxLJNdbNCgrNRKVVM0qzsazXwAgWObf+jZ
	 63JLwtHnXGsfrsrnDWiYLMVaWNibFqNX/5Zr0vuXVshzJ2w0e/CqwDKvNfGEFpWAje
	 t3+QMd7Om4CKratdUrgiNGq6edfthSqzYQILdms7MdEPnSY5OmG3/+vWalIfBOF65v
	 LL78kMrrNSDeWIvW1BKf3q5ONhw/Q/knExm5tBA+/3qpteCOrTe72w8BOa4lstY+nJ
	 L193hg62sI0bQ==
Date: Tue, 17 Feb 2026 13:59:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
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
Message-ID: <20260217135958.216c30b6@kernel.org>
In-Reply-To: <20260216102359.37586219@wsk>
References: <20260204232135.1024665-1-lukasz.majewski@mailbox.org>
	<20260204232135.1024665-3-lukasz.majewski@mailbox.org>
	<20260205182805.196fd832@kernel.org>
	<20260206112454.2e9a686f@wsk>
	<20260216102359.37586219@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_140003_683120_70448A83 
X-CRM114-Status: GOOD (  13.85  )
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

On Mon, 16 Feb 2026 10:23:59 +0100 =C5=81ukasz Majewski wrote:
> > > Transient build failure here:
> > >=20
> > > drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1072:32: warning:
> > > variable =E2=80=98priv=E2=80=99 set but not used [-Wunused-but-set-va=
riable] 1072 |
> > >       struct mtip_ndev_priv *priv; |
> > > ^~~~
> > >=20
> > > I sent out the AI code reviews while at it, without looking at them.
> > > So please approach them with caution..   =20
> >=20
> > IMHO, issues pointed with AI review have been at discussed and
> > (to my best knowledge) addressed.
> >=20
> > Shall I prepare next version of this patch set?
>=20
> I'm a bit confused regarding the next steps for this driver.

1. This version didn't build, so it's out.
2. Take the AI review under consideration.
3. Address issues from 1+2.
4. Post v24

Well before posting:=20

4a) wait for net-next to open up, it's close right now

> There was no reply regarding my last question - and I don't know how I
> shall proceed...

Hope above clarifies.

I strongly advise you to follow the ML so you have a better
understanding of the process.

