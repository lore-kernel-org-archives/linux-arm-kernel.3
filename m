Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D1EC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSZSNvXIbxinhOWwX8RXwgMptdfYZOHfLPwJUx7KQK4=; b=vRbsf17z1uqO7d8BAf1rPGlXMV
	DMztv/L4LrWZvgPugtEGV7LO60bGAb1tHMiZjxtqed1+jhPG+pB29AO2Uh+sW8UOlv2nWORACvD9d
	jScZhAzd+TJRVtBAcaHy59M0lKfHyAEzrE+TeaQTqJgTHmKBJoZMcP83+FY8d/RTQyj4eniYTsPUD
	LCHVAThVgsCgKE+uuinAfRMR/WU15fuQoWTccvunWUya+T0hsUDvjtaYwhFd90Xk8UIK9iaWIB0KJ
	Yt+RFD3p7BWmdWYExIEt9nTRNWdE+qhTynx2RbHAnzRD8+kyxG2S05CWb5fZiT3Emu37NPX5s0LbT
	1iBU/g5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATkc-0000000FXxC-10KT;
	Sat, 26 Sep 2026 14:51:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATkZ-0000000FXwg-1c5X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:51:41 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9022BB5;
	Sat, 26 Sep 2026 16:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434188;
	bh=pZTeVCBlihakj8ZvNv1lAbjxoAd+n7SrGIEcG9d3MYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgnQyVoJjxp560wpTUaSNxt8ZRBb32HnVlVcX03MbARetRBUPqWOIAOFVDozVx52n
	 MKRWUAA9xeLYfsE1Cf5qmbcAQa5CfPZEe7WcBTw0GUe2hbOcFjvOl/cmKkN/yHfaLE
	 CjfEReU7M9nONodqmbLmRfImeplZEmP7oJpEjehE=
Date: Sat, 26 Sep 2026 17:51:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 1/8] dt-bindings: media: Add bindings for Omnivision
 OV2312
Message-ID: <20260926145135.GC764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-2-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-2-r-donadkar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075139_569780_4AE69BFF 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, Sep 25, 2026 at 06:59:54PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Add DT bindings for Omnivision OV2312 camera sensor.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../bindings/media/i2c/ovti,ov2312.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> new file mode 100644
> index 000000000000..76929fcc6550
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2312.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2312 Camera Sensor
> +
> +maintainers:
> +  - Jai Luthra <j-luthra@ti.com>
> +
> +description: |-
> +  Omnvision OV2312 is a camera sensor with an active array size of 1600x1300.

s/Omnvision/OmniVision/

(although they now seem to style the company name as OMNIVISION)

> +  It supports capture of frames with a 4x4 RGB-IR bayer pattern. This provides
> +  both human (RGB) and machine vision (IR) capabilities in low-light scenarios.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,ov2312
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xvclk

If there's a single clock, drop the name.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the RESET pin.

You also need regulators.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false

The sensor supports both CSI-2 and parallel output. You need to be more
precise here regarding the supported properties. The bus type, in
particular, needs to be defined.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@60 {
> +            compatible = "ovti,ov2312";
> +            reg = <0x60>;
> +
> +            clocks = <&fixed_clock>;
> +            clock-names = "xvclk";
> +
> +            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint = <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart

