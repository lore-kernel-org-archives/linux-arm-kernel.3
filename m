Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDC5CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FibP0s8DsDRdRncEUYqsAz/ECZHtws1JsEgePtJvE8Y=; b=ctrZwRUj/DvEAuxNjS/5ISRmua
	14umdtlARp8UQuOtPqL3UgrA5uHC6W45VKuk8AvvSECX7myBrgvs7cCk11xbwjwIUJfZt5GuL6DoO
	P0Ho4MLObnYtIF/DeXhpGU4FNhznk01kO/ym4YWiVFDF5DHw652Mmhmt1DU3IkHD5VbK8pFKwfldk
	9Zn5Pa2x+B48iXeGEF62lTVVyOceIsOJlEg9Y0kIKKRy5kKTI2U8fTntLNUVg2X6ai3jhKRUpfFOR
	ETQ3/PD3fX9duvbOybX94LI6yTlQ4+A1tp07Xeib7D+vn4Gd9LGEoiLFnMb7QbElktO3i3BJahf+B
	3sPqNbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjef-0000000AKXu-2cIP;
	Sun, 31 Aug 2025 15:07:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjbw-0000000AKFL-1RpV;
	Sun, 31 Aug 2025 15:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FibP0s8DsDRdRncEUYqsAz/ECZHtws1JsEgePtJvE8Y=; b=cPpv6qlPTEnbNultnuF78/ObsZ
	AIKnE4RuwUdabNTi4jRz45mFbmRfArz4IW6ike0/r3Xu/W9X/375j7UZmiBWXZJEHEamxRpNynWxL
	Cu0TYqtV0mhrm9mlUo7vTTisqt1lSxfqkLnJTkQ4PnVlcAe8ypN9kPwjKkzlP7jsT0p1FVlu1Bqnd
	hCK/lGaOHH4G2Nr8TPya/dsBLmavC9S5wIc6z2Gp3FbEGMSPgL84l+Xmp0xs8gKWU2aqb8vHsRvrZ
	cs+bHCI/QbaLu0B5B0rzb76oUTyJ7+RfIOxSpDRWUq5RICFnN5wAbwQgffL/tvEZikO6JnGtfRstr
	6IsWn1Qw==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjbr-0006Xs-Pd; Sun, 31 Aug 2025 17:04:47 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 5/7] ARM: dts: rockchip: Add display subsystem for RK3368
Date: Sun, 31 Aug 2025 17:04:47 +0200
Message-ID: <3368190.aeNJFYEL58@diego>
In-Reply-To: <20250831104855.45883-6-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-6-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_080452_386036_62EC1E08 
X-CRM114-Status: GOOD (  13.45  )
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

Am Sonntag, 31. August 2025, 12:48:53 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> Add vop and display-subsystem nodes to RK3368's device tree.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

please use the appropriate patch prefix. For arm64 this should be
arm64: dts: rockchip:

The one you're using is from the arm32 side.

Also please sort things appropriately both node-position and order of
properties inside nodes, see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/dts-coding-style.rst


Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3368.dtsi
> index 73618df7a..0e47bf59a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -858,6 +858,32 @@ vop_mmu: iommu@ff930300 {
>  		status =3D "disabled";
>  	};
> =20
> +	vop: vop@ff930000 {
> +		compatible =3D "rockchip,rk3368-vop";
> +		reg =3D <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0x400>;
> +		reg-names =3D "regs", "gamma_lut";
> +		interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
> +		clock-names =3D "aclk_vop", "dclk_vop", "hclk_vop";
> +		assigned-clocks =3D <&cru ACLK_VOP>, <&cru HCLK_VOP>;
> +		assigned-clock-rates =3D <400000000>, <200000000>;
> +		resets =3D <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LC=
DC0_DCLK>;
> +		reset-names =3D "axi", "ahb", "dclk";
> +		iommus =3D <&vop_mmu>;
> +		status =3D "disabled";
> +
> +		vop_out: port {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +	};
> +
> +	display_subsystem: display-subsystem {
> +		compatible =3D "rockchip,display-subsystem";
> +		ports =3D <&vop_out>;
> +		status =3D "disabled";
> +	};
> +
>  	hevc_mmu: iommu@ff9a0440 {
>  		compatible =3D "rockchip,iommu";
>  		reg =3D <0x0 0xff9a0440 0x0 0x40>,
>=20





