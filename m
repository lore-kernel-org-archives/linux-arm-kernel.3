Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035CDD13585
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l89cQ+5FKiaeTPE/rlo7O3cnzTI548NZ+Cmu6uq4XFo=; b=117Pq6Pc4Ho+O2sb+2674ex39J
	Ttbyhpp8DLamgEmHVI6gQ7YkemF/gg78GrRQyH29y1DqwrYkrZjc9Fp6ePt/t9lIxjwUPpOSuDFeK
	g++CYpYXMkXDxzBhHQNUAmek1sIF9ZLj13ee5ujlpzdcjRAPQZgbwKWb/vX1S+DDpN4jQQ0sZkqlv
	OL6HoXsToWLSEVpPUNHaXiF6eotFx7tXAhlJlEEI8l3pzPw7M01wZTDwYQf3KSdhJAnQYJzds9Yl8
	faKc6kVFO8iKFyj15UbfhWK9gV2P+/fX7XNw5kxjJ6Aq7NGL7DEkeVody+Xj5EKOGmeTwMCRMYVaC
	KxtvRi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AR4-00000008u38-0gqq;
	Sun, 27 Oct 2024 21:04:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5APT-00000008tvi-37JX;
	Sun, 27 Oct 2024 21:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90B0FA41381;
	Sun, 27 Oct 2024 21:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E20C4CEC7;
	Sun, 27 Oct 2024 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730062970;
	bh=1CN3cHomt0l97thHBnpxa1oYEp4SPAVR2NHJL6u+QI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utA08je0e4Eju4ck+Wh7xtn2qIbSYoPo3l6BQHj1u6xjzElw425xCeBE+oed70UpQ
	 5GBEduv7K6ntNlsWDJaj7Wa34c9dOfysbGlhFRr3Yh8GXZUIBC4nDVzC0YUuEyU+0x
	 IPn9VoSzZcyBEiJmDVVdYwmIiRmSQefeVdrJ/Smbm0bVoXZ95gqonGRPtSDbC3ureT
	 2kfmtXnZnX42FLcRUATqEdmXnYEhNRNlGPQqf0kM0S9L0WxATKVgOGyrDVLNdvJYPI
	 tmN6fSXVQa6zpQguZSOEvDp5u6ZbCN9pmJiyxPgnnG6CuIbq4n/aj1xrhuqFOg4OWY
	 D5VaW7vk3+AiQ==
Date: Sun, 27 Oct 2024 22:02:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
Message-ID: <iupuwxxslb3t76mzy3ufsruwwpd47fuop7y6tfcbwkosdagkxf@fnklbp6t6au2>
References: <20241025110111.1321704-1-fshao@chromium.org>
 <20241025110111.1321704-3-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025110111.1321704-3-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_140251_937225_0BA3A8A0 
X-CRM114-Status: GOOD (  18.85  )
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

On Fri, Oct 25, 2024 at 06:59:36PM +0800, Fei Shao wrote:
> Introduce MT8188-based Chromebook Ciri, also known commercially as
> Lenovo Chromebook Duet (11", 9).
> 
> Ciri is a detachable device based on the Geralt design, where Geralt is
> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
> different combinations of second-source components, including:
> - audio codecs (RT5682S and ES8326)
> - speaker amps (TAS2563 and MAX98390)
> - MIPI-DSI panels (BOE NV110WUM-L60 and IVO t109nw41)
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/mediatek/Makefile         |    8 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   63 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   54 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   20 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   76 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   67 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   52 +
>  .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  413 +++++
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1497 +++++++++++++++++
>  11 files changed, 2304 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 8fd7b2bb7a15..c6c34d99316b 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -69,6 +69,14 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku1.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku2.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku3.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku4.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku5.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku6.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku7.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> new file mode 100644
> index 000000000000..7a2edbaa74f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +/dts-v1/;
> +#include "mt8188-geralt-ciri.dtsi"
> +
> +/ {
> +	model = "Google Ciri sku0 board";
> +	compatible = "google,ciri-sku0", "google,ciri", "mediatek,mt8188";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> new file mode 100644
> index 000000000000..53fdd5acaa3f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2023 Google LLC
> + */
> +/dts-v1/;
> +#include "mt8188-geralt-ciri.dtsi"
> +
> +/ {
> +	model = "Google Ciri sku1 board";
> +	compatible = "google,ciri-sku1", "google,ciri", "mediatek,mt8188";
> +};
> +
> +&dsi_panel {
> +	compatible = "ivo,t109nw41", "himax,hx83102";
> +};
> +
> +&touchscreen {
> +	himax,pid = <0x1003>;

Why do you add more of undocumented properties?

> +	firmware-name = "himax_i2chid_1003.bin";
> +};
> +
> +&i2c0 {
> +	/delete-node/ audio-codec@1a;
> +
> +	es8326: audio-codec@19 {
> +		compatible = "everest,es8326";
> +		reg = <0x19>;
> +		interrupts-extended = <&pio 108 IRQ_TYPE_LEVEL_LOW>;
> +		#sound-dai-cells = <0>;
> +		everest,jack-pol = [0e];
> +		everest,interrupt-clk = [00];
> +	};
> +};
> +
> +&sound {
> +	compatible = "mediatek,mt8188-es8326";
> +	model = "mt8188_m98390_8326";
> +
> +	audio-routing =
> +		"ETDM1_OUT", "ETDM_SPK_PIN",
> +		"ETDM2_OUT", "ETDM_HP_PIN",
> +		"ETDM1_IN", "ETDM_SPK_PIN",
> +		"ETDM2_IN", "ETDM_HP_PIN",
> +		"ADDA Capture", "MTKAIF_PIN",
> +		"Headphone Jack", "HPOL",
> +		"Headphone Jack", "HPOR",
> +		"MIC1", "Headset Mic",
> +		"Left Spk", "Front Left BE_OUT",
> +		"Right Spk", "Front Right BE_OUT";
> +	status = "okay";
> +
> +	hs-capture-dai-link {

Nope, that's not how DAI links are called.

> +		codec {
> +			sound-dai = <&es8326>;
> +		};
> +	};

...

> +&i2c2 {
> +	status = "disabled";
> +};
> +
> +&i2c_tunnel {
> +	/delete-node/ sbs-battery@b;
> +
> +	battery: sbs-battery@f {
> +		compatible = "sbs,sbs-battery";
> +		reg = <0xf>;
> +		sbs,i2c-retry-count = <2>;
> +		sbs,poll-retry-count = <1>;
> +	};
> +};
> +
> +&max98390_38 {
> +	sound-name-prefix = "Front Right";
> +	maxim,dsm_param_name = "dsm_param.bin";

NAK. Not a DT property. You cannot send us ACPI stuff.

Go through internal review first, which should tell you that ACPI is not
accepted into DT. There are just few exceptions and codecs do not
qualify.

Best regards,
Krzysztof


