Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C830C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlkoQK9Jj3Zkbr/7ax+qMgzZXpZ194fDPTfYXd3ays0=; b=utSS3NBpvANfyAMYGhfA38vyD5
	ngV1NfGAPw15G/1twaDYJNaELmImQRqN6o5avns+UdkRZ0eNtyYB9Q6qwEZBQuYNTEVFdQRoHF7AM
	yUYZ4+/hF0x0q8mA/tgIkmCBQcxQlOgFmGBD7sqgmq8D+X2aNp3/YtvUJhR2+LI6Qx52KRc8OiF2K
	u+XTiY0lLFvJQ+51+Xr4Vlqi/lHqZKbYmsi8+OpNFJ9hhm8jc2BNHCsyaBXahUoLtrYqv5kI4G2zr
	MdxHotnnlMMAix8f9subqwe1Vu/NA+Dr2ZfcCWT0C+ADz7zJ1J651VK0qq3HHBcQA2FK2ADfq5XvK
	DZ4z61FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu4d-00000005bNo-2umB;
	Fri, 28 Aug 2026 10:44:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu4Z-00000005bMw-3SvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:44:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAA1A1A185C;
	Fri, 28 Aug 2026 10:44:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7982C60537;
	Fri, 28 Aug 2026 10:44:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D31B811C7810F;
	Fri, 28 Aug 2026 12:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UlkoQK9Jj3Zkbr/7ax+qMgzZXpZ194fDPTfYXd3ays0=;
	b=qJjIVK4XQJzgkzfVrXD2wDdcdKmT63+DbuJIfLwMOqzVj+AoQthsKgAkQRQWtW9ccdvmID
	Q/lD7tlchMkbpbGj11vwUPv54JbVzvmBkSbjFLWkKcwuxTdXx6y8Q/nvSlHCvht9bJf1hF
	xIRX21+AOOm33J/oDWEfeJSgbVaMWl/BnCzT5YcxBoSiTrOOxuSHObyDHFNz8kc48c7FSr
	6l8hzlikvW2EChYH9QElgWhbJmRkSPZwtItfPlvLrTa6qMB4JZ2biPdPbMXc/vD6/uUjRN
	NmKQflQueTtTBSstqTW03/XYTmf1NgnBCRoQnY7qoRrcAQEPw5jVYxinmuQNdQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: marvell: add missing SDHCI clock-names
In-Reply-To: <20260823234721.72903-1-rosenp@gmail.com>
References: <20260823234721.72903-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:44:26 +0200
Message-ID: <87y0dqplrp.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_034436_011967_3ACD4B90 
X-CRM114-Status: GOOD (  12.28  )
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

> The marvell,armada-380-sdhci binding requires "clock-names", and
> the sdhci-pxav3 driver requests its io clock by name before falling
> back to an unnamed lookup. Both Armada 38x and 39x nodes only carry
> an unnamed clocks reference, so dtbs_check reports "'clock-names'
> is a required property" on every board.
>
> Add clock-names =3D "io" to both nodes. No functional change: the
> driver already obtains the clock through its fallback.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
>  arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
>  2 files changed, 2 insertions(+)
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
> diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-39x.dtsi
> index 218fcf99ae07..81dd4ca5fbc9 100644
> --- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
> @@ -381,6 +381,7 @@ mmc@d8000 {
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

