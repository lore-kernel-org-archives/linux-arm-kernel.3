Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D3CD0C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLv56U3/Zz72eM/lEdZTNG55136adgJL/USFcoNGdYE=; b=o0WqBkH70xofqC+wb4J+bPM+lH
	9PeAGasV1qSi71ijZ3GArRJULJ/d8oDtTUglnd0XurKBa6ZOYnFyfDVi7eoTeMZLr0BYju40EWqfh
	jY0qT1xlVk7BjjjZIEqfYygamI/0taFHcH1fWBeZTtrngFMnkvbtFiwRM+jBf77Xa+MQXmqfRMTBk
	qaBFBqMzZXRueT1lFNusFQehqr831Bg2tdjXSrSv4giYWX133VlO5HPfwSb4CuN7W4HeOLrKWa8+x
	jZ3zK0vD62NuPdFBEIYI5+Kof+EqQgzFu+LScGi8lL8Vhg/Nffvom/Ep+nz4Q4MhNWIEtgZwHLNl4
	qZsaRHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HF7-00000003J4G-1EyM;
	Fri, 25 Oct 2024 10:08:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HCi-00000003IeT-1tDz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:06:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C57B339;
	Fri, 25 Oct 2024 03:06:29 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 902673F73B;
	Fri, 25 Oct 2024 03:05:57 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:05:54 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: allwinner: h313/h616/h618/h700:
 Enable audio codec for all supported boards
Message-ID: <20241025110554.289809cb@donnerap.manchester.arm.com>
In-Reply-To: <20241023075917.186835-8-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
	<20241023075917.186835-8-ryan@testtoast.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_030600_629475_C22AF887 
X-CRM114-Status: GOOD (  26.56  )
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

On Wed, 23 Oct 2024 20:57:03 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> Now that the H616 (and variants) audio codec is supported, enable it for
> boards with a mainline DTS. The Tanix TX1, Transpeed 8K618-T and X-96
> Mate have all been tested with the onboard 3.5mm audio jack and the
> Orange Pi Zero 3 with a 3.5mm jack connected to the audio header.

Martin, if I see this correctly, the Bigtreetech Pi also has an audio jack
(but not the Manta)?
Should we enable the codec then there, too? Can you maybe test this?

> The RG35XX (2024, -H, -Plus and -SP variants) are also tested working
> but have a separate mux and GPIO-controlled (PI5) power amplifier to
> support both a headphone jack and onboard speakers.
> 
> The headphone jack has a GPIO for jack detection, but this is not
> currently supported by the driver, so audio is heard both via the
> headphone jack and speakers when the speaker amp is powered (by the
> CLDO1 regulator, defined as always-on until proper jack detection is
> implemented).

Is the support for that board then premature? Because this would introduce
a regression, wouldn't it? With kernel 6.13 and this proposed DT it would
work, courtesy of regulator-always-on, but future DTs (as provided by
up-to-date firmware like U-Boot) with kernel v6.13 would not anymore, as
the 6.13 code wouldn't know about the upcoming jack detection bits. So this
would break forward compatibility.

> Define the audio codec and routing for all supported H616 and variant
> boards, and power and speaker amp enablement where present on boards and
> known.

For TX1, OrangePi, X96 Mate, 8K618-T:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

For Tanix TX1, OPi Zero3, X96 Mate, Transpeed 8K618-T:
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Tested-by: Philippe Simons <simons.philippe@gmail.com>
> ---
> Changelog v1..v2:
> - Add codec enablement all supported boards.
> ---
>  .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts    |  5 +++++
>  .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi    |  5 +++++
>  .../boot/dts/allwinner/sun50i-h616-x96-mate.dts     |  5 +++++
>  .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts   |  5 +++++
>  .../dts/allwinner/sun50i-h618-transpeed-8k618-t.dts |  5 +++++
>  .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 13 +++++++++++--
>  6 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
> index bb2cde59bd033..bafd3e803106b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
> @@ -65,6 +65,11 @@ reg_vcc5v: vcc5v {
>  	};
>  };
>  
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&reg_dcdc2>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index fc7315b944065..19c5cf75f3f7d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -59,6 +59,11 @@ reg_usb1_vbus: regulator-usb1-vbus {
>  	};
>  };
>  
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	status = "okay";
> +};
> +
>  &ehci1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
> index 26d25b5b59e0f..6dfe4eab91f6a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
> @@ -33,6 +33,11 @@ reg_vcc5v: vcc5v {
>  	};
>  };
>  
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&reg_dcdca>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> index 6a4f0da972330..a0fe7a9afb77c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> @@ -54,6 +54,11 @@ reg_vcc3v3: vcc3v3 {
>  	};
>  };
>  
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&reg_dcdc2>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> index d6631bfe629fa..59ee2b253ea4b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> @@ -52,6 +52,11 @@ wifi_pwrseq: pwrseq {
>  	};
>  };
>  
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&reg_dcdc2>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 899ae3be5683c..89de86b442155 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -237,6 +237,12 @@ panel_in_rgb: endpoint {
>  	};
>  };
>  
> +&codec {
> +	allwinner,audio-routing = "Line Out", "LINEOUT";
> +	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&reg_dcdc1>;
>  };
> @@ -352,7 +358,7 @@ reg_aldo3: aldo3 {
>  			reg_aldo4: aldo4 {
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> -				regulator-name = "vcc-pg";
> +				regulator-name = "avcc";
>  			};
>  
>  			reg_bldo1: bldo1 {
> @@ -375,7 +381,10 @@ reg_bldo4: bldo4 {
>  			};
>  
>  			reg_cldo1: cldo1 {
> -				/* 3.3v - audio codec - not yet implemented */
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-spkr-amp";
>  			};
>  
>  			reg_cldo2: cldo2 {


