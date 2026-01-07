Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B970ED0D143
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yycvn6JYAMCNzs20ck2BmTzc1LyVi3Ht7iyhVT/cs0=; b=UfUPeGUnxJSPTudwvDtEjbVg9O
	7huJAZWuvSbdMsGFkfrcjK2UIoawOayCctsI9ZMgBC1eKKkvlOlO5MvdNMx7G3h3Xhfz6SnDlUSu3
	BnUdX8Y9JCncZGuCMF5dXgjr31T1JYFgL1HDePVYFNqT/UMGFzWp+0iHjrSMGUM80/klg9czzUQtX
	Nsl9DhciqigCUcrQgmlsJ6zSkU0oJoHm/FVIUdCf3tWn0es66u/4qBm1lxux5Plo+VDfVDYQqqbDp
	mSfpef6A/18sqLjwlvrtLx0JWykVbJucZxZZGylKdUVnezg4CI9xF4qQfTpG1y+08pptd4UDYCB9t
	iEsT3RYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWjd-0000000FKiK-3GQW;
	Wed, 07 Jan 2026 16:50:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWja-0000000FKhX-1gou
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:50:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B258F4E41FC3;
	Wed,  7 Jan 2026 16:50:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B43F606F8;
	Wed,  7 Jan 2026 16:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB437103C821A;
	Wed,  7 Jan 2026 17:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767804607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8yycvn6JYAMCNzs20ck2BmTzc1LyVi3Ht7iyhVT/cs0=;
	b=y5DC+12MhyOjLGIviyVCZlq/DUOt72pPHqK1VUrFHUhzqr4u/s5YNjwFv4U47BqccQ1t+4
	U5adVwNi5x7tVPL2ouDlI+WG5VMDeHvov53wQW607L94fc2AYStmKNJl5nBUi0gVXA1I3H
	PrXYCDLTLf9qn7kNlq2Dlp6nvqvCkUxdJbduiuElxitDOOWb4UnaVTcA7AcjFaRGTbbvr3
	ZZDfA3G95V/a0QkQn4gDjBv9vTiaBtT4fXU23CtoXJTVqqrel9KegV/fZ7WAfgVYY9UOeU
	m9wEtjk0/k803IbRLVod9dynsKNUCfP8l4TJwT7/P4GFFn7+xBNf7b+rKQiz5g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: cn9131-cf-solidwan: Add missing
 GPIO properties on "nxp,pca9536"
In-Reply-To: <20260105194647.3189303-1-robh@kernel.org>
References: <20260105194647.3189303-1-robh@kernel.org>
Date: Wed, 07 Jan 2026 17:50:06 +0100
Message-ID: <87bjj5qse9.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_085010_574861_1EAA00FF 
X-CRM114-Status: GOOD (  11.73  )
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

> The PCA9536 is always a GPIO provider, so add the missing properties.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/ar=
m64/boot/dts/marvell/cn9131-cf-solidwan.dts
> index 338853d3b179..b6aeba7d0a61 100644
> --- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
> @@ -202,6 +202,8 @@ fan-controller@18 {
>  	expander0: gpio@41 {
>  		compatible =3D "nxp,pca9536";
>  		reg =3D <0x41>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
>=20=20
>  		usb-a-vbus0-ilimit-hog {
>  			gpio-hog;
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

