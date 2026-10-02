Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D89CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mF7zPZZiyi1UeenhlWbnxlNgGDfxL0sUjRand4J9S74=; b=a5/yhrq+PT81w0usIJc/BA2mN4
	q+MDj06lDLlIaiKcGpk3NAUMLLvaIDUStrvAsdDz3WtzV0ymTajsCC0L2Y0AGwPuwCBmQzO3D/B9W
	yXmAqM2AnWI35xXP737E952S+k/e8rmg5JFVC6ueFol/2SALyRA5yxwbWlZQ9DyJEmdmlqvnmosYX
	b4riNJdoDUQ6iojVdmDi0OCxvmUJTwX+TljMORxhdy21ZrLPVuefRt3NmXJOEsrKsoeyWIhAEKNbR
	N6pZNtnQqY7qEUKswgV7tDl7x2kVTdALp4nbY2Zq50oFuwuVAv0fauDz8FJnD+CnD2F05ix7FPGok
	ELsPE7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWX3-0000000Agxd-0wfQ;
	Fri, 02 Oct 2026 06:14:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWX2-0000000AgxT-1d2X;
	Fri, 02 Oct 2026 06:14:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EB1460234;
	Fri,  2 Oct 2026 06:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B681F000FF;
	Fri,  2 Oct 2026 06:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790921647;
	bh=mF7zPZZiyi1UeenhlWbnxlNgGDfxL0sUjRand4J9S74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4is420Ey8dJrq/CWtEZBCbozdYPW6MAF9HME2Oi5mlvh4uoSxUmI9bYPYsq8y8ZW
	 lMaj4TBBJ2zI/+pvBZNzDLjxBkdgS/S+ui74xsoSohOW3YLlw7L0Wq3U/SgKJrFqkQ
	 f+fxrSkWfduX2JsWz8rYszQyF8B+LmhlN6zCSPhTxCVGDxqGgo3SLFnYIWPK0Ba4LI
	 AayGMqrcQmP/Bd+0FdMVqbicTQMVVzG5TJeAIrmHulVwb6Cc6Uhu8yMsJiyeNTARhX
	 lv78X4k/ASMTleeuT/atNXOUbzRSjkx7cyivo2RHHnNpsGM3rrgSZNDR23FSGvHIH+
	 TEl+uDcCvm4aA==
Date: Fri, 2 Oct 2026 08:14:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: Add Allwinner D1 CSIC
Message-ID: <20261002-angelic-wombat-of-chemistry-af8a67@quoll>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
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

On Wed, Sep 30, 2026 at 10:48:33PM +0700, Nguyen Minh Tien wrote:
> +maintainers:
> +  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> +
> +description:
> +  The CSIC found in the Allwinner D1, D1s and T113 receives video from a
> +  parallel camera interface and writes it to memory. It contains a parser for
> +  the camera bus and two DMA engines.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun20i-d1-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: DMA engine 0
> +      - description: DMA engine 1
> +      - description: Parser 0
> +      - description: Top-level block (CSI_TOP_PKT)
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +      - description: DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: Parallel input port, connect to a parallel sensor
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-width:
> +            const: 8

If it is const, why do you exactly need it in the DT?

> +
> +          pclk-sample: true
> +          hsync-active: true
> +          vsync-active: true

Drop these three.

> +
> +        required:
> +          - bus-width

No second port to the ISP?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun20i-d1-ccu.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/sun20i-d1-ccu.h>
> +
> +    csi@5800000 {
> +        compatible = "allwinner,sun20i-d1-csi";
> +        reg = <0x05800000 0x400000>;
> +        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>,
> +                     <112 IRQ_TYPE_LEVEL_HIGH>,
> +                     <116 IRQ_TYPE_LEVEL_HIGH>,
> +                     <122 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_CSI>,
> +                 <&ccu CLK_CSI_TOP>,
> +                 <&ccu CLK_MBUS_CSI>;
> +        clock-names = "bus", "mod", "ram";
> +        resets = <&ccu RST_BUS_CSI>;
> +
> +        port {
> +            endpoint {
> +                remote-endpoint = <&ov5640_ep>;
> +                bus-width = <8>;
> +                hsync-active = <1>; /* Active high */
> +                vsync-active = <0>; /* Active low */
> +                pclk-sample = <1>;  /* Rising */
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5eff489a8..f4c45c4678 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -905,6 +905,13 @@ L:	linux-crypto@vger.kernel.org
>  S:	Maintained
>  F:	drivers/crypto/allwinner/
>  
> +ALLWINNER D1 CSIC DRIVER
> +M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git

Drop, unless you actually have their commit rights and manage patches. I
would say mailing list is also here redundant (duplicating), but I
stopped pointing to it.

Best regards,
Krzysztof


