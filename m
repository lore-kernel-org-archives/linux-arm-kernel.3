Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881DEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3acT+j5Fvk1kA+ik+rtMXubsjZ0DD1wGF5KMHatMRuQ=; b=hWaOjmEqoP9HsabgUu8LVa2HCt
	MP0Gf5tIPAjMz1qQREAEWoRi2uBdpPWI6oUMfPfIaHuXFS2EQM7yp6Y4Vb0FnlN0wHK8VewoxwQWy
	SxfEY1WkPVPr2E94D+bylPAzC9VAi+1QNbpP1Gu/9d2ic32f1S8iVToPprii3L2ziI20ZxgbthTjW
	qcRqviOc1Qp+wDKVoh85zT1BYU2jSstF5X4f1TySVsV16Qy5rqV8yvsZnSkmGtAVLeOyXy/3lZt/i
	xspsh+r7XqXG9g74OQNzwGodHPNhBo/hhETbMnOvYqxzrqfTWhtZq4SawCuxLvtIKahbIFIkWiGmw
	FMl+nlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oVh-00000007IKH-1MmW;
	Tue, 15 Apr 2025 22:12:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oSe-00000007Hjn-1HV2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 22:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 943C66115F;
	Tue, 15 Apr 2025 22:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E63C4CEE7;
	Tue, 15 Apr 2025 22:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744754935;
	bh=tyVsM8sNu2PCOz+arnoETnAj/qNuujBFl5CZuIgb6qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUL+er06cdomuT2To0Vp+vl3RezE21eS9FHO39xYrxl13ItAS72cgNN1YDbw2sDoI
	 jZUM/ht2DCGfCQaOp4g3ktg4fzLibFvaacZA5KDdh4rrxDAhJnGlOgRTyfsjnfVGOZ
	 rfLw4v57o6nzJQXAMX1FG97HnypSpNKjwJ/AvgDZKW8bmOjgWAsz8OFRckuSetUJbF
	 h0KpuhqmWYAaBuooEoYERzR+4RL9c7X/EHqyMPCfwCRh1ZVi7tFK0Tqgki7uWm4FP5
	 OmXmrl5M1eFTenfphFKy6xfN4WQrh6WhZSGrw5NtFjPXPxj7ExiMR1Btj2Agl3onuA
	 i9k7R/0At5mgg==
Date: Tue, 15 Apr 2025 17:08:53 -0500
From: Rob Herring <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v5 1/6] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250415220853.GA903775-robh@kernel.org>
References: <20250414140128.390400-1-lukma@denx.de>
 <20250414140128.390400-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414140128.390400-2-lukma@denx.de>
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

On Mon, Apr 14, 2025 at 04:01:23PM +0200, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>   (nxp,imx287-mtip-switch)
> 
> Changes for v3:
> - Remove '-' from const:'nxp,imx287-mtip-switch'
> - Use '^port@[12]+$' for port patternProperties
> - Drop status = "okay";
> - Provide proper indentation for 'example' binding (replace 8
>   spaces with 4 spaces)
> - Remove smsc,disable-energy-detect; property
> - Remove interrupt-parent and interrupts properties as not required
> - Remove #address-cells and #size-cells from required properties check
> - remove description from reg:
> - Add $ref: ethernet-switch.yaml#
> 
> Changes for v4:
> - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove already
>   referenced properties
> - Rename file to nxp,imx28-mtip-switch.yaml
> 
> Changes for v5:
> - Provide proper description for 'ethernet-port' node
> ---
>  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> new file mode 100644
> index 000000000000..6f2b5a277ac2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +description:
> +  The 2-port switch ethernet subsystem provides ethernet packet (L2)
> +  communication and can be configured as an ethernet switch. It provides the
> +  reduced media independent interface (RMII), the management data input
> +  output (MDIO) for physical layer device (PHY) management.
> +
> +$ref: ethernet-switch.yaml#/$defs/ethernet-ports
> +
> +properties:
> +  compatible:
> +    const: nxp,imx28-mtip-switch
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy-supply:
> +    description:
> +      Regulator that powers Ethernet PHYs.
> +
> +  clocks:
> +    items:
> +      - description: Register accessing clock
> +      - description: Bus access clock
> +      - description: Output clock for external device - e.g. PHY source clock
> +      - description: IEEE1588 timer clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ahb
> +      - const: enet_out
> +      - const: ptp
> +
> +  interrupts:
> +    items:
> +      - description: Switch interrupt
> +      - description: ENET0 interrupt
> +      - description: ENET1 interrupt
> +
> +  pinctrl-names: true
> +
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      ethernet-port:
> +        type: object
> +        unevaluatedProperties: false

This is going to fail if you have any property other than 'reg'. But 
then it will never be applied because you never have a node called
'ethernet-port' since you have more than 1 child node. You need this 
under 'patternProperties' and 'additionalProperties: true' instead. And 
please test some of the requirements here. Like a reg value of 3 or 
remove 'phy-mode'.

> +
> +        properties:
> +          reg:
> +            items:
> +              - enum: [1, 2]
> +            description: MTIP L2 switch port number
> +
> +        required:
> +          - reg
> +          - label
> +          - phy-mode
> +          - phy-handle

