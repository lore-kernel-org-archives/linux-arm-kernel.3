Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5248CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYGXsQAb2CSsGFfXHxA+1+PGfASQDHqZzJGFLVn2lCY=; b=0qSHyJasrVKawX1uUSATfc8/sK
	r15r4cdGPYQIRIKkxoEPx3aWNYwl8VFgciMXaOhycNfY9M8H+X6+F5JUtjZwuD3V83pT188ztJfIJ
	5Y59v7yl+FVPQ/gj+p/p5XpAR4zqwSsV09D9HeZXuMrYZ6r6sGNnduRZRpyInTaaxZmGP8lfm9pkS
	FNVEkv9VCybbyoBqgqCcCpPRMb3NaaJd3xyY0PDQtihVn/B5oGKALrk0bWa3pbkCu2zC0gR+nkyUk
	1Yd6N5S7ST7KRswgzH9ynvLZ2G8BgUwilv228ai0uw7DPZm/wxAd8bbhzPC+mzni59c+om4IhgVPM
	MVL77skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnub-000000059cy-1bFt;
	Wed, 30 Sep 2026 06:35:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnuY-000000059cC-2Bdf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:35:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 21BE64E410D2;
	Wed, 30 Sep 2026 06:35:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAA6B60749;
	Wed, 30 Sep 2026 06:35:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3520A103297F7;
	Wed, 30 Sep 2026 08:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790750123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vYGXsQAb2CSsGFfXHxA+1+PGfASQDHqZzJGFLVn2lCY=;
	b=0AC3zil6hrxy9fwTlBlblTWbA2nfDWy5d6a03+jUcpqXKHqyvTz30Ep+k6QPSBdLyxGNvD
	iHotmlJQ1jMQLPAkO0CdANJ73jwW/8i5+Atwg7FKvTLCEZ+XdPyfigq4iDL7PWMxkZJMon
	KD3hGyQnGFMZpKCRhQBpC0gQgi1u5OkeWBfPXYOAxB+LGTUIuadFclCL8mw2s87j6eTEvQ
	X6F9kiCpcPSGPY2eLdiRv3AjmnnSFFxrCanVPS8PbsTABgCe7nvPvEM38oKfRLnw5itC95
	/sXbuFVK+1yCinycoeBBc5YxE5C5ghPpjkVxdCLzSTooyZg3vfa/J0dRf3Lgbw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: add #phy-cells to USB nop phys
In-Reply-To: <20260831233626.13947-1-rosenp@gmail.com>
References: <20260831233626.13947-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 08:35:20 +0200
Message-ID: <87fqyr8cwn.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_233526_700765_A5B8F776 
X-CRM114-Status: GOOD (  10.11  )
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

> The usb-nop-xceiv binding requires a #phy-cells property; without it
> dtbs_check reports:
>
>   usb2-phy: '#phy-cells' is a required property (usb-nop-xceiv)
>   usb3-phy: '#phy-cells' is a required property (usb-nop-xceiv)
>
> Add #phy-cells =3D <0> to both nodes. No functional change.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index e63b8b5e632d..548fb92ca811 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -141,10 +141,12 @@ fan2: j17-pwm {
>  	usb2_phy: usb2-phy {
>  		compatible =3D "usb-nop-xceiv";
>  		vbus-supply =3D <&reg_5p0v_usb>;
> +		#phy-cells =3D <0>;
>  	};
>=20=20
>  	usb3_phy: usb3-phy {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  	};
>=20=20
>  	soc {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

