Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C24CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6wJaGg0mzDKlmtNK7x71kNik7/sUjJTXNgG9/ByQWQ=; b=NESfpj4/FkUUYoww3nn5MTRXfr
	GPPvo86roPm104axwyfZboS8H7Ep2S/b80N37R+P4FicBThVwhFOY2V8E2xFKJZoM4kXa/0h9/tjk
	Jhj43bKgo2rHWJezujcB2uzClkAQnaoQ8OMap4JTQgSBVyc0C5gHAEqGrYUoTg7I6PCrkwbJnkp0D
	C5XX4lP8CH20PLKToDLVi8J/PfkJRn6Pdq3gVf7LNeUg1YmX7zQA5/tf1xZRarEKJeD2SOzg4nODr
	r3PCH2T2omnuxJuOhhcTsGx7qcHmnounm4XrYpcqXYF5UB4Hy4nZ5GKLRqFKxp9CNpZF/pMw1nGgY
	eHdWvzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1N7S-0000000GgAD-3Vi7;
	Wed, 24 Sep 2025 10:53:06 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1N7P-0000000Gg6v-2Cq1;
	Wed, 24 Sep 2025 10:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1758711162; x=1759315962; i=wahrenst@gmx.net;
	bh=L6wJaGg0mzDKlmtNK7x71kNik7/sUjJTXNgG9/ByQWQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=I8FAc/sy55yGjSnvt6gEQG+zOfeZpfvU+LXuRZ3de+I6EA9dhoBw8jxlhpHRyj9n
	 R8nCA+rQami1SReBYsHTGFH/1ycPNiN7cplqaeieAMbr4tGcQhLozVUaaRmNG1RAf
	 p1fNuFcTa9AANC84KjoHcUvmdsJMNn3LahzwtAZlVAV6YwCUqdNKSVio+SsZPq8oD
	 730Ozpx/Cy7imuyoqUM7k3v2y/syvyLiQTBghUBPRgLE29GO2vKKTAUMPIPiTkE0y
	 vyEsP+KAcijr5iPEyC3XGydI1nXJW8GKmxyfy32IjaVE8YgaXaDPW8+inVpzBU5Tn
	 B1G1/UeXD/AgTewijA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiHl-1uhmgn2ia7-00Lb0u; Wed, 24
 Sep 2025 12:52:42 +0200
Message-ID: <3659a5c5-12cb-47c7-bcb1-06c8955ed910@gmx.net>
Date: Wed, 24 Sep 2025 12:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250924085712.1040284-1-pbrobinson@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250924085712.1040284-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tgoqPdWzh2Zvou1QF4lN6l/UZX/YBcy+g/qeBbgGB6CIhbMtj8G
 JOeiCtUnngfA93QUAmjH2C8q5rOLvV1q3WwTb68BXmHbf97gbyiYWziv+u540ShuxIy2Nd4
 5YnNbCPzF3G0n+3rck25qjfcd7DbZB2y5jNWWpfNIYgHHef4gPDr/grO5WOEkFF41laDE46
 nuXAqv0MX0+OdbTYQ2ECg==
UI-OutboundReport: notjunk:1;M01:P0:Si6wgPgL4fY=;G+3ZjfeWQpGYHDFY+qSZlmjCo+D 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_035303_857086_3450A956 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Peter,

Am 24.09.25 um 10:57 schrieb Peter Robinson:
> Typically non critical IP in a SoC are disabled by
> default in the SoC .dtsi and enabled on board specific
> configs. There are usecases, such as some CM5 carrier
> boards, where display output may not be desired or
> connected. So disable them on the SoC .dtsi and enable
> them on the RPi5 board.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Andrea della Porta <andrea.porta@suse.com>
> Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support=
 to BCM2712")
I'm fine with this change in general, but I don't think this is a fix.=20
Especially there is no CM5 support upstream yet.

Except of this:

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 31 +++++++++++++++++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++++
>   2 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/=
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> index 6ea3c102e0d67..359c262b8d956 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> @@ -97,19 +97,42 @@ power: power {
>   	};
>   };
>  =20
> +&ddc0 {
> +	status =3D "okay";
> +};
> +
> +&ddc1 {
> +	status =3D "okay";
> +};
> +
> +&disp_intr {
> +	status =3D "okay";
> +};
> +
>   &hvs {
>   	clocks =3D <&firmware_clocks 4>, <&firmware_clocks 16>;
>   	clock-names =3D "core", "disp";
> +	status =3D "okay";
>   };
>  =20
>   &hdmi0 {
>   	clocks =3D <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&=
clk_27MHz>;
>   	clock-names =3D "hdmi", "bvb", "audio", "cec";
> +	status =3D "okay";
>   };
>  =20
>   &hdmi1 {
>   	clocks =3D <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&=
clk_27MHz>;
>   	clock-names =3D "hdmi", "bvb", "audio", "cec";
> +	status =3D "okay";
> +};
> +
> +&mop {
> +	status =3D "okay";
> +};
> +
> +&moplet {
> +	status =3D "okay";
>   };
>  =20
>   &pcie1 {
> @@ -119,3 +142,11 @@ &pcie1 {
>   &pcie2 {
>   	status =3D "okay";
>   };
> +
> +&pixelvalve0 {
> +	status =3D "okay";
> +};
> +
> +&pixelvalve1 {
> +	status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot=
/dts/broadcom/bcm2712.dtsi
> index 4cae17c04b50a..4cd51d80d40d0 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -287,12 +287,14 @@ pixelvalve0: pixelvalve@7c410000 {
>   			compatible =3D "brcm,bcm2712-pixelvalve0";
>   			reg =3D <0x7c410000 0x100>;
>   			interrupts =3D <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
>   		};
>  =20
>   		pixelvalve1: pixelvalve@7c411000 {
>   			compatible =3D "brcm,bcm2712-pixelvalve1";
>   			reg =3D <0x7c411000 0x100>;
>   			interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
>   		};
>  =20
>   		mop: mop@7c500000 {
> @@ -300,6 +302,7 @@ mop: mop@7c500000 {
>   			reg =3D <0x7c500000 0x28>;
>   			interrupt-parent =3D <&disp_intr>;
>   			interrupts =3D <1>;
> +			status =3D "disabled";
>   		};
>  =20
>   		moplet: moplet@7c501000 {
> @@ -307,6 +310,7 @@ moplet: moplet@7c501000 {
>   			reg =3D <0x7c501000 0x20>;
>   			interrupt-parent =3D <&disp_intr>;
>   			interrupts =3D <0>;
> +			status =3D "disabled";
>   		};
>  =20
>   		disp_intr: interrupt-controller@7c502000 {
> @@ -315,6 +319,7 @@ disp_intr: interrupt-controller@7c502000 {
>   			interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-controller;
>   			#interrupt-cells =3D <1>;
> +			status =3D "disabled";
>   		};
>  =20
>   		dvp: clock@7c700000 {
> @@ -333,6 +338,7 @@ ddc0: i2c@7d508200 {
>   			clock-frequency =3D <97500>;
>   			#address-cells =3D <1>;
>   			#size-cells =3D <0>;
> +			status =3D "disabled";
>   		};
>  =20
>   		ddc1: i2c@7d508280 {
> @@ -343,6 +349,7 @@ ddc1: i2c@7d508280 {
>   			clock-frequency =3D <97500>;
>   			#address-cells =3D <1>;
>   			#size-cells =3D <0>;
> +			status =3D "disabled";
>   		};
>  =20
>   		bsc_irq: interrupt-controller@7d508380 {
> @@ -388,6 +395,7 @@ hdmi0: hdmi@7c701400 {
>   			interrupt-names =3D "cec-tx", "cec-rx", "cec-low",
>   					  "hpd-connected", "hpd-removed";
>   			ddc =3D <&ddc0>;
> +			status =3D "disabled";
>   		};
>  =20
>   		hdmi1: hdmi@7c706400 {
> @@ -417,6 +425,7 @@ hdmi1: hdmi@7c706400 {
>   			interrupt-names =3D "cec-tx", "cec-rx", "cec-low",
>   					  "hpd-connected", "hpd-removed";
>   			ddc =3D <&ddc1>;
> +			status =3D "disabled";
>   		};
>   	};
>  =20
> @@ -439,6 +448,7 @@ axi: axi {
>  =20
>   		vc4: gpu {
>   			compatible =3D "brcm,bcm2712-vc6";
> +			status =3D "disabled";
>   		};
>  =20
>   		pcie0: pcie@1000100000 {
> @@ -611,5 +621,6 @@ hvs: hvs@107c580000 {
>   		interrupt-parent =3D <&disp_intr>;
>   		interrupts =3D <2>, <9>, <16>;
>   		interrupt-names =3D "ch0-eof", "ch1-eof", "ch2-eof";
> +		status =3D "disabled";
>   	};
>   };


