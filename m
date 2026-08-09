Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96EFC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jnxJNAlP0KAoaRrSKMZfQoenHX3AcP9wHdWXBleevk=; b=iZHP6V1OzioXPE67PLCedR4+Ak
	Sf+D83G02eEjOTVEm78xtVGCEQninmVqcbnXJEa/eipZ61AnBReqJZrIF009VJLwkI3ZotqywDptP
	Dl22LljjYlqBullY4AGrzGCGZq00xDoqbcHo36Pb5xSG3LiRQUCYMwpOeCedT2cCOnVowZwtFtvsb
	GBzBAn62uWWAh+fW1xOUBVb/TaAHEjFDcBRQ4XjbivaPgy8DIzcwq15b7qXKN0fDh/b1UQ/EKYFvw
	XXCo9j31/R+9/SM3jrlxvqA7LMvioQnb75wa3hOdBq66HU7tUUNJdKq9TukEjAnY+dJi+uriANS8E
	QYRf2e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt10h-0000000ADm3-0Iry;
	Sun, 09 Aug 2026 10:44:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt10e-0000000ADl4-0iRs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:44:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9CB01A14FC;
	Sun,  9 Aug 2026 10:44:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDAB26033B;
	Sun,  9 Aug 2026 10:44:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DB5F11C489E4;
	Sun,  9 Aug 2026 12:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786272237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4jnxJNAlP0KAoaRrSKMZfQoenHX3AcP9wHdWXBleevk=;
	b=rlnanntTFmhd4i6bJvWBmhBLiQs6Jjo0770O38bs2Q51dvcYpMZktLXC1VdNkmr0BrRoaP
	uF/L9swfZCUQp22KaeobbeeekvmN+xVw4jUswO07pfBk4uan2qwrnc/f9CE23aYc81xFky
	SWyFlbAzbV4suziedXLO/4wAGjVX0S2FSPKgUsDhdKVkTBN3b7TvVUOP4ABlqpCBkGb5uG
	QupPQIjqHXNnEHyrzd+yDdN+HmwpnAMFDm+32NGSMH+2TO20eT/O5SvimBdRUSEF1yahio
	GhlXOY+SRTrMbfcO+F3zulIvN/bdK30optX/Xcxu3nADz+u1fCHn/iSTe8MyBQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: =?utf-8?B?VG9tw6HFoQ==?= Macholda <tomas.macholda@nic.cz>, Andrew Lunn
 <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, =?utf-8?B?VG9tw6HFoQ==?= Macholda
 <tomas.macholda@nic.cz>
Subject: Re: [PATCH mvebu-dt64] arm64: dts: turris-mox: fix usb3 phys
In-Reply-To: <20260707210830.3708-1-tomas.macholda@nic.cz>
References: <20260707210830.3708-1-tomas.macholda@nic.cz>
Date: Sun, 09 Aug 2026 12:43:54 +0200
Message-ID: <875x1jmv4l.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_034404_349546_86FF03F4 
X-CRM114-Status: GOOD (  13.54  )
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

Hi Tom=C3=A1=C5=A1 Macholda,

> After commit 00e6d608fe80b0f6 ("arm64: dts: marvell: armada-37xx: swap
> PHYs' order in USB3 controller node") swapped USB3 PHY order, USB
> initialization breaks on Turris MOX.
>
> This regression was exposed by commit 91ddf6f722084383 ("phy: marvell:
> mvebu-a3700-utmi: fix incorrect USB2_PHY_CTRL register access") which
> made USB2 devices not work at all.
>
> Fix the issue by explicitly adding all USB3 PHYs and PHY names to
> Turris MOX device-tree.
>
> Fixes: 7109d817db2e ("arm64: dts: marvell: add DTS for Turris Mox")
> Signed-off-by: Tom=C3=A1=C5=A1 Macholda <tomas.macholda@nic.cz>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arc=
h/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> index f4d73c8b1a6d..bd00e7df87c6 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> @@ -290,7 +290,8 @@ connector {
>=20=20
>  &usb3 {
>  	status =3D "okay";
> -	phys =3D <&comphy2 0>;
> +	phys =3D <&usb2_utmi_otg_phy>, <&comphy2 0>;
> +	phy-names =3D "usb2-phy", "usb3-phy";
>  };
>=20=20
>  &mdio {
> --=20
> 2.54.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

