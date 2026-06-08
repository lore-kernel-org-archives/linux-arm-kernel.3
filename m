Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD21CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwAr31YE3Z1pED6qS0szzIwG3QCMLEOLMnQ2RMJDUOM=; b=vrAc1LvXCIhjdOLHu6WhaYiUjx
	UtZwZvnbTr60TO9ZGX/gUiew/TkQNI0ph/JTNBm0Lu6L1Lt7sdpZqPqaqb790UDcTaglqlKL7MJuZ
	kNwB2dF1aMnMmAqFNn+Xv1YurmA6Yh2+3AEOFfmsqfAfi3YQcPxCK2tusv8GCzSaA18J8pDvyJpKZ
	INydxpZHtsZ2uBEHbR31dTiaXB/8IYZ4u3cl9VGfPxzbmn7OQIZ2YpCuzKbwWUte5zUdZLGNt5Dvt
	c9ZiMbB1JwXQuw1PcLPZgDd3zurGvGcm8dE1/XCLG3J/NbQmoJ+FNOAQ67jo/cv+m0hv1XYc/AgtF
	YkuyDfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXUS-00000003M8e-1eon;
	Mon, 08 Jun 2026 10:45:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXUR-00000003M8Q-3Hf3;
	Mon, 08 Jun 2026 10:45:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F0A543AD6;
	Mon,  8 Jun 2026 10:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B051F00893;
	Mon,  8 Jun 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915555;
	bh=lwAr31YE3Z1pED6qS0szzIwG3QCMLEOLMnQ2RMJDUOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dH7w9e5cFvpPBbow5Hvzni+rdfyCJ3vvHYC0PpS0hpnzJH/kiVkxTr/pH/L/j24io
	 sHDosiUTCsVi0O5Ubn/CDuPWvynxVvwHKIpPhBSgGQ3iZMv+fvYy/03Om123qHfaD4
	 rqeT5sS7i3FuHBqZd6+A8R2ymf1lu/2sUxKAw0MH8Fim/BFtCOl6gcXDQvg8yS7On5
	 ulpkSxz+5tbOngYZa8XXDRazCC6gxRlGcimjE5YFDRx6ovgft23vkbHXt871HAA7Gl
	 2PRBnv8wbkJj1Y9JtYZ+9uQ+snvAfGO2VJFOm6a9fC7m2kJ/2cThPgPlVs2Xlm1Rhe
	 68JvJBYcj1lEw==
Date: Mon, 8 Jun 2026 12:45:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY
 binding
Message-ID: <20260608-demonic-horned-honeybee-4f6bb7@quoll>
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604101220.1092822-2-a0987203069@gmail.com>
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

On Thu, Jun 04, 2026 at 06:12:19PM +0800, Joey Lu wrote:

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-usb2-phy-otg
> +

Where is reg? MMIO is expressed with reg, not via custom phandle.


> +  clocks:
> +    maxItems: 1
> +
> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the system management syscon.
> +          - description: PHY instance index.
> +            enum:
> +              - 0   # USB0, OTG port (shared with DWC2 gadget controller)
> +              - 1   # USB1, host-only port
> +    description:
> +      A phandle to the syscon node covering the SYS register block, with
> +      one argument selecting the PHY instance. Index 0 selects the OTG
> +      port PHY (USB0) and index 1 selects the host-only PHY (USB1).
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  nuvoton,rcalcode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Resistor calibration trim code written to the RCALCODE field in
> +      USBPMISCR. The 4-bit value adjusts the PHY's internal termination
> +      resistance. When absent the hardware reset default is used.
> +
> +  nuvoton,oc-active-high:
> +    type: boolean
> +    description:
> +      When present, the over-current detect input from the VBUS power
> +      switch is treated as active-high. The default (property absent) is
> +      active-low. This setting is shared by both USB host ports.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - nuvoton,sys
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    usb_hphy0: usb-host-phy {

usb-phy

And drop unused label.

> +        compatible = "nuvoton,ma35d1-usb2-phy-otg";
> +        clocks = <&clk HUSBH0_GATE>;
> +        nuvoton,sys = <&sys 0>;
> +        #phy-cells = <0>;
> +    };
> -- 
> 2.43.0
> 

