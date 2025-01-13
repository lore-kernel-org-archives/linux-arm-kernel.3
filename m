Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC469E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpLq8XGKNPM5E/3NwdY8kWBPVV+tl98pEqUKOGCmCG0=; b=AKJGmHQ2Y+cceCmTEG3rxrJ3Bj
	ecPLFlOKFrWO5XBjx1Y9cVg+JjsNcQ17eVXuVNamS7Ezn4AZ/Gg57RathaHjQ+CDXF+SixeBri7xo
	sjpf+fym99KWqFqItdtXUl4aN155TVo/2B9qDloEkrUVzODt98SLLxqhrZ+EdJwC2/pHa7HEvPKhw
	yAQF5qvF4wLg/g6aeNBsOO9DCRPPIxOfDGKFnTHhnkJUaQFOxz38E0TTdiwIUIS0rILnTd2AxF2Ay
	NldSZAqgxJM9KMffaL4NDjvEVaa//LcYq9MWOv0MZxuaIaRjkVGvydealWRdY05dmJg4mTPGR5LEi
	ksjaeTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGKo-00000004WZ5-3ace;
	Mon, 13 Jan 2025 09:02:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGHn-00000004VFH-12Fn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 08:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C76405C26EA;
	Mon, 13 Jan 2025 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7ABC4CED6;
	Mon, 13 Jan 2025 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736758742;
	bh=2wJJM13zlSd944RH/1F0Bz3tql/OxPThH7169R04jPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF3rsECnnNXnLPj/o91djAfP13GvTUDHa2aK3jynTdpWUxaFsoHt+YYpkPFr2bKhE
	 paaaxfqSUYRyNmmn5DgXeZlS7H1ClTLKP+oyDF+5GGDc2WsJ1et8+uLlDwJA6dc8Yh
	 iBKHhWS8W7njrgoB4rmdN/Dy6jnx/scMlCusFopJtOhRwT7LIC432I46q+uA2e4VTT
	 IygCnhmFDWjW+tC5D5GmeULFnqs4qDnkJIkQqQYXJQsOvzLw5ublYsF1jTSODgkwbC
	 9BDvIfgqmUwktgiixLRMuCPn3STy19yGn/+3RanXIrVLiaNUHa+N7JZ6x5ru221kEl
	 e3ah5b52n3SCg==
Date: Mon, 13 Jan 2025 09:58:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
Message-ID: <7rr3fja4rxjbdmgpdqaid5fybiu6uctpbvp24ujv5drfmeiowf@u4pkhzyhy3pd>
References: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
 <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_005903_375205_D5C47AD2 
X-CRM114-Status: GOOD (  16.22  )
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

On Sun, Jan 12, 2025 at 09:43:48PM +0100, Sasha Finkelstein wrote:
 +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port. Always connected to the primary controller
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output MIPI DSI port to the panel
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi@228200000 {
> +        compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +        reg = <0x28200000 0xc000>;

This looks not matching unit address.

> +        power-domains = <&ps_dispdfr_mipi>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;

Make the example complete, so you will see that address/size cells are
unnecessary here or, if you really have more than one endpoint, they are
supposed to be here.

> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc07edccb437b221ea9772b9356e1896326aa7da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,h7-display-pipe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description:
> +  A secondary display controller used to drive the "touchbar" on
> +  certain Apple laptops.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8112-display-pipe
> +          - apple,t8103-display-pipe
> +      - const: apple,h7-display-pipe
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: be
> +        description: Primary register block, controls planes and blendinga

Description goes to 'reg:' field, just like I asked last time.

> +      - const: fe
> +        description:
> +          Contains other configuration registers like interrupt
> +          and FIFO control
> +
> +  power-domains:
> +    description:
> +      Phandles to pmgr entries that are needed for this controller to turn on.
> +      Aside from that, their specific functions are unknown
> +    maxItems: 2
> +
> +  interrupts:

Same comments as before - list and describe the items.

Best regards,
Krzysztof


