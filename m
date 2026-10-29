Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MfohOFfu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FekffGg1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aYbsPd6v1c8tWlmZ8JnGqLhxR5NtaX3G4ydQCpTpDHI=; b=MfohOFfuRi/3+3iX+kDiQJ1dJv
	44A4VWNNGeroPhCt/j4xzBHZ1hWE36q8gBQiAZZ2eFcDXxPIx5ez+NZ1F6VYUXVth2PCcILx2KNxt
	wzhi/qy1RqxQbBfsiUeaZyV92ND2iSzGNhsIjGZR6Xtub7ra2IPnynqbAcoxhWju72sN1QM+Ud+Ng
	dWgbOWnPyJmUY+aguHFfqqabl5aF14y4U7KmptTFxbWhs3p8rRJf0Wp8KKgStFaN4AAm2MGGS1iF8
	FsG2IufCy9ZKiwLZPKOEyOKVzfhEdrv5NVhJFuJm+zAf3w6FvKe0FfBY/xFSsfBeEFeYjOS2i1CF/
	CVAhHkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFTj-00000008AhH-0t5Z;
	Thu, 29 Oct 2026 02:02:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFTb-00000008AbP-3cCX;
	Thu, 29 Oct 2026 02:02:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B9EA40914;
	Thu, 29 Oct 2026 02:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224231F031E1;
	Thu, 29 Oct 2026 02:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793239367;
	bh=aYbsPd6v1c8tWlmZ8JnGqLhxR5NtaX3G4ydQCpTpDHI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FekffGg1WvdKdO4PzvuTAjaswTmfApMYNhIHRrhfZ7ijAGCj+ZJyhWKje/cj9NU8p
	 G/tD1RFw242jH/wO6Hi09g4inHH34+QXcFo7XyzptybHfuf7CVOu0zN5FVzDREzLw+
	 nn7NOtMG3Vdhmq/quFBIpWi77meQJ3IcLHL3pRg3DF/rWPG7+huEogf8HFK+zbt9hh
	 hnJg8M5FStCpnaD4cWcr4EzQJSOlJLDnNxJl5I0S4M/dZ/44qFgS5+AtNskRtHh7DQ
	 a9ln0RlUJBV99700xyN/MTToWAo2nJp/qSM2ZC/EbS10os5Ueokkley3jsNf0Upp9H
	 fmzJrroGBx45A==
Subject: Re: [PATCH v3 6/7] dt-bindings: net: dsa: mediatek,mt7530: add
 econet,en751221
From: netdev-bot+sashiko@kernel.org
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Date: Thu, 29 Oct 2026 02:02:45 +0000
Message-ID: <179323936568.3134.10381091206538490208@kernel.org>
In-Reply-To: <20261028011317.1557238-7-cjd@cjdns.fr>
References: <20261028011317.1557238-7-cjd@cjdns.fr>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The binding documents `econet,en751221-gswitch` for the MCM
  switch, but even at the end of the series no driver matches that…
- [Low] In Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
  the new `$defs/mt7530-passthrough-dsa-port` (lines 240-252) is applied…
- [Low] The binding text gives the wrong number of on-die PHYs.
- [Low] The `econet,en751221-gswitch` conditional in mediatek,mt7530.yaml
  (lines 369-377) only requires `mediatek,mcm` and references…

--

dt-bindings: net: dsa: mediatek,mt7530: add econet,en751221

This patch adds two compatibles to the MT7530 DSA binding.
econet,en751221-switch is the on-die switch of the EcoNet EN751221 SoC.
econet,en751221-gswitch is the multi-chip module MT7530 that some packages
connect to port 5 of the on-die switch over TRGMII. The gswitch gets a new
mt7530-passthrough-dsa-port definition that limits its link port to reg 6
and trgmii.

> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index e29fb86934981..b73732d28d8cb 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -29,6 +29,12 @@ description: |
>    and the switch registers are directly mapped into SoC's memory map rather than
>    using MDIO. The DSA driver currently doesn't support MT7620 variants.
>  
> +  EcoNet EN751221 SoCs have a memory mapped MT7530 with 3x 10/100 PHYs and 1x
> +  gigabit PHY. Some EN751221 chips such as EN7513G and EN7526G have a multi-chip
> +  module implementation of the MT7530 as well as the on-die switch. In these
> +  packages, the multi-chip module is connected to port 5 of the on-die switch
> +  via a TRGMII link and allows for 5 gigabit ports.

[Severity: Low]
Is the PHY count here right? The commit message says:

  ports 0..3 are 10/100 only, port 4 has a gigabit PHY

That is four 10/100 PHYs, not three. The later driver patch in this series
("net: dsa: mediatek: support EN751221 switch") also says "The on-die
MT7530 has 4 FE ports and 1 GE port". Its en751221_mac_port_get_caps()
handles case 0 ... 3 as MAC_10 | MAC_100.

The mediatek,mcm description further down has a related wording problem.
It now reads:

  Used for MT7621AT, MT7621DAT, MT7621ST, MT7623AI and EN751221 SoCs which
  the MT7530 switch is a part of the multi-chip module.

However, this patch adds econet,en751221-switch to the builtin block, which
sets "mediatek,mcm: false". Only econet,en751221-gswitch in the EN7513G and
EN7526G packages can use the property.

Could that text name the multi-chip module packages instead of EN751221
SoCs in general?

[ ... ]

> @@ -111,6 +117,14 @@ properties:
>            Built-in switch of the EcoNet EN7528 SoC
>          const: econet,en7528-switch
>  
> +      - description:
> +          Built-in switch of EcoNet EN751221 SoC
> +        const: econet,en751221-switch
> +
> +      - description:
> +          Multi-chip module gigabit MT7530 in EN751221 SoC
> +        const: econet,en751221-gswitch

[Severity: High]
Will any driver bind to econet,en751221-gswitch? Neither new compatible
has a driver match in this tree yet.

The later commit "net: dsa: mediatek: support EN751221 switch" adds
econet,en751221-switch to mt7988_of_match in mt7530-mmio.c. For the
multi-chip module, though, it adds this entry to mt7530_of_match in
drivers/net/dsa/mt7530-mdio.c:

	{ .compatible = "econet,en751221", .data = &mt753x_table[ID_EN751221_EXT], },

econet,en751221 is also the SoC root compatible in
arch/mips/boot/dts/econet/en751221.dtsi.

So with a DT that follows this binding, mt7530_probe() never binds to the
gswitch node. The on-die switch's port 5 link then points at a switch that
never registers. The DSA tree never completes, and EN7513G and EN7526G
boards have no switch networking.

Using "econet,en751221" in the DT to get the driver to probe would fail
dt_binding_check instead, because that string is not in the compatible
list here.

The binding requires mediatek,mcm and reset-names = "mcm" for the gswitch.
Those properties are only read in mt7530_probe() in mt7530-mdio.c:

	priv->rstc = devm_reset_control_get(&mdiodev->dev, "mcm");

That path is never reached for the documented compatible.

Should the binding and the driver use the same string here?

[ ... ]

> @@ -223,6 +237,20 @@ $defs:
>                  phy-mode:
>                    const: internal
>  
> +  mt7530-passthrough-dsa-port:
> +    patternProperties:
> +      "^(ethernet-)?ports$":
> +        patternProperties:
> +          "^(ethernet-)?port@[0-6]$":
> +            if:
> +              required: [ link ]
> +            then:
> +              properties:
> +                reg:
> +                  const: 6
> +                phy-mode:
> +                  const: trgmii

[Severity: Low]
Is "passthrough" the right name for this definition? It is only applied to
econet,en751221-gswitch, the downstream multi-chip module. By the driver's
definition, that switch is not in passthrough mode.

In this series, mt753x_check_passthrough() in drivers/net/dsa/mt7530.c
treats a switch as passthrough only when exactly two enabled ports carry
an ethernet or link phandle:

	if (passthrough_ports > 2 ||
	    (passthrough_ports == 2 && enabled_ports != 2)
	) {
		dev_err(dev, "Only two ports allowed in passthrough mode\n");
		return -EINVAL;
	}
	return passthrough_ports == 2;

The gswitch has user ports 0..4 plus one link, so this returns 0 for it.

The switch that really is in passthrough mode is the on-die
econet,en751221-switch, with CPU port 6 on ethernet and port 5 on link.
The "add passthrough mode" patch in this series describes it as: "the
upstream switch is restricted, with no other ports".

That switch only gets builtin-dsa-port, which only checks ports that have
ethernet. Doesn't that let the on-die port 5 link port use any reg and any
phy-mode, and allow extra user ports next to the link, while still passing
dt_binding_check?

At runtime, mt753x_check_passthrough() rejects the extra-ports case with
-EINVAL. A non-trgmii port 5 is refused by phylink, because
en751221_mac_port_get_caps() only allows TRGMII on port 5.

The reg 6 / trgmii rule does match the gswitch's upstream port. Would a
different name for this definition work, plus separate rules for
econet,en751221-switch?

[ ... ]

> @@ -337,6 +366,16 @@ allOf:
>          mediatek,mcm: false
>          reset-names: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - econet,en751221-gswitch
> +    then:
> +      $ref: "#/$defs/mt7530-passthrough-dsa-port"
> +      required:
> +        - mediatek,mcm

[Severity: Low]
Does this branch constrain the gswitch ports enough?
mt7530-passthrough-dsa-port uses "if: required: [ link ]", so it only
checks link ports that already exist. It never requires a link port, and
it never matches ports that have ethernet.

The commit message says the gswitch is "similar to the MT7621 multi-chip
module" and that its "port 6 is configured as a DSA link port". The
mediatek,mt7621 branch applies mt7530-dsa-port:

    then:
      $ref: "#/$defs/mt7530-dsa-port"
      required:
        - mediatek,mcm

Nothing in this branch constrains a CPU (ethernet) port or requires the
port 6 link.

The gswitch only connects to on-die port 5 over TRGMII. Wouldn't a
gswitch node with an ethernet port of any phy-mode, or with no link port
at all, still pass dt_binding_check?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261028011317.1557238-1-cjd%40cjdns.fr

