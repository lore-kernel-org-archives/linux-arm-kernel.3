Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA157E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoEb1XR+DvoKvuE1+8lQvknx+Q7A1egR2GoxJ6whEys=; b=eqQaMl2bDfdMypwFkfvNnhscyo
	VKuUYI9kuLIKGZEAkG4CKwfCK9GCTU0MKv8BDHMYJ/vCK56vPLOMhyFPuDgKlk9E3cWT8hovsKRnu
	pACUM15Tt0AozdWu4abbmCkRCGpncRKLXOiSEDMmVsPPppJAmhj8B2OpoWt9f51n7QVKhynhZ2ziN
	gHbfB4a9IQt3uL8isrv+xmlmudQ/AEetMcyE1bvqSiwdRU6QWCKb2Wag3WlnCGA5H7ND0jkQUtjra
	Pc10RcAZZbEVsyr+yTUOMHaRo1Dfxhd1ObVkYj5MYCXWfk8yRrvQX+BId7/Y4CjYVvRGkly/S0o32
	Ka/ayAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwqy-00000006SM8-2ouL;
	Mon, 16 Feb 2026 11:33:24 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwqw-00000006SL3-0XRX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:33:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E0410DFC3;
	Mon, 16 Feb 2026 12:33:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1771241599;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qoEb1XR+DvoKvuE1+8lQvknx+Q7A1egR2GoxJ6whEys=;
	b=hlt37SUDAjJI7q8KMVJO+g+KffWs5ok/uj1DyhEEpWVQiazm5kV0sjzPaHL/0L1eVUx1NZ
	M0XrcR10oOLIuVo7IDaZ6zfhzeSmUt+go0Wv9+KhksA7Dj1bHKri37q1ApbGrEaT1pxCbr
	do2rMtqJRY6yNzHjITgpVoDPZvvqcKOTIKt0+VfWgpyDVI+usLCBGhBZsJhggYLLIcx2HK
	rX1r4G+z/lF2UcrLsjOTy7IHUZCW4Q+V2DMV3d0S/LJsKVZ5C4cSiRhfA7wkyR8i0Bdn3S
	uPlAme14G7Ro/jMb45unQbCXuQSe6CbMqoJcmHex1tkVmmCZQQApZtz7Ox6Umw==
Date: Mon, 16 Feb 2026 12:33:12 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <20260216123312.4a310b39@wsk>
In-Reply-To: <jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
References: <20260129095442.1646748-1-lukma@nabladev.com>
	<aYAEM8pcuumly+hc@shlinux89>
	<20260216101538.0aeae484@wsk>
	<jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_033322_386086_7B6D9872 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Abel,

> On 26-02-16 10:15:38, =C5=81ukasz Majewski wrote:
> > Dear all,
> >  =20
> > > On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote: =20
> > > >This patch series:
> > > >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> > > >  to driver code
> > > >- introduces support for several clocks required by MTIP switch
> > > >IP block
> > > >
> > > >Lukasz Majewski (4):
> > > >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> > > >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> > > >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> > > >  clk: vf610: Add support for the Ethernet switch clocks   =20
> > >=20
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com> =20
> >=20
> > Gentle ping regarding this patch set... =20
>=20
> Will apply after rc1.

Thanks :-)

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

