Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0F6D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYPdjCs2I4pKStwB8vwr/UnSwkBP0xQatRIbmAK/KFA=; b=nyTWQPBNpwfmjgqHxPPY80BYLe
	jz+j/KqbEfx4uYhZVOOkwL+AkXqnFmOcbdih5kSqueoR7cQN/6l0UQG7w2Jg+QwKIXZpsBajt3vDY
	AUf8uzGEqaYWs321C8rEuKreAnnaEHA+QamWzZeL+uE/x0lXOzlXIEBdOlA7lNQgdv1HB1LhWYZKi
	KQp+BWhASACina1DRFPsOwFh92id7wsXnifUWeyUMqA6Fuba+SAGxBk9HGaQscLgXyIMFJxtbtpZ4
	OPIAXK+t3haXcFUe78PGtOIkIxqHPPJaCsQryK/Y25og8irC0Vm15XymKdrvD4cyaAXM41PuVQIBv
	WlrFHrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6uE-00000003XRz-3jdW;
	Mon, 15 Dec 2025 11:38:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6uC-00000003XRa-2Cyf;
	Mon, 15 Dec 2025 11:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gYPdjCs2I4pKStwB8vwr/UnSwkBP0xQatRIbmAK/KFA=; b=OdCBfSVEdv2ReAg+WKWx43rNzw
	zcUqPS79qXRZQ7rP82AHOeQJ+ncOzDbBwLM35SE2VJAQ64T5tEd7NH4cInw4KoYGyAnTiDm4UdPfA
	UkAUmCuhbZqV3nTd/Ix2Rs0xjLGdy2Zb6I+matGxiVOM0EXd1vaBcx5R7tKwo9WfUBFHZ+p2BKiRG
	xgazN6dei/Fi1iQupd/lK4pP+xsJUNtRG2zq8eU63V8Lzb5GACnF3Wax9pwiyXIHpQle/fwAsqAnR
	/Nvczwt37mvB+Wm/pSFCcw7fvR6P0E69z/Vsk4gbx5Ja2TrI2YY8nVf3rqHBK1xAjzkcr2CxCF4Av
	BCy7klPQ==;
Received: from [192.76.154.237] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV6uA-0000CP-HC; Mon, 15 Dec 2025 12:38:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, guptarud@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, "Leonardo G. Trombetta" <lgtrombetta@gmx.com>,
 Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: Add magnetometer sensor to Pinephone
 Pro
Date: Mon, 15 Dec 2025 12:38:17 +0100
Message-ID: <7420522.MhkbZ0Pkbq@phil>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-3-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
 <20251124-ppp_light_accel_mag_vol-down-v5-3-f9a10a0a50eb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_033820_594162_AC4D094D 
X-CRM114-Status: GOOD (  12.42  )
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

Am Dienstag, 25. November 2025, 04:47:02 Mitteleurop=C3=A4ische Normalzeit =
schrieb Rudraksha Gupta via B4 Relay:

>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 15 +++++++++++++=
++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index f8c74b43ae9f..03721d71766c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -553,6 +553,21 @@ mpu6500@68 {
>  	};
>  };
> =20
> +&i2c4 {
> +	af8133j: compass@1c {
> +		compatible =3D "voltafield,af8133j";
> +		reg =3D <0x1c>;
> +		reset-gpios =3D <&gpio1 RK_PA1 GPIO_ACTIVE_LOW>;

reset-gpios below dvdd-*

And for completeness sake, you probably want to also add a simple
pinctrl entry

> +		avdd-supply =3D <&vcc_3v0>;
> +		dvdd-supply =3D <&vcc_1v8>;
> +
> +		mount-matrix =3D
> +			"0", "1", "0",
> +			"-1", "0", "0",
> +			"0", "0", "1";
> +	};
> +};
> +

Thanks
Heiko



