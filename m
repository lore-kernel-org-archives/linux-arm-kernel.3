Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A59CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk+6pVVCUnWUK9IgM7r73lRfaDtOS1AqOjhCfpJf030=; b=DkM1MrZvWexqY0y/27siBAp/9E
	1T/f3MeWO+tlsqrC6AHFGzcg4MUThvg62Lx5W43sDO5AHm9+qwu+r6f4/OTdYJx6ATsb5Ay7lkY3b
	CjHGicDDFOxEBcG5Fmo8aVr62NWAHyB0CIBLLr70TDEoloua9W91exdlwQGA8neyxJ9/IGWlG/WEP
	WE+liiW04m492YJ0VeiiycTqYhgOliJ2p8CuR7zEccP9mjcH24pP9DwY+9pAwME/cVuVr0e9iD2Lb
	CgwdKaWqeZT4GFcTuAdKZxIW6Tik7TgxEKOKeixmTRKhp8nqsXNFkzvWnoCRRqdb1KyBWvsH0GAZq
	brw6GfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLHD-0000000BKUq-0hvd;
	Mon, 12 Oct 2026 19:01:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLH7-0000000BKRo-0K5r;
	Mon, 12 Oct 2026 19:01:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A564A43220;
	Mon, 12 Oct 2026 19:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D71A1F008A1;
	Mon, 12 Oct 2026 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831688;
	bh=xk+6pVVCUnWUK9IgM7r73lRfaDtOS1AqOjhCfpJf030=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l7oJfps7OydmdVFQdL8dS9pBt+n65dUip9H0ZEO7xSKTWtHAbYRwCtjeXiOREazIw
	 yeb8gkyBgiJZJ4y+Ns/8KBTQ92H4xWWZFkO4LKYnF6EmrtAGLA0jVHLhYLeAgjp079
	 Q08BuXxkaZXM/+txQ4jDAJzfj3eo/VnhK0vbwg0y4AQXBMnDJM1Zd22xmNS3hhc/eS
	 MRfVGUf4Gb5sJvvUsQJe6jxqN7m6sh9It1rEfvzfio/jg0Rh4GBVy+1b7oHCTlgvNP
	 flAUcbfddRcLaSFteFoymlntXLXmQknLG+LfhO43TX3VnsFWLk6OabYpiwJp3954nV
	 kk/PuK07up5YA==
Subject: Re: [PATCH net-next v11 2/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 david.wu@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 19:01:27 +0000
Message-ID: <179183168700.434549.4839888235106301371@kernel.org>
In-Reply-To: <20261008175225.3375274-3-coiaprant@gmail.com>
References: <20261008175225.3375274-3-coiaprant@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new binding
  Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml…

--

dt-bindings: net: pcs: add rockchip,rk3568-xpcs support

This adds a new device tree binding for the Synopsys DesignWare XPCS on
the Rockchip RK3568 SoC. The XPCS is accessed over APB3 and connected to a
Naneng Combo SerDes PHY. The binding covers reg, the csr and eee clocks,
one phy and one power domain, and on purpose leaves out the CRU reset
lines.

> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> new file mode 100644
> index 0000000000000..a331880eb11c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> @@ -0,0 +1,69 @@

[ ... ]

> +  phys:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - phys
> +  - power-domains
> +
> +additionalProperties: false

[Severity: Medium]
The properties list has no resets or interrupts entries, and
additionalProperties is false. Would a DT that fully describes this block
then fail dt_binding_check?

The SoC has four CRU reset inputs for this IP, defined in
include/dt-bindings/clock/rk3568-cru.h:

#define SRST_XPCS		150
#define SRST_XPCS_TX_DIV10	151
#define SRST_XPCS_RX_DIV10	152
#define SRST_XPCS_XGXS_RX	153

The commit message says they are left out because "no in-tree user
requests them". Documentation/devicetree/bindings/writing-bindings.rst
says the opposite:

  - DO attempt to make bindings complete even if a driver doesn't support some
    features. For example, if a device has an interrupt, then include the
    'interrupts' property even if the driver is only polled mode.

  - DON'T refer to Linux or "device driver" in bindings. Bindings should be
    based on what the hardware has, not what an OS and driver currently support.

Could resets and reset-names be added now, so the binding matches the
hardware?

The commit message also says the resets "can be added later as optional
without breaking ABI". Once DTs ship without them, though, they would have
to stay optional for good.

Could a driver then ever rely on putting the TX/RX div10 and XGXS RX
domains into a known state? The in-IP soft reset may not cover those
domains.

The same question applies to interrupts. The generic binding for this IP,
snps,dw-xpcs.yaml, documents an auto-negotiation interrupt output:

  interrupts:
    description:
      System interface interrupt output (sbd_intr_o) indicating Clause 73/37
      auto-negotiation events':' Page received, AN is completed or incompatible
      link partner.
    maxItems: 1

Is sbd_intr_o routed to the GIC on RK3568? If it is, should this binding
have an interrupts property too? If it isn't, could the commit message say
so?

The later patches in this series leave this binding unchanged, so neither
point is addressed later in the series.

> +
> +examples:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261008175225.3375274-1-coiaprant%40gmail.com

