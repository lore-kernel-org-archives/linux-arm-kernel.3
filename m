Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD87E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRKIzfyLdcWYYPGBDhzJkGr9kJMNnMGRRB5s2TQkHwY=; b=VOcTLub/zoXTqwl2fNJyjkGfnv
	e22d8/QG2SvdcpSgHN8H95OEEFnqarBtuaddRqqiQJUOsHpEWDRyLCIzf58YcXLi2gdRSIaTp2lmu
	d11uM8jHTt+0f+Cw3ayPim7ehndnGj0GZ9DcljPV1BLT4xFUSMRS83ZYS7cTPu4wBTN51L4BtOgLf
	7yAHD+RDPd2U7gm8e8hF1bsiuuJN4vcA17Y59rNEASHQqXh7LUBLXZ/as+0Le58TiApb8C8KnkSCE
	GmdyapRoCGOBJ9Rc1WGH9PkG0v/aJpmnNtB0uLQtPzdNtParoXebl+Ql3TZYnASl3crknb/zPdnKA
	XrzkP5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpJs-0000000Fv2D-1q5W;
	Wed, 18 Dec 2024 08:22:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpIl-0000000FuwT-326k;
	Wed, 18 Dec 2024 08:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CA0EA41D90;
	Wed, 18 Dec 2024 08:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1FCC4CECE;
	Wed, 18 Dec 2024 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734510062;
	bh=Y67UFTQrPnNpxipawqZdos+lVbeXi0ujBQ7g+3GP5+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9aoecZIumn9o1pSSiNDiYbyXoPMwNUMrowK3ZPZwuTmSP5r8unM9mhwrVE0poApQ
	 5nRGqL7llNZonY24T5gPAdaEcxR2QiFBC+CeMCJZyp/9iKYWoMV5xTcWfxS+2ZyLOu
	 /HQQLb3bQvEHbFFSmHQ5+Wo4j3V5v2xbAbs2E9LKSfRiwH2wzaC3IXRIGgyEe0m2YP
	 2bee3/rkc+swKUahErNARRTJUnLDs5XlfOBd/9TEa1CJEVYnKQtAXMRz0Fw3gRoCr5
	 ygs8lQAqIbCHARcAI1hFmYLyOUCNIHYbdWmzP0kxdnFVdujiYwCYteWU2ZgWDEGIg1
	 JCI1nYMNr5nhQ==
Date: Wed, 18 Dec 2024 09:20:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Message-ID: <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_002103_892842_F3354EE2 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Dec 17, 2024 at 04:43:19PM +0100, AngeloGioacchino Del Regno wrote:
> +  i2c:
> +    type: object
> +    $ref: /schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> +    unevaluatedProperties: false
> +    description: HDMI DDC I2C controller
> +
> +  phys:
> +    maxItems: 1
> +    description: PHY providing clocking TMDS and pixel to controller
> +
> +  phy-names:
> +    items:
> +      - const: hdmi
> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default

Drop both pinctrl entries.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port, usually connected to the output port of a DPI
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port that must be connected either to the input port of
> +          a HDMI connector node containing a ddc-i2c-bus, or to the input
> +          port of an attached bridge chip, such as a SlimPort transmitter.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Please keep the same order of things here and in main properties
section.

> +  - interrupts
> +  - power-domains
> +  - phys
> +  - phy-names
> +  - ports
> +

You need allOf: with ref to dai-common.yaml.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        hdmi-tx@1c300000 {

hdmi@

Best regards,
Krzysztof


