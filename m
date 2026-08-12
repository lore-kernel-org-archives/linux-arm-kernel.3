Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D787DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy+yY7ScNPTLI9GPqIPBBSp+vMzLO39xsKXyzQYJ99g=; b=BQtHSxPCIvsFd6EIcBpdopAGOi
	1WS3dVGVw1EY/XQOkR5z3jIvc8NlqrxYpGIYlFaVE17sTxV5jbmGY6AZchnLg5s2jPcY0cPTJwEwL
	gdk4OBF4Gg912xLGXbej0YqqFOd64EN+OFD6Tq8lDFpPe5CCsBLH1OIOsSmQ6sOvnN9uD3y8Udncp
	TR3WM793tzDziA41TBoiKNurGaDvgMoh2EFXMh5yL+o/M0rzbAZ/woXPu6Nkuk9Janje7ZW7ccsck
	gP9jvHLS4fiynIN0Rvhk0V7QioNA1unJhFW/2B+G4lMT0w4z1VoWfaAgieJzklFVxfqwwiVJtxLZs
	4VbdFtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGJ1-0000000H2LA-1dEv;
	Wed, 12 Aug 2026 21:16:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGIx-0000000H2Kp-2IQa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 21:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2329402EE;
	Wed, 12 Aug 2026 21:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2CD1F000E9;
	Wed, 12 Aug 2026 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786569366;
	bh=Jy+yY7ScNPTLI9GPqIPBBSp+vMzLO39xsKXyzQYJ99g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E58VqySMPVR3JY7HOTNGr9aKopdC/lyGXtSvQDmLeEvPWmMjbVUfelG4CWhcmWxtn
	 2bHovtMMDJThTowpyek8S0i+tc0b6ncMVDblTqQ23iiglr3Z0fyKP0qc0aJm1QM/OY
	 n52J3OD/J1sUCV817jRl7Sz1js835hjMmDRTPEExkqDiXgXvsnGhNNZgKfxWx7O08M
	 fFdtsDOfEq7cNMUzcxFkpXuXJ5x00ORiLqfOPmZWVin+GpzY93COwrR1QarzO+4POW
	 XLFIeSISNBKyGvbDbGY1G3Py9Ehvh9hVQW5YtSGZwsuTTrZPKSd2XruYcCFvIGNvNS
	 YB9LOHBnjNflA==
Date: Wed, 12 Aug 2026 16:16:05 -0500
From: Rob Herring <robh@kernel.org>
To: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git-dev@amd.com
Subject: Re: [PATCH 01/20] dt-bindings: net: add Xilinx TSN Endpoint Ethernet
 MAC
Message-ID: <20260812211605.GA984427-robh@kernel.org>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807104431.157230-2-nagadheeraj.rottela@amd.com>
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

On Fri, Aug 07, 2026 at 04:14:12PM +0530, Nagadheeraj Rottela wrote:
> From: Srinivas Neeli <srinivas.neeli@amd.com>
> 
> Add a binding for the Xilinx TSN Endpoint Ethernet MAC IP. The
> top-level node describes the IP wrapper, which owns the six shared
> IP clocks and the xlnx,num-priorities parameter, and has two
> children:
> 
>   - xlnx,tsn-ep-mac: the endpoint MAC, owning the host-side DMA
>     channels (dmas / dma-names / tx-queues-config).
> 
>   - xlnx,tsn-switch: the three-port Ethernet switch covering the
>     switch fabric and the two per-MAC register windows. The MDIO
>     controllers and PTP register blocks sit at fixed offsets inside
>     the per-MAC windows, accessed through the mdio-mac1 / mdio-mac2
>     children and per-MAC interrupt-names entries. Each external
>     port@N references its PHY through a phy-handle in the matching
>     mdio-mac<N> child.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Co-developed-by: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
> Signed-off-by: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
> ---
>  .../net/xlnx,tsn-endpoint-ethernet-mac.yaml   | 343 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 350 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> new file mode 100644
> index 000000000000..00f52b7b623c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> @@ -0,0 +1,343 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/xlnx,tsn-endpoint-ethernet-mac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx TSN Endpoint Ethernet MAC
> +
> +description:
> +  TSN Endpoint Ethernet MAC IP implements IEEE 802.1 Time-Sensitive
> +  Networking (TSN) standards and provides low-latency network connectivity
> +  in either Endpoint-only or Bridged Endpoint configurations. In the
> +  Bridged Endpoint mode, the IP integrates a three-port switch, with two
> +  ports connected to the external network and one port connected to an
> +  internal endpoint. It also supports GMII/RGMII interfaces for connection
> +  to an external PHY, enabling full-duplex operation at 100 Mb/s and
> +  1 Gb/s speeds.
> +
> +maintainers:
> +  - Srinivas Neeli <srinivas.neeli@amd.com>
> +  - Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
> +
> +properties:
> +  compatible:
> +    const: xlnx,tsn-endpoint-ethernet-mac-3.0
> +
> +  reg:
> +    maxItems: 1
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
> +
> +  ranges: true
> +
> +  xlnx,num-priorities:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2
> +    maximum: 8
> +    description:
> +      Number of traffic classes (priorities) configured in the IP.
> +      This is an IP configuration parameter that determines the number of
> +      priority queues available for QoS scheduling. Traffic classes map to
> +      IEEE 802.1Q priority levels (0-7).

Vendor specific properties go after standard properties. See ordering 
rules.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^ep-mac@":

'^ethernet@[0-9a-f]+$'

> +    type: object
> +    $ref: /schemas/net/ethernet-controller.yaml#

Move unevaluatedProperties here.

> +    description:
> +      Endpoint MAC sub-node. Provides the host-side data path through the
> +      DMA channels described by its dmas / dma-names.
> +    properties:
> +      compatible:
> +        const: xlnx,tsn-ep-mac
> +
> +      reg:
> +        maxItems: 1
> +
> +      dmas:
> +        minItems: 2
> +        maxItems: 32
> +
> +      dma-names:
> +        minItems: 2
> +        maxItems: 32
> +        items:
> +          pattern: "^(tx|rx)_chan(1[0-5]|[0-9])$"
> +        description: |
> +          Names matching the entries in 'dmas', one per DMA channel and in
> +          the same order. TX channel names use "tx_chan<N>" and RX channel
> +          names use "rx_chan<N>", where N is 0..15. Example: "tx_chan0",
> +          "tx_chan1", ..., "rx_chan0", "rx_chan1", ....
> +
> +      tx-queues-config:
> +        type: object

Move additionalProperties here.

> +        description:
> +          TX queue configuration node that maps IP priority queues to
> +          DMA TX channels. The TSN IP supports multiple priority queues for
> +          QoS scheduling, and each queue can be connected to a specific DMA
> +          channel. This mapping defines which DMA TX channel is used to
> +          transmit packets for each priority queue. For example, queue0
> +          with xlnx,dma-channel-num set to 5 means priority queue 0 uses
> +          tx_chan5 for data transfer.
> +
> +        patternProperties:
> +          "^queue[0-7]$":
> +            description:
> +              Each subnode represents a priority queue. The
> +              xlnx,dma-channel-num property specifies which DMA TX channel
> +              (tx_chan0 to tx_chan15) is connected to this queue for
> +              transmitting packets.
> +            type: object

Move additionalProperties here and then a blank line after.

> +            properties:
> +              xlnx,dma-channel-num:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description:
> +                  DMA TX channel number connected to this priority queue.
> +                minimum: 0
> +                maximum: 15
> +
> +            required:
> +              - xlnx,dma-channel-num
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
> +
> +    required:
> +      - compatible
> +      - reg
> +      - dmas
> +      - dma-names
> +      - tx-queues-config
> +
> +    unevaluatedProperties: false
> +
> +  "^switch@":

^switch@[0-9a-f]+$

> +    type: object
> +    $ref: /schemas/net/dsa/dsa.yaml#/$defs/ethernet-ports
> +    description:
> +      Three-port Ethernet switch sub-node. Contains the switch fabric
> +      register window and the two per-MAC register windows; each per-MAC
> +      window houses an MDIO controller and a PTP register block at fixed
> +      offsets. The IP's per-MAC and PTP-timer interrupts are exposed here.
> +
> +    properties:
> +      compatible:
> +        const: xlnx,tsn-switch
> +
> +      reg:
> +        items:
> +          - description: Switch fabric register window
> +          - description: MAC1 register window (includes MDIO and PTP)
> +          - description: MAC2 register window (includes MDIO and PTP)
> +
> +      reg-names:
> +        items:
> +          - const: switch
> +          - const: mac1
> +          - const: mac2
> +
> +      interrupts:
> +        maxItems: 7
> +
> +      interrupt-names:
> +        items:
> +          - const: ptp_rx_mac1
> +          - const: ptp_tx_mac1
> +          - const: mac_irq_mac1
> +          - const: ptp_timer
> +          - const: ptp_rx_mac2
> +          - const: ptp_tx_mac2
> +          - const: mac_irq_mac2
> +
> +      mdio-mac1:

mdio-1

> +        $ref: /schemas/net/mdio.yaml#
> +        description:
> +          MDIO bus controller for MAC1. Registers reside inside the mac1
> +          reg-names window.
> +        unevaluatedProperties: false
> +
> +      mdio-mac2:

mdio-2

> +        $ref: /schemas/net/mdio.yaml#
> +        description:
> +          MDIO bus controller for MAC2. Registers reside inside the mac2
> +          reg-names window.
> +        unevaluatedProperties: false
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
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - interrupts
> +      - interrupt-names
> +
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - xlnx,num-priorities
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +examples:
> +  - |
> +    tsn_ip: tsn@80040000 {

Drop unused labels.

Rob

