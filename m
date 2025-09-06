Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136DBCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+Du9TeIxlEbNhvp61SYY8KuLIZkAqncV6TyBj9h6w4=; b=ac2tAHd7717Af5y0hBIBl/gMi8
	BI6fW+9ZHOFxr629ntqd6OBkZa9Vxm/yBvrmh4Ciw6NmHLgzyLtlWzqBm6YNnn1KU7BQy4NJTIX3s
	qNBQyv5nnYHSerwF0h91ox/ar8QpLyKufmUFOKjUd0DoQpqcbGE+38vNWfsG8hokcHudntDJSG4qs
	amSnMJp9Jz4xcHD3NLBXthLvfhDtPkwtHBEB0xVXIxlLWG5Cn1rV30fauegLAUZlt0a1S056Ts1ez
	e7X0H8jO0HIbOQVaMbQxl6Xy/0t8pZMKx9No7Z9TU/KVAlu6bDNd82/KmD/U0aYhq9aonrH2WH1UZ
	W2nIjGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurE6-00000007hGE-3HRy;
	Sat, 06 Sep 2025 11:37:02 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurBH-00000007gzt-2EEI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 11:34:09 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1757158442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b+Du9TeIxlEbNhvp61SYY8KuLIZkAqncV6TyBj9h6w4=;
	b=dyFLZBBFQ3+fJrBybmZ30Ba9rVjhUCsCr/fFpHSIuXFcfGEdnYs6CsyuB+nkg/q+SYdDiM
	awuWCwVrXjZMBp2hNApyssaAvyMC9X67o/GyMrWC1nbqHBkius1OHU/6jEMgBGWLDWCzIF
	p423/DIc7w/h0l4nBj1SASmAsOeKs7gDdwezyyYloch8+IUpKPDs+P/JodR3ZQULROR1sE
	uyunYJfcZ0RxF2SJJpV7RRo9xP5LUK9p0FWF8EnAsklMQhPMN0vYzZ0G+63l8ShA+d1gY9
	no8sG2t+eyxEqYUOPIlroUM64WnMFUw8EuFl9NP5PujRF+RIKATjkEISR7LYGA==
Content-Type: multipart/signed;
 boundary=71e10b725da0bb370e79d95e44ae5bd5e7d2c935e23050771e2938286b81;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 06 Sep 2025 13:33:52 +0200
Message-Id: <DCLOOFYCU4G3.TRKM9VIKO4BX@cknow.org>
Cc: "Alex Bee" <knaerzche@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: add GPU powerdomain, opps,
 and cooling to rk3328
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Christian Hewitt" <christianshewitt@gmail.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250906112030.1829706-1-christianshewitt@gmail.com>
In-Reply-To: <20250906112030.1829706-1-christianshewitt@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_043407_951735_B25B26E1 
X-CRM114-Status: GOOD (  17.19  )
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

--71e10b725da0bb370e79d95e44ae5bd5e7d2c935e23050771e2938286b81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Sep 6, 2025 at 1:20 PM CEST, Christian Hewitt wrote:
> From: Alex Bee <knaerzche@gmail.com>
>
> Add GPU powerdomain, opp-table, and cooling map nodes for the Mali
> GPU on the RK3328 SoC. Opp-table frequencies are sourced from the
> Rockchip Linux v4.4 vendor kernel while voltages have been derived
> from practical use and support work: keeping voltage above 1075mV
> and disabling the 500MHz opp-point avoids instability and crashes.
>
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Changes since v1:
> - Use opp_table_gpu not gpu_opp_table to fix dtb schema warnings
>
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 +++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3328.dtsi
> index 6438c969f9d7..01ed2bfa7ee1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -331,6 +331,11 @@ power: power-controller {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> =20
> +			power-domain@RK3328_PD_GPU {
> +				reg =3D <RK3328_PD_GPU>;
> +				clocks =3D <&cru ACLK_GPU>;
> +				#power-domain-cells =3D <0>;
> +			};
>  			power-domain@RK3328_PD_HEVC {
>  				reg =3D <RK3328_PD_HEVC>;
>  				clocks =3D <&cru SCLK_VENC_CORE>;
> @@ -570,9 +575,13 @@ map0 {
>  							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  					contribution =3D <4096>;
>  				};
> +				map1 {
> +					trip =3D <&target>;
> +					cooling-device =3D <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					contribution =3D <4096>;
> +				};
>  			};
>  		};
> -
>  	};
> =20
>  	tsadc: tsadc@ff250000 {
> @@ -651,7 +660,35 @@ gpu: gpu@ff300000 {
>  				  "ppmmu1";
>  		clocks =3D <&cru ACLK_GPU>, <&cru ACLK_GPU>;
>  		clock-names =3D "bus", "core";
> +		operating-points-v2 =3D <&opp_table_gpu>;
> +		power-domains =3D <&power RK3328_PD_GPU>;
>  		resets =3D <&cru SRST_GPU_A>;
> +		#cooling-cells =3D <2>;
> +	};
> +
> +	opp_table_gpu: opp-table-gpu {
> +		compatible =3D "operating-points-v2";
> +		opp-200000000 {
> +			opp-hz =3D /bits/ 64 <200000000>;
> +			opp-microvolt =3D <1075000>;
> +		};
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-microvolt =3D <1075000>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz =3D /bits/ 64 <400000000>;
> +			opp-microvolt =3D <1075000>;
> +		};
> +
> +		opp-500000000 {
> +			/* causes stability issues */
> +			opp-hz =3D /bits/ 64 <500000000>;
> +			opp-microvolt =3D <1150000>;
> +			status =3D "disabled";
> +		};

The opp-table-gpu should be moved downwards, right above the pinctrl
node. But maybe that can be done by Heiko when committing?

Cheers,
  Diederik

>  	};
> =20
>  	h265e_mmu: iommu@ff330200 {


--71e10b725da0bb370e79d95e44ae5bd5e7d2c935e23050771e2938286b81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaLwcIwAKCRDXblvOeH7b
br56AQCWWWvp8dGJgHCWZPupIEljTv62eHRRlJgagXNls350nAD9EjoJ2samkkdH
662TWxKU0z5ftvwqQy8+keNZBlbmpgA=
=SwUq
-----END PGP SIGNATURE-----

--71e10b725da0bb370e79d95e44ae5bd5e7d2c935e23050771e2938286b81--

