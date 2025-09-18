Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEB9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yReL3BW5cNgeOoU+ct6Z0+QfxkhYi0zLxLWspzmRmBU=; b=eQmyP4Sx3e4mP1hfRGIWwwsT3G
	Vq3ctHyDs+p1cPmpA3gdRSJ9ZqH51PldvGtcG9jILA0/snT1jzIVp6A6p2rBJT3i5qfX/xlMY+MLY
	Wegf+lgdCgRFcy9xcrVqhkgljO89ZZoJfccDUjH+OKiThasYDnh5RhnH5v3vxiQFI8io6OpGKE7fZ
	zyccYNs4OCADpENfZhZIl49bI3doAu8ZlFAbTOP2NgLH9Hpe9kyrcmWfRUTjvni7DZZKYo9WDOtD5
	gWkUvJ6jJS1g3oilvhASV0I0N+JVsnG5iT6XtTgfx7l2oHf42r1MBibmhIPo6ko6NtiiyboSkulRA
	xfytqvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzITV-00000000lCs-05a3;
	Thu, 18 Sep 2025 17:31:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzITT-00000000lC6-0YwX;
	Thu, 18 Sep 2025 17:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yReL3BW5cNgeOoU+ct6Z0+QfxkhYi0zLxLWspzmRmBU=; b=eO6eaCxDj6t7fnCop9QAYLYJgH
	59X7aMuS9JsaTAGxG7jM2PogXRFDOxYTBU0EHDKvoxfG31wmQDx/aTI2pKuqulDdPEgJthfghaKeb
	oDk9ZUzmBfJYRnAZ2iuE9+OyJnJHuYDS+SpstpkdeDwvln/C++hD6c3udYOu9/aWsagBPM0eotUl/
	sTVL4naZ5rlJdwaRQEixAQe5kFO9OuK/NLeKJIlOaDAxs3XV6HpgalP3DAoHVuLQpVEAxG/howhYn
	QH8jxLp+Etb+s3/d8+ccO+yTWQ1aXZrxGFmwFBznxC8TWo4wQPQBmTbsIuYMomj7Dxirrmpn9tOCY
	HYolQ8hg==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzITJ-0002Pr-Qb; Thu, 18 Sep 2025 19:31:05 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki <naoki@radxa.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: disable display subsystem for Radxa
 E52C
Date: Thu, 18 Sep 2025 19:31:05 +0200
Message-ID: <10594621.0AQdONaE2F@diego>
In-Reply-To: <20250901100027.164594-2-amadeus@jmu.edu.cn>
References: <20250901100027.164594-1-amadeus@jmu.edu.cn>
 <20250901100027.164594-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_103115_196578_AA89FA6A 
X-CRM114-Status: GOOD (  16.53  )
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

Am Montag, 1. September 2025, 12:00:25 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Chukun Pan:
> The Radxa E52C SBC do not have HDMI output, so disable
> the display subsystem to avoid the following error log:
>=20
> *ERROR* No available vop found for display-subsystem.
>=20
> Fixes: 9be4171219b6 ("arm64: dts: rockchip: Add Radxa E52C")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

I'm torn on the approach vs. just removing the error line in the driver.

Returning -ENODEV from rockchip_drm_platform_of_probe() is correct,
but the error log could just be a debug one instead.

Because running a system without active vops is obviously fine.


Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/ar=
m64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> index 48ddc43e2ab5..1883bd183396 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> @@ -207,6 +207,10 @@ &cpu_l3 {
>  	cpu-supply =3D <&vdd_cpu_lit_s0>;
>  };
> =20
> +&display_subsystem {
> +	status =3D "disabled";
> +};
> +
>  &i2c0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c0m2_xfer>;
>=20





