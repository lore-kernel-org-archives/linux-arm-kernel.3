Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F835C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkcUnKoEWvBgRRdFNTHQoXsTzjHIKtGAHBkZ7/leYyc=; b=OFy/X6yIY6SkbCqylALl5MKh3j
	BE8RRF527yrvXCU2hayA+bpptyWzRfTMCkDxhC0q45yAM1zJ+8eIMmFVAM3U2aPWi6gsw4VMIYt/u
	gOO/MnH6Qa0Ol0LmGZjPTmEEXjYDdOOdJwJ3GzFnJsgqx7IP2tRaav11JWiiOv9SHGzqNU2QY142C
	25DeAq/xNsvVnsPzrvDC66oF0N5O1Iqf9TE1CydV2n4a++04XfGjxDJ9eWJLeY14lK5F16Zbq3Z/O
	KvyBxkW1xc3KwvWTfYiqzl9QCF4VaH4X26w79FZ6lUUqOVx1m3ls8Lj5PBGqaxTadimQh1EHzgY4c
	J69C8DNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1n-00000009fLP-1w9G;
	Sat, 08 Aug 2026 19:48:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1m-00000009fLJ-1vxy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:48:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6570643BAE;
	Sat,  8 Aug 2026 19:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5661F000E9;
	Sat,  8 Aug 2026 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786218497;
	bh=CkcUnKoEWvBgRRdFNTHQoXsTzjHIKtGAHBkZ7/leYyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FIb6eqjcVilsRjU4afSLBaSf2bwJsBUocJhWEA6bnyD69ksb6ZEkulVkib35gt3Qh
	 vTwicJNV+O4YZeLBFenmhgLtmMS/1vyix42eAC//3DVIfFQdtIcYShH0hJk8zytviV
	 smp9ofDpjjKhOt2ryIwHq+o6ZghN6lOhm0EkfYKrVSLcJ7aJLfF2htlkQiS5T/1WRW
	 xxrW+/UDWTloq6ishSoSwr0myBInvbcrnW5O7MrjZzxRcE4Noo+j4q4TQ/GEIoACfl
	 lY4Sycym9oMX8MuQoefnoQFhFgX8VmN0htvc05ZVEh9ntXsfE/doLQB8MjNr+7jjFY
	 e1q+axExZX/vA==
From: Jakub Kicinski <kuba@kernel.org>
To: nagadheeraj.rottela@amd.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	srinivas.neeli@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	michal.simek@amd.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	git-dev@amd.com
Subject: Re: [PATCH 01/20] dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC
Date: Sat,  8 Aug 2026 12:48:15 -0700
Message-ID: <20260808194815.132344-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC

This adds a new binding for the Xilinx TSN Endpoint Ethernet MAC IP,
describing a wrapper node that owns the six IP clocks and
xlnx,num-priorities, plus an endpoint MAC child and a three-port switch
child.  A MAINTAINERS entry is added for the new file.

A few questions about the schema below.

> diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> new file mode 100644
> index 000000000000..00f52b7b623c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> @@ -0,0 +1,343 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: xlnx,tsn-endpoint-ethernet-mac-3.0
> +
> +  reg:
> +    maxItems: 1

[Severity: Low]
Should the wrapper node have a reg at all?  It is listed in the top-level
required list alongside ranges, and in the example the two describe the
same window:

    reg = <0x80040000 0x40000>;
    ranges = <0x0 0x80040000 0x40000>;

Every child window (mac1 0x0+0x14000, ep-mac 0x16000+0xa000, mac2
0x20000+0x14000, switch 0x38000+0x8000) falls inside the parent's own
reg.

The commit message says the wrapper only owns the six shared clocks and
xlnx,num-priorities, and the wrapper driver in this series never maps
that region:

drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c:tsn_ip_probe() {
    ...
    ret = devm_clk_bulk_get(dev, TSN_NUM_CLOCKS, w->clks);
    ...
    return devm_of_platform_populate(dev);
}

Would it be cleaner for a bus node that translates its children through
ranges to either drop reg or describe only a wrapper-private register
block that no child window overlaps?

> +
> +  clocks:
> +    items:
> +      - description: GTX clock for transmitter logic and RTC
> +      - description: GTX 90-degree phase shifted clock for RGMII
> +      - description: Host RX FIFO clock
> +      - description: Host TX FIFO clock
> +      - description: Reference clock for IDELAY control
> +      - description: AXI-Lite register interface clock
> +
> +  clock-names:
> +    items:
> +      - const: gtx
> +      - const: gtx90
> +      - const: host_rxfifo
> +      - const: host_txfifo
> +      - const: ref
> +      - const: s_axi

[Severity: Low]
Are all six clocks present in every IP configuration?

A fixed items list implies minItems == maxItems == 6, and both clocks and
clock-names are in the top-level required list, so each DT must supply all
six phandles.  Two of them are documented as RGMII specific, gtx90 ("GTX
90-degree phase shifted clock for RGMII") and ref ("Reference clock for
IDELAY control"), while the switch ports below also allow:

              phy-mode:
                enum:
                  - gmii
                  - rgmii
                  - rgmii-id

For a GMII-only build with no IDELAY primitives, would a DT author have to
invent phandles for clocks the IP does not instantiate?  If those two are
optional in some configurations, could they be made conditional rather
than unconditionally required?

Note the wrapper driver in this series is consistent with what is written
here, it requests exactly these six names non-optionally via
devm_clk_bulk_get(dev, TSN_NUM_CLOCKS, w->clks), so the question is only
about the hardware.

[ ... ]

> +patternProperties:
> +  "^ep-mac@":
> +    type: object
> +    $ref: /schemas/net/ethernet-controller.yaml#
> +    description:
> +      Endpoint MAC sub-node. Provides the host-side data path through the
> +      DMA channels described by its dmas / dma-names.
> +    properties:
> +      compatible:
> +        const: xlnx,tsn-ep-mac
> +
> +      reg:
> +        maxItems: 1

[ ... ]

> +    required:
> +      - compatible
> +      - reg
> +      - dmas
> +      - dma-names
> +      - tx-queues-config
> +
> +    unevaluatedProperties: false

[Severity: Low]
How is an Endpoint-only instance described here?  The top-level
description says the IP:

  "provides low-latency network connectivity in either Endpoint-only or
   Bridged Endpoint configurations"

and

  "It also supports GMII/RGMII interfaces for connection to an external
   PHY"

The ep-mac node declares no interrupts/interrupt-names, and
ethernet-controller.yaml contains no interrupt properties either, so with
unevaluatedProperties: false any interrupt or MDIO child on the endpoint
MAC is rejected.  All interrupts and both MDIO buses live only on the
optional switch@ child, whose interrupt-names list is fixed to MAC1/MAC2
plus one ptp_timer.

An Endpoint-only DT (wrapper plus ep-mac, no switch child) is allowed by
the top-level required list, but ends up with no interrupt and no MDIO
description at all, and there is one compatible string with no if/then to
tell the two configurations apart.

Should ep-mac gain its own interrupts/interrupt-names and a way to reach
its PHY, or should the description be narrowed to the Bridged Endpoint
configuration the drivers in this series implement?  Nothing appears
broken today, the endpoint driver requests no interrupts and drives the
data path entirely through dmaengine.

> +
> +  "^switch@":
> +    type: object
> +    $ref: /schemas/net/dsa/dsa.yaml#/$defs/ethernet-ports

[ ... ]

> +      mdio-mac1:
> +        $ref: /schemas/net/mdio.yaml#
> +        description:
> +          MDIO bus controller for MAC1. Registers reside inside the mac1
> +          reg-names window.
> +        unevaluatedProperties: false
> +
> +      mdio-mac2:
> +        $ref: /schemas/net/mdio.yaml#
> +        description:
> +          MDIO bus controller for MAC2. Registers reside inside the mac2
> +          reg-names window.
> +        unevaluatedProperties: false

[Severity: Low]
This isn't a bug, but the child node names contradict the $nodename
patterns of the generic schemas this binding references.

mdio.yaml documents:

    pattern: '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'

and -mac1 / -mac2 matches none of the allowed suffixes (-bus, -external,
@<addr>, -<digits>).  Similarly the patternProperties key "^ep-mac@"
forces names like the example's ep-mac@16000, while
ethernet-controller.yaml documents:

    pattern: "^ethernet(@.*)?$"

Other in-tree bindings that $ref mdio.yaml for a child use a conforming
name (qca8k.yaml, realtek.yaml, renesas,rzn1-a5psw.yaml,
renesas,etheravb.yaml, faraday,ftgmac100.yaml, microchip,lan7800.yaml).
Would mdio@<offset> (or mdio-0 / mdio-1) and ethernet@<offset> work here
instead?

Related: the mdio-mac<N> nodes carry no reg, so nothing in DT locates the
MDIO block inside the parent mac1/mac2 window.  The offset is instead
hard-coded in the driver added later in this series:

drivers/net/dsa/xilinx/xilinx_tsn.h:
    #define TSN_MDIO_MC_OFFSET		0x00000500

Could the buses be described as mdio@500 with a reg so the offset comes
from DT?

> +
> +      ethernet-ports:
> +        type: object
> +        additionalProperties: true
> +
> +        properties:
> +          port@0:
> +            type: object
> +            additionalProperties: true
> +            description:
> +              CPU port. Wired internally to the ep-mac sibling.
> +
> +            properties:
> +              reg:
> +                const: 0
> +
> +              phy-mode:
> +                const: internal
> +
> +        patternProperties:
> +          "^port@[1-2]$":
> +            type: object
> +            additionalProperties: true
> +            description:
> +              External Ethernet port (port@1 is wired to MAC1, port@2 to
> +              MAC2). Its PHY is reached through the corresponding
> +              mdio-mac<N> bus.
> +
> +            properties:
> +              phy-mode:
> +                enum:
> +                  - gmii
> +                  - rgmii
> +                  - rgmii-id

[Severity: Medium]
Can a valid device tree bypass all of these port constraints?

The switch node uses $ref: /schemas/net/dsa/dsa.yaml#/$defs/ethernet-ports,
and the referenced schemas accept both container and port spellings:

Documentation/devicetree/bindings/net/ethernet-switch.yaml:
    patternProperties:
      '^(ethernet-)?ports$':
    ...
        patternProperties:
          '^(ethernet-)?port@[0-9a-f]+$':
    ...
    oneOf:
      - required:
          - ports
      - required:
          - ethernet-ports

The local constraints are attached only under properties: ethernet-ports:
and only to the keys port@0 and "^port@[1-2]$", and that container is
declared additionalProperties: true.

So a DT spelling the container ports { port@0 ... } (the spelling most
existing DSA device trees use), or spelling the ports
ethernet-port@0/1/2, passes dt_binding_check while none of the hardware
rules apply: the CPU port's reg: const: 0 and phy-mode: const: internal,
the gmii/rgmii/rgmii-id enum on external ports, and the port@1/port@2
only topology of this three-port IP.  A fourth port or phy-mode =
"sgmii" then validates cleanly and is only caught at probe:

drivers/net/dsa/xilinx/xilinx_tsn.c:xlnx_tsn_setup() {
    ...
    if (!dsa_is_user_port(ds, XLNX_TSN_PORT_MAC1) ||
        !dsa_is_user_port(ds, XLNX_TSN_PORT_MAC2))
	    return dev_err_probe(sw->dev, -EINVAL,
			         "both MAC1 and MAC2 must be enabled as switch ports\n");
    ...
}

Would matching both container spellings ('^(ethernet-)?ports$') and both
port spellings, and dropping additionalProperties: true inside the
container, close this?

[ ... ]

