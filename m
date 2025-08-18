Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A86CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc6P835DxKr69oSCM6M41RgZOB2wSNxZZcT4gcuaAas=; b=VkmhUCz7OKnDeUg3/Mw/tjaEkU
	oqMyCwAnMexAq9kQY/NnYdmrHmV7/BgEnJxmYceLuN8kLOMbDP7n8+LVYC5VO6NAdeR25TYotP/Lf
	oy/vOyAHP46M1131zUt88861q7GUudVl6IAKbiZla4l66Kyi670cVWCCr0ec5SJMy1azCDR83/Qs+
	dt/Ap2kyNEOB6imXqi3W0tz+b0CuGLaLuwrTfiBhIQAV4B4eXmYaToU+D5EJ9MmWcS6nNMpNb2+ql
	9Z+dRExH83BRg+DMzRL+90PLHLHiuWfvLjVAqrGipFgNqro99Ham7C/p/mlX3jZp2GwTV0EDkkPIw
	XN98sBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7OC-00000008iS9-3nIN;
	Mon, 18 Aug 2025 21:27:36 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo69M-00000008aZJ-3SX1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:08:14 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c5P0K5XHfz9spd;
	Mon, 18 Aug 2025 22:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755547681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tc6P835DxKr69oSCM6M41RgZOB2wSNxZZcT4gcuaAas=;
	b=x+S4B8p0LG32NBGQ+FGXtCHXcljeFFH6tgPOXMCvIkcdvR0aBjE8TAm3UAsZ6kcMyNECCz
	9p2oaimFPxc+agYEVznV7t+x3HhcSf8Bne6KAud8aRiZLrBGqInZHHXXM/+L4wixkwHaAS
	8LTecY1terpjtmdF9De250uV3rC445Dw4PT8Fnpkk3+Xg094X4JIMU5g6ptTvF3UXL3QJ+
	USuiM6vFGp/1txMxwz4G8s3aExhRJA/OGskeSbzvVR8Pnj6iJ2qXtzSS2IV3CXZrhZ9JNP
	DINS76kq5B6cPgpefpY/iMwSyX1kS2TUaEbXKvtkyKKPdmHspj8de9yU31o9hQ==
Date: Mon, 18 Aug 2025 22:07:54 +0200
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
Subject: Re: [net-next v18 2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250818220754.585dac78@wsk>
In-Reply-To: <20250815182930.196973bb@kernel.org>
References: <20250813070755.1523898-1-lukasz.majewski@mailbox.org>
	<20250813070755.1523898-3-lukasz.majewski@mailbox.org>
	<20250815182930.196973bb@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: 35qi5izozcp45u58cd3qppdasc3mhqxe
X-MBO-RS-ID: d00d9afc35992f2ef92
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_130813_004086_D69836D4 
X-CRM114-Status: GOOD (  11.76  )
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

> On Wed, 13 Aug 2025 09:07:50 +0200 Lukasz Majewski wrote:
> > +	pkts =3D mtip_switch_rx(napi->dev, budget, &port);
> > +	if (pkts =3D=3D -ENOMEM) {
> > +		napi_complete(napi);
> > +		return 0; =20
>=20
> And what happens next? looks like you're not unmasking the interrupt
> in this case so we'll never get an IRQ until timeout kicks in?

Good point - I shall set the "default" set of interrupts before return
0;

>=20
> > +	}
> > +
> > +	if ((port =3D=3D 1 || port =3D=3D 2) && fep->ndev[port - 1])
> > +		mtip_switch_tx(fep->ndev[port - 1]);
> > +	else
> > +		mtip_switch_tx(napi->dev);
> > +
> > +	if (pkts < budget) {
> > +		napi_complete_done(napi, pkts); =20
>=20
> Please take napi_complete_done()'s return value into account

Ok.

>=20
> > +		/* Set default interrupt mask for L2 switch */
> > +		writel(MCF_ESW_IMR_RXF | MCF_ESW_IMR_TXF,
> > +		       fep->hwp + ESW_IMR);
> > +	} =20



--=20
Best regards,

=C5=81ukasz Majewski

