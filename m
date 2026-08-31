Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BD6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h9f4egroVHXOkCH/bF4osumxuil4xiCtT1M5bdwfPw=; b=PRpjZSJyy+FC4P9PPAIwP2Tnwu
	VOUPioDAYyE/Brh5ohjcRby9E3tdKNSxwZr3xOQSlkipXi7CNv9klWPUHbie3Yz0jSe2TP9L/bqDo
	aeDwTTDbjE6IOoOJPQj/F/thx0SlK5xiTnoG4rCO2a5LMAqHE11+noK00Figri9W2PCExdZUbevlM
	NR++pRaR8RZOT625XcRGh68OdtO/p4LsPygtCyhe50CCFSDH5fbNyz6GAkAKibm1aABL2TkE4wwqF
	CJ4ZYgypglhJaM9DLMmx/d5Yw9JE/gMmvl0EgCWzfu6BWFZISFZEFjl0B7ullTDNrZmWxhM0vNuzB
	39qD1IKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x17EF-0000000AKel-3Bba;
	Mon, 31 Aug 2026 18:59:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x17EE-0000000AKeZ-2aus
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:59:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15775601FB;
	Mon, 31 Aug 2026 18:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD371F000E9;
	Mon, 31 Aug 2026 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788202773;
	bh=9h9f4egroVHXOkCH/bF4osumxuil4xiCtT1M5bdwfPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ndixk7wLCgrS3AfH4roAaSWyjpt6ufvFGCl1XMdBSSX4QPgVizjQANmqjZZy9qBfQ
	 O76D+5jcGxlF6hqPgJuowvhyVEMK7OXT8uqs3uVVBqtnv1itOgJQbghQsPdJDk8GOW
	 aRcwtd3BEYCn41BEygTvNM9xOkvC64yit+QYGXy+H5eHhcLtQa8g4G1y0YLa0Sehk3
	 zi3BVKpPetNI1o+oFq8XyUPfhhHuxgvPnUh0X09rSMJ3+G427abmKAp4Oy+NgV/6KR
	 xKEBlrwIsWTqOMGlbdLlUba/pXs0TTfYcaqbk5gDD3oR7tm5GtxTuVWWTRD7ZYMGY6
	 9TQALswYWSgiA==
Date: Mon, 31 Aug 2026 13:59:33 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
	Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Message-ID: <20260831185933.GA1042786-robh@kernel.org>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
 <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
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

On Mon, Aug 31, 2026 at 08:15:35PM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema.
> 
> During the conversion, the following updates were made:
> - Add "simple-mfd" to compatibles matching existing dts usage.
> - Add required bus properties #address-cells, #size-cells, and ranges
>   which were missing in text binding.
> - Document child nodes gpio, interrupt-controller, and reset-controller.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
>  .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
>  2 files changed, 84 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> index 000000000000..dd73b62357ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments Keystone Device State Control
> +
> +maintainers:
> +  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> +
> +description:
> +  The Keystone II devices have a set of registers that are used to control the
> +  status of its peripherals. This node is intended to allow access to this
> +  functionality.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ti,keystone-devctrl
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +    description: Keystone DSP GPIO controller

       required:
         - compatible

And on the other 2 child nodes.

> +
> +  "^interrupt-controller@[0-9a-f]+$":
> +    type: object
> +    description: Keystone DSP to ARM interrupt controller
> +
> +  "^reset-controller@[0-9a-f]+$":
> +    type: object
> +    description: Keystone reset controller

