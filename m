Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C03BCA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOmhtgpp0CunsN7e7nTP80xujGK1hi9KxA+e2Q5Bid0=; b=ZO9RmVbe72RusWc3gUZk7kUyiN
	SY0AcOm8jgP9KoI0gvlDgncKYZ1RW6HgNuBzFuNfHOSDQxeck7gLXqNPlTdodqbQ2P1WJoBMq7AwK
	2/cEW0TIZuGgXdn70QoefTjxxe80eL4gPQUNu8v3r9XWVG+CfF2LYR6I+0PZiFqcPKfW5ZFbXjwQI
	RwDBznwMHboWCrenoP2xMHWAI3UYGdjlFYZn6/7bz52kSkLdWTWgIM7zmqHErsiI8W+gZ+kN4Nb/D
	dCmNvoYgBmC4cLwZyoSuOM+cR+r5ApAMeVeA6sHs6FBOxyXSD/bgamyOuMclNKzuHt3tDPFEQmXHH
	I7j7SyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr39-00000004hKu-29KL;
	Thu, 08 Oct 2026 16:32:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr37-00000004hKA-3VxX;
	Thu, 08 Oct 2026 16:32:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED11A60A74;
	Thu,  8 Oct 2026 16:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE031F000FF;
	Thu,  8 Oct 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791477172;
	bh=vOmhtgpp0CunsN7e7nTP80xujGK1hi9KxA+e2Q5Bid0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZrIv3h6uHbT7jpD/++Tbd99EhBLTIXx/iEToD8YKEUGJ0YmDpGUOCBe/rAwePrP4P
	 c6k5m/VX+1k1bl2eyzFSrOgzXFnU6c0BmHT9Og0C3Jsfm1fx8W7zQTJW0vbTTjqcxO
	 wWh/txaYR7j5Doys2nX9VEs0xXBeR/ZbW6LgWaDMrrce+qqRTvNwg1XmWptLAxT8yG
	 4yjEcVBi4j+T9pARmbJgo57sxe69VrDvEGdLQ/R8iJ2qytGwtYh8g7OyZaoRYvaf5F
	 dexO212QCB14qQ6+ncvh02ME0vMaIUlD45Afl3ciXJvbVYtse6Gh5I3Mget2wpJOyi
	 Et45NHqzkBCoA==
Subject: Re: [PATCH net-next v10 1/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, maxime.chevallier@bootlin.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, david.wu@rock-chips.com,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 16:32:51 +0000
Message-ID: <179147717113.434549.5384797662065196680@kernel.org>
In-Reply-To: <20261005223011.1124347-2-coiaprant@gmail.com>
References: <20261005223011.1124347-2-coiaprant@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new binding
  Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml…

--

dt-bindings: net: pcs: add rockchip,rk3568-xpcs support

This adds a new binding for the Synopsys DesignWare XPCS on the Rockchip
RK3568 SoC. The XPCS sits on the APB3 bus, connects to a Naneng Combo
SerDes PHY, and exposes four MII ports as ethernet-pcs-mii@N child nodes.
The commit message says the CRU reset lines are left out on purpose.

> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> new file mode 100644
> index 0000000000000..703fcff0e3f70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

[ ... ]

> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: serdes
> +
> +  power-domains:
> +    maxItems: 1
> +

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - power-domains
> +
> +additionalProperties: false

[Severity: Low]
Should this binding describe the XPCS reset inputs? The CRU binding
header already has four reset IDs for this block:

include/dt-bindings/clock/rk3568-cru.h:
#define SRST_XPCS		150
#define SRST_XPCS_TX_DIV10	151
#define SRST_XPCS_RX_DIV10	152
#define SRST_XPCS_XGXS_RX	153

The commit message gives this reason for leaving them out:

  The CRU reset lines (SRST_XPCS*) are intentionally not described: no
  in-tree user requests them, and bring-up relies on the PD_PIPE power
  domain, the SerDes PHY and the in-IP soft reset.

That reason is based on what drivers use today, not on what the hardware
has. Documentation/devicetree/bindings/writing-bindings.rst says:

  DO attempt to make bindings complete even if a driver doesn't support
  some features.

The schema has no resets or reset-names property and ends with
additionalProperties: false. A DT that fully describes the hardware with
something like resets = <&cru SRST_XPCS>, ... would then fail
dt_binding_check and dtbs_check.

The in-IP soft reset also only acts inside the PCS register block. It
does not appear to cover the TX/RX div10 or XGXS RX reset domains.

Could resets and reset-names be added now, even as optional properties?

On a related point that I have not been able to confirm: the generic
snps,dw-xpcs binding documents an sbd_intr_o interrupts output, and
additionalProperties: false also rejects that here. Does RK3568 route
that interrupt to the GIC? If it does, should interrupts be listed too?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261005223011.1124347-1-coiaprant%40gmail.com

