Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99D0E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvXkqZOEZnsx6UnUcZ93CchMAEzS5KMaOLVtQ7V/f1Q=; b=NuEICEBwFnMbhPoDyGeBSP21Z0
	otrBVfwUtd/t+bj1Z7iU7UqB2FuLOFsiYu319FXtPh0Ppm0cb4RPEqP2yb67Lh1gGGF9jXncVViOm
	xMgOo78Dds0itbQDqe9nhzq8Zf97Ng1MW2QU/a1TB/oiis6WrkqY1QtbT+Ar7OqlV8saTfrBWoyle
	Ns9YV7jhM55JzuJ/KwzCsixNJZ41medzQvIi60JxmO5srBHNfGGVwXeq0wVD8sFcBiKE0l55fr9EK
	Je5nY9ahjFn15DJnkRDt2PnVsl0xmlyugBtKYmMO5VPsoY5Bgaim5+8J6xEi4wb/MU7RSFFqOzn02
	i5Qni7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNS9H-0000000CayD-3Ztm;
	Tue, 17 Dec 2024 07:37:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNS8C-0000000CarA-3Q4j;
	Tue, 17 Dec 2024 07:36:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B4105C5F0A;
	Tue, 17 Dec 2024 07:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF32AC4CED3;
	Tue, 17 Dec 2024 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734420996;
	bh=Ga6YyJPT2SabgQ++x1dTYapjnEIbe0j6plAt5ho+zUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0yMoUH7VxU5A7BAPTHnI6tj0MtYase+3tUSJHORqleTKtpxoe71YZ2FUsP5HEdvC
	 tT4hy56ugAvovNiVf4w9X+yiTwio+szXiPYWCMEe8qI5ruWnd94hwJi/d7rlCjED6V
	 CDra3myb5Wy+CNGTHSrnlcvkIUYDvGl+8pfse1AmFXQdE6w8OpdsXjlbaFGvatOWu0
	 hu/6aAPRE4xchr3mj7zoKuz/lujikip1FX0cJ/tVvTkiKLIaP9b6sPDCdj/gy6saDe
	 A007O1Z2e3Mt0sEP8lHNjJr5e27E5oKYYpBR2lPc/fxAWvL2zDhe8ryTMFg8hpVRkB
	 oi34W6og3gx/w==
Date: Tue, 17 Dec 2024 08:36:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, herbert1_wu@pegatron.corp-partner.google.com, 
	Thomas_Hsieh@pegatron.corp-partner.google.com
Subject: Re: [PATCH] arm64: dts: mt8186: Add mt8186-skitty
Message-ID: <um3ivvtmyk3jjvwpkzg5hg5dd5s2zjs4jzfl3xbg6cdil7mtvq@42wqiqmyuiv2>
References: <20241216-skitty_kernel-v1-1-bc75dcdfeb57@pegatron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216-skitty_kernel-v1-1-bc75dcdfeb57@pegatron.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_233636_944624_B54BF8AD 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Dec 16, 2024 at 03:35:12PM +0800, Geoffrey Chien wrote:
> Add Skitty initial device tree.
> Support second source Synaptics trackpad
> Support US2 keyboard.
> Enhance touch screen timing for ELAN
> Based on experiment, set drive-strength to 6mA (default = 8mA)
> Modify sbs battery reg to 0x0f
> 
> Signed-off-by: Geoffrey Chien <geoffrey_chien@pegatron.corp-partner.google.com>
> ---
>  .../devicetree/bindings/arm/mediatek.yaml          |  8 +++
>  arch/arm64/boot/dts/mediatek/Makefile              |  4 ++
>  .../dts/mediatek/mt8186-corsola-skitty-sku1.dts    | 23 +++++++
>  .../dts/mediatek/mt8186-corsola-skitty-sku2.dts    | 13 ++++
>  .../dts/mediatek/mt8186-corsola-skitty-sku3.dts    | 40 ++++++++++++
>  .../dts/mediatek/mt8186-corsola-skitty-sku4.dts    | 30 +++++++++
>  .../boot/dts/mediatek/mt8186-corsola-skitty.dtsi   | 76 ++++++++++++++++++++++

This wasn't ever tested (as robots point out), but also:

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

>  7 files changed, 194 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d9aadb7b77e144a474b79da005056..29e7555569a772ba042e29af01ea98fdd3be1525 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -224,6 +224,14 @@ properties:
>                - google,pico-sku2
>            - const: google,pico
>            - const: mediatek,mt8183
> +      - description: Google Skitty (HP Chromebook G1m 11 inch)
> +        items:
> +          - const: google,skitty-sku1
> +          - const: google,skitty-sku2
> +          - const: google,skitty-sku3
> +          - const: google,skitty-sku4
> +          - const: google,skitty
> +          - const: mediatek,mt8186
>        - description: Google Willow (Acer Chromebook 311 C722/C722T)
>          items:
>            - enum:
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 8fd7b2bb7a1590341e7bb4ea1ecf039ae3e8eb0d..328e1ee444bd81b5a2aa3d21acb7a5c5a3318a87 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku1.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku2.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku3.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-skitty-sku4.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..a0e7b10445333d6f83fc4c461ce8f8d75ffaa697
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty-sku1.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright 2024 Google LLC
> + */
> +
> +/dts-v1/;
> +#include "mt8186-corsola-skitty.dtsi"
> +
> +/ {
> +	model = "Google Skitty sku1 board";
> +	compatible = "google,skitty-sku1",
> +		"google,skitty", "google,corsola", "mediatek,mt8186";

Fix alignment.

Best regards,
Krzysztof


