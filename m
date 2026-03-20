Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28953109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbDVFjolLGX3QRmdSUPmSQ/KW7YhxkrqDIk5QadA5dk=; b=39EgEfNZ+jGlvnBZbVfoWLTl+M
	hXaUtVwlXF2OJSWUMolzuHJmMzKVcCLRYmX59BO8pVnnqMTMiBpLik+zRkgd9B39gIy9NuLtkV7WX
	xCOuNIA16H3L54S3z/ownf80WbzlOeKkmnKhEmxZOKTnk8ELa9cWBKuoKpLvIEe1KauQK0hAhPw0i
	Bdn7z/KAi9U5FEuVzAxaeStnqKqLo860Ovpn0chlFn0fN/y72rZYEAYY/40pV+kX7nxL9M+lVj/FD
	ArOalBaa8BE2B6VHwkiK957AiE98eX5NYkcSizdQwPbTi5/ME0+7PD1v2vkBLHB0enLEZRihAAh82
	4ypSlf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VX4-0000000CPJo-13v2;
	Fri, 20 Mar 2026 08:48:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VX1-0000000CPJI-09GT;
	Fri, 20 Mar 2026 08:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZbDVFjolLGX3QRmdSUPmSQ/KW7YhxkrqDIk5QadA5dk=; b=ICG+lqrbkJBPFYv1OGnP9Miu3d
	NaIyEx6PVQH8VVHU9O4VNSprLyhEfZDoEcH3+OdOfo7tgVqLWRO05gCbEs+VViGZzRPOfrpWGFFvu
	ri+hGv9EwejACBCAtQUSD73xYCrFkd0eEIVBbGCwUNKcsxj0JrpurMeWAZmh0xmbR+vt7DKEF7ybG
	2OUR9ANCKMt1tXIc+X0r2/63Nbqd2dPw2272RNrCGaftYGPNWa21DiYGzVf5Nh/qJ7RP9vee9AoEx
	vY36tOpj8+/pbDgvtFSuYt0z/bH788AQbe3KFmAzDtNhK9h9yuwmgtxAccZFTcrzESgBnc1Dr89p+
	9/S9wM5w==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, MidG971 <midgy971@gmail.com>
Cc: shawn.lin@rock-chips.com, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 MidG971 <midgy971@gmail.com>
Subject: Re: [PATCH v4] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Fri, 20 Mar 2026 09:48:25 +0100
Message-ID: <2053182.usQuhbGJ8B@phil>
In-Reply-To: <20260319145120.99833-1-midgy971@gmail.com>
References: <20260304132957.684616-1-midgy971@gmail.com>
 <20260319145120.99833-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014835_099717_D4E3A655 
X-CRM114-Status: GOOD (  22.40  )
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

Am Donnerstag, 19. M=C3=A4rz 2026, 15:51:20 Mitteleurop=C3=A4ische Normalze=
it schrieb MidG971:
> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
> This chip is currently modeled only as a fixed regulator
> (vcc3v3_pi6c_03), with no clock output representation.
>=20
> The PI6C20100 is a clock generator, not a power supply. Model it
> properly as a gated-fixed-clock, following the pattern established
> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> chips.
>=20
> The regulator node is kept as-is since it controls the power supply
> to the PI6C20100 chip via GPIO0_D4. The new gated-fixed-clock node
> references this regulator as its vdd-supply and provides a proper
> 100MHz clock output. The pcie3x2 node is updated to include the
> pipe and reference clocks, matching the approach used in
> rk3588-rock-5-itx.dts.
>=20
> Assisted-by: Claude:claude-3-opus
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>

Sorry for having to bring up the process again, but the patch
author should match the Signed-off-by line.

You can update the patch author with something like:
  git commit --author=3D"Midgy BALON <midgy971@gmail.com>" --amend

Also is the last name always "UPPER CASE" in your region?

Thanks a lot for staying on this
Heiko


> ---
>=20
> Changes since v3 [1]:
>  - Add Reviewed-by from Shawn Lin
>=20
> Changes since v2 [2]:
>  - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shaw=
n)
>  - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks
>    override (Shawn, referencing David's patch [3])
>=20
> Changes since v1 [4]:
>  - Drop phy-supply approach entirely (Jonas, Shawn)
>  - Model PI6C20100 as gated-fixed-clock instead
>  - Wire reference clock to pcie3x2 controller
>  - Follow pattern from rk3588-rock-5-itx.dts
>=20
> [1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy9=
71@gmail.com/
> [2] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy9=
71@gmail.com/
> [3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47=
177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
> [4] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy9=
71@gmail.com/
>=20
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 21 +++++++++++++++++++=
+-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64=
/boot/dts/rockchip/rk3568-rock-3b.dts
> index c5f67dd6dfd9..1a2b3c4d5e6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -56,7 +56,16 @@
>  		};
>  	};
>=20
> -	/* pi6c pcie clock generator */
> +	/* PI6C20100 PCIe reference clock buffer (100MHz) */
> +	pcie30_refclk: pcie-clock-generator {
> +		compatible =3D "gated-fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <100000000>;
> +		clock-output-names =3D "pcie30_refclk";
> +		vdd-supply =3D <&vcc3v3_pi6c_03>;
> +	};
> +
> +	/* PI6C20100 power supply - active-high GPIO0_D4 */
>  	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
>  		compatible =3D "regulator-fixed";
>  		enable-active-high;
> @@ -553,6 +562,15 @@
>  };
>=20
>  &pcie3x2 {
> +	clocks =3D <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
> +		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
> +		 <&cru CLK_PCIE30X2_AUX_NDFT>,
> +		 <&cru CLK_PCIE30X2_PIPE_DFT>,
> +		 <&pcie30_refclk>;
> +	clock-names =3D "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "pipe", "ref";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie30x2m1_pins>;
>  	reset-gpios =3D <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
> --
> 2.39.5
>=20
>=20





