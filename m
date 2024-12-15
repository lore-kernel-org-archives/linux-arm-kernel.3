Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61362E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNkUVDCZhDaEmA6yIBIe4bMQKnUcOVR08f2igvbWkbk=; b=EOGA33UUHceybL4lqufHTz5qEL
	6ekEnDJUsWXgTUJZq7tS2xgGdUyO9Td4ZaB2lztIr1U6okHvV5gVGcSlTmweSDoDXrPWRg2GLwYUt
	Xjgm9egJyiNksubQ9UA7yVZqNvCUaCzzACnq59YlV4BQSP52TVxZi4sMouVa6wgHuAiC2p4FQ5tXC
	tKWLG/6XW/liTs1FvFJsTJ24rNpQHCsIjcjINUqSyB9xXOcp2lw9jB/MMQXfDclcYcoNW1VewFClU
	bZuwhC2DKVnjoaXb4BL22lEZ0Z+SYQ+hpRSGz6SQC+6mw+FMtpHqDkqHrgN8iAUrLIAGkFoG3T4np
	Un3wCABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMnbL-00000007s94-3HRS;
	Sun, 15 Dec 2024 12:19:59 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMnaG-00000007rz1-3tPX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 12:18:54 +0000
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YB2DN11ZnzybN;
	Sun, 15 Dec 2024 14:18:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1734265126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNkUVDCZhDaEmA6yIBIe4bMQKnUcOVR08f2igvbWkbk=;
	b=q2uUHQiAoXW3hESINEMrWO1ktTOA1ljeykfiuIWAB6uaLVSHv9NWk6jkgFkJiL+vgpjAva
	hecH1U2LgHA5duHJ/Vl/S3WdJzggwitK62FkR4HAzobWyxoaivq17OLhMzHYhltlpljmVZ
	WZSlMLiLPOetPgEch88+myjDv6l/uBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1734265126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNkUVDCZhDaEmA6yIBIe4bMQKnUcOVR08f2igvbWkbk=;
	b=sVtVx9r8BjV7s7SelVuMQyX0JbRI8W0We5vuO8mghd5K4m+Sok2OvIg5hLVfKvEFTyY8Y6
	hiPHLNCOtBPYtbWSKkXBihWDatrs20pz9iuGEg8a/hayNnRgoFEssyg5xkvMSkKzX3yHf8
	UQhKQat+qWAclCLg4dyi8mrUqT+gBRg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1734265126; a=rsa-sha256; cv=none;
	b=MfJKE/lQoqP6UcKfO1WDXMpt4oQU3e4iaIa91DSFZoLmR45/AdCS+hgBuOidI+MStglFM6
	jZ7mr/Mz3rsU2cu4O4vrnKnKWEkqAuQEQbb4z8LKToWFNQhQhwJUMMV76fEoOvvd5PqmVt
	2B+UHHpKSmO4vUrEv0R8D3Y6AgUkdAg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B67FC634C94;
	Sun, 15 Dec 2024 14:18:42 +0200 (EET)
Date: Sun, 15 Dec 2024 12:18:42 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 02/15] dt-bindings: media: add description of stm32 csi
Message-ID: <Z17JItE-98IIrnMv@valkosipuli.retiisi.eu>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
 <20241212-csi_dcmipp_mp25-v4-2-fbeb55a05ed7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-2-fbeb55a05ed7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_041853_166480_0C9AB408 
X-CRM114-Status: GOOD (  18.66  )
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

Hi Alain,

On Thu, Dec 12, 2024 at 10:17:26AM +0100, Alain Volmat wrote:
> Add the stm32 csi controller description.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> v2:
>   - rename into st,stm32mp25-csi.yaml to match compatible
>   - correct port / data-lanes (remove useless lines &
>     use data-lanes 1 and 2 instead of 0 and 1)
>   - correct commit log
> ---
>  .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> new file mode 100644
> index 000000000000..33bedfe41924
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32mp25-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 CSI controller
> +
> +description:
> +  The STM32 CSI controller allows connecting a CSI based
> +  camera to the DCMIPP camera pipeline.

CSI-2 I presume?

You should also document it here it has D-PHY...

> +
> +maintainers:
> +  - Alain Volmat <alain.volmat@foss.st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: txesc
> +      - const: csi2phy
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Digital core power supply (0.91V)
> +
> +  vdda18-supply:
> +    description: System analog power supply (1.8V)
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +    csi@48020000 {
> +        compatible = "st,stm32mp25-csi";
> +        reg = <0x48020000 0x2000>;
> +        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&rcc CSI_R>;
> +        clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>, <&rcc CK_KER_CSIPHY>;
> +        clock-names = "pclk", "txesc", "csi2phy";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&imx335_ep>;
> +                    data-lanes = <1 2>;
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;

...and drop bus-type property.

> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&dcmipp_0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 

-- 
Kind regards,

Sakari Ailus

