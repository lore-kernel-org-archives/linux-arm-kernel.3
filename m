Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A483C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnnEVurKsE39VK48mQRlSprYtzG3NdBD2JmMXmTnB9A=; b=R0JtStBKVAsK77aWI98O7XyCdu
	aRqSERTQ0u8X9o1TFOtREj9lEIymkncwUptPNULD95ssLMuT52zBcn8iddNUtG584Nmnys2vg7MkT
	9OECNjbSRs3W68yv9F/OPVrO+kZdiymCG0pdTUimDqdleuYQmmr5Xv3IUxdFzUP1KrCsHKUA30haN
	h63HHupUxMgJ3M8Eq7crlNAY9uM3Pp153WiVSxNFTthqwqfzsdYXsHsCCUT+XIdlWrLPjAHl6YK7d
	kzaohUNYLF7GkS4fyj76dwcNbAfg3jtp2WBy6WqNTb69ryo5286PszsgomBfIa0B4HYbnrMdQTFM3
	CKN5VdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1TX-0000000CupT-3zP0;
	Fri, 25 Sep 2026 08:40:11 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1TU-0000000CuoU-1kES
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mnnEVurKsE39VK48mQRlSprYtzG3NdBD2JmMXmTnB9A=; b=jmfWB1hkHhyIf1MLqAlKpJjFjG
	rmnnv+vQotGLnRkpPJh52dMym9rkzC6XYqlHzjlwIRg08yVmmNdLHFMCUxroFesYd8ge4/19dFnuN
	9HjCYm0JH44xF8zk4699EQvaPbYkEMB+aycSf7u8M/rITLODvn/JYfoWuEeN3L0X0921LhuHSFJ9C
	/332+AGH7lx+e/XCnGRBXN/eFIQ9IcqrudFH7SB7w6I1VahvisI3oOPp/UWgVecK55RTDee9GTCC8
	FNigEuRr4aR9hDC6hioDoa60v9rNgzL0cAu8K4NMFWCWOdjGMLtP//A8aEHXCxwubtImSDlueMU7K
	r82OMMxg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xA1TA-000Ccs-2S;
	Fri, 25 Sep 2026 10:39:48 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xA1T9-000Dnx-2R;
	Fri, 25 Sep 2026 10:39:48 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, virtualization@lists.linux.dev,
 imx@lists.linux.dev, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>,
 Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs
Date: Fri, 25 Sep 2026 10:39:46 +0200
Message-ID: <3065678.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28134/Fri Sep 25 08:25:58 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_014008_572908_A1177EB2 
X-CRM114-Status: GOOD (  14.11  )
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

Am Mittwoch, 16. September 2026, 23:10:57 CEST schrieb Francesco Valla:
> Add rings for multiple vdevs, as well as the required virtio nodes for
> I2C, SPI and GPIO functionalities. On top of that, add example
> peripherals using all of them.
>=20
> NOTE: this is a Proof-Of-Concept, not meant to be integrated!
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>

Just a general question, unrelated to virtio, but related to AMP: How do you
manage the clocks, so that Linux doesn't disable clocks needed by the
Cortex-M?

Best regards
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++=
++++--
>  1 file changed, 119 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx93-11x11-frdm.dts
> index bd14ba28690c..dfa3b122ac5f 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -53,6 +53,32 @@ button-k3 {
>  		};
>  	};
> =20
> +	gpio-keys-virtio {
> +		compatible =3D "gpio-keys-polled";
> +		poll-interval =3D <100>;
> +
> +		button-v1 {
> +			label =3D "Button V1";
> +			linux,code =3D <BTN_3>;
> +			gpios =3D <&v_gpio 23 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		button-v2 {
> +			label =3D "Button V2";
> +			linux,code =3D <BTN_4>;
> +			gpios =3D <&v_gpio 24 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led {
> +			gpios =3D <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> +			label =3D "LED V";
> +		};
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible =3D "regulator-fixed";
>  		off-on-delay-us =3D <12000>;
> @@ -89,11 +115,6 @@ linux,cma {
>  			linux,cma-default;
>  		};
> =20
> -		rsc_table: rsc-table@2021e000 {
> -			reg =3D <0 0x2021e000 0 0x1000>;
> -			no-map;
> -		};
> -
>  		vdev0vring0: vdev0vring0@a4000000 {
>  			reg =3D <0 0xa4000000 0 0x8000>;
>  			no-map;
> @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
>  		};
> =20
>  		vdev1vring0: vdev1vring0@a4010000 {
> -			reg =3D <0 0xa4010000 0 0x8000>;
> +			reg =3D <0 0xa4010000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev2vring0: vdev2vring0@a4011000 {
> +			reg =3D <0 0xa4011000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev2vring1: vdev2vring1@a4013000 {
> +			reg =3D <0 0xa4013000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev3vring0: vdev3vring0@a4015000 {
> +			reg =3D <0 0xa4015000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev4vring0: vdev4vring0@a4017000 {
> +			reg =3D <0 0xa4017000 0 0x4000>;
> +			no-map;
> +		};
> +
> +		vdev5vring0: vdev5vring0@a401B000 {
> +			reg =3D <0 0xa401B000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev5vring1: vdev5vring1@a401D000 {
> +			reg =3D <0 0xa401D000 0 0x2000>;
>  			no-map;
>  		};
> =20
> -		vdev1vring1: vdev1vring1@a4018000 {
> -			reg =3D <0 0xa4018000 0 0x8000>;
> +		vdev5vring2: vdev5vring2@a401F000 {
> +			reg =3D <0 0xa401F000 0 0x1000>;
>  			no-map;
>  		};
> =20
> @@ -149,8 +200,67 @@ &cm33 {
>  		 <&mu1 3 1>;
>  	mbox-names =3D "tx", "rx", "rxdb";
>  	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> +			<&vdev3vring0>, <&vdev4vring0>,
> +			<&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;
>  	status =3D "okay";
> +
> +	virtio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		vdev@2 {
> +			reg =3D <2>;
> +
> +			v_gpio: gpio {
> +				compatible =3D "virtio,device29";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
> +		};
> +
> +		vdev@3 {
> +			reg =3D <3>;
> +
> +			i2c {
> +				compatible =3D "virtio,device22";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				eeprom@50 {
> +					compatible =3D "atmel,24c1025";
> +					reg =3D <0x50>;
> +				};
> +			};
> +		};
> +
> +		vdev@4 {
> +			reg =3D <4>;
> +
> +			spi {
> +				compatible =3D "virtio,device2d";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				sram@0 {
> +					compatible =3D "microchip,mchp23k256";
> +					reg =3D <0>;
> +					spi-max-frequency =3D <20000000>;
> +				};
> +
> +				lcd@1 {
> +					compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> +					reg =3D <1>;
> +					spi-max-frequency =3D <10000000>;
> +					dc-gpios =3D <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> +					reset-gpios =3D <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> +					rotation =3D <90>;
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &eqos {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



