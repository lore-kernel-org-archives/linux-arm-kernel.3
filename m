Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBC1CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wmofm78JRryIo+iavTmFWvNToNAqtknCqZBuvuMBVJk=; b=wgJenMJ12WX5DzZdJJtYoVjSti
	i/LwZbh1anKMW87mneu6kKzzepkK5k87N1kIcHz38fg69DI9x11ssCoamwGWYl5E1eyKvOpNCjZcb
	YmsXCwrEr11R8J+Wg+XzQTrGWwfhuYuBnM3KqcYLdHXN2f4ghxt09WBCTmcqQ5Bk5bsHv8t17K6Xq
	t9IA1edjz+LzvYxAYxa7uiX9Gv2thLQIvhNncmyQs3M11hi52qv0sv3Dkk/MZ9lYcAQXEiVjc5fw6
	vpqBWHmOrvEx/+dRfWLjZv/hytR/peAMYgoBrXpf6n0Ka/fL24RDSB2H1PRGu0Xh7iZ8i7p4hps1Y
	axXenwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4cS-00000009oiS-3S6B;
	Fri, 12 Sep 2025 14:19:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4cQ-00000009ogu-0lFy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:19:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EC5C4069D;
	Fri, 12 Sep 2025 14:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8EEC4CEF4;
	Fri, 12 Sep 2025 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757686757;
	bh=PSxYq2ubTxu1tLMT4DKVAGcg+k7YJbgFqjIaawl5S3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7ULSFcNhUwPip5ZGQjDHF8BRxMGJs/tTb+aAPO85WFZx3/TPtG5mB8Pu7sXtqNzz
	 Cd1F60y4y6lJkZXJB40Ov9Ed2KGYzF7U9NTt1w2RGCjgkBeDgpNXQ1p3D9fsz1be6e
	 T8j2o47OLq/1uSPeEGtnooEP12z3/nd93lg0AiOqy+L9e3nTmVry01+N/nH03xLPnz
	 Hr2G5Yv9gsvSWOIhh8XFXccehuffFv8cLgqZC/vRzqlAmAkIfCUlB3xPcDZZIwplow
	 Z7imIVx59ZXIr+pWq4gqxoGm22ANUELll1XsHPLsWOZKS3FBD/sfrUONpyC4x3XcRT
	 6YaOE9diGR7Ug==
Date: Fri, 12 Sep 2025 09:19:16 -0500
From: Rob Herring <robh@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20250912141916.GA1339383-robh@kernel.org>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-3-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912060650.2180691-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071918_262024_EEB9A86C 
X-CRM114-Status: GOOD (  21.59  )
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

On Fri, Sep 12, 2025 at 02:06:49PM +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S5 state.

Wrap lines at 72 chars.

> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> new file mode 100644
> index 000000000000..c4a127fd8330
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 Pin Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  The pin-controller is used to control Soc pins. There are two pin-controllers
> +  on Cix Sky1 platform. one is used under S0 state, the other one is used under
> +  S5 state.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cix,sky1-iomuxc
> +      - cix,sky1-iomuxc-s5
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +# Client device subnode's properties
> +patternProperties:
> +  'pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '(^pins|pins?$)':
> +        type: object
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, and drive strength.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> +              See arch/arm64/boot/dts/cix/sky1-pinfunc.h for valid arguments.

Constraints on the values?

> +
> +        required:
> +          - pinmux
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
> +    #define DS_LEVEL4 (4)
> +    iomuxc: pinctrl@4170000 {
> +        compatible = "cix,sky1-iomuxc";
> +        reg = <0x4170000 0x1000>;
> +
> +        wifi_vbat_gpio: wifi-vbat-gpio-pins {
> +            pins-wifi-vbat-gpio {
> +                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
> +                bias-pull-up;
> +                drive-strength = <DS_LEVEL4>;
> +           };
> +        };
> +    };
> -- 
> 2.49.0
> 

