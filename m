Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAA2CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sel27oZgcA+4qs92Ns785z7hsDLS/ChrGwuIP1OX4QY=; b=uCGBKbnzx/uQ4JcSwgJR4Rfo8Y
	9Hd8w7Z6FSnzvYyrhjtYbWcaGm1ee9ZOCmfBRQdRNfV5SLhQs1QtpzaHgG6qSjgkwtbz24tRfW0Mt
	ZUNeqqm5RpgE6hnP8q3m9fCYRixd4QsKTovwxiVeaQx2uVa1q+PC/3Fk+z2lDIjx0bYcFsmpe53VZ
	BJx0uAKc7kDow9zy6Qsf4IF57BUdMDSBY5poVyjp1Aigky8bPFZhFsy0V3FI2gIy2FwWgtaq3I+kp
	OK+JbfjwlnTs+oVnfhtpzaGM5/pcuwjS8/WANHollcyvCdoyPjROHh+RyFxMBJ3U7fnPlfusrcilp
	Tqvymuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdB2-00000001yJy-3P1y;
	Thu, 11 Sep 2025 09:01:12 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdAx-00000001yG6-1Wux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:01:11 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1757581264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sel27oZgcA+4qs92Ns785z7hsDLS/ChrGwuIP1OX4QY=;
	b=RIVDSn+hVXAKKajO3BRUnX+PyZI/AhKE0Wn5Etb5gKNYHCOfcMIm2lXptzKPu5a13C8hqi
	dTzFniMW80cSeplBesZEyQGxWOkYxU90JGNGZlx+n5/rx3fjS866EjUs48bRz15GiymiwQ
	9GBNt8cBZyfIMIVUsZZJ1KhohDTSXlnBhdldGJaop/ST6Z4AOs7x1c39BgtYxLHS7jrAbs
	8g4/WVpaJAJj4cswJCf636dAspMsev8cp1tPn8Y00ZI/YhWeUdEGoPcWVohRk5TW3bESc+
	53r0AmyXBLDBJorq9A+l9swYRAiEEp7gH7KDOCvVsNfXqgIj/GivbNrq+kTUhQ==
Content-Type: multipart/signed;
 boundary=ae5433376ac9f3e1826a9aad5813272fffe73f438ca790723a238b2ba171;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 11 Sep 2025 11:00:54 +0200
Message-Id: <DCPUK1QMC94L.281K2EV4NQOWS@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Christian Hewitt" <christianshewitt@gmail.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: "Alex Bee" <knaerzche@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: rockchip: add GPU powerdomain, opps,
 and cooling to rk3328
References: <20250906120810.1833016-1-christianshewitt@gmail.com>
In-Reply-To: <20250906120810.1833016-1-christianshewitt@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_020108_464908_C2261999 
X-CRM114-Status: GOOD (  16.90  )
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

--ae5433376ac9f3e1826a9aad5813272fffe73f438ca790723a238b2ba171
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Sep 6, 2025 at 2:08 PM CEST, Christian Hewitt wrote:
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

Now that the 'other' issue with power domains has been resolved, or at
least localized, I feel (more) comfortable giving my

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock64

Cheers,
  Diederik

> ---
> Changes since v2:
> - Revert to gpu_opp_table but retain opp-table-gpu $nodename
> Changes since v1:
> - Use opp_table_gpu not gpu_opp_table to fix dtb schema warnings
>
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 +++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3328.dtsi
> index 6438c969f9d7..610c1c27b798 100644
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
> +		operating-points-v2 =3D <&gpu_opp_table>;
> +		power-domains =3D <&power RK3328_PD_GPU>;
>  		resets =3D <&cru SRST_GPU_A>;
> +		#cooling-cells =3D <2>;
> +	};
> +
> +	gpu_opp_table: opp-table-gpu {
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
>  	};
> =20
>  	h265e_mmu: iommu@ff330200 {


--ae5433376ac9f3e1826a9aad5813272fffe73f438ca790723a238b2ba171
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaMKPyQAKCRDXblvOeH7b
bnvvAP9cDJ5evO0m4pNc3VzMtFadq913C7DWR5qrTp1cVAzeMAD/ZA+eArhOyXVx
S3TR4Ha5ypA3l+htGbzr3UZ2YtgszQA=
=K9LX
-----END PGP SIGNATURE-----

--ae5433376ac9f3e1826a9aad5813272fffe73f438ca790723a238b2ba171--

