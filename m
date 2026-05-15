Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idYK+oiNy6LxPtdmf43l7b0w4xlTiQ+GkPjSdrvWsvE=; b=ZoJFfEmmtep5f8Epw+x/6wIfFd
	sJFVpt5UZVbTSE7Bb+jkde2488NKwEAH3lRY5M4O03sYklRfRdA6+29YB75tBqON9XsC5ZJUunU6O
	v/K56yMriiFbqLFkkHL3lH+l0VCMxPI2oCkc1rX9RDC5cFABDCPmGi9+SKTVJzcJnFuRtAIVbf9NE
	qSNAgfeCJ5Om0LbA3thCKrAWyXB8Eoeb3yGx/AHmjRbdheiJ0Ref5mtWRz+ozoKu51fguyfarfTmQ
	Inj1Urv7UkXUEDFejGo0NnWnEteB4QmhVy4kJwjAcTdKA4DAteeSf0Qcq1ExcXULhdAjOwm9QJ++G
	oSaz6yXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnN9-00000007fMQ-3zbM;
	Fri, 15 May 2026 07:54:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnN8-00000007fM0-0ICI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1592960581;
	Fri, 15 May 2026 07:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FA7C2BCC7;
	Fri, 15 May 2026 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778831652;
	bh=6ceNaQOsWeuicN4hn04erefEjHrpUzdn7iOlsxG3uV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQCUnjVl95zerEu5idPYQgFx5D1M+KBHFdz6BwSmSbcvV3+ktlYEqSupy6T017Wof
	 ES3463b/oqdcvR2oGHQqucZl0PtOw2ptAGwcNz63XcWeF1G4/Tm2k+bLVAC5Va18m/
	 +LNI6hPLN693AfDNkwep6l/L9y8dElHu0paB/sczHAXca2lwT7fsefpvjJ0GMcOlDb
	 N1TjpZypvaLrz3IsYBnEhQzm5zX3MgoqZUPecakF402Twai+x3ydBubgEgeQFZaWoZ
	 Dboapk/t353YYcpHvDlXocRN2rx1fHhZ8txKf/FIISCcx9qMdf7HbXcimAZqRY63ze
	 ewa2ALJACJ9lg==
Date: Fri, 15 May 2026 09:54:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH 3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3
 controller
Message-ID: <20260515-dynamic-archetypal-reindeer-dc6dd5@quoll>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-4-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511024244.981941-4-peter.chen@cixtech.com>
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

On Mon, May 11, 2026 at 10:42:43AM +0800, Peter Chen wrote:
> Add a binding for the CIX Sky1 integration of the Cadence USBSSP DRD
> controller. The schema documents the glue register window, clocks,
> resets, interrupts and S5 system controller phandle.
> 
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  .../bindings/usb/cix,sky1-cdns3.yaml          | 151 ++++++++++++++++++

Why are you mixing USB patches with DTS in one patchset? Don't.

>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> new file mode 100644
> index 000000000000..23d82d8cc9bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml

Complete mess of filename. There is no such compatible.

> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cix,sky1-cdns3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Cadence USB3 Controller
> +
> +maintainers:
> +  - Peter Chen <peter.chen@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USB3 controller is based on the Cadence USBSSP DRD
> +  controller. The integration adds glue registers and mode strap controls
> +  in the Sky1 S5 system controller.
> +
> +allOf:
> +  - $ref: usb-drd.yaml#
> +  - $ref: usb-xhci.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: cix,sky1-usb3
> +      - const: cix,cdns-usb3

I don't understand the fallback compatible. You claim this device is
called EXACTLY like vendor cdns? Nope, you SoC specific compatibles.


> +
> +  reg:
> +    items:
> +      - description: OTG controller registers
> +      - description: Device controller registers
> +      - description: XHCI host controller registers
> +      - description: Sky1 USB glue registers
> +
> +  reg-names:
> +    items:
> +      - const: otg
> +      - const: dev
> +      - const: xhci

Wrong order, look at cdns,usb3 schema.

> +      - const: glue
> +
> +  interrupts:
> +    items:
> +      - description: XHCI host controller interrupt
> +      - description: Device controller interrupt
> +      - description: OTG/DRD controller interrupt
> +      - description: Wakeup interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: host
> +      - const: peripheral
> +      - const: otg
> +      - const: wakeup
> +
> +  clocks:
> +    items:
> +      - description: Start-of-frame clock
> +      - description: AXI bus clock
> +      - description: Low-power mode clock
> +      - description: APB register interface clock
> +
> +  clock-names:
> +    items:
> +      - const: sof
> +      - const: aclk
> +      - const: lpm
> +      - const: pclk
> +
> +  resets:
> +    items:
> +      - description: APB register reset
> +      - description: Controller reset
> +
> +  reset-names:
> +    items:
> +      - const: prst

apb

> +      - const: rst

controller or core

> +
> +  cix,syscon-usb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.
> +
> +  dma-coherent: true
> +
> +  maximum-speed:
> +    enum: [super-speed-plus, super-speed, high-speed, full-speed]

Why isn't this deducible from the compatible?

> +
> +  phys:
> +    minItems: 1
> +    maxItems: 2

No, this is not flexible.

> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      anyOf:
> +        - const: cdns3,usb2-phy
> +        - const: cdns3,usb3-phy

Drop all this and define standard names.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,syscon-usb

phys should be required, no?

> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


