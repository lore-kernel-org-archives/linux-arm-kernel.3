Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D75C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3si6D7p6acB9cnyiZ3w5R1umfag36fSmLFul2szXvJg=; b=HE3rCz4qvpffTX5Rwo75Pvf03x
	vM7W/S3X5qTPMbl5O+QmFoCa4Rj+5N+PK1O5LUcCsonvNjFoFXolo52gWYjeG91sj/jWwSyA2mmys
	wwLTogv7A09KSzB3pOvqAD/X0TkcttyxRhazhhRGH3lnM0Q+1zrfkNArCw76wIUNA+gDrLvMzxBJa
	ZJsTzmZeB+LAZDCrdRbMjD1jZYyy951eM+ARe0Ne128raYrRrHxZkdI+DEJ7TbKd/rRtnmicVaBSm
	VF/W8cw/4njMASfHEmS877g0/F8SxdeKNz/9pfiVypd3KJmPOtXAm181b8BILbHxdZQj+NnMkyluX
	C6wdLcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Tw-00000006t4D-0Ya4;
	Wed, 12 Feb 2025 09:56:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Ai-00000006o9N-44WQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:36:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1ti9AB-0003qj-6V; Wed, 12 Feb 2025 10:36:11 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ti9AA-000Z2U-1y;
	Wed, 12 Feb 2025 10:36:10 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ti9AA-00AzSK-1c;
	Wed, 12 Feb 2025 10:36:10 +0100
Date: Wed, 12 Feb 2025 10:36:10 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Message-ID: <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_013645_014836_E2975D22 
X-CRM114-Status: GOOD (  17.90  )
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

On 25-02-11, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add binding for imx95's CM7 core, used for audio processing.
> Additionally, introduce a common binding for NXP audio processors with
> Sound Open Firmware (SOF) support.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
>  .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> new file mode 100644
> index 000000000000..f00ae3219e15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP imx95 CM7 core
> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +description: NXP imx95 CM7 core used for audio processing
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-cm7-sof

Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
add the -sof suffix instead of -audio or so? SOF is a software project
but you can clearly run different software on the audio-copro as well.

Regards,
  Marco

> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: sram
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  memory-region-names:
> +    const: dma
> +
> +  port:
> +    description: SAI3 port
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - memory-region
> +  - memory-region-names
> +  - port
> +
> +allOf:
> +  - $ref: fsl,sof-cpu.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    cm7-cpu@80000000 {
> +        compatible = "fsl,imx95-cm7-sof";
> +        reg = <0x80000000 0x6100000>;
> +        reg-names = "sram";
> +        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
> +        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +        memory-region = <&adma_res>;
> +        memory-region-names = "dma";
> +        port {
> +            /* SAI3-WM8962 link */
> +            endpoint {
> +                remote-endpoint = <&wm8962_ep>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> new file mode 100644
> index 000000000000..31863932dbc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP audio processor common properties
> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +properties:
> +  mboxes:
> +    maxItems: 4
> +
> +  mbox-names:
> +    items:
> +      - const: txdb0
> +      - const: txdb1
> +      - const: rxdb0
> +      - const: rxdb1
> +
> +required:
> +  - mboxes
> +  - mbox-names
> +
> +additionalProperties: true
> -- 
> 2.34.1
> 
> 
> 

