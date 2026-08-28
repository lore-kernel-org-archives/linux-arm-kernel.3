Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A281DC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDHLfZf5tPMsJrYh28B2Mi+dPjwBy0qVlHBF2yzTOCY=; b=BOM3/NZbIz+ajEyg23cLTtLXBS
	pM4UDDZYIL9lVqcUUmSZ0LamXBTHB1LhflwtKx8MfvL7CdFIXImMjEzZ5VrqpHiKCHfwnZifBprXt
	0fLcGSkn+ofg4UgxS3ruwPY+YX/pLhhWsCcpel1vb0Lt/EKpvwP+WvHtR0ouuKkEhVGbroOGSEFU2
	e4BdF/TW7bXw2vTeJk5uvya4y1l0VHdHTbpiacXztDqZ+EeNrSV/lT+nGIQRaEcI4FujOf2a2tQ45
	+hJMEEbVM4WM9JB1+2nrfNDM7Pfiqp+I9AKlWOzGscWYlXp9ssxmSWJ7Qu7dFGPGP77cwb66dFutR
	/zoqS4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzty6-00000005ahp-34R0;
	Fri, 28 Aug 2026 10:37:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzty2-00000005agu-3KCV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:37:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 993B74E413FF;
	Fri, 28 Aug 2026 10:37:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 644DC60537;
	Fri, 28 Aug 2026 10:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EAA511C780D1;
	Fri, 28 Aug 2026 12:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hDHLfZf5tPMsJrYh28B2Mi+dPjwBy0qVlHBF2yzTOCY=;
	b=oEkOva8LUzRsQh1c7/WvesEuyA2G/MnbQsh4POw8tskYduXCWBjbLn4LzabrvepbnqV7in
	4gNIOMT/4p17vvGlxrG2Qkcahk5yNn5b1ZCPBFPJ5/+2m6itctqP5ugsqoVZ/GLJqdR2sQ
	msGhkql1l8s8KPQ4QuTTbscPjwhCrm6Vg9n3mRixAJXSAO+FwLsa2rRIcKjARiaA/pkSOW
	lNMR/1Qiy5Xhsakxh+YSTYGEPYu0KbqjQtK0T9AmcsAATTt+sgXQyscJBlmACJChqWPq+l
	QMGdlSWB16VU989mMsARUnBT590MTOlB6DO26qrDV6QsQ0kWCdgp5FlchbRAjg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: fix lm75 supply name
In-Reply-To: <20260823234326.71111-1-rosenp@gmail.com>
References: <20260823234326.71111-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:37:36 +0200
Message-ID: <874iger0nj.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_033750_971498_BAC35474 
X-CRM114-Status: GOOD (  13.24  )
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

> The lm75 driver requests a regulator named "vs" (the +VS power pin
> of the chip).  The Helios4 DTS incorrectly used vcc-supply instead
> of vs-supply, causing the regulator core to emit:
>
>   lm75 0-004c: supply vs not found, using dummy regulator
>
> Fix the property name to match the binding and the driver.


Applied on mvebu/dt

Thanks,

Gregory

>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 626a7339a5d0..af96d27e7159 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -200,7 +200,7 @@ usb3-ilimit-hog {
>  				temp_sensor: temp@4c {
>  					compatible =3D "ti,lm75";
>  					reg =3D <0x4c>;
> -					vcc-supply =3D <&reg_3p3v>;
> +					vs-supply =3D <&reg_3p3v>;
>  				};
>=20=20
>  				eeprom@53 {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

