Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9081C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ta3WZqL5sk0Mne1WoZc62il08AwI4oyyWxmIyIfrOXc=; b=I2j4YDc9IraswpR9iF3k5UTPUG
	JYPqy59X2UrBmcus1x1vGGx7HroPIh5Z3dC3W2CQ9WB3L+qQfeP+3oJ15qvgDxOwiI0AgV7mKeijd
	f8AxwlmyTBC8pJWjQrx/3H3zZQJI9FiSEIDBnWbEWz9jaVyLLt/Q+UBTTLOO3jEb9TffbFocAHeB0
	XgalBJYRbwHFvPWlCVOufHsgjbhVOZR5XnZbNaedglRQ5wqi9X2mUhIFry0ciq2huVSvgqzjcX1tl
	ACyPMzF97tim6FDAQ3TA3U2BEJAPihDyeRjg4TsCXYq0eNoQaGzE7ejGUhZqqmYacskAhGkOqF02K
	ghR5JT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTj8j-00000003FDa-2UXb;
	Mon, 23 Jun 2025 15:31:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg29-00000002dJM-1zCj;
	Mon, 23 Jun 2025 12:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15ACD4AA87;
	Mon, 23 Jun 2025 12:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6020DC4CEEA;
	Mon, 23 Jun 2025 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750680740;
	bh=loOUJIQr+qUEW6o9ZxGsrjaE4988YPr7iwZh3UArESo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XBOkkLeu5kmfliNt9G/hdS1pmLkw614one20LVvyu1XHTcO5DZ9Kmg7OLmON5K0fG
	 1QhwZglMpkvnEaudY4Whgk9Zivh8iUetQhyAirAvQXH9/mdryiVI0UtyAQgJ+PC526
	 M5doIi/1rjGJ3WNu9DgCCE8ZEdk3+UnPjNwb5nuZmGBkXvlRssweoJTiATNX5fQ2Ms
	 T4e+AcASfagtUmcDIJHpVEqyO/C6u4kPkRpeZ6KURKqKYJSvrIV70NcoiqJdvmL6kI
	 IIIIOgefj8TTaXBCcKOfQN3KvwMZE6x56rGwJ0LfmAaBCqJ7xpH40Dck84wy3tfMgg
	 t95vFUAuE5MOQ==
Message-ID: <ef64816f-0ba2-4a12-bef8-aa10e44793e1@kernel.org>
Date: Mon, 23 Jun 2025 14:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/30] dt-bindings: clock: mediatek: Describe MT8196
 peripheral clock controllers
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250623102940.214269-1-laura.nao@collabora.com>
 <20250623102940.214269-10-laura.nao@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250623102940.214269-10-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_051221_563689_03274FC1 
X-CRM114-Status: GOOD (  13.73  )
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

On 23/06/2025 12:29, Laura Nao wrote:
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8196-adsp
> +          - mediatek,mt8196-imp-iic-wrap-c
> +          - mediatek,mt8196-imp-iic-wrap-e
> +          - mediatek,mt8196-imp-iic-wrap-n
> +          - mediatek,mt8196-imp-iic-wrap-w
> +          - mediatek,mt8196-mdpsys0
> +          - mediatek,mt8196-mdpsys1
> +          - mediatek,mt8196-pericfg-ao
> +          - mediatek,mt8196-pextp0cfg-ao
> +          - mediatek,mt8196-pextp1cfg-ao
> +          - mediatek,mt8196-ufscfg-ao
> +          - mediatek,mt8196-vencsys
> +          - mediatek,mt8196-vencsys-c1
> +          - mediatek,mt8196-vencsys-c2
> +          - mediatek,mt8196-vdecsys
> +          - mediatek,mt8196-vdecsys-soc
> +      - const: syscon

Why everything is syscon?


> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  mediatek,hardware-voter:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle of the hw voter node
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pericfg_ao: clock-controller@16640000 {
> +        compatible = "mediatek,mt8196-pericfg-ao", "syscon";
> +        reg = <0x16640000 0x1000>;
> +        mediatek,hardware-voter = <&scp_hwv>;
> +        #clock-cells = <1>;
> +    };
> +  - |
> +    pextp0cfg_ao: clock-controller@169b0000 {
> +        compatible = "mediatek,mt8196-pextp0cfg-ao", "syscon";
> +        reg = <0x169b0000 0x1000>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
> new file mode 100644
> index 000000000000..363ebe87c525
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8196-sys-clock.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt8196-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Clock Controller for MT8196
> +
> +maintainers:
> +  - Guangjie Song <guangjie.song@mediatek.com>
> +  - Laura Nao <laura.nao@collabora.com>
> +
> +description: |
> +  The clock architecture in MediaTek SoCs is structured like below:
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The apmixedsys, apmixedsys_gp2, vlpckgen, armpll, ccipll, mfgpll and ptppll
> +  provide most of the PLLs which are generated from the SoC's 26MHZ crystal oscillator.
> +  The topckgen, topckgen_gp2 and vlpckgen provide dividers and muxes which
> +  provide the clock source to other IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8196-apmixedsys
> +          - mediatek,mt8196-armpll-b-pll-ctrl
> +          - mediatek,mt8196-armpll-bl-pll-ctrl
> +          - mediatek,mt8196-armpll-ll-pll-ctrl
> +          - mediatek,mt8196-apmixedsys-gp2
> +          - mediatek,mt8196-ccipll-pll-ctrl
> +          - mediatek,mt8196-mfgpll-pll-ctrl
> +          - mediatek,mt8196-mfgpll-sc0-pll-ctrl
> +          - mediatek,mt8196-mfgpll-sc1-pll-ctrl
> +          - mediatek,mt8196-ptppll-pll-ctrl
> +          - mediatek,mt8196-topckgen
> +          - mediatek,mt8196-topckgen-gp2
> +          - mediatek,mt8196-vlpckgen
> +      - const: syscon

Why everything is syscon?

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  mediatek,hardware-voter:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle of the hw voter node

Do not copy property name to description, but say something useful - for
what? And why this cannot be or is not a proper interconnect?

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apmixedsys_clk: syscon@10000800 {
> +        compatible = "mediatek,mt8196-apmixedsys", "syscon";
> +        reg = <0x10000800 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +  - |
> +    topckgen: syscon@10000000 {
> +        compatible = "mediatek,mt8196-topckgen", "syscon";
> +        reg = <0x10000000 0x800>;
> +        mediatek,hardware-voter = <&scp_hwv>;
> +        #clock-cells = <1>;
> +    };
> +



> +#define CLK_OVL1_DLO9					56
> +#define CLK_OVL1_DLO10					57
> +#define CLK_OVL1_DLO11					58
> +#define CLK_OVL1_DLO12					59
> +#define CLK_OVL1_OVLSYS_RELAY0				60
> +#define CLK_OVL1_OVL_INLINEROT0				61
> +#define CLK_OVL1_SMI					62
> +
> +
> +/* VDEC_SOC_GCON_BASE */
> +#define CLK_VDE1_LARB1_CKEN				0
> +#define CLK_VDE1_LAT_CKEN				3

IDs increment by 1, not 3.



Best regards,
Krzysztof

