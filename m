Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B4ECA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eS2taJONz3Qi/rNF5f7NmVYquugu+IPk8/RXX7aAR8=; b=aO4uJdlWHByAqAzNp/8hd616+2
	5ZdOnKhFl43OLBYo9DhwmO5eK0J+kEJV96cwVlJE+yCZMEh1Fw0ZFhTB5qftaUdjJ+PJcZl8GEyYq
	csmAnv1EPI3KVaF0O9+Ejcef1kKzD+a+LJS4JSrxM84hUAkCVmGcsImEgEdZQyc/tA53XjzSV0sv8
	XBGMGOAIlZY0YTA8tXmlAOUjmobodom/ReUNkEIteqDSzJtfe5uA/46cWhbqGKFewRb8THy/j0xKQ
	5Lk7txQP/WaQol492qIXuKWk04AQeHyONTyi9lA3KI8741Vvh4JQrXaCmEjSTD+WjLKfPeLVSrrwg
	LDwJKOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswcL-0000000BAdm-2V7R;
	Mon, 01 Sep 2025 04:58:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uswZf-0000000BATG-1um0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 04:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 838A3601B8;
	Mon,  1 Sep 2025 04:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2FFC4CEF0;
	Mon,  1 Sep 2025 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756702521;
	bh=FTdg3qQDLcLg/WJueya255ckIzqEnwBISq9UOPfgb1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sb0PPBuy4LNuawkiyKqy4flACZvPyACS2s8cmFCOIajbAtXsGkPnL8mGiy0wvQdwL
	 o5Y3OECor5b3FrN+UCofWsGFx3ncy6tVkRCmWH31FxH97bBVF32qAWiDO4jAmX41cL
	 OyivnUoIDI0EORzt0BmSvlxBhbIarAQSC6kxOmzrxYjOKLtdc2Vx+N7hchKZS7xtoX
	 lV0NWZbEMlLKuHPProj2luwqxlt/rN7vrVt0kRZ4iZXGhDyOG+ixZ7np2Hr6pTxeHN
	 0oxKYlxRjATQ0lp/XKAf7cbAMegR2KtPCYpozMXYlL/QMzTAgcP4bedjYjOTr9ePP3
	 v2gfk6h9iFdoA==
Date: Mon, 1 Sep 2025 06:55:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de, 
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, 
	ravi.patel@samsung.com, shradha.t@samsung.com
Subject: Re: [PATCH v3 2/7] dt-bindings: media: fsd: Add CSIS video capture
 interface
Message-ID: <20250901-rousing-orange-crab-c05fdf@kuoka>
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
 <CGME20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5@epcas5p1.samsung.com>
 <20250828085911.81266-3-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828085911.81266-3-inbaraj.e@samsung.com>
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

On Thu, Aug 28, 2025 at 02:29:06PM +0530, Inbaraj E wrote:
> The Tesla FSD CSIS video capture interface is used to capture frames.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  .../bindings/media/tesla,fsd-csis-media.yaml  | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> new file mode 100644
> index 000000000000..f045094ae539
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/tesla,fsd-csis-media.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla FSD SoC MIPI CSI-2 video capture interface(Bridge device).

Drop final full stop. Also missing space before (


> +
> +maintainers:
> +  - Inbaraj E <inbaraj.e@samsung.com>
> +
> +description:
> +  The Tesla FSD CSIS has an internal video capture interface to capture
> +  frames originating from the sensor. The power supply for the IP is
> +  managed by custom firmware and is expected to remain enabled
> +  permanently, so power supply control is not added in linux.
> +
> +properties:
> +  compatible:
> +    const: tesla,fsd-csis-media
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
> +      - const: aclk
> +      - const: pclk
> +      - const: pll
> +
> +  iommus:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    csis0: csis@12641000 {

Incorrect unit address.

> +        compatible = "tesla,fsd-csis-media";
> +        reg = <0x12661000 0x44c>;


Best regards,
Krzysztof


