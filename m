Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BF606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c44XmY9d;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcaoLPDy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psxTBiyBkH+KxLML7YqAe/upIHPCDfQs4bqvvBxC+lE=; b=c44XmY9dEi54nAYFxuzP+HM6HH
	OB7HnmkauW1L3RPBexvqYV6GqoMyiGvxT1R/LgCpgQGRxpSQGmbh1geA/chx0eQgG7EqVJCkVKc2C
	U52RhRGZxhyHCFEfdSKTvF1uQenzf11RAyYHhHSS8lfxPgSBNvnHNfLYDY8HBFRTrA4kVBe8va0RN
	eUK/1jHPq7hDu3I7vM0dA0/UBAwd67iIZyE7A6OTvZe6xC/GGdLNeJsACQxqSVI7Xi2puoG7bdc4m
	hXG+meHCdw7fF4vPxpRLuyD5lPg4U7q+cFOMPqsAuyO7YM3EWwLz9rD81faSDz3wch5NahQmlv8u8
	tdg+WODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Tv-00000009bbF-0YBD;
	Tue, 20 Oct 2026 11:58:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Tt-00000009bar-27ps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:58:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F171940783;
	Tue, 20 Oct 2026 11:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955561F000C4;
	Tue, 20 Oct 2026 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497492;
	bh=psxTBiyBkH+KxLML7YqAe/upIHPCDfQs4bqvvBxC+lE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HcaoLPDytPyCiCnlZsuFUxkvjLxqnRbTFvBIXp+RP2q/yNkwLA082kKTYIq2GU6FW
	 Gn8usd6nf4LgC8MXPFuQGkBpW0aLp7FDFTa3nc+5s1tjzRWUVkJUWMxElA9Kev7I1K
	 kyc9hohT4v+jK7T+22P9qJisyFJ+sfhmb3uDD9Bzz1O4GuKcNRS8TFpxABUp3LAODc
	 T46mpT5uqV2BESDygC458ZfAZ0r0ZeJEz+DnW3rHMe83siOWtYOplxQuGfvqydXl+1
	 c66ebZrU97I/82j+OGjFdeGNWXux59i7J4rcyyrIvJ2qy5MV8VWNjn/em2NGziwF4O
	 7jwgzy229h6Zw==
Subject: Re: [PATCH net-next v3 1/8] dt-bindings: net: add Xilinx TSN Endpoint
 Ethernet MAC
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Tue, 20 Oct 2026 11:58:11 +0000
Message-ID: <179249749105.3135.3116293825083161439@kernel.org>
In-Reply-To: <20261016-patches_v2_external-v3-1-e33d3960ca1e@amd.com>
References: <20261016-patches_v2_external-v3-1-e33d3960ca1e@amd.com>
X-sashiko-severity: Low
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-
  ethernet-mac.yaml, the ethernet@ node's dma-names (lines 81-96) does…
- [Low] Concern: tx-queues-config only enforces a lower bound tied to
  xlnx,num-priorities, and the rest of the checking is left to a driver…
- [Low] The child compatibles in
  Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-…

--

dt-bindings: net: add Xilinx TSN Endpoint Ethernet MAC

This adds a YAML binding for the Xilinx TSN Endpoint Ethernet MAC IP in
its Bridged Endpoint configuration. The wrapper node owns the shared
clocks and xlnx,num-priorities. It has two children: an xlnx,tsn-ep-mac
endpoint that holds the DMA channels, and an xlnx,tsn-switch three-port
switch with its MDIO buses and ports.

> diff --git a/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> new file mode 100644
> index 0000000000000..bca834120b3b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
> @@ -0,0 +1,491 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: xlnx,tsn-endpoint-ethernet-mac-3.0

[ ... ]

> +patternProperties:
> +  "^ethernet@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/net/ethernet-controller.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Endpoint MAC sub-node. Provides the host-side data path through the
> +      DMA channels described by its dmas / dma-names.
> +    properties:
> +      compatible:
> +        const: xlnx,tsn-ep-mac

[Severity: Low]
The wrapper compatible is versioned (xlnx,tsn-endpoint-ethernet-mac-3.0).
The child compatibles here and on the switch node (xlnx,tsn-switch) are
generic and carry no version.

writing-bindings.rst asks for specific compatibles, with no device-family
names. For sub-blocks of a bigger device, it asks for device-based
compatibles.

If a later IP revision, or the planned Endpoint-only variant, changes the
endpoint or switch register layout, how would these child nodes be told
apart? The endpoint driver later in the series matches only on
"xlnx,tsn-ep-mac" in xlnx_tsn_ep_of_match.

Should the child compatibles be tied to the device or version, the same
way the wrapper compatible is?

[ ... ]

> +      dma-names:
> +        minItems: 2
> +        maxItems: 16
> +        items:
> +          pattern: "^(tx|rx)_chan[0-7]$"
> +        allOf:
> +          - contains:
> +              pattern: "^tx_chan[0-7]$"
> +          - contains:
> +              pattern: "^rx_chan[0-7]$"
> +        description: |
> +          Names matching the entries in 'dmas', one per DMA channel and in
> +          the same order. TX channel names use "tx_chan<N>" and RX channel
> +          names use "rx_chan<N>", where N is 0..7. At least one TX and one RX
> +          channel are required. Example: "tx_chan0", "tx_chan1", ...,
> +          "rx_chan0", "rx_chan1", ....

[Severity: Low]
The description says the names are "one per DMA channel". The v3
changelog says "Cap TX at 8 and RX at 8 channels". Does the schema
enforce either of these?

Without uniqueItems: true, dt_binding_check appears to accept a 16-entry
list of fifteen "tx_chan0" plus one "rx_chan0". It also appears to accept
"tx_chan0".."tx_chan7", then "tx_chan0".."tx_chan6", then "rx_chan0".

dtschema doesn't add uniqueness to -names properties by itself. For
example, renesas,drif.yaml lists "rx", "rx", while renesas,sdhi.yaml sets
uniqueItems: true on its clock-names.

Could uniqueItems: true be added here? The pattern only allows eight
names per direction, so that would also enforce the 8 TX / 8 RX limit.

Later in the series, ep_count_dma_channels() rejects duplicate TX and RX
names at probe time. So the runtime result is a DT that passes schema
validation and then fails probe.

[ ... ]

> +        patternProperties:
> +          "^queue[0-7]$":
> +            type: object
> +            additionalProperties: false

[ ... ]

> +        required:
> +          - queue0
> +          - queue1

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        xlnx,num-priorities:
> +          const: 3
> +    then:
> +      patternProperties:
> +        "^ethernet@[0-9a-f]+$":
> +          properties:
> +            tx-queues-config:
> +              required:
> +                - queue0
> +                - queue1
> +                - queue2

[Severity: Low]
With xlnx,num-priorities = <2>, can a tx-queues-config that contains
queue0 through queue7 still pass dt_binding_check?

The ^queue[0-7]$ pattern accepts every index from 0 to 7. The if/then
blocks for num-priorities 3..8 only add entries to required. So the
schema has a lower bound tied to xlnx,num-priorities, but no upper bound.

Later in the series, ep_parse_tx_queue_config() rejects queueN with
N >= num_tx_queues at probe time, so only schema validation is affected.

Could each if/then block also set queueK: false for K >= N, so the
schema rejects these nodes too?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-patches_v2_external-v3-0-e33d3960ca1e%40amd.com

