Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F0ACAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOhuNvmVuf/GyxrRlHUdHw8fHEaK2f199bcbQPpCzOs=; b=XAFWZhEjVw/THACgq1fT8fYUAQ
	UslScVJ7HoXkC5bIlSChCy2dJn571myHq9KkMcRbv0ds2oly37WOO75vOnCokBLaq18wTOVSH+BOx
	PxoQ4OBdmCKXcDJU1f8OhpY46r4TlFSGhcrzyDG5FMc37pyVMJYiLEraoDeRiiCjqS6sW4Igfcpo1
	6o7vvHbg71HoXnsc7/WB2FoTOianK2AlW44l1h09yrlwBN+zNEtQcpJWAc80mEjPlRHFmvVyI1CTj
	uMvC0SKe0Muil+o+tO7XQWuYVjs477ohXaXaTpuzxVcigGogc9x/TBGw5SuVa60qGlPSLNP/jbEMt
	tEn3LRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdBH-00000001yS7-2Z2P;
	Thu, 11 Sep 2025 09:01:27 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdBE-00000001yQA-2TW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:01:25 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1757581282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOhuNvmVuf/GyxrRlHUdHw8fHEaK2f199bcbQPpCzOs=;
	b=rlpEnzLgbl0QN8y8xa2LMDj5Y2jUGB5QT6TzfpFMua7/pQ9K5ZUksTmFKmviJ2HgGhk3Sk
	GKHOOkMSjbhx6dPlbl/ysyHqnMS7AHg8C//n+ALK+Y7C6X0MiRXRZaj5ZvFC+cxfdMfOvd
	XgvJgxOE+5byOlMBDpL9JIzOZy9CFSJLkfEeOjYRGrBjjfBaQOFvxrOv1HiCtLOVdogrmh
	sGaiOUQ27WPhFHwR6FdrPWjMKi51T48Rkf6LBWRmG9x29+xtoDzT3oWzJ8QgmG5GLE7cs3
	JQSjljsnrthR3wJTYYK/IDe/I8sJEZDo3bWtHqwXxxeC4qD/bLtJlJBEhGoyhg==
Content-Type: multipart/signed;
 boundary=50ff9f84bc944755ff7976bae1dce62405cf41bd88db2cec6a292aa3edfc;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 11 Sep 2025 11:01:14 +0200
Message-Id: <DCPUKAWW5N0Z.AM3JS7S8FJ7A@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Christian Hewitt" <christianshewitt@gmail.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: "Alex Bee" <knaerzche@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: enable the Mali GPU on
 RK3328 boards
References: <20250906120810.1833016-1-christianshewitt@gmail.com>
 <20250906120810.1833016-2-christianshewitt@gmail.com>
In-Reply-To: <20250906120810.1833016-2-christianshewitt@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_020124_771831_807C0ED3 
X-CRM114-Status: GOOD (  14.86  )
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

--50ff9f84bc944755ff7976bae1dce62405cf41bd88db2cec6a292aa3edfc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Sep 6, 2025 at 2:08 PM CEST, Christian Hewitt wrote:
> From: Alex Bee <knaerzche@gmail.com>
>
> Add a gpu node to the rock64 board to enable the Mali GPU and
> move the existing node from roc-pc to the shared roc dtsi to
> enable it also for the roc-cc board.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Now that the 'other' issue with power domains has been resolved, or at
least localized, I feel (more) comfortable giving my

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock64

Cheers,
  Diederik

> ---
> Changes since v2:
> - No changes
> Changes since v1:
> - No changes
>
>  arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts | 4 ----
>  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi   | 4 ++++
>  arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 4 ++++
>  3 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts b/arch/arm64/=
boot/dts/rockchip/rk3328-roc-pc.dts
> index 329d03172433..c0b7b98ff788 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
> @@ -44,10 +44,6 @@ &codec {
>  	mute-gpios =3D <&grf_gpio 0 GPIO_ACTIVE_LOW>;
>  };
> =20
> -&gpu {
> -	mali-supply =3D <&vdd_logic>;
> -};
> -
>  &pinctrl {
>  	ir {
>  		ir_int: ir-int {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3328-roc.dtsi
> index b5bd5e7d5748..7eef6f7f108f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> @@ -160,6 +160,10 @@ &gmac2io {
>  	status =3D "okay";
>  };
> =20
> +&gpu {
> +	mali-supply =3D <&vdd_logic>;
> +};
> +
>  &hdmi {
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/=
boot/dts/rockchip/rk3328-rock64.dts
> index 5367e5fa9232..592fd8ca21df 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> @@ -152,6 +152,10 @@ &gmac2io {
>  	status =3D "okay";
>  };
> =20
> +&gpu {
> +	mali-supply =3D <&vdd_logic>;
> +};
> +
>  &hdmi {
>  	avdd-0v9-supply =3D <&vdd_10>;
>  	avdd-1v8-supply =3D <&vcc_18>;


--50ff9f84bc944755ff7976bae1dce62405cf41bd88db2cec6a292aa3edfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaMKP4gAKCRDXblvOeH7b
btAmAP4/fD3deQwUhDfEtz/l+iUwn6XJqEv0cEIsnG13lxcECgD/YbRdmoDzM10V
t3np71DjmSrIwMLbLVp6fZJ4OKbV2Ao=
=I02j
-----END PGP SIGNATURE-----

--50ff9f84bc944755ff7976bae1dce62405cf41bd88db2cec6a292aa3edfc--

