Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAEBCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6hJBtyTi9DM1ORhmBlWxBLMJ0Kys5j4u+cW0spLmNU=; b=KZ8ijcUdrjwBFPL2EM30Mq8HMr
	jzP0ZrGwyQFLH4XL0bDegLNKaHUih9ZTbRU//mHfSzKuXkLAL2x9X28/jMHhZYXtQ5dLIqimXl14s
	46qEHP27NWOsmxbGNHvy+zqdqIFWkiDexolPRPTEYnfqUdoeKzhf6d8UJNs8MEfjQGTvlZ7XpnB05
	IDv7bLVENGWDa2XN+GE+ZDcO65g97Lty6wjYInzBbLcUnw76c16Q/fsDspImdIDCS4029iQGr3oox
	q3mwflYQso82vvKG1wk+bIvKBy3mxykhqgz9gSNX5A8bfxstId0BaQMU5DV/EwYrfUQfI2TsUtDjA
	c9Alg5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthny-000000051ws-1ahQ;
	Wed, 03 Sep 2025 07:21:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthlF-000000050eg-2UhC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90E5660233;
	Wed,  3 Sep 2025 07:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4367C4CEF0;
	Wed,  3 Sep 2025 07:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756883907;
	bh=YuoISYCyGQJP6CZlxMjw80wdeLcQLhpCqTKRpVB9WGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Onavuu25vmdsBWj3aAVpuIn0haCHhtOp0Ucgqa+e3guMFePD70UzmO3VarK12SaQx
	 MhI8xYFXTDMvSw4aiGbmzcnCCGlM9YVQzLP3E+9xR7cG7fcaLZu3bS+yFmr3J0OMJX
	 hiVOhRGgBtePUldLKUlszstDLfYIU9bSiOdquNB1Utdt/qAH9bYwgg1Oo7fRgbVoJx
	 /KpbvsKsvueX80BtwbSw7WVP9zpbr2MkceGhy/vQOm8QdHYdDUOBMKz+XIJzioMkK5
	 jefMMNyqHoSz4ynxNBO8dckT2rKDJZd/GU3SXvJ0Ip/eqdkWIp0TID/ivpjp4MgIGJ
	 q0lR6Myo4T04A==
Date: Wed, 3 Sep 2025 09:18:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Subject: Re: [PATCH net-next v2 1/8] dt-bindings: net: ti,rpmsg-eth: Add DT
 binding for RPMSG ETH
Message-ID: <20250903-dark-horse-of-storm-cf68ea@kuoka>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902090746.3221225-2-danishanwar@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 02, 2025 at 02:37:39PM +0530, MD Danish Anwar wrote:
> Add device tree binding documentation for Texas Instruments RPMsg Ethernet
> channels. This binding describes the shared memory communication interface
> between host processor and a remote processor for Ethernet packet exchange.
> 
> The binding defines the required 'memory-region' property that references
> the dedicated shared memory area used for exchanging Ethernet packets
> between processors.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  .../devicetree/bindings/net/ti,rpmsg-eth.yaml | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml b/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
> new file mode 100644
> index 000000000000..1c86d5c020b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,rpmsg-eth.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,rpmsg-eth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments RPMsg channel nodes for Ethernet communication
> +
> +description: |
> +  RPMsg Ethernet subnode represents the communication interface between host
> +  processor and a remote processor.
> +
> +maintainers:
> +  - MD Danish Anwar <danishanwar@ti.com>
> +
> +properties:
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the shared memory region used for communication between the
> +      host processor and the remote processor.
> +      This shared memory region is used to exchange Ethernet packets.
> +
> +required:
> +  - memory-region
> +
> +additionalProperties: false

This cannot be really tested and is pointless binding... Really, one
property does not make it a device node.


> +
> +examples:
> +  - |
> +    main_r5fss0_core0 {
> +        mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
> +        memory-region = <&main_r5fss0_core0_dma_memory_region>,
> +                        <&main_r5fss0_core0_memory_region>;

All this is irrelevant, drop.

> +        rpmsg-eth {
> +            memory-region = <&main_r5fss0_core0_memory_region_shm>;
> +        };
> +    };
> -- 
> 2.34.1
> 

