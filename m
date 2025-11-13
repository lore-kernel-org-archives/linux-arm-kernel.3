Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A11CD98FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grMTbYxT3/Qu8aQl2TnXJ0ZZN1+fBc/GLnQ6IdZDoyc=; b=vIz480Cw7HYxNM6gEOkSjwM2xU
	Aoa+7zoReATpB9RKjIaj+ADhwYPw81GWjorQbmFudkdohUVsuv4MqHiOQs4rFR231N7vpVhbJAEyh
	jDHzW49iDTwF0cHqbwPDLX1dLQvYsxVW+/AlLaDXj+NbLgju/te2ONJf9m8sqqLxSvGb6fnUgMfmK
	Ku8byPPP5nShzr8TjhMVO47CuTzV9jfDeZsu1h9p/Urb4/Kdc3qWR5srbB1w0qhCQKwU+HAb76iqy
	krhhpLHM+IbkdOMv8iA/nLF6lEry4xB0hDMG3Z07kXT4dGqAg1ndA+ewN6BOxki9ssNaazak9je2U
	+Vxq8xeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgIw-0000000BDmj-2F0S;
	Thu, 13 Nov 2025 23:00:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgIu-0000000BDm9-1yyF;
	Thu, 13 Nov 2025 23:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=grMTbYxT3/Qu8aQl2TnXJ0ZZN1+fBc/GLnQ6IdZDoyc=; b=dxFLBhUo9l+ugyCbGCgdx8+WbI
	ZxFRWe9SnBJa7RxKNyggJEt/8aNO5GKzdg+YCwrz2qqyOy1h9UfAuNomHtfzV7cAui7pN9wu8b03Q
	m94a5AfQijob3Hfpmp9zA/R6Gl4znVvirOuKHFIqJtNETR3jH2odWocki6DI49loXMfy/edgTD/xw
	jLFIY8n0FC/gTOnjOBzQcnV7qDT/xqRERsIaJGcF1nI/16hGurX7ltwX6X10sF3xn9zIrnFUXTOJS
	V7wkQJKbX9czmViLJezsnwNMBNM0IzPs3sIFw+iodpV4Q+3Ups9gnbl3v6UgrtkRp89NTjFw1LB6z
	wVRNmzOQ==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgIe-0005Zq-D3; Fri, 14 Nov 2025 00:00:20 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Hsun Lai <i@chainsx.cn>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
Date: Fri, 14 Nov 2025 00:00:19 +0100
Message-ID: <1841407.VLH7GnMWUR@diego>
In-Reply-To: <20251101120010.41729-1-amadeus@jmu.edu.cn>
References: <20251101120010.41729-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150036_515227_C0BECE06 
X-CRM114-Status: GOOD (  14.70  )
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

Am Samstag, 1. November 2025, 13:00:05 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Chukun Pan:
> Add missing MMC aliases. Remove the max-frequency property
> from the MMC node, which is already defined in rk3576.dtsi.

please split this into 2 patches, one for the aliases, one for the
max-frequency removal.

Thanks
Heiko

>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/=
arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
> index 59c172573cf8..9cbd3fae16ab 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
> @@ -19,6 +19,8 @@ / {
>  	aliases {
>  		ethernet0 =3D &gmac0;
>  		ethernet1 =3D &gmac1;
> +		mmc0 =3D &sdhci;
> +		mmc1 =3D &sdmmc;
>  	};
> =20
>  	chosen {
> @@ -735,7 +737,6 @@ &sai6 {
>  &sdhci {
>  	bus-width =3D <8>;
>  	full-pwr-cycle-in-suspend;
> -	max-frequency =3D <200000000>;
>  	mmc-hs400-1_8v;
>  	mmc-hs400-enhanced-strobe;
>  	no-sdio;
> @@ -749,7 +750,6 @@ &sdmmc {
>  	cap-mmc-highspeed;
>  	cap-sd-highspeed;
>  	disable-wp;
> -	max-frequency =3D <200000000>;
>  	sd-uhs-sdr104;
>  	vmmc-supply =3D <&vcc_3v3_s3>;
>  	vqmmc-supply =3D <&vccio_sd_s0>;
>=20





