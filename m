Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF4FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeJszXnPjHuc48zl24ceFndownoREwpnAPNDGqGwW/Y=; b=dEkJ9YprfZMb1p+NCZy8Yp8NqT
	zne5qCX0I3OtLFfViCz33ZTy3Is/PPHJrueUh2rw2yCf/6fLDdm1Rw3Z2gkKoKl1UTxyO77gXIcIU
	gfBjY2iROtbyLGz/m0jFhNTNnlyV1uTQlzuYQGd8hYAex8JHmvaix2ygWMHfL4iYN4T33sMzV2hZu
	egmZywwDadWPksld/8kkcjpasMOJKV6lFj0Ppp2wafnWUxxMyY1eR8i2Bm7942kz1LWH7iqF0HmkD
	Bbo5OMQhBuE5/JzEmwakr7wvpJISjukahg2XLwJvPbEDgXdNfOeG5HB28zyqr4UrownASSpy5hapO
	cE1+fHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ9w-00000005KJl-1788;
	Mon, 10 Nov 2025 11:34:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ9t-00000005KIq-1AqC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:34:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vIQ9g-00022r-64; Mon, 10 Nov 2025 12:33:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vIQ9f-0080xM-2I;
	Mon, 10 Nov 2025 12:33:51 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vIQ9f-00CYGP-1u;
	Mon, 10 Nov 2025 12:33:51 +0100
Date: Mon, 10 Nov 2025 12:33:51 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
Message-ID: <aRHNn6fv8jiGXccq@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	yassine.ouaissa@allegrodvt.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
References: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
 <20250813-allegro_dvt_al300_dec_driver-v5-2-a312ddebc4d8@allegrodvt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813-allegro_dvt_al300_dec_driver-v5-2-a312ddebc4d8@allegrodvt.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_033405_323010_A4F13BF2 
X-CRM114-Status: GOOD (  24.66  )
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

On Wed, 13 Aug 2025 09:54:54 +0000, Yassine Ouaissa via B4 Relay wrote:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> 
> Add a schema for the allegro gen3 video decoder.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegro,al300-vdec.yaml         | 76 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  2 files changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..12e86c306d5578d298ad03a6d59593dd1ddcff9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allegro DVT Video IP Decoder Gen 3
> +
> +maintainers:
> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> +
> +description:
> +  The al300-vdec represents the gen 3 of Allegro DVT IP video
> +  decoding technology, offering significant advancements over its
> +  predecessors. This new decoder features enhanced processing capabilities
> +  with improved throughput and reduced latency.

This reads more like marketing than a technical description. Maybe just
stick to the first sentence:

	The al300-vdec represents the gen 3 of Allegro DVT IP video decoding
	technology.

> +
> +  Communication between the host driver software and the MCU is implemented
> +  through a specialized mailbox interface mechanism. This mailbox system
> +  provides a structured channel for exchanging commands, parameters, and
> +  status information between the host CPU and the MCU controlling the codec
> +  engines.

I'd focus the description on the hardware/MCP and drop anything
referring to the host driver software.

> +
> +properties:
> +  compatible:
> +    const: allegro,al300-vdec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: apb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCU core clock
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1

Please add a description explaining the purpose of the memory-region.

> +
> +  firmware-name:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    axi {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        video-decoder@a0120000 {
> +            compatible = "allegro,al300-vdec";
> +            reg = <0x00 0xa0120000 0x00 0x10000>, /*VDEC_TOP*/
> +                  <0x01 0x80000000 0x00 0x8000>;  /*MCU_APB*/

Drop these comments. If the register maps need documentation, these
should be a description in the binding above.

> +            reg-names = "top", "apb";
> +            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&mcu_core_clk>;
> +            memory-region = <&vdec_mem>;
> +            firmware-name = "al300_vdec.fw";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 88a76452956eb3b91e7813cbdc16c361f26216a5..532d8a51df9f500767f468935d960b1634139c65 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -819,7 +819,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> +F:	drivers/media/platform/allegro-dvt/al300
>  F:	drivers/media/platform/allegro-dvt/zynqmp

This feels a bit weird. You first change the maintenance to the
zynqmp subdirectory and then add the al300 to the same maintainers
entry.

Either add yourself as maintainer for the al300 directory or just leave
the maintainership on the top directory.

Also, the al300 directory should be added with the actual driver.

Michael

