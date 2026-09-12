Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD64C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Mf+Bus7bZExgX6eYnOhdv7JCpgr42IOI7dNLYeXZDg=; b=ROsMbQnuxbndoqjVRUeqi3hNxn
	dscYXp2Rh3Xos7zT3HGYurmQN69bZKx3wDiZgnm8cA61BBIW/XmIdmSPb1Lys+aqj1n2oeHX/rpXW
	TYIo2bRrvNeCQlzJL1FHTf1GeVMrWFsigtTgEzFINfm/VflQAZS+domFU0iey1Y6Fz0m7f+ChKX1v
	dq1ZcT1Ki/oF6gAPEVb8T8y2yi9/tx7lNaQQd8a/Z7/K3pzrazU5urm/WNOtT+haNclXrjOKdnLIw
	BSLsYTIh4mRGgy7NxdLnYHm2w+aYDdlgPldQcFfEq/nTYCtoyludnSYHk92DP1/nS3GcGUyCkM8yB
	3ccM4WgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USG-00000001Afs-2odP;
	Sat, 12 Sep 2026 20:36:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USF-00000001Afl-2IaB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:36:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0BC46020C;
	Sat, 12 Sep 2026 20:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2481F000FF;
	Sat, 12 Sep 2026 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789245366;
	bh=3Mf+Bus7bZExgX6eYnOhdv7JCpgr42IOI7dNLYeXZDg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XEMYoKz4ALPiSXMax/Cs8C4xOjdSa5xuiMZI/JrBpmZruaGuCY1lED7PWaJUYypz6
	 8iUo5JoTAt4byFY8nISrlCvhryA4MyqlrRRu7JtEjkchgOU85PsXbZBw6jeU/bXwIu
	 Q8Hfv8/fyHcfa7sRwaSGIwJLSrXxwPxsjmYEKCoMO0QDaT2UhlZQtXFMUtY7YChHlr
	 6ZjpINW50T2osjv1SGr3Y3uohbuUpE0JJxOPs+EAk6AZIDJ20/BHNbkJE1M9+LWuWf
	 GXz3lVIJAaEeYCQm/+TQSrWxH+hzuE7gCsSIZZ4TTM7Ur0hFqw6ICYis613/MyRQw9
	 /AyAu8l6C2LcA==
Subject: Re: [PATCH net-next v2 1/8] dt-bindings: net: add Xilinx TSN Endpoint
 Ethernet MAC
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 michal.simek@amd.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Sat, 12 Sep 2026 20:36:04 +0000
Message-ID: <178924536482.3125.12884246382008244685@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-1-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-1-3a40babaff4c@amd.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] Inconsistent/incomplete port constraints in the new switch
  `^(ethernet-)?ports$` container.
- [Low] The endpoint MAC child's DMA/queue description is under-
  constrained and, more importantly, duplicates information that is…

--

dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC

Adds a new binding for the Xilinx TSN Endpoint Ethernet MAC IP in the
Bridged Endpoint configuration.  The wrapper node owns the six IP clocks
and xlnx,num-priorities, and has an ethernet@ child for the endpoint MAC
and a switch@ child for the three-port switch plus its two per-MAC
windows.

Two questions below about the schema constraints.

> diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> new file mode 100644
> index 000000000000..4e65d1710da7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> @@ -0,0 +1,364 @@

[ ... ]

> +  xlnx,num-priorities:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2
> +    maximum: 8
> +    description:
> +      Number of traffic classes (priorities) configured in the IP.
> +      This is an IP configuration parameter that determines the number of
> +      priority queues available for QoS scheduling. Traffic classes map to
> +      IEEE 802.1Q priority levels (0-7).

[Severity: Low]

Is xlnx,num-priorities derivable from the properties already present in
the ethernet@ child?

The driver added later in this series only accepts one value for it.  In
xlnx_tsn_ep_probe() in drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c:

	if (num_tx != num_prio)
		return dev_err_probe(dev, -EINVAL,
				     "TX channel count %u must equal num-priorities %u\n",
				     num_tx, num_prio);

so the only legal value is the number of tx_chanN entries in the child's
dma-names.

Since this is a required ABI property, would it be better to drop it and
count the tx_chanN entries, or, if it must stay, to state in the
description which of the two is authoritative?

[ ... ]

> +      dma-names:
> +        minItems: 2
> +        maxItems: 16
> +        items:
> +          pattern: "^(tx|rx)_chan[0-7]$"
> +        description: |
> +          Names matching the entries in 'dmas', one per DMA channel and in
> +          the same order. TX channel names use "tx_chan<N>" and RX channel
> +          names use "rx_chan<N>", where N is 0..7. Example: "tx_chan0",
> +          "tx_chan1", ..., "rx_chan0", "rx_chan1", ....

[Severity: Low]

A plain items pattern here also accepts lists the description rules out:
a TX-only or RX-only list, the same name repeated twice, or RX names
before TX names.  Could the entries be spelled out as an ordered items
list (or split with minItems/maxItems per direction) so the "TX first,
then RX" ordering is actually enforced?

> +      tx-queues-config:
> +        type: object
> +        additionalProperties: false
[ ... ]
> +        patternProperties:
> +          "^queue[0-7]$":
> +            type: object
> +            additionalProperties: false
[ ... ]
> +            properties:
> +              xlnx,dma-channel-num:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description:
> +                  DMA channel that transmits this priority queue, given as
> +                  the N of the tx_chanN entry in dma-names.
> +                minimum: 0
> +                maximum: 7

[Severity: Low]

tx-queues-config is required but has no required queueN child, so an
empty tx-queues-config node validates.  xlnx,dma-channel-num is also
bounded only by 0..7, so a queue may point at a channel that is absent
from dma-names, or at a channel another queue already claims.  Was at
least a required queue0 intended here?

[ ... ]

> +    patternProperties:
> +      "^(ethernet-)?ports$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +          port@0:
> +            type: object
> +            unevaluatedProperties: true
> +            description:
> +              CPU port. Wired internally to the endpoint MAC sibling.
> +
> +            properties:
> +              reg:
> +                const: 0
> +
> +              phy-mode:
> +                const: internal
> +
> +            required:
> +              - ethernet

[Severity: Medium]

Should reg be required on port@0 as well?

The value is constrained with reg: const: 0, but the required list only
names ethernet, and nothing in the inherited chain makes reg mandatory:
dsa.yaml#/$defs/ethernet-ports -> dsa-port.yaml only defines it,

  properties:
    reg:
      items:
        - description: Port number

and its if/then on ethernet/link requires phy-mode plus one of
fixed-link/phy-handle/managed.  ethernet-switch.yaml's ports container
requires only #address-cells/#size-cells.

So this node passes dt_binding_check:

    port@0 {
        ethernet = <&ep_mac>;
        phy-mode = "internal";
        fixed-link { speed = <1000>; full-duplex; };
    };

but dsa_switch_parse_ports_of() in net/dsa/dsa.c bails out on it:

	for_each_available_child_of_node(ports, port) {
		err = of_property_read_u32(port, "reg", &reg);
		if (err) {
			of_node_put(port);
			goto out_put_node;
		}

That is also asymmetric with the sibling ^port@[1-2]$ subschema below,
which does require reg.

> +        patternProperties:
> +          "^port@[1-2]$":
> +            type: object
> +            unevaluatedProperties: true
> +            description:
> +              External Ethernet port. port@1 is wired to MAC1 and reached
> +              through the mdio-1 bus, port@2 is wired to MAC2 and reached
> +              through the mdio-2 bus.
> +
> +            properties:
> +              reg:
> +                enum: [1, 2]

[Severity: Medium]

Since both external node names share this one subschema, reg is
decoupled from the unit address.  This validates:

    port@1 { reg = <2>; phy-handle = <&phy0>; phy-mode = "rgmii-id"; };
    port@2 { reg = <1>; phy-handle = <&phy1>; phy-mode = "rgmii-id"; };

as does giving both ports the same reg value.  The description keys the
MAC and MDIO association by node name, while the DSA core selects the
port by the reg value, so a swapped DT passes the schema and then
associates the wrong PHY/MDIO bus with each MAC.

Would per-port subschemas with reg: const: 1 and reg: const: 2, in the
same style used for port@0, work better here?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-patches_v2_external-v2-0-3a40babaff4c%40amd.com

