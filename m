Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C491C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqCrFGGm5J7f5kHtiiyfF3IVbiHO0Bhhe0e1xz4ZMJ4=; b=xuJa5ZXQvxDAYi1P8DAS6fgiaP
	B+wQrZ5KH2d9+xWLCxToujHf7IjrhmRAJpgcpJxuJtvMqdIc3zX5Dc9hvW8PsfK0S/UAp9SyAflZc
	o8mv9ZGvUK3aXMsJ2TgTFBzhuVqNOFN/KyOkWXbQPwcTNRCkIaKOzYfm3ri0s5evVsP5gkuoJ/VAn
	w2+PVlUb7j9Gm2ni2pGC9/gage/yeW26v1yEKzNIZhl0dFsFOMEwETQCfqQuAKsjzmJmND93xrQZ2
	ZeWIJg+Axy2UVGX4wJs0dHrVrS0alLyZt/mDvQe2nxSeI1SpVYwZsK5WqXH3RtK3puUiSWy/RR5PJ
	3c+J/gpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuZg-00000005d5c-1WG7;
	Fri, 28 Aug 2026 11:16:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuZc-00000005d5A-12lb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:16:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C44A4E413FC;
	Fri, 28 Aug 2026 11:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E57E60537;
	Fri, 28 Aug 2026 11:16:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADC5511C78131;
	Fri, 28 Aug 2026 13:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787915792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JqCrFGGm5J7f5kHtiiyfF3IVbiHO0Bhhe0e1xz4ZMJ4=;
	b=KuPj7gu09Slu8xSV1fhBDNmnzpvBy6oyRgliGMqiV9HPHGtJf5Nka8TLsz6ivSdurNVoGS
	7PGa4QC8gU+T5P9OBgDtczqcR1Zon1/KccQ8jN0gJ1k7LWgjDVhMEyizzqbKZ43k+IWAYi
	uaUQ+wNG3WfOu38QEDwwpzsz1fSSARAfR8k45JVnGuoxM6Slkmfe5VjiWBxUQTIHiqdLBr
	6ir2/p3gfYbJiDtuK/QxXJSG0A7N7mz5aj1xFCFN3bIJYF/6ooadvt7ww3UYhOrgrXf1Ql
	wql0kwhDRkyU41hjeJARO2aq79LcNhWxNJi19/9XGo+Ax6HBCC2DM+QNkCCRYw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Jason Cooper
 <jason@lakedaemon.net>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 38x
In-Reply-To: <20260823235652.77997-1-rosenp@gmail.com>
References: <20260823235652.77997-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 13:16:27 +0200
Message-ID: <87se3ypkac.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_041640_434238_1A77AB92 
X-CRM114-Status: GOOD (  11.28  )
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

> The marvell,armada-380-sdhci binding requires clock-names, but the
> Armada 38x SDHCI node only carries an unnamed clock reference.
> Add the missing clock name so the node passes schema validation.
>
> Fixes: 6eccc52b448e ("ARM: mvebu: enable the SDHCI interface on Armada 38=
5")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Fix already applied with ARM: dts: marvell: add missing SDHCI clock-names

> ---
>  arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 1155bee20523..598022645dd2 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
> @@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

