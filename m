Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1430ECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 05:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13NPlfGbvgDFw8RrLUwVeJRg6pjNha4obGTNg9Fzl5w=; b=24fh8ydNcQhNVhyz24heEcyF5s
	Omk0SJ6Sq76MaYMGBL3AHGok1sk65rZVWoTjx7DKPrNy+YPRSmUDZl+HXSeJeucBRWqMZf6ghrroX
	rszkyIuDg2dMbvdZYRu8jBXCKwcBdrcK5UY3JgLig4swlrHskdBJvTKrI+oGlBAK09hBisYzvNqeL
	vFlXEk/VcV4vTmACCFWrQV9+tVO2xtQ22KPtPDbxoR+XX7cwIgJ67aOZE5pn3x28SWFUPb3327bry
	o9nX9QSag9blh87OwVoPZqmbVYIRJeziofp3O/ubUnTXeU/rdEkfspYRKBBMC7GxxKsSnSLXb+s+z
	xtcVm58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1MO-00000002oJB-346B;
	Mon, 15 Sep 2025 05:02:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1MM-00000002oIj-1dzm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 05:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757912556;
	bh=13NPlfGbvgDFw8RrLUwVeJRg6pjNha4obGTNg9Fzl5w=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=htf09HkZFncGYF0Rk8VAKDviUA7EafLlMxtWRN/F0fsy/5RzAISL02kbcEX+N3Hpf
	 gmYX+/6Ugp/r+8NcNHWSJJ57fuGIVId3f/v9GNVSx+Thn7pSlRSiOaM4n38n6kp9+a
	 ZTAv/UH4ezzW3W//f6WHKC3Hg56oOsdoknqCzWvaX7MgsgexrA6Pbvso0IN+Lz+0GK
	 9w/a1w7hH57eD7+hD+/VwuUX51By8eHIP5/BO3Neo2XdCnsdjCKjQUCPEx2DEwHxEf
	 41+nNknmci6emz4/Uema0AIslKYe5kNKmEpyLCXa1rgQ4z7ADlg+30GHu2GU3JwFpO
	 Pga+GDAX/L9KA==
Received: from [IPv6:2405:6e00:2430:fb15:b2b4:1872:3690:c682] (unknown [120.20.190.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 04C2364CF0;
	Mon, 15 Sep 2025 13:02:33 +0800 (AWST)
Message-ID: <bb4509319d8d6a72b4d6c4a21c0362c76196fd52.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rebecca Cran <rebecca@bsdio.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 14:32:32 +0930
In-Reply-To: <20250911051009.4044609-3-rebecca@bsdio.com>
References: <20250911051009.4044609-1-rebecca@bsdio.com>
	 <20250911051009.4044609-3-rebecca@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_220238_630109_CB33D681 
X-CRM114-Status: GOOD (  14.41  )
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

On Wed, 2025-09-10 at 23:10 -0600, Rebecca Cran wrote:
> The ALTRAD8 BMC is an Aspeed AST2500-based BMC for the ASRock Rack
> ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards.
>=20
> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts | 647
> ++++++++++++++++++++
> =C2=A02 files changed, 648 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile
> b/arch/arm/boot/dts/aspeed/Makefile
> index aba7451ab749..6bffb7130839 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-ampere-mtjefferson.dtb \
> =C2=A0	aspeed-bmc-ampere-mtmitchell.dtb \
> =C2=A0	aspeed-bmc-arm-stardragon4800-rep2.dtb \
> +	aspeed-bmc-asrock-altrad8.dtb \
> =C2=A0	aspeed-bmc-asrock-e3c246d4i.dtb \
> =C2=A0	aspeed-bmc-asrock-e3c256d4i.dtb \
> =C2=A0	aspeed-bmc-asrock-romed8hm3.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts
> new file mode 100644
> index 000000000000..61f6cf8018c0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-altrad8.dts
> @@ -0,0 +1,647 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model =3D "ASRock ALTRAD8 BMC";
> +	compatible =3D "asrock,altrad8-bmc", "aspeed,ast2500";
> +

*snip*

> +};
> +
> +&uart1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_txd1_default
> +			 &pinctrl_rxd1_default
> +			 &pinctrl_ncts1_default
> +			 &pinctrl_nrts1_default>;
> +};
> +
> +&uart2 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_txd2_default
> +			 &pinctrl_rxd2_default>;
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_txd3_default
> +			 &pinctrl_rxd3_default>;
> +};
> +
> +&uart4 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_txd4_default
> +			 &pinctrl_rxd4_default>;
> +};
> +
> +/* The BMC's uart */
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&mac0 {

Recently I've decided that I'd like the "usual" node references here in
the DTS to be ordered alphabetically. The style guide gives us two
ordering options, either by ascending unit address or alphabetically:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
nodes

Without the unit address being visible it's hard to verify the former,
hence the preference for the latter.

Can you please sort these accordingly?

> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii1_default>;
> +	clocks =3D <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +		 <&syscon ASPEED_CLK_MAC1RCLK>;
> +	clock-names =3D "MACCLK", "RCLK";
> +	use-ncsi;
> +
> +	nvmem-cells =3D <&eth0_macaddress>;
> +	nvmem-cell-names =3D "mac-address";
> +};
>=20

*snip*

> +
> +&i2c3 {
> +	status =3D "okay";
> +
> +	power-supply@3c {
> +		compatible =3D "pmbus";

Devicetrees describe the hardware and not abstract protocols like
PMBus, so the compatible string must refer to a specific
manufacturer,model here.

Cheers,

Andrew

