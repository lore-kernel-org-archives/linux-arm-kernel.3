Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B52CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKNnYWlZ4y0T7QFRMYOGoByQhzd8uC503fuBr3CdBm4=; b=RP17twGYnWqhnaQ6V6LjkokECr
	jyitzElL5Nf0N+Vuk/w6GTgfoq1diJJ8gpSgXDqdNgPLu/9yO4fIthOC0/E0wiiztUyBGsjhVEz9d
	LsogIsBbVQLKhoUR7Dydj1r2doAsvx7jwHosRRueO/11Y47UH9GiuGuxB+zVFa9jK1kXxm6UhJtp1
	SwPH2/qYR2rPPFVh5GY3m81yT//bsGazmoDfJRm/kAKUO/ObJCpAaNHbGpj+LtC9HZtkm7ua5+/Om
	EH8iHkiBOgtqIkuemj1y9PmT7Sd9Q7871fVgZko5NqNlfGm54ZZDJ2EAY4I6K2CELi0AXxzr1fdk3
	1tInZalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8fi-00000007kdL-0coT;
	Thu, 01 Oct 2026 04:45:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8fg-00000007kcs-45mG;
	Thu, 01 Oct 2026 04:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF0BC60A52;
	Thu,  1 Oct 2026 04:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B89B1F000FF;
	Thu,  1 Oct 2026 04:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790829927;
	bh=NKNnYWlZ4y0T7QFRMYOGoByQhzd8uC503fuBr3CdBm4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FZtJESE+BWot7p5Ro5S53bhfOHS/d90XihLGl4ORxXaFnpZaZ8Y+AVbqp/eAPgj4h
	 eWWFyEgqQy+q4c6Hq/YZS3/PYhfVUd6HoToVW/Xhb+dJCNPbuIuiFOpJWHZCZ8E6Bm
	 LQTWoK82V8/DkcHXYprDNo2olbZBEkgacbGrkIX3F+RgVji2ycf+AJ3nCSWIDvtXCT
	 F/hCUMlkmWJVMdnv+KJntrtIv3IR5a+IkuA1dnPdByzAlMmvH8rGNANHrDaiYY8FX1
	 u91k9XZtQs0HrmiXxeOK2ni6VYGpva0a0rSvrzo7XTwGYfo5LFBZTXnhkLqrCYiq9U
	 LmzsM7c5rbugw==
Subject: Re: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
From: netdev-bot+sashiko@kernel.org
To: ansuelsmth@gmail.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 horms@kernel.org, joey@tinyisr.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch
Date: Thu, 01 Oct 2026 04:45:25 +0000
Message-ID: <179082992577.434549.3218874144788071107@kernel.org>
In-Reply-To: <20260928194511.41878-2-ansuelsmth@gmail.com>
References: <20260928194511.41878-2-ansuelsmth@gmail.com>
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

- [Low]
  Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml…

--

dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch

This commit adds a YAML binding for the Airoha AN8855 5-port Gigabit
Switch. The binding references the generic DSA ethernet-ports
definition and adds a single compatible string.

> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> new file mode 100644
> index 0000000000000..5ad9b9e139831
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

[ ... ]

> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> +  can access the Switch register space by configuring the PHY page.
> +
> +$ref: dsa.yaml#/$defs/ethernet-ports

[Severity: Low]
Should the port unit addresses be limited to what the hardware has?

This binding inherits the generic port node pattern from
dsa.yaml#/$defs/ethernet-ports without narrowing it:

Documentation/devicetree/bindings/net/dsa/dsa.yaml:
          "^(ethernet-)?port@[0-9a-f]+$":

The AN8855 has 6 ports. Ports 0-4 are user ports with internal PHYs and
port 5 is the CPU port, and the driver later in the series sets
ds->num_ports = AN8855_NUM_PORTS.

As a result, a DT with port@7 or port@1f still passes dt_binding_check
and dtbs_check. It is only rejected at probe time, and then the whole
switch fails to probe:

net/dsa/dsa.c:dsa_switch_parse_ports_of() {
    ...
		if (reg >= ds->num_ports) {
			dev_err(ds->dev, "port %pOF index %u exceeds num_ports (%u)\n",
    ...
}

Other DSA bindings with a fixed port count narrow the pattern under
ports: patternProperties. For example, mediatek,mt7530.yaml and
qca8k.yaml use "^(ethernet-)?port@[0-6]$", and renesas,rzn1-a5psw.yaml
uses "^(ethernet-)?port@[0-4]$".

Would something like "^(ethernet-)?port@[0-5]$" make sense here? This
file is unchanged at the end of the series.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928194511.41878-1-ansuelsmth%40gmail.com

