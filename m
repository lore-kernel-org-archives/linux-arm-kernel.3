Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFD3C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gDMNCcHBDuYrPnahUNiZDFlvS3Nqh1QQMdqSSWYU9w=; b=kyODrqKBJ4jNrsfk/CdW29qOCw
	+IDm6/3dKZUkwJQSnKd1OCVg5Otuw/bmsyCxojnmGbYfoWqZFKX/KUwdsaP0BNUsqtsfx4OBnlS2X
	UUvNJzlk+Qzx+vySwfUE795mm0A333vyd1dwpjkBwDvcjR1eRz8AbmuCH0pMg3O5H59gzb4gzu71c
	mJtLuaR2HK3vlJkQav2E1d9KcifaP8FEKcG5dH4DouPqN3YEVSTecTw5jnP+grZXILQye75QSdo3C
	ljwM2sludW+QoHM65yIGm5N/kyUa2KZjeiDh5cEpcnTWgLrjvQJthH+QXFGsv3UQN9SzfgQx9IYzV
	mLa+OlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobII-00000004XHl-3N7F;
	Tue, 28 Jul 2026 06:28:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobII-00000004XHK-0nyX;
	Tue, 28 Jul 2026 06:28:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D86B6013A;
	Tue, 28 Jul 2026 06:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547C71F000E9;
	Tue, 28 Jul 2026 06:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785220081;
	bh=1gDMNCcHBDuYrPnahUNiZDFlvS3Nqh1QQMdqSSWYU9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OjCXX2RIhL4IV+fRTZslnsx2qiImzidMTIUjeGPhIiKJFW0pjPQNLBSTVoM6UUkBq
	 +PrUHOhExKJP8U30r56EWiY1QifFN74cf1D0tz0GsCypZOvJP0AWPHbdc428mzu6Mr
	 J2hgeiTXJfEOC3cWqTbVeomqhjNF3/vZlF3hC5zw5pQY5abkUuwUkxsQyRGa7kZcpk
	 6M1zV1dxzH9CgTyvID3JDJPXhPPLj6ZaIdmxaILO/kabZzN8rhMAssxCAObADzqXcE
	 k/LxzIyV8XrdeShSxA2RygfstjVfNdhUU6sYY8z7PMyunpmmbIfvWJURQdZS/OOHDx
	 duXqVfzPyelww==
Date: Tue, 28 Jul 2026 08:27:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Message-ID: <20260728-proficient-boobook-of-will-2cc94a@quoll>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
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

On Mon, Jul 27, 2026 at 09:24:16PM +0300, Stefan D=C3=B6singer wrote:
> +  interrupts:
> +    items:
> +      - description: IRQ reporting USB connection
> +      - description: IRQ reporting USB disconnection
> +      - description: IRQ reporting HSIC connection
> +      - description: IRQ reporting HSIC disconnection
> +
> +  interrupt-names:
> +    items:
> +      - const: usb-up
> +      - const: usb-down
> +      - const: hsic-up
> +      - const: hsic-down
> +
> +  resets:
> +    items:
> +      - description: USB phy reset
> +      - description: HSIC phy reset
> +
> +  reset-names:
> +    items:
> +      - const: usb
> +      - const: hsic

You do not need these two. It's one device and DT does not represent
internal device wirings because they are redundant (deducible from the
compatible).

> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    description:
> +      Reboot method for the SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names
> +  - syscon-reboot
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - "#reset-cells"
> +
> +unevaluatedProperties: false

This was different last time and previous code was correct.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
> +    #include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    topcrm: clock-controller@13b000 {
> +        compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +        reg =3D <0x0013b000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +        interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names =3D "usb-up", "usb-down", "hsic-up", "hsic-down";
> +        resets =3D <&topcrm ZX297520V3_USB_PHY_RESET>,
> +                 <&topcrm ZX297520V3_HSIC_PHY_RESET>;
> +        reset-names =3D "usb", "hsic";
> +        #clock-cells =3D <1>;
> +        #phy-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +
> +        syscon-reboot {
> +          compatible =3D "syscon-reboot";
> +          offset =3D <0x0>;
> +          mask =3D <0x1>;
> +          value =3D <0x1>;
> +        };

Best regards,
Krzysztof


