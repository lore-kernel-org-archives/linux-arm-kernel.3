Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EC3CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 04:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGxmJ8QZDdmCANyNTUXphiMPhE3zn5mb8hMghM2V7h4=; b=ONJJRVi8i4YpSrTO34MBkiMkNS
	CqPN0WObBXO4kqEIzLWzNiGavoYouwOaQ1iK1xfE2P6LVImB0MUiiVhMKLAHpIx8ouvfWh5ejdPSp
	igPHj/BkjHrbyIIj7/76FwuvZRRLhnn4+vGR1zKZ9Pl7tjZis0QE3Z68UGxsDt4OjR2mWKVMKzOTu
	fQ8VbLP6UVIO8miLPxja93tfuzr+yYSDA5+uS8pNxc7iO/2V3RbM2/tc6O37Hag8TFioZ8HhPAHfp
	V+BUDc1p8PuEzwKxCdYYlaWimidOUemC6eNdGlSfGpivx2pRNxOUjry5QAdoLWK3KygNNQMOfJtJ0
	4CEOrXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlEa-0000000BX1r-1O87;
	Fri, 14 Nov 2025 04:16:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlEU-0000000BX1P-3i7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 04:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763093780;
	bh=dGxmJ8QZDdmCANyNTUXphiMPhE3zn5mb8hMghM2V7h4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TpC08zSh2Ei57vzT6d/aAKdHeib95GVeaL78ng0PoWlOhiZLhVjpw7XlWRAFaOQ1q
	 qhUFu5R752QfjvGEZ+JyQ0yvjI7958Kh9bAmGOM8h0lfOTxmVSqDpzRYeBxNlAJY1z
	 9oshk8hwFa2vepgB+rb5GNukxDmxVDczF4ztMllPvc4AaY4DYo4akDVSS392WDhokz
	 IglLWALpyy3UBMcwKh2Hyt4Y2Y+w3ZlvLjHB191KnrZiwcW0m8GlRCVasgk/jrsqXE
	 zp61htxLbjXnxNOXQgVXQ499qFm2UtbsWYbGNHwbdGyU3F2mFYvFr3TWOuwx5YkdPU
	 oRDV87jrmXa2A==
Received: from [192.168.68.115] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 23D79783DF;
	Fri, 14 Nov 2025 12:16:20 +0800 (AWST)
Message-ID: <a030d7a2e2d36064bd86fe2af1ec6e4baabd9946.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 14:46:19 +1030
In-Reply-To: <20251108-msx1_devicetree-v3-2-c7cb477ade27@nvidia.com>
References: <20251108-msx1_devicetree-v3-0-c7cb477ade27@nvidia.com>
	 <20251108-msx1_devicetree-v3-2-c7cb477ade27@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_201623_132563_867A3F66 
X-CRM114-Status: GOOD (  13.37  )
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

On Sat, 2025-11-08 at 14:24 -0800, Marc Olberding wrote:
> Adds a dts for the nvidia mgx pcie switchboard reference
> platformi hpm. This is a dual socket granite rapids based platform.
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts | 235 ++++++++++=
+++++++++++
> =C2=A02 files changed, 236 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 0f0b5b7076545e6babb2f25f302b5d70b71d8a19..c3ce0d218b53f2b4c37061cac=
e483f5f2c6d3bf1 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-lenovo-hr855xg2.dtb \
> =C2=A0	aspeed-bmc-microsoft-olympus.dtb \
> =C2=A0	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
> +	aspeed-bmc-nvidia-msx4-bmc.dtb \
> =C2=A0	aspeed-bmc-opp-lanyang.dtb \
> =C2=A0	aspeed-bmc-opp-mowgli.dtb \
> =C2=A0	aspeed-bmc-opp-nicole.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts b/ar=
ch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..ad476a093293f807c04f7e708=
58af1f557c17370
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
> @@ -0,0 +1,235 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model =3D "AST2600 MSX4 Kernel";

I find this to be a curious model name :)

Are there no other reasonable names?

> +	compatible =3D "nvidia,msx4-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 =3D &uart1;
> +		serial1 =3D &uart2;
> +		serial2 =3D &uart3;
> +		serial3 =3D &uart4;
> +		serial4 =3D &uart5;

Just checking whether you're actually using all of these? I guess the
uart nodes further down suggest so?

> +	};
> +
> +	chosen {
> +		stdout-path =3D "uart5:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			compatible =3D "shared-dma-pool";
> +			size =3D <0x01000000>;
> +			alignment =3D <0x01000000>;
> +			reusable;
> +		};
> +
> +		video_engine_memory: jpegbuffer {
> +			compatible =3D "shared-dma-pool";
> +			size =3D <0x02000000>;	/* 32M */
> +			alignment =3D <0x01000000>;
> +			reusable;
> +		};
> +	};
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		label =3D "bmc";
> +		spi-tx-bus-width =3D <4>;
> +		spi-rx-bus-width =3D <4>;
> +		status =3D "okay";
> +		#include "openbmc-flash-layout-128.dtsi"
> +	};
> +};
> +
> +&gfx {
> +	memory-region =3D <&gfx_memory>;
> +	status =3D "okay";
> +};
> +
> +&gpio0 {
> +	gpio-line-names =3D
> +	/*A0-A7*/	"","","","","","","","",
> +	/*B0-B7*/	"ASSERT_BMC_READY","","","","","","","",
> +	/*C0-C7*/	"MON_PWR_GOOD","","","","","","","FP_ID_LED_N",
> +	/*D0-D7*/	"","","","","","","","",
> +	/*E0-E7*/	"","","","","","","","",
> +	/*F0-F7*/	"","","","","","","","",
> +	/*G0-G7*/	"","","FP_LED_STATUS_GREEN_N","FP_LED_STATUS_AMBER_N",
> +			"","","","",
> +	/*H0-H7*/	"","","","","","","","",
> +	/*I0-I7*/	"","","","","","","","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"","","","","","","","",
> +	/*O0-O7*/	"","","","","","","","",
> +	/*P0-P7*/	"MON_PWR_BTN_L","ASSERT_PWR_BTN_L","MON_RST_BTN_L",
> +			"ASSERT_RST_BTN_L","","ASSERT_NMI_BTN_L","","",
> +	/*Q0-Q7*/	"","","MEMORY_HOT_0","MEMORY_HOT_1","","","","",
> +	/*R0-R7*/	"ID_BTN","","","","","VBAT_GPIO","","",
> +	/*S0-S7*/	"","","RST_PCA_MUX","","","","","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	"","","","","","","","",
> +	/*Z0-Z7*/	"","","","","","","","";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =3D
> +	/*18A0-18A7*/ "","","","","","","","",
> +	/*18B0-18B7*/ "","","","","","","","",
> +	/*18C0-18C7*/ "","","","","","","","",
> +	/*18D0-18D7*/ "","","","","","","","",
> +	/*18E0-18E3*/ "","","BMC_INIT_DONE","";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +
> +	eeprom@51 {
> +		compatible =3D "atmel,24c256";
> +		reg =3D <0x51>;
> +		pagesize =3D <64>;
> +		label =3D "sku";
> +	};
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +};
> +
> +&i2c6 {
> +	status =3D "okay";
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +};
> +
> +&i2c8 {
> +	status =3D "okay";
> +};
> +
> +&i2c9 {
> +	status =3D "okay";
> +};
> +
> +&i2c10 {
> +	status =3D "okay";
> +};
> +
> +&i2c11 {
> +	status =3D "okay";
> +};
> +
> +&i2c12 {
> +	status =3D "okay";
> +};
> +
> +&i2c13 {
> +	status =3D "okay";
> +};
> +
> +&i2c15 {
> +	status =3D "okay";
> +};
> +

Seems curious to enable all of these I2C controllers yet have no
devices under them? Can you elaborate?

Andrew

> +&kcs1 {
> +	aspeed,lpc-io-reg =3D <0xca0>;
> +	status =3D "okay";
> +};
> +
> +&kcs2 {
> +	aspeed,lpc-io-reg =3D <0xca8>;
> +	status =3D "okay";
> +};
> +
> +&kcs3 {
> +	aspeed,lpc-io-reg =3D <0xca2>;
> +	status =3D "okay";
> +};
> +
> +&lpc_reset {
> +	status =3D "okay";
> +};
> +
> +&rtc {
> +	status =3D "okay";
> +};
> +
> +&sgpiom0 {
> +	ngpios =3D <80>;
> +	status =3D "okay";
> +};
> +
> +&uart_routing {
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	status =3D "okay";
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +};
> +
> +&uart4 {
> +	status =3D "okay";
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&video {
> +	memory-region =3D <&video_engine_memory>;
> +	status =3D "okay";
> +};

