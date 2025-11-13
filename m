Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE7CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVXTH0Fs7IlCW/ANknvFrwELbCa+8jE//TvOJc2PI4w=; b=ESlm0yu9GnDSU7OcwnwcRxnKr/
	CfDahf5AZ+YpMQDwk9TGi1M2ielWosaMAMZLMgpRgLhbZv7iwRknPLg0jcQK5dRgbG/U22G6X5Wap
	40fJDo5Gknodfglclhztr6i0CwRyNO205HBFOa5Q6gON54+7/siYrxqB2GW90nz5MGkr1/Srev2pP
	jV6imx5VWIH2c094hZ1isAQnf9kejksn8iMn2obsCznKJHmi5u+dkqFVr6K8JIqxQPC7+HrpyqNca
	0soCsBoNyOMTXaOAomsEelsfHCZF8bYG/4v5XjWb2ZY7p1IhjyTOZ9Za1cF6pILPkPJjw8niwd3PU
	iKfnSlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdAM-0000000B1OW-1Geu;
	Thu, 13 Nov 2025 19:39:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdAK-0000000B1O6-0BKo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F47A4461E;
	Thu, 13 Nov 2025 19:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCA8C4CEF5;
	Thu, 13 Nov 2025 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062771;
	bh=KAWex1GOIW6PS1dlFxY8ETVyEcV50mZ4em/2EF+WvwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnKKG6aCfB9XUc6/Pt/z0d8ysk7NLPkiYWvlF2P5fM7TYxIHOBas5zr4uPuFEUvFm
	 KK/qAh+Zo52FzN8LtNoxNIy0wk6zAruosKST7+TxtiZ8G7+vx9ASsdriev7kbZfnbu
	 MJityj3mO+guC8eKXeC1+0PefZOKlNcKXwmlc4sTusXxpHreABmfEqQltR4OEHA9vl
	 liHNDc1x503TEi6QRa92R7/KFPkuY8GOPwopsu02xKZmzeESbo6n0+BZGXvjR9GxMd
	 OBlfh6XQo5RqU1il45VAtWdnUBInOpCV5uOx03OKbvtYzpWjdN8nsKs42yGElpLvCF
	 UcgKedKzobPWw==
Date: Thu, 13 Nov 2025 19:39:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: add sky1 reset controller
Message-ID: <20251113-kissing-uphill-e8eea3fa6f5c@spud>
References: <20251113075935.774359-1-gary.yang@cixtech.com>
 <20251113075935.774359-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yz8zv5OhRBRImQYW"
Content-Disposition: inline
In-Reply-To: <20251113075935.774359-2-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113932_146479_FA1C9ECC 
X-CRM114-Status: GOOD (  21.07  )
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


--Yz8zv5OhRBRImQYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 03:59:33PM +0800, Gary Yang wrote:
> There are two reset controllers on Cix sky1 Soc.
> One is located in S0 domain, and the other is located
> in S5 domain.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/reset/cix,sky1-rst.yaml          |  48 +++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  3 files changed, 254 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.=
yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
>=20
> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml b/=
Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> new file mode 100644
> index 000000000000..6339ed3f296a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Reset Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description: |
> +  CIX Sky1 reset controller can be used to reset various set of peripher=
als.
> +  There are two reset controllers, one is located in S0 domain, the other
> +  is located in S5 domain.
> +
> +  See also:
> +  - include/dt-bindings/reset/cix,sky1-rst.h
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-rst
> +          - cix,sky1-rst-fch
> +      - const: syscon

Why are these "syscon"s? I don't see that explained.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/cix,sky1-rst.h>
> +    reset-controller@16000000 {
> +      compatible =3D "cix,sky1-rst", "syscon";
> +      reg =3D <0x16000000 0x1000>;
> +      #reset-cells =3D <1>;
> +    };
> diff --git a/include/dt-bindings/reset/cix,sky1-rst-fch.h b/include/dt-bi=
ndings/reset/cix,sky1-rst-fch.h
> new file mode 100644
> index 000000000000..8e67d7eb92aa
> --- /dev/null
> +++ b/include/dt-bindings/reset/cix,sky1-rst-fch.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */
> +#ifndef DT_BINDING_RESET_FCH_SKY1_H
> +#define DT_BINDING_RESET_FCH_SKY1_H
> +
> +/* func reset for sky1 fch */
> +
> +#define SW_I3C0_RST_FUNC_G_N	0
> +#define SW_I3C0_RST_FUNC_I_N	1
> +#define SW_I3C1_RST_FUNC_G_N	2
> +#define SW_I3C1_RST_FUNC_I_N	3
> +#define SW_UART0_RST_FUNC_N	4
> +#define SW_UART1_RST_FUNC_N	5
> +#define SW_UART2_RST_FUNC_N	6
> +#define SW_UART3_RST_FUNC_N	7
> +#define SW_TIMER_RST_FUNC_N	8
> +
> +/* apb reset for sky1 fch */
> +#define SW_I3C0_RST_APB_N	9
> +#define SW_I3C1_RST_APB_N	10
> +#define SW_DMA_RST_AXI_N	11
> +#define SW_UART0_RST_APB_N	12
> +#define SW_UART1_RST_APB_N	13
> +#define SW_UART2_RST_APB_N	14
> +#define SW_UART3_RST_APB_N	15
> +#define SW_SPI0_RST_APB_N	16
> +#define SW_SPI1_RST_APB_N	17
> +#define SW_I2C0_RST_APB_N	18
> +#define SW_I2C1_RST_APB_N	19
> +#define SW_I2C2_RST_APB_N	20
> +#define SW_I2C3_RST_APB_N	21
> +#define SW_I2C4_RST_APB_N	22
> +#define SW_I2C5_RST_APB_N	23
> +#define SW_I2C6_RST_APB_N	24
> +#define SW_I2C7_RST_APB_N	25
> +#define SW_GPIO_RST_APB_N	26
> +
> +/* fch rst for xspi */
> +#define SW_XSPI_REG_RST_N	27
> +#define SW_XSPI_SYS_RST_N	28
> +
> +#endif
> diff --git a/include/dt-bindings/reset/cix,sky1-rst.h b/include/dt-bindin=
gs/reset/cix,sky1-rst.h
> new file mode 100644
> index 000000000000..72c0d6a60452
> --- /dev/null
> +++ b/include/dt-bindings/reset/cix,sky1-rst.h
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */
> +#ifndef DT_BINDING_RESET_SKY1_H
> +#define DT_BINDING_RESET_SKY1_H
> +
> +/* reset for csu_pm */
> +
> +#define SKY1_CSU_PM_RESET_N		0
> +#define SKY1_SENSORHUB_RESET_N		1
> +#define SKY1_SENSORHUB_NOC_RESET_N	2
> +
> +/* reset group0 for s0 domain modules */
> +#define SKY1_DDRC_RESET_N		3
> +#define SKY1_GIC_RESET_N		4
> +#define SKY1_CI700_RESET_N		5
> +#define SKY1_SYS_NI700_RESET_N		6
> +#define SKY1_MM_NI700_RESET_N		7
> +#define SKY1_PCIE_NI700_RESET_N		8
> +#define SKY1_GPU_RESET_N		9
> +#define SKY1_NPUTOP_RESET_N		10
> +#define SKY1_NPUCORE0_RESET_N		11
> +#define SKY1_NPUCORE1_RESET_N		12
> +#define SKY1_NPUCORE2_RESET_N		13
> +#define SKY1_VPU_RESET_N		14
> +#define SKY1_ISP_SRESET_N		15
> +#define SKY1_ISP_ARESET_N		16
> +#define SKY1_ISP_HRESET_N		17
> +#define SKY1_ISP_GDCRESET_N		18
> +#define SKY1_DPU_RESET0_N		19
> +#define SKY1_DPU_RESET1_N		20
> +#define SKY1_DPU_RESET2_N		21
> +#define SKY1_DPU_RESET3_N		22
> +#define SKY1_DPU_RESET4_N		23
> +#define SKY1_DP_RESET0_N		24
> +#define SKY1_DP_RESET1_N		25
> +#define SKY1_DP_RESET2_N		26
> +#define SKY1_DP_RESET3_N		27
> +#define SKY1_DP_RESET4_N		28
> +#define SKY1_DP_PHY_RST_N		29
> +
> +/* reset group1 for s0 domain modules */
> +#define SKY1_AUDIO_HIFI5_RESET_N	30
> +#define SKY1_AUDIO_HIFI5_NOC_RESET_N	31
> +#define SKY1_CSIDPHY_PRST0_N		32
> +#define SKY1_CSIDPHY_CMNRST0_N		33
> +#define SKY1_CSI0_RST_N			34
> +#define SKY1_CSIDPHY_PRST1_N		35
> +#define SKY1_CSIDPHY_CMNRST1_N		36
> +#define SKY1_CSI1_RST_N			37
> +#define SKY1_CSI2_RST_N			38
> +#define SKY1_CSI3_RST_N			39
> +#define SKY1_CSIBRDGE0_RST_N		40
> +#define SKY1_CSIBRDGE1_RST_N		41
> +#define SKY1_CSIBRDGE2_RST_N		42
> +#define SKY1_CSIBRDGE3_RST_N		43
> +#define SKY1_GMAC0_RST_N		44
> +#define SKY1_GMAC1_RST_N		45
> +#define SKY1_PCIE0_RESET_N		46
> +#define SKY1_PCIE1_RESET_N		47
> +#define SKY1_PCIE2_RESET_N		48
> +#define SKY1_PCIE3_RESET_N		49
> +#define SKY1_PCIE4_RESET_N		50
> +
> +/* reset group1 for usb phys */
> +#define SKY1_USB_DP_PHY0_PRST_N		51
> +#define SKY1_USB_DP_PHY1_PRST_N		52
> +#define SKY1_USB_DP_PHY2_PRST_N		53
> +#define SKY1_USB_DP_PHY3_PRST_N		54
> +#define SKY1_USB_DP_PHY0_RST_N		55
> +#define SKY1_USB_DP_PHY1_RST_N		56
> +#define SKY1_USB_DP_PHY2_RST_N		57
> +#define SKY1_USB_DP_PHY3_RST_N		58
> +#define SKY1_USBPHY_SS_PST_N		59
> +#define SKY1_USBPHY_SS_RST_N		60
> +#define SKY1_USBPHY_HS0_PRST_N		61
> +#define SKY1_USBPHY_HS1_PRST_N		62
> +#define SKY1_USBPHY_HS2_PRST_N		63
> +#define SKY1_USBPHY_HS3_PRST_N		64
> +#define SKY1_USBPHY_HS4_PRST_N		65
> +#define SKY1_USBPHY_HS5_PRST_N		66
> +#define SKY1_USBPHY_HS6_PRST_N		67
> +#define SKY1_USBPHY_HS7_PRST_N		68
> +#define SKY1_USBPHY_HS8_PRST_N		69
> +#define SKY1_USBPHY_HS9_PRST_N		70
> +
> +/* reset group1 for usb controllers */
> +#define SKY1_USBC_SS0_PRST_N		71
> +#define SKY1_USBC_SS1_PRST_N		72
> +#define SKY1_USBC_SS2_PRST_N		73
> +#define SKY1_USBC_SS3_PRST_N		74
> +#define SKY1_USBC_SS4_PRST_N		75
> +#define SKY1_USBC_SS5_PRST_N		76
> +#define SKY1_USBC_SS0_RST_N		77
> +#define SKY1_USBC_SS1_RST_N		78
> +#define SKY1_USBC_SS2_RST_N		79
> +#define SKY1_USBC_SS3_RST_N		80
> +#define SKY1_USBC_SS4_RST_N		81
> +#define SKY1_USBC_SS5_RST_N		82
> +#define SKY1_USBC_HS0_PRST_N		83
> +#define SKY1_USBC_HS1_PRST_N		84
> +#define SKY1_USBC_HS2_PRST_N		85
> +#define SKY1_USBC_HS3_PRST_N		86
> +#define SKY1_USBC_HS0_RST_N		87
> +#define SKY1_USBC_HS1_RST_N		88
> +#define SKY1_USBC_HS2_RST_N		89
> +#define SKY1_USBC_HS3_RST_N		90
> +
> +/* reset group0 for rcsu */
> +#define SKY1_AUDIO_RCSU_RESET_N			91
> +#define SKY1_CI700_RCSU_RESET_N			92
> +#define SKY1_CSI_RCSU0_RESET_N			93
> +#define SKY1_CSI_RCSU1_RESET_N			94
> +#define SKY1_CSU_PM_RCSU_RESET_N		95
> +#define SKY1_DDR_BROADCAST_RCSU_RESET_N		96
> +#define SKY1_DDR_CTRL_RCSU_0_RESET_N		97
> +#define SKY1_DDR_CTRL_RCSU_1_RESET_N		98
> +#define SKY1_DDR_CTRL_RCSU_2_RESET_N		99
> +#define SKY1_DDR_CTRL_RCSU_3_RESET_N		100
> +#define SKY1_DDR_TZC400_RCSU_0_RESET_N		101
> +#define SKY1_DDR_TZC400_RCSU_1_RESET_N		102
> +#define SKY1_DDR_TZC400_RCSU_2_RESET_N		103
> +#define SKY1_DDR_TZC400_RCSU_3_RESET_N		104
> +#define SKY1_DP0_RCSU_RESET_N			105
> +#define SKY1_DP1_RCSU_RESET_N			106
> +#define SKY1_DP2_RCSU_RESET_N			107
> +#define SKY1_DP3_RCSU_RESET_N			108
> +#define SKY1_DP4_RCSU_RESET_N			109
> +#define SKY1_DPU0_RCSU_RESET_N			110
> +#define SKY1_DPU1_RCSU_RESET_N			111
> +#define SKY1_DPU2_RCSU_RESET_N			112
> +#define SKY1_DPU3_RCSU_RESET_N			113
> +#define SKY1_DPU4_RCSU_RESET_N			114
> +#define SKY1_DSU_RCSU_RESET_N			115
> +#define SKY1_FCH_RCSU_RESET_N			116
> +#define SKY1_GICD_RCSU_RESET_N			117
> +#define SKY1_GMAC_RCSU_RESET_N			118
> +#define SKY1_GPU_RCSU_RESET_N			119
> +#define SKY1_ISP_RCSU0_RESET_N			120
> +#define SKY1_ISP_RCSU1_RESET_N			121
> +#define SKY1_NI700_MMHUB_RCSU_RESET_N		122
> +
> +/* reset group1 for rcsu */
> +#define SKY1_NPU_RCSU_RESET_N			123
> +#define SKY1_NI700_PCIE_RCSU_RESET_N		124
> +#define SKY1_PCIE_X421_RCSU_RESET_N		125
> +#define SKY1_PCIE_X8_RCSU_RESET_N		126
> +#define SKY1_SF_RCSU_RESET_N			127
> +#define SKY1_RCSU_SMMU_MMHUB_RESET_N		128
> +#define SKY1_RCSU_SMMU_PCIEHUB_RESET_N		129
> +#define SKY1_RCSU_SYSHUB_RESET_N		130
> +#define SKY1_NI700_SMN_RCSU_RESET_N		131
> +#define SKY1_NI700_SYSHUB_RCSU_RESET_N		132
> +#define SKY1_RCSU_USB2_HOST0_RESET_N		133
> +#define SKY1_RCSU_USB2_HOST1_RESET_N		134
> +#define SKY1_RCSU_USB2_HOST2_RESET_N		135
> +#define SKY1_RCSU_USB2_HOST3_RESET_N		136
> +#define SKY1_RCSU_USB3_TYPEA_DRD_RESET_N	137
> +#define SKY1_RCSU_USB3_TYPEC_DRD_RESET_N	138
> +#define SKY1_RCSU_USB3_TYPEC_HOST0_RESET_N	139
> +#define SKY1_RCSU_USB3_TYPEC_HOST1_RESET_N	140
> +#define SKY1_RCSU_USB3_TYPEC_HOST2_RESET_N	141
> +#define SKY1_VPU_RCSU_RESET_N			142
> +
> +#endif
> --=20
> 2.49.0
>=20

--Yz8zv5OhRBRImQYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYz7wAKCRB4tDGHoIJi
0o9vAP9Ng5A5I1/BoWwQacFJgKdkEBNUk7zGUTOiG6yrttjZAQEAr86SSHXQMidr
ye4OhbE4hwmmpgsuo9lvnD6+2Tz/SAU=
=oBDZ
-----END PGP SIGNATURE-----

--Yz8zv5OhRBRImQYW--

