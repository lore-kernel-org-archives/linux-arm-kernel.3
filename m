Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D69D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuF8eKYdyq0Lx8q7EFdB8lJKxyIkO2eBdUsXglP9txM=; b=IOTcRzzddUqjAQej1AG37UA05g
	hRP7HPfnX5Fh4oojdB/6GREUluarVXhEoSxcOvEB1ruRZDrTLLs4bSFRYM5TAXH/1YUNfKXQiKo0k
	fP914p9pSHcostR7z2Lrsg8cYBIXMcBmmhqFc9VZb+Wgv90K45hbHtD6WAarpAI3i+tI97HY963Da
	iNwpbHaDJLgoyyjA+8NaJwz0eax3GHM5PJTvFo1jUsHv1tJovSARZOqsG4m+M5Qr7RcJPFTRYoa2j
	rRhTSRaRTVKtwfy/yNyUaE1976dkQ2YzgX0CReHj85vmFmQtFC2x6vfxG9r/6yeafISeVqcVGqOhq
	dYH9dt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6sU-00000003X7F-2UAU;
	Mon, 15 Dec 2025 11:36:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6sS-00000003X6q-2593;
	Mon, 15 Dec 2025 11:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QuF8eKYdyq0Lx8q7EFdB8lJKxyIkO2eBdUsXglP9txM=; b=1AlnazApiDEhlijBTC0mwxyBQu
	Yk9J4u2sl6IlknfNmDU06dEBcLn7GF4vglaa7tkWsjvCnHRYV/dgnrtoUQh1ekSay9NBjHHO1PEee
	AsWcz/JMZOQ6+LRbU027X3kDK9Nawin2HhVzyKDGC+icz4TkDs5fea/XJk0huyDlzD5QMeGuNW7rf
	MWfz30VnoGipVOHUX4yBDUDBEjdMfdN6vc/VV1KFcDXvgZfqBOnv1kdGKOxF/AiVexzV0bcC+L7wq
	cOtPdDqJhpcZGDcJAA6jrNFOu3YqTcBaXeGseK2sc6CBx77ENl9lVuCLM3eCs27XC/ApGURT6tfwo
	KkziR4yQ==;
Received: from [192.76.154.229] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV6sN-0000B7-NP; Mon, 15 Dec 2025 12:36:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, guptarud@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>,
 Kamil =?UTF-8?B?VHJ6Y2nFhHNraQ==?= <ayufan@ayufan.eu>
Subject: Re: [PATCH v5 1/4] arm64: dts: rockchip: Add light/proximity sensor to
 Pinephone Pro
Date: Mon, 15 Dec 2025 12:36:26 +0100
Message-ID: <10855349.CDJkKcVGEf@phil>
In-Reply-To: <20251124-ppp_light_accel_mag_vol-down-v5-1-f9a10a0a50eb@gmail.com>
References: <20251124-ppp_light_accel_mag_vol-down-v5-0-f9a10a0a50eb@gmail.com>
 <20251124-ppp_light_accel_mag_vol-down-v5-1-f9a10a0a50eb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_033632_721525_D78C0D8D 
X-CRM114-Status: GOOD (  11.29  )
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

Am Dienstag, 25. November 2025, 04:47:00 Mitteleurop=C3=A4ische Normalzeit =
schrieb Rudraksha Gupta via B4 Relay:

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 6f97e57f36f5..2d2858ee149e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -520,6 +520,16 @@ touchscreen@14 {
>  		touchscreen-size-x =3D <720>;
>  		touchscreen-size-y =3D <1440>;
>  	};
> +
> +	light-sensor@48 {
> +		compatible =3D "sensortek,stk3311";
> +		proximity-near-level =3D <300>;

proximity-next-... belongs below pinctrl-*


> +		reg =3D <0x48>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&light_int_l>;
> +	};
>  };
> =20
>  &i2c4 {
> @@ -689,6 +699,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
>  		};
>  	};
> =20
> +	stk3311 {

please sort nodes alphabetically
(stk3311 after vcc1v8-codec-en is incorrect)


> +		light_int_l: light-int-l {
> +			rockchip,pins =3D <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
> +		};
> +	};
> +
>  	wireless-bluetooth {
>  		bt_wake_pin: bt-wake-pin {
>  			rockchip,pins =3D <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
>=20


Heiko




