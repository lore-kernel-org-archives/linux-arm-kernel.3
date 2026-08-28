Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4663FC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DmhBzyPBem9bpHPsGsJOXYnQ8sxc5roWwk4g4y8cvk=; b=Zl7Q6WgxJLGAomR/Dr4/2cxsB0
	SOmJvyVoYKQcHyFE7EJyrRacaS/kXfa5UGGLo5TtEEdGH3KF3M+AfKzBMTr/9LVmm3Vs390/Ns3Nu
	A8gx25tE8BB0wlJmmCa2cvJUl3kb/Ez7cmoxfHB8oJGRrwnLPcuVfQ0LXyA5aOUZuiUFA1UBYmG0L
	jit9q5hUBD3Q65bBzMtkvEXig4SWJuhG2q13AfmTfbZgiAzuJWM7vUzg2lC3mr6cXyoPD0IsQdTfs
	fMWMe77r/vNG4KNuglHlzf9aJSI6ooFyvwpJSUM+AUgMDnlHpEKJVe3Jx2PImYjg3Y1zM5u/D023i
	3l1kQoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwf9-00000005pKH-0tl3;
	Fri, 28 Aug 2026 13:30:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwf6-00000005pJr-2hmH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:30:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 45D171A189F;
	Fri, 28 Aug 2026 13:30:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19F6E60537;
	Fri, 28 Aug 2026 13:30:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B49D11C7815E;
	Fri, 28 Aug 2026 15:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787923821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DmhBzyPBem9bpHPsGsJOXYnQ8sxc5roWwk4g4y8cvk=;
	b=f7fzXX77YZ9eApF8kP4Lo54SQw2aEk3QibiwCTClNeqZrTbjL9ttqSk0bc+6KSS/aGTYWH
	Ncb7GxBUrDnajmr9U2ErFRloH5c29tT6iz+3qlIh0iq34M/cf4ir0uHZ9XVJmQLcHSkBl6
	cKTacAOkY0TMP7qSKKcdeOKRWFq1N8Q6dBu6xUMn6tZEmlRLSHtk12p1SpMXgMzc6mcaCI
	DXr3sHH1905CT4I8fy5iir3DueWrUh0dl/hvmcnD8tKdCj9wr3i0fcl/1/elDrFTn1bRiI
	/HDZUBJuhFILUgRDzOSWqgazrWNM5T/7VYvpM+OLJukfOaEQ3+lgub9bmy2Txg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: armada-388-helios4: fix vmmc property name
In-Reply-To: <20260824000521.80492-1-rosenp@gmail.com>
References: <20260824000521.80492-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 15:30:19 +0200
Message-ID: <87mru6pe38.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_063028_953661_4C0F5180 
X-CRM114-Status: GOOD (  13.99  )
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

> The sdhci@d8000 node references the 3.3V regulator through a bare
> "vmmc" property, which is not part of the mmc controller DT
> binding. The binding requires supply properties in the form
> "vmmc-supply", so the current entry is ignored by the driver.
>
> Rename the property to "vmmc-supply" so the fixed regulator is
> correctly wired up as the card power supply.
>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 0b23d4da8276..092290da1f4a 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -304,7 +304,7 @@ mmc@d8000 {
>  					     &helios_sdhci_cd_pins>;
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

