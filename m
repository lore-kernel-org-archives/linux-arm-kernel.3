Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB6ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHYdiOvoPMM4fKDDQu6aYgmkSz9zei65hX1+eT9iVnE=; b=HrT+n6dMZDAJ/yh72U/ZRuv8tv
	BXAoH8miOWcFfR/XlfQ1oHidHOU9/w5e5NFUL+4GoZQYqQ3Jtu2HRKtVgD1mAh4jHBw7JhBs5pto0
	ZSBBC+2PI/IIldod+rYwtrRBZl9K0XkC+cB4f6HHPUB43sqHIzvQtGWSfsnAhG82PkZfBkUNpwW6t
	zgt+7Rwp1mdQuHTQbYfoxvZ+H2Mtusq6hC88XOnHwOS1KiciKytoXNKARG8cirWxTxdL6OxeUXUU+
	kVkhdLXL7fDyesnOiGTWRdRnCWdliauNvGNJwk3nMvKmwzzi+VWw0h6/G8fB2zNFEWYPTXSB271hf
	3CRYi8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLHD-0000000BKVy-2Ymq;
	Mon, 12 Oct 2026 19:01:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLHA-0000000BKTa-41Hi;
	Mon, 12 Oct 2026 19:01:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 391FE602A8;
	Mon, 12 Oct 2026 19:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54601F008A1;
	Mon, 12 Oct 2026 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831691;
	bh=zHYdiOvoPMM4fKDDQu6aYgmkSz9zei65hX1+eT9iVnE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m1212i0Heg3Ok5j7k4aYr3MYBbpWrUTI4j8sr2lTfEPh0NHtvXqOHwh0+pWFtYUei
	 12qErMtNs/m6V8MW0VeNkZY33fSio1nn9NBV3a5+7vEPu4Zjd6E7V9oipyQa6jW54h
	 tN5OEcD6VNzQlPU1lB8HBQYE8kJc7A8YI/IV6xrIRlWwDBMo1gdUwkbCKoJQ9+4gpZ
	 HWGMyxyBd0Zv9Mmt2X7CxOlDaTzkRX1/CkB0D4XXkeoIdjY58i7pAcpkffqDNjyaDr
	 I/luYbsjrC4H62aZ3uVYMRrJkDEteNAaaP6i1LEhdtXwrYe/ZbHxjoyeTOYVlQCrcY
	 gjHIvejXagSNw==
Subject: Re: [PATCH net-next v11 4/6] dt-bindings: net: rockchip-dwmac:
 document pcs-handle
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
Date: Mon, 12 Oct 2026 19:01:30 +0000
Message-ID: <179183169035.434549.10534973207994828766@kernel.org>
In-Reply-To: <20261008175225.3375274-5-coiaprant@gmail.com>
References: <20261008175225.3375274-5-coiaprant@gmail.com>
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

- [Low] The patch adds an allOf entry to
  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml (lines…
- [Low] At this commit, rockchip-dwmac.yaml documents `pcs-handle` and
  requires it for rk3568 when phy-mode is "sgmii", but nothing in dwmac-…

--

dt-bindings: net: rockchip-dwmac: document pcs-handle

This patch documents a pcs-handle property in the Rockchip GMAC binding.
It makes the property required for rockchip,rk3568-gmac when phy-mode is
"sgmii". The SGMII driver support that uses the property arrives later in
the series.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 80c252845349c..c434450fd07ff 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml

[ ... ]

> @@ -159,6 +165,27 @@ allOf:
>          clocks:
>            minItems: 5
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-gmac
> +    then:
> +      required:
> +        - phy-mode
> +

[Severity: Low]
Is this block needed? The commit message doesn't mention it.

rockchip-dwmac.yaml already includes snps,dwmac.yaml through its allOf:

  - $ref: snps,dwmac.yaml#

That schema already requires phy-mode for every node, with no condition:

Documentation/devicetree/bindings/net/snps,dwmac.yaml:
required:
  - compatible
  - reg
  - interrupts
  - interrupt-names
  - phy-mode

So phy-mode is already required for all Rockchip GMAC compatibles,
including rk3568, and dt_binding_check / dtbs_check give the same results
with or without this block.

Repeating the requirement for rk3568 only could also suggest that phy-mode
is optional on the other Rockchip SoCs.

If the goal is to keep the sgmii if clause below from matching when
phy-mode is absent, the inherited requirement already does that. Could
this block be dropped? Alternatively, a local required: [phy-mode] could
go inside the sgmii if clause.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-gmac
> +        phy-mode:
> +          contains:
> +            const: sgmii
> +    then:
> +      required:
> +        - pcs-handle
> +

[Severity: Low]
At this commit, nothing in dwmac-rk.c reads pcs-handle yet, and the driver
doesn't accept SGMII. Doesn't that leave the binding and the driver out of
sync if someone bisects to this commit or applies only part of the series?

The consumer arrives in the next patch, "net: stmmac: dwmac-rk: add SGMII
support for RK3568". That patch adds rk_pcs_init():

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_pcs_init() {
    ...
	pcs_node = of_parse_phandle(node, "pcs-handle", 0);
	if (!pcs_node)
		return -ENODEV;
    ...
}

It also adds the SGMII pcs_init/pcs_exit/select_pcs handling to
rk_gmac_probe(). By the end of the series the binding and driver match,
and putting the binding before its user is the usual DT submission order.
I'm only noting it here for completeness.

>  unevaluatedProperties: false
>  
>  examples:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261008175225.3375274-1-coiaprant%40gmail.com

