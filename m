Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBOBE2lJJ4ubL1SZFxRHcJFjs6sCvB23xdXmM4GToK8=; b=3uQ2UKTQKqafsEttRawJL5lvnr
	1ExhsYL7xkYh5pIOGx7zbkPk2xnQdvXqJXCv/DhwzgT1wiwXE6Cjl9YTLkVRar1cv0PVZ5pEOAMH+
	Wc7mJrbxYw0bohf3szYaVr1AqbtoPo88q49Bzze72xlb54K9SC20rCNge+Pg15yDSPw0Mv3V7tMne
	uTdXi4dYfI7I4ODkCU/vh+muEJAqVCnZgawpLylYNi6HOtGJqN0E5mh9oARUEyqHe4QQDWHhVQPqM
	mebCzy8pm8FdOY4n0AP4q711HjepbNfAbsbNsb204mpGxAffWCniYsi+GZK0lTxYpyrSwbc0JQyXj
	ff71Auog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dEk-00000006e2F-3FKw;
	Fri, 17 Oct 2025 05:42:46 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dEi-00000006e1v-49Wf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 05:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760679762;
	bh=FBOBE2lJJ4ubL1SZFxRHcJFjs6sCvB23xdXmM4GToK8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hm0yU3a2z4bD4DKGw34ZbPDfR4rW6dPHM7WeC4kQPhcDJVhiSCwheDLG7f3xa0io2
	 5H/RYHexWp3moLpTsY05ufX3r1a7hG4pRri3O9/rWF1BwkofObOZcvlSrYycV0aCvw
	 REsTNvcvGFUcT+RqwUVeaChsa7nLBkhXXYTFN8O8177yP4u0tm+ranaQChlIQQVTQT
	 QSxuaeyPqBJSz/3EpmlmIJ1R7MiYaGKmPVNyx4yJsBzcQ/5D86RLiQVhPG82yIAogi
	 0GKMzuIzyg1tVgF91bMvdOtfyWDX4m8iD7aYuO15s1k1US+vBSe2AcUbZpz7Lx2rFF
	 Rt0o3NL2o9G0g==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E4193766F5;
	Fri, 17 Oct 2025 13:42:41 +0800 (AWST)
Message-ID: <eb9ed79a820b67d7d3dbb0ab7ec6349bf962fe9c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tan Siewert <tan@siewert.io>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Cc: Zev Weiss <zev@bewilderbeest.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 17 Oct 2025 16:12:41 +1030
In-Reply-To: <20251011112124.17588-3-tan@siewert.io>
References: <20251011112124.17588-1-tan@siewert.io>
	 <20251011112124.17588-3-tan@siewert.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_224245_223236_E1520920 
X-CRM114-Status: GOOD (  15.09  )
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

On Sat, 2025-10-11 at 13:21 +0200, Tan Siewert wrote:
> The ASRock Rack X470D4U X470D4U is a single-socket X470-based microATX
> motherboard for Ryzen processors with an AST2500 BMC and either 32MB or
> 64MB SPI flash.
>=20
> This mainboard exists in three known "flavors" which only differ in the
> used host NIC, the BMC SPI size and some parts that may be un-populated.
>=20
> To keep the complexity low with the BMC SPI, use the 32MB layout
> regardless of the used SPI or mainboard flavor.
>=20
> Signed-off-by: Tan Siewert <tan@siewert.io>
> ---
> v2:
> =C2=A0 - fix led node names [robh]
> =C2=A0 - fix missing gfx memory region and other offenses [Tan]
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-asrock-x470d4u.dts=C2=A0 | 350 ++++++++++=
++++++++
> =C2=A02 files changed, 351 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d=
4u.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 0f0b5b707654..c601af36915e 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-asrock-e3c256d4i.dtb \
> =C2=A0	aspeed-bmc-asrock-romed8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-spc621d8hm3.dtb \
> +	aspeed-bmc-asrock-x470d4u.dtb \
> =C2=A0	aspeed-bmc-asrock-x570d4u.dtb \
> =C2=A0	aspeed-bmc-asus-x4tf.dtb \
> =C2=A0	aspeed-bmc-bytedance-g220a.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
> new file mode 100644
> index 000000000000..e9804b0ace9f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
> @@ -0,0 +1,350 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model =3D "Asrock Rack X470D4U-series BMC";
> +	compatible =3D "asrock,x470d4u-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +	};
>=20
>=20

*snip*

> nvmem-cell-names =3D "mac-address";
> +};
> +
> +&mac1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii2_default &pinctrl_mdio2_default>;

If you're using NCSI you don't need the MDIO pins here, right?

> +	use-ncsi;
> +
> +	nvmem-cells =3D <&eth1_macaddress>;
> +	nvmem-cell-names =3D "mac-address";
> +};
> +

Andrew

