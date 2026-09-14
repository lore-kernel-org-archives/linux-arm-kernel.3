Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D704FC88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aOylPq8QnPfvdonDez7MymtTE8l4/nFf2/wk25ND9o=; b=AShVLiTpMZxQ9LR7yutafy1Fei
	Rdlgo7vGIqcvyPSrWKpI55lPI2C5z5SD2iuUH5rftePiQ/sfrTaHw4+sT77FSUucVKJ0d5VAJZvwN
	0rbVT9eLMDXihn1PELEGJ26VjpniqqMmVa2XgZ410BX3wtDdmows5gsdB3mDzXnXIWcoPaSlw60UR
	zq/9wR7EwIUjcSzZBaTOG3j2OEFn82GpXcleFmmELNo497yxC0SJ20/Zlm9Y3rZ2ii+k+El0JAdvL
	HO6Vz9tFnoidCogk17tWvFnsDC0I4Ch0DJ5NU2Wz6KPMF3TQh4gKeWGQtFi6AHIq3e62KjtSnIFN6
	6MSjuHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEk-00000004auF-0SNy;
	Mon, 14 Sep 2026 20:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DER-00000004aVj-45t9;
	Mon, 14 Sep 2026 20:24:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B522D43EFC;
	Mon, 14 Sep 2026 20:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B70B1F008AB;
	Mon, 14 Sep 2026 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417491;
	bh=6aOylPq8QnPfvdonDez7MymtTE8l4/nFf2/wk25ND9o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aMz3N7D9ioLUm4AQwgsjhTFk/c4ruGmOiuvcf8wqCumVWQEUDfTrfEn6y2hnZZLph
	 /NKYungq/1xmfE9KWEgwQ3uYRvQjZmu56PNsn+tz87I3qI5CwvGb0oj5VSrgWR0Cw1
	 PHcsqvaXdi7YoVMlxGFlykHoZryLZpr0Bsxzfh+2FYJuVBn3s894xTQeU34vWjW6aJ
	 w+LAMjmmVt1dYOs7gzEnKin+oHvPCCm/jqWhizILCG7lrtCoktTEehJ+HCacVhI0LH
	 6xFEcIGN3tvPHgcA/vbAEXFNFH8Y+UnQDmab6knE6jykCz6FSaD7G7xTZC5/5Wpo9S
	 xuXnnoX8zgRWw==
Subject: Re: [PATCH net-next v5 08/11] dt-bindings: net: rockchip-dwmac:
 document pcs-handle
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org,
 linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Mon, 14 Sep 2026 20:24:49 +0000
Message-ID: <178941748966.22033.4234623456215568276@kernel.org>
In-Reply-To: <20260913185849.907479-9-coiaprant@gmail.com>
References: <20260913185849.907479-9-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 3

- [Low] Concern (verified FALSE POSITIVE, retained for policy): the
  binding makes `pcs-handle` required for `phy-mode = "sgmii"` and the…
- [Low] Concern (verified FALSE POSITIVE, retained for policy): the new
  `pcs-handle` property and the `if phy-mode contains sgmii -> require…
- [Low] Concern (verified FALSE POSITIVE, retained for policy): the new
  conditional's `if` clause tests the value of `phy-mode` without…

--

dt-bindings: net: rockchip-dwmac: document pcs-handle

This adds a pcs-handle property to the Rockchip dwmac binding and adds an
allOf conditional that makes pcs-handle a required property whenever
phy-mode contains "sgmii".  There are no other changes to the schema.

No Link: tags are present in the commit header.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 80c252845349c..67b21ea77ec96 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -120,6 +120,12 @@ properties:
>      maximum: 0x7F
>      default: 0x10
>  
> +  pcs-handle:
> +    description:
> +      Specifies a reference to a node representing the PCS device
> +      connected to this GMAC. Required when phy-mode is "sgmii".
> +    maxItems: 1
> +

[Severity: Low]

Should pcs-handle be gated on compatible?  As written the property is
accepted for every Rockchip GMAC compatible selected by this binding,
even though only rockchip,rk3568-gmac integrates the XPCS plus Naneng
combo SerDes.  Other SoC-specific properties in this file use the
else-branch form, for example:

    else:
      properties:
        rockchip,php-grf: false

Checking this further, the un-gated form does not appear to cause a
problem in practice.  At the end of the series only rk3568_ops provides
.set_to_sgmii, and rk_gmac_check_ops() in
drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c has:

	case PHY_INTERFACE_MODE_SGMII:
		if (!bsp_priv->supports_sgmii)
			return -EINVAL;

so an sgmii device tree on a Rockchip SoC without SGMII support fails
probe rather than misbehaving.  This binding has also never restricted
phy-mode per compatible, since it inherits the full phy-connection-type
enum through snps,dwmac.yaml, so accepting phy-mode = "sgmii" on other
Rockchip parts predates this patch.  The same construct appears un-gated
in Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml, which is
also a snps,dwmac child binding.

>    phy-supply:
>      description: PHY regulator
>  
> @@ -159,6 +165,15 @@ allOf:
>          clocks:
>            minItems: 5
>  
> +  - if:
> +      properties:
> +        phy-mode:
> +          contains:
> +            const: sgmii
> +    then:
> +      required:
> +        - pcs-handle
> +

[Severity: Low]

This conditional makes pcs-handle mandatory, and the commit message
describes its consumer in the present tense:

    The property is parsed by rk_pcs_init() and a missing phandle fails
    the probe

At this revision there is no rk_pcs_init() in
drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c, so is the wording ahead
of the tree here?

Looking at the rest of the series answers this: the following patch,
"net: stmmac: dwmac-rk: add SGMII support for RK3568", adds
rk_pcs_init() with exactly the described behaviour:

	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
	if (!pcs_node)
		return -ENODEV;

and rk_gmac_probe() installs plat_dat->pcs_init = rk_pcs_init for SGMII.
Sending the binding before the driver change is the expected ordering, so
this is only visible when the patch is read on its own.

[Severity: Low]

Separately, the if clause tests the value of phy-mode without listing it
in required, for example:

  - if:
      properties:
        phy-mode:
          contains:
            const: sgmii
      required:
        - phy-mode

Without that, JSON Schema also matches nodes that omit phy-mode entirely,
which nominally makes template nodes such as gmac0 in
arch/arm64/boot/dts/rockchip/rk3568.dtsi and gmac1 in rk356x-base.dtsi
require pcs-handle.  Would adding required: [phy-mode] be worthwhile for
clarity?

Following this through, it does not change validation results.  This file
has allOf: - $ref: snps,dwmac.yaml#, and snps,dwmac.yaml already lists:

required:
  - compatible
  - reg
  - interrupts
  - interrupt-names
  - phy-mode

so a node without phy-mode already fails validation on the inherited
required list, and the new conditional only adds a second, redundant
message.  The two dtsi nodes above already omit the pre-existing
mandatory phy-mode, so nothing that previously validated is newly
rejected.  The same un-guarded pattern is used in
Documentation/devicetree/bindings/net/ethernet-controller.yaml.

>  unevaluatedProperties: false
>  
>  examples:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260913185849.907479-1-coiaprant%40gmail.com

