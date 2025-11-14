Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA3FCE7AFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JqrXtDIWacf7LyJzGg6QNUUCciuiFlCgHcYaRzx5iQ=; b=Lq6ffyf7rFzUYDheOeZlHTXPo3
	iZ9+PLb+tZ/SnFplIo+EMTH3rTTNEZUESTs1Ytn08LJFHNzrfrC2jZggatEQsda0s8p2Z47ty+FBo
	gOgfsZ6QjLBCu5+wJ8HqPUhSGPefpxlakg9K9L/XX43R0pXdEEGFnzcmaQ8mhSr7mm6T7MLzfHleW
	ocCtDgT2zL9QQsKTkkMV3v9rOreLjRsFsvIj5KcmOzOL5P2o+ohCFpRRhQlins98lP0TQXHE/L1xG
	xNoLdmEWxOf85qOtricd68tu9voR2GBTcX9WVNi9JNXdRKEjkvne+0K3vsFrtjvkqozu+gJaQNO8z
	Q9U+Zq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy6O-0000000Cv1r-49Rj;
	Fri, 14 Nov 2025 18:00:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy6M-0000000Cv1b-40Bh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 18:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E17346017F;
	Fri, 14 Nov 2025 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFB6C113D0;
	Fri, 14 Nov 2025 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763143249;
	bh=e9XQZl86mEsvNS09VH+IEIv0jGQ7O2pqdXzZJddHorI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbR0JYdRObIpR/g+rNtoNF3yoLixD1Y10MJheoW5qWEBN9qAll0ZH62gJNTf6bVtE
	 0I8LcgDYc2WdpcHqqVda63LQYnd4TSbJXfpsZXKocBPwX2EvGzEa0Omp/ypUySSdsK
	 q9qUpxnJI6UUhvI0Puh7SeUr3qLnpcNs8nxzrUcT6ptFOxEhp/Zo2xl+xW6KHqncpl
	 PXgrspauobC8iPE0lPWlTerHeE5s4+6L5a/LYXmPh9J9mvCB9snxGf6jKH6PXr00fU
	 yXImkxp+588UJNog+qd7ICb4IB4GEGRPraByvHRpzipq4I9CKaphmAXXOjSZi0NY1u
	 J7HSPH26fm0YA==
Date: Fri, 14 Nov 2025 18:00:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v2 1/3]
 dt-bindings: reset: add sky1 reset controller
Message-ID: <20251114-problem-overbook-383f8e45cd0b@spud>
References: <20251113075935.774359-1-gary.yang@cixtech.com>
 <20251113075935.774359-2-gary.yang@cixtech.com>
 <20251113-kissing-uphill-e8eea3fa6f5c@spud>
 <PUZPR06MB5887EC14CD0613594F071A9AEFCAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XhYsjJrSxviGfhoG"
Content-Disposition: inline
In-Reply-To: <PUZPR06MB5887EC14CD0613594F071A9AEFCAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
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


--XhYsjJrSxviGfhoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 02:28:47AM +0000, Gary Yang wrote:
> Hi Conor:
>=20
> Thanks for your comments
>=20
> > On Thu, Nov 13, 2025 at 03:59:33PM +0800, Gary Yang wrote:
> > > There are two reset controllers on Cix sky1 Soc.
> > > One is located in S0 domain, and the other is located in S5 domain.
> > >
> > > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > > ---
> > >  .../bindings/reset/cix,sky1-rst.yaml          |  48 +++++
> > >  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
> > >  include/dt-bindings/reset/cix,sky1-rst.h      | 164
> > ++++++++++++++++++
> > >  3 files changed, 254 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > >  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
> > >  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > > b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > > new file mode 100644
> > > index 000000000000..6339ed3f296a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> > > @@ -0,0 +1,48 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: CIX Sky1 Reset Controller
> > > +
> > > +maintainers:
> > > +  - Gary Yang <gary.yang@cixtech.com>
> > > +
> > > +description: |
> > > +  CIX Sky1 reset controller can be used to reset various set of peri=
pherals.
> > > +  There are two reset controllers, one is located in S0 domain, the
> > > +other
> > > +  is located in S5 domain.
> > > +
> > > +  See also:
> > > +  - include/dt-bindings/reset/cix,sky1-rst.h
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - cix,sky1-rst
> > > +          - cix,sky1-rst-fch
> > > +      - const: syscon
> >=20
> > Why are these "syscon"s? I don't see that explained.
> >=20
>=20
> There are serval modules sharing the same register space on Cix Sky1 plat=
form.
>=20
> Maybe you will see these module later as we upstream more modules.
>=20
> If miss any information, please let me know

You need to describe these devices /now/ at least in part. Calling this
device "-rst" doesn't make sense if it turns out that only 10% of the
functionality is that. What else does it do?

>=20
> Best wishes
> Gary
>=20
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#reset-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#reset-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/reset/cix,sky1-rst.h>
> > > +    reset-controller@16000000 {
> > > +      compatible =3D "cix,sky1-rst", "syscon";
> > > +      reg =3D <0x16000000 0x1000>;
> > > +      #reset-cells =3D <1>;
> > > +    };
> > > diff --git a/include/dt-bindings/reset/cix,sky1-rst-fch.h
> > > b/include/dt-bindings/reset/cix,sky1-rst-fch.h
> > > new file mode 100644
> > > index 000000000000..8e67d7eb92aa
> > > --- /dev/null
> > > +++ b/include/dt-bindings/reset/cix,sky1-rst-fch.h
> > > @@ -0,0 +1,42 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */ #ifndef
> > > +DT_BINDING_RESET_FCH_SKY1_H #define DT_BINDING_RESET_FCH_SKY1_H
> > > +
> > > +/* func reset for sky1 fch */
> > > +
> > > +#define SW_I3C0_RST_FUNC_G_N	0
> > > +#define SW_I3C0_RST_FUNC_I_N	1
> > > +#define SW_I3C1_RST_FUNC_G_N	2
> > > +#define SW_I3C1_RST_FUNC_I_N	3
> > > +#define SW_UART0_RST_FUNC_N	4
> > > +#define SW_UART1_RST_FUNC_N	5
> > > +#define SW_UART2_RST_FUNC_N	6
> > > +#define SW_UART3_RST_FUNC_N	7
> > > +#define SW_TIMER_RST_FUNC_N	8
> > > +
> > > +/* apb reset for sky1 fch */
> > > +#define SW_I3C0_RST_APB_N	9
> > > +#define SW_I3C1_RST_APB_N	10
> > > +#define SW_DMA_RST_AXI_N	11
> > > +#define SW_UART0_RST_APB_N	12
> > > +#define SW_UART1_RST_APB_N	13
> > > +#define SW_UART2_RST_APB_N	14
> > > +#define SW_UART3_RST_APB_N	15
> > > +#define SW_SPI0_RST_APB_N	16
> > > +#define SW_SPI1_RST_APB_N	17
> > > +#define SW_I2C0_RST_APB_N	18
> > > +#define SW_I2C1_RST_APB_N	19
> > > +#define SW_I2C2_RST_APB_N	20
> > > +#define SW_I2C3_RST_APB_N	21
> > > +#define SW_I2C4_RST_APB_N	22
> > > +#define SW_I2C5_RST_APB_N	23
> > > +#define SW_I2C6_RST_APB_N	24
> > > +#define SW_I2C7_RST_APB_N	25
> > > +#define SW_GPIO_RST_APB_N	26
> > > +
> > > +/* fch rst for xspi */
> > > +#define SW_XSPI_REG_RST_N	27
> > > +#define SW_XSPI_SYS_RST_N	28
> > > +
> > > +#endif
> > > diff --git a/include/dt-bindings/reset/cix,sky1-rst.h
> > > b/include/dt-bindings/reset/cix,sky1-rst.h
> > > new file mode 100644
> > > index 000000000000..72c0d6a60452
> > > --- /dev/null
> > > +++ b/include/dt-bindings/reset/cix,sky1-rst.h
> > > @@ -0,0 +1,164 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */ #ifndef
> > > +DT_BINDING_RESET_SKY1_H #define DT_BINDING_RESET_SKY1_H
> > > +
> > > +/* reset for csu_pm */
> > > +
> > > +#define SKY1_CSU_PM_RESET_N		0
> > > +#define SKY1_SENSORHUB_RESET_N		1
> > > +#define SKY1_SENSORHUB_NOC_RESET_N	2
> > > +
> > > +/* reset group0 for s0 domain modules */
> > > +#define SKY1_DDRC_RESET_N		3
> > > +#define SKY1_GIC_RESET_N		4
> > > +#define SKY1_CI700_RESET_N		5
> > > +#define SKY1_SYS_NI700_RESET_N		6
> > > +#define SKY1_MM_NI700_RESET_N		7
> > > +#define SKY1_PCIE_NI700_RESET_N		8
> > > +#define SKY1_GPU_RESET_N		9
> > > +#define SKY1_NPUTOP_RESET_N		10
> > > +#define SKY1_NPUCORE0_RESET_N		11
> > > +#define SKY1_NPUCORE1_RESET_N		12
> > > +#define SKY1_NPUCORE2_RESET_N		13
> > > +#define SKY1_VPU_RESET_N		14
> > > +#define SKY1_ISP_SRESET_N		15
> > > +#define SKY1_ISP_ARESET_N		16
> > > +#define SKY1_ISP_HRESET_N		17
> > > +#define SKY1_ISP_GDCRESET_N		18
> > > +#define SKY1_DPU_RESET0_N		19
> > > +#define SKY1_DPU_RESET1_N		20
> > > +#define SKY1_DPU_RESET2_N		21
> > > +#define SKY1_DPU_RESET3_N		22
> > > +#define SKY1_DPU_RESET4_N		23
> > > +#define SKY1_DP_RESET0_N		24
> > > +#define SKY1_DP_RESET1_N		25
> > > +#define SKY1_DP_RESET2_N		26
> > > +#define SKY1_DP_RESET3_N		27
> > > +#define SKY1_DP_RESET4_N		28
> > > +#define SKY1_DP_PHY_RST_N		29
> > > +
> > > +/* reset group1 for s0 domain modules */
> > > +#define SKY1_AUDIO_HIFI5_RESET_N	30
> > > +#define SKY1_AUDIO_HIFI5_NOC_RESET_N	31
> > > +#define SKY1_CSIDPHY_PRST0_N		32
> > > +#define SKY1_CSIDPHY_CMNRST0_N		33
> > > +#define SKY1_CSI0_RST_N			34
> > > +#define SKY1_CSIDPHY_PRST1_N		35
> > > +#define SKY1_CSIDPHY_CMNRST1_N		36
> > > +#define SKY1_CSI1_RST_N			37
> > > +#define SKY1_CSI2_RST_N			38
> > > +#define SKY1_CSI3_RST_N			39
> > > +#define SKY1_CSIBRDGE0_RST_N		40
> > > +#define SKY1_CSIBRDGE1_RST_N		41
> > > +#define SKY1_CSIBRDGE2_RST_N		42
> > > +#define SKY1_CSIBRDGE3_RST_N		43
> > > +#define SKY1_GMAC0_RST_N		44
> > > +#define SKY1_GMAC1_RST_N		45
> > > +#define SKY1_PCIE0_RESET_N		46
> > > +#define SKY1_PCIE1_RESET_N		47
> > > +#define SKY1_PCIE2_RESET_N		48
> > > +#define SKY1_PCIE3_RESET_N		49
> > > +#define SKY1_PCIE4_RESET_N		50
> > > +
> > > +/* reset group1 for usb phys */
> > > +#define SKY1_USB_DP_PHY0_PRST_N		51
> > > +#define SKY1_USB_DP_PHY1_PRST_N		52
> > > +#define SKY1_USB_DP_PHY2_PRST_N		53
> > > +#define SKY1_USB_DP_PHY3_PRST_N		54
> > > +#define SKY1_USB_DP_PHY0_RST_N		55
> > > +#define SKY1_USB_DP_PHY1_RST_N		56
> > > +#define SKY1_USB_DP_PHY2_RST_N		57
> > > +#define SKY1_USB_DP_PHY3_RST_N		58
> > > +#define SKY1_USBPHY_SS_PST_N		59
> > > +#define SKY1_USBPHY_SS_RST_N		60
> > > +#define SKY1_USBPHY_HS0_PRST_N		61
> > > +#define SKY1_USBPHY_HS1_PRST_N		62
> > > +#define SKY1_USBPHY_HS2_PRST_N		63
> > > +#define SKY1_USBPHY_HS3_PRST_N		64
> > > +#define SKY1_USBPHY_HS4_PRST_N		65
> > > +#define SKY1_USBPHY_HS5_PRST_N		66
> > > +#define SKY1_USBPHY_HS6_PRST_N		67
> > > +#define SKY1_USBPHY_HS7_PRST_N		68
> > > +#define SKY1_USBPHY_HS8_PRST_N		69
> > > +#define SKY1_USBPHY_HS9_PRST_N		70
> > > +
> > > +/* reset group1 for usb controllers */
> > > +#define SKY1_USBC_SS0_PRST_N		71
> > > +#define SKY1_USBC_SS1_PRST_N		72
> > > +#define SKY1_USBC_SS2_PRST_N		73
> > > +#define SKY1_USBC_SS3_PRST_N		74
> > > +#define SKY1_USBC_SS4_PRST_N		75
> > > +#define SKY1_USBC_SS5_PRST_N		76
> > > +#define SKY1_USBC_SS0_RST_N		77
> > > +#define SKY1_USBC_SS1_RST_N		78
> > > +#define SKY1_USBC_SS2_RST_N		79
> > > +#define SKY1_USBC_SS3_RST_N		80
> > > +#define SKY1_USBC_SS4_RST_N		81
> > > +#define SKY1_USBC_SS5_RST_N		82
> > > +#define SKY1_USBC_HS0_PRST_N		83
> > > +#define SKY1_USBC_HS1_PRST_N		84
> > > +#define SKY1_USBC_HS2_PRST_N		85
> > > +#define SKY1_USBC_HS3_PRST_N		86
> > > +#define SKY1_USBC_HS0_RST_N		87
> > > +#define SKY1_USBC_HS1_RST_N		88
> > > +#define SKY1_USBC_HS2_RST_N		89
> > > +#define SKY1_USBC_HS3_RST_N		90
> > > +
> > > +/* reset group0 for rcsu */
> > > +#define SKY1_AUDIO_RCSU_RESET_N			91
> > > +#define SKY1_CI700_RCSU_RESET_N			92
> > > +#define SKY1_CSI_RCSU0_RESET_N			93
> > > +#define SKY1_CSI_RCSU1_RESET_N			94
> > > +#define SKY1_CSU_PM_RCSU_RESET_N		95
> > > +#define SKY1_DDR_BROADCAST_RCSU_RESET_N		96
> > > +#define SKY1_DDR_CTRL_RCSU_0_RESET_N		97
> > > +#define SKY1_DDR_CTRL_RCSU_1_RESET_N		98
> > > +#define SKY1_DDR_CTRL_RCSU_2_RESET_N		99
> > > +#define SKY1_DDR_CTRL_RCSU_3_RESET_N		100
> > > +#define SKY1_DDR_TZC400_RCSU_0_RESET_N		101
> > > +#define SKY1_DDR_TZC400_RCSU_1_RESET_N		102
> > > +#define SKY1_DDR_TZC400_RCSU_2_RESET_N		103
> > > +#define SKY1_DDR_TZC400_RCSU_3_RESET_N		104
> > > +#define SKY1_DP0_RCSU_RESET_N			105
> > > +#define SKY1_DP1_RCSU_RESET_N			106
> > > +#define SKY1_DP2_RCSU_RESET_N			107
> > > +#define SKY1_DP3_RCSU_RESET_N			108
> > > +#define SKY1_DP4_RCSU_RESET_N			109
> > > +#define SKY1_DPU0_RCSU_RESET_N			110
> > > +#define SKY1_DPU1_RCSU_RESET_N			111
> > > +#define SKY1_DPU2_RCSU_RESET_N			112
> > > +#define SKY1_DPU3_RCSU_RESET_N			113
> > > +#define SKY1_DPU4_RCSU_RESET_N			114
> > > +#define SKY1_DSU_RCSU_RESET_N			115
> > > +#define SKY1_FCH_RCSU_RESET_N			116
> > > +#define SKY1_GICD_RCSU_RESET_N			117
> > > +#define SKY1_GMAC_RCSU_RESET_N			118
> > > +#define SKY1_GPU_RCSU_RESET_N			119
> > > +#define SKY1_ISP_RCSU0_RESET_N			120
> > > +#define SKY1_ISP_RCSU1_RESET_N			121
> > > +#define SKY1_NI700_MMHUB_RCSU_RESET_N		122
> > > +
> > > +/* reset group1 for rcsu */
> > > +#define SKY1_NPU_RCSU_RESET_N			123
> > > +#define SKY1_NI700_PCIE_RCSU_RESET_N		124
> > > +#define SKY1_PCIE_X421_RCSU_RESET_N		125
> > > +#define SKY1_PCIE_X8_RCSU_RESET_N		126
> > > +#define SKY1_SF_RCSU_RESET_N			127
> > > +#define SKY1_RCSU_SMMU_MMHUB_RESET_N		128
> > > +#define SKY1_RCSU_SMMU_PCIEHUB_RESET_N		129
> > > +#define SKY1_RCSU_SYSHUB_RESET_N		130
> > > +#define SKY1_NI700_SMN_RCSU_RESET_N		131
> > > +#define SKY1_NI700_SYSHUB_RCSU_RESET_N		132
> > > +#define SKY1_RCSU_USB2_HOST0_RESET_N		133
> > > +#define SKY1_RCSU_USB2_HOST1_RESET_N		134
> > > +#define SKY1_RCSU_USB2_HOST2_RESET_N		135
> > > +#define SKY1_RCSU_USB2_HOST3_RESET_N		136
> > > +#define SKY1_RCSU_USB3_TYPEA_DRD_RESET_N	137
> > > +#define SKY1_RCSU_USB3_TYPEC_DRD_RESET_N	138
> > > +#define SKY1_RCSU_USB3_TYPEC_HOST0_RESET_N	139
> > > +#define SKY1_RCSU_USB3_TYPEC_HOST1_RESET_N	140
> > > +#define SKY1_RCSU_USB3_TYPEC_HOST2_RESET_N	141
> > > +#define SKY1_VPU_RCSU_RESET_N			142
> > > +
> > > +#endif
> > > --
> > > 2.49.0
> > >

--XhYsjJrSxviGfhoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRduTQAKCRB4tDGHoIJi
0pqZAP9TCvZJO8xg5xkkZRXBxlQD4PRgCqAZa91tcoIcFlUYjgD4hvHD/cuLnJfX
KRmhRyjIp7kH4xMAesV1UsElfn1cAw==
=BrR7
-----END PGP SIGNATURE-----

--XhYsjJrSxviGfhoG--

