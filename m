Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD82C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkVkz6dk4cOLjXYYtXS5CCd0YLGWAVsLoyMR7Wnuhxc=; b=DJexu1/gfObDxdAHNO7WXmPjde
	MjtWYSCiXUG3D0Ztaa1sHxPtyjmpjDj9DKIsdXLCtJyX0ZbT1d7fSve4g+OGEK9V8WK8WrThhKghX
	e1WpBcJNwCMe/EDrNzTa3mGteGavlCN5lCWQKLYFzctVd0NzFAb/4z60Y6UbUBUuGnfJVWNLPr38n
	c4DoCrolQhbYY4A08GWAv65c6gYqpYNTad0trtHASa3cr201bOlEobEYmANvK60i+Cy5ZSjDx/Iz4
	uNBaUggYv6UmA5GDR1h4pIzWqEFhRLtC+1vbeuESKfXoMw1TIVSG4cBcPdftDFGxjmLudffKc1d7X
	c7B3yVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u901x-00000003Onv-0x4a;
	Sun, 27 Apr 2025 11:18:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8zyX-00000003OSb-14jC;
	Sun, 27 Apr 2025 11:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QkVkz6dk4cOLjXYYtXS5CCd0YLGWAVsLoyMR7Wnuhxc=; b=UI6khAWq+pM6v4WdeLYhnQsgp/
	lHTRCJ/dOLzPTbwx4z/4b9eMdtZKySKYeya+7mepfDy/Zvhpc7sbvJISaK0QEzpf0kly057pSuec+
	gsnhNjtGd/7LxC+lY4l49HoLN2vUriKIb/SSXh3pvQKm/ulbt+NO24DEmA7aM4Nx9A0Yvds14+AaY
	vMXyIMgmeWPKLPXCBnYl9BV8o7ykMuVYndjJwBVcIKiLBDIWgoO/+stCCcafW6tsCHe2ckvlCtIHb
	wjdeLvIiJKbXWRSgrn7aV0/9XBLLYjc12FXtcGtyYa0dApxjkF9C55819jao9BUU++s4HoXTBI5zx
	3jG2cdqg==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8zyN-0003VC-98; Sun, 27 Apr 2025 13:14:59 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Hao Zhang <hao.zhang@coolkit.cn>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, "hao.zhang" <hao.zhang@coolkit.cn>
Subject: Re: [PATCH 1/1] ARM: dts: rockchip: Wifi improvements for Sonoff iHost
Date: Sun, 27 Apr 2025 13:14:58 +0200
Message-ID: <1929240.tdWV9SEqCh@diego>
In-Reply-To: <20250427065013.99871-2-hao.zhang@coolkit.cn>
References: <20250427065013.99871-1-hao.zhang@coolkit.cn>
 <20250427065013.99871-2-hao.zhang@coolkit.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_041509_317367_55033239 
X-CRM114-Status: GOOD (  15.84  )
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

Hi,

Am Sonntag, 27. April 2025, 08:50:13 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Hao Zhang:
> From: "hao.zhang" <hao.zhang@coolkit.cn>
>=20
> After some Sonoff-iHosts have been running for a long time,=20
> the WiFi module will run abnormally.
>=20
> Adjust the pmu_io_domains and sdio properties=20
> to solve the WiFi module operation abnormality.

"adjust the ... properties", really sounds like hacking around some issue.

> diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/a=
rm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
> index 9a87dc0d5f66..3c0371103015 100644
> --- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
> @@ -323,15 +323,15 @@ wifi_enable_h: wifi-enable-h {
>  };
> =20
>  &pmu_io_domains {
> -	pmuio0-supply =3D <&vcc1v8_pmu>;
> +	pmuio0-supply =3D <&vcc3v3_sys>;
>  	pmuio1-supply =3D <&vcc3v3_sys>;
>  	vccio1-supply =3D <&vcc_1v8>;
>  	vccio2-supply =3D <&vccio_sd>;
> -	vccio3-supply =3D <&vcc3v3_sd>;
> -	vccio4-supply =3D <&vcc_dovdd>;
> -	vccio5-supply =3D <&vcc_1v8>;
> -	vccio6-supply =3D <&vcc_1v8>;
> -	vccio7-supply =3D <&vcc_dovdd>;
> +	vccio3-supply =3D <&vcc_3v3>;
> +	vccio4-supply =3D <&vcc_3v3>;
> +	vccio5-supply =3D <&vcc_3v3>;
> +	vccio6-supply =3D <&vcc_3v3>;
> +	vccio7-supply =3D <&vcc_1v8>;
>  	status =3D "okay";
>  };

=46irst of all, this would be two patches.  If the io-domains do not follow
the schematics, fixing this is one patch, but for such a big change
I do expect actual references to the devices' schematics for that.

This is even more important, as you're switching some supplies
between sources of different voltages


> @@ -342,18 +342,15 @@ &saradc {
> =20
>  &sdio {
>  	bus-width =3D <4>;
> -	cap-sd-highspeed;
>  	cap-sdio-irq;
>  	keep-power-in-suspend;
> -	max-frequency =3D <50000000>;
> +	max-frequency =3D <25000000>;
>  	mmc-pwrseq =3D <&sdio_pwrseq>;
> +	supports-sdio;
>  	non-removable;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
>  	rockchip,default-sample-phase =3D <90>;
> -	sd-uhs-sdr50;
> -	vmmc-supply =3D <&vcc3v3_sd>;
> -	vqmmc-supply =3D <&vcc_1v8>;
>  	status =3D "okay";
>  };

and here it looks like you're more or less randomly adding and removing
properties until it worked "for you".

Especially removing the supply-regulators does not really make sense.
If you see instabilities, the main contenders would be max-frequency and
sd-uhs-sdr50 as culprits.

Similarly, supports-sdio is not even a valid property, so neither the
devicetree spec does allow it, nor does the kernel handle it at all.


Heiko



