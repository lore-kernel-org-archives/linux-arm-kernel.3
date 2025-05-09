Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E60C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW4KBcGtJSrAqFPHP5H5PG7TlnbU9UpApL0n436QVo4=; b=Kh7VmU5JV+PScn/HZFfiN9jTO8
	K7CryTruA3MGCk2iGE/lkNNg6pddRbozz0GgLbD3TrJjUFjhq473uN498hmoUaNmaCPyJPDTKvqxC
	ikVbGSqkhBB5hoAl7JhwzOQ6OV+82vxarkJ96D9U65mhwXnzx4LkyBlKky16lpJFPd2bhG6ClQ8zN
	KACjrchM6sL3NijXe/6Yfc2wRitU7jANl+5gGB4qJki2HJbMWQXxYbd2KpvTk8egQeWInWTyn70FD
	CaFsNmDAsja8A/TRRJuj03JuS/dAfWIpwFbDkZQt+pWmFYAe+oLM8O89NvE6nj07TXL3f9khTagaU
	NknoqzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNyy-00000003npl-3XkW;
	Fri, 09 May 2025 13:41:44 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN6E-00000003cw1-2bGv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:45:12 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746794706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KW4KBcGtJSrAqFPHP5H5PG7TlnbU9UpApL0n436QVo4=;
	b=ImuD8IbRIqKE/CNpdy4WPO3H6jwtC1fJZQatK6NXOjntc5zPYY0Hini8qWMmbczkWJBfkA
	ngxt4TAajwKHgWWQVXc+p0IYLaaWurIOD87JeLM1V0R/fYqCuKcGKVAEi7lw758doECP/l
	UPVVsgeGriocqzrprVLErqTCAq65AlolVSZo77ifnvUka01goaVwjItz+4WU1pBiimJoI0
	X5wTj02NhPFroV0UJohtv/paQRC4NbD08j7/roreBlL0GN+VlIVwAgx4q2Qq3Zw6HL1MXY
	f9AXHD9tgg4nzE5F+EE3opvXO2Rn0ULldCSPleRIbDnmgSH8eCVqYgOLFcRyIg==
Content-Type: multipart/signed;
 boundary=a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 14:44:57 +0200
Message-Id: <D9RN1HZAXH1M.3H228KWQJ9CR0@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include
 file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Heiko Stuebner"
 <heiko@sntech.de>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_054511_009421_91DAD7BC 
X-CRM114-Status: GOOD (  21.10  )
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

--a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
> Radxa released some more boards, which are based on the original
> Rock 5B. Move its board description into an include file to avoid
> unnecessary duplication.

Aren't you moving it *out of* an/the include file?
If so, the patch Subject and the above line should be updated so that
they correctly reflect what is changed in this patch.

The above text is correct (and the same ...) as patch 1, but in this
patch you move things out of the dtsi which are unique per board.

> NOTE: this should be merged with the previous commit to ensure
> bisectability. The rename happens in a separete commit during
> development because git does not properly detect the rename when
> the original filename is reused in the same commit. This means
>
> 1. it's a lot harder to review the changes
> 2. it's a lot harder to rebase the patch series

Or did I fall prey to the exact thing you described here?

Cheers,
  Diederik

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 40 ------------------
>  2 files changed, 52 insertions(+), 40 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64=
/boot/dts/rockchip/rk3588-rock-5b.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..9407a7c9910ada1f6c803d2e1=
5785a9cbd9bd655
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588-rock-5b.dtsi"
> +
> +/ {
> +	model =3D "Radxa ROCK 5B";
> +	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> +};
> +
> +&sdio {
> +	max-frequency =3D <200000000>;
> +	no-sd;
> +	no-mmc;
> +	non-removable;
> +	bus-width =3D <4>;
> +	cap-sdio-irq;
> +	disable-wp;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> +	vqmmc-supply =3D <&vcc_1v8_s3>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdiom0_pins>;
> +	status =3D "okay";
> +};
> +
> +&uart6 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	usb {
> +		vcc5v0_host_en: vcc5v0-host-en {
> +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&vcc5v0_host {
> +	enable-active-high;
> +	gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&vcc5v0_host_en>;
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588-rock-5b.dtsi
> index 17f4fd054cd3d1c4e23ccfe014a9c4b9d7ad1a06..6052787d2560978d2bae6cfbe=
ea5fc1d419d583a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> @@ -8,9 +8,6 @@
>  #include "rk3588.dtsi"
> =20
>  / {
> -	model =3D "Radxa ROCK 5B";
> -	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> -
>  	aliases {
>  		mmc0 =3D &sdhci;
>  		mmc1 =3D &sdmmc;
> @@ -139,10 +136,6 @@ vcc5v0_host: regulator-vcc5v0-host {
>  		regulator-always-on;
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		enable-active-high;
> -		gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&vcc5v0_host_en>;
>  		vin-supply =3D <&vcc5v0_sys>;
>  	};
> =20
> @@ -488,12 +481,6 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
>  			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> -
> -	usb {
> -		vcc5v0_host_en: vcc5v0-host-en {
> -			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
>  };
> =20
>  &pwm1 {
> @@ -530,27 +517,6 @@ &sdmmc {
>  	status =3D "okay";
>  };
> =20
> -&sdio {
> -	max-frequency =3D <200000000>;
> -	no-sd;
> -	no-mmc;
> -	non-removable;
> -	bus-width =3D <4>;
> -	cap-sdio-irq;
> -	disable-wp;
> -	keep-power-in-suspend;
> -	wakeup-source;
> -	sd-uhs-sdr12;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-sdr104;
> -	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> -	vqmmc-supply =3D <&vcc_1v8_s3>;
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&sdiom0_pins>;
> -	status =3D "okay";
> -};
> -
>  &sfc {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&fspim2_pins>;
> @@ -566,12 +532,6 @@ flash@0 {
>  	};
>  };
> =20
> -&uart6 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> -	status =3D "okay";
> -};
> -
>  &spi2 {
>  	status =3D "okay";
>  	assigned-clocks =3D <&cru CLK_SPI2>;


--a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB34zAAKCRDXblvOeH7b
bspkAQDgrjd4oJNZSgatYk5e0hVQKf7yl7XI/rQr2kM9asNPSAEAlw0l4olpMeDx
eBT79vJHA5+VVMCa7wErGOK6rQi7+gc=
=5PU0
-----END PGP SIGNATURE-----

--a8e812d93356676e6d3194396309dd33e90e10afd882605b15d3904c7ce0--

