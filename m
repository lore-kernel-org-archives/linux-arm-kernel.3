Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD6C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUskfXTEiw1h5B2Q/KY6GP2s7WW7diEyJBqLFIH/p34=; b=huRuKu35UbyeWyq3t9dmH5C2sg
	vGEgUKX8jP42i0/xBY1zsJZNp9fHt4iPG779RdONVm4vXEkUYHIsPn//8MjJN+d4XMfWAfz5aiE6R
	BlA1dzJs+JTHJV3Bbt16hhaM8ADSGfYyycvf4mRRWcfBmV3JEFYq66aWSKGjWQOfIOS2GrUR1ChyS
	BXMH2dX89LiLdhBJbEjJTE0jtB3yGonrAGeT/Nvr6kuMAGX4ddE+flRMyhyEm4Q5RrtJfbEAd+Ilv
	mJE/ES75TfuD+KRHUKOXGJmfBlp0QEWI2SXn1zc058vWruyGnqJiAhqp9OinSdIzvKT6z+E3ITeJy
	n0Ra81ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztzW-00000005atn-3oLE;
	Fri, 28 Aug 2026 10:39:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztzU-00000005at2-1QNq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:39:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA9D44E413FF;
	Fri, 28 Aug 2026 10:39:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DE0C60537;
	Fri, 28 Aug 2026 10:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB34611C780D1;
	Fri, 28 Aug 2026 12:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913554; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bUskfXTEiw1h5B2Q/KY6GP2s7WW7diEyJBqLFIH/p34=;
	b=DC+qhltk9aAeKdzX23ilz5nmwsxXUY0ErPvt+YlvHG6YxXv2stvXP0/ap6pakFWQRkGYsW
	AHe50TWugEUMk9DU4jqsTBi7GLBvJQn+F6nwJahk5AZtbfEQe26ZwjDJXbF+UVin6vL4rr
	dq5oQLITVMaTaO7nmimZkECXQyfImmrpXKL4kSW7ZYkTZ8X7spK0r0d17TCiHXAAEaJ7QQ
	TRosgmWq6zoSTb5imLBsmRNAwAuJ03/4vSzrq8+txulkIvoUfb4MwGMIZMenyKIPCKqGEJ
	iLIyJQORT2Ka/dviqDlGCVP2l5srhwKO8drNnbVHmiGvU3xlSbiGMMmDESmCaw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: armada-385-clearfog-gtr: fix vmmc property name
In-Reply-To: <20260823234535.72052-1-rosenp@gmail.com>
References: <20260823234535.72052-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:39:11 +0200
Message-ID: <871pbir0kw.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_033920_516617_3F02A79A 
X-CRM114-Status: GOOD (  11.91  )
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

Rosen Penev <rosenp@gmail.com> writes:

> The SDHCI node references the 3.3V regulator through a bare "vmmc"
> property, which is not part of the mmc controller DT binding; the
> correct property is "vmmc-supply".
>
> Fixes: aecc313490ae ("ARM: dts: mvebu: add support for SolidRun Clearfog =
GTR")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arc=
h/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> index 48b09df53c60..3262b726a1c7 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> @@ -235,7 +235,7 @@ mmc@d8000 {
>  				pinctrl-0 =3D <&cf_gtr_sdhci_pins>;
>  				pinctrl-names =3D "default";
>  				status =3D "okay";
> -				vmmc =3D <&reg_3p3v>;
> +				vmmc-supply =3D <&reg_3p3v>;
>  				wp-inverted;
>  			};
>=20=20
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

