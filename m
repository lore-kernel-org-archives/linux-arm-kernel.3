Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9CFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsGh62njhoKlewROetP2PvNKUr3a3BT6K5c3XMORfWc=; b=Dz0beOkKCeyR33zhHOlOx7HXyr
	obUqGRY1HD5rbbfzJ3QwVm0zYSJStlxoBtiT65NoMYom5Kgq0aylrzKNMb3ngooBuJF+d0JtjCHxJ
	3EElNILQZ0l5XScP6kStG4oWm4wBq6FVBZRx+veyjjMFZPNPSHKvWyPREaHdOXV/q/W/5RZ9vNOXM
	hKHa034in/uZMaevS4iA36sMk8xxRiabnXLSsS+PhcDuiq/PVmucFIpayl83SMGbrc+gVzSpXm7N8
	vkFOiBE/+PSsCkEStiK3PJEltGOEoFgveINLQBe8rEj/jQkMBOqSbPP+HWBO5YisO/Anlt6Si31fy
	OFbF1xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneFB-00000000U2J-0wFq;
	Sat, 25 Jul 2026 15:24:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneFA-00000000U2A-1eGF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 15:24:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC2C64048E;
	Sat, 25 Jul 2026 15:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6BC1F000E9;
	Sat, 25 Jul 2026 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993091;
	bh=qsGh62njhoKlewROetP2PvNKUr3a3BT6K5c3XMORfWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQufEFheAC7SqbrvLG1R2l/zb+kY0GUNTGO8s949cIv/7E8ADyC8Vnzmj/t1bdn6Y
	 GKOI8WWejexTVkqWZ7RTJ0BmO223lS8IZulq/V3FxF0M/M4ueUO9Ln+2b3Qe3XsU2F
	 COGEOTEDoHT30+or0iqq78vwXC7nSKILbXTz580sG/3tTlSrrzSl/MBoNQA0/GUk4Z
	 LWpKiYMiEHXfMluV5W9ArtFhW4K30DwwhNhrnyylAHvZNtMQ4fM96H6qDFgveuEUDP
	 ncjrWvDO4r1/Vudpz6Vx1u2yYzoX778fO2kV+ysbV4A0hjkimiZPprpw3mcm0/zo91
	 3MoMVGH5G4DmQ==
Date: Sat, 25 Jul 2026 17:24:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v7 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260725-acoustic-orchid-tiger-a6be5f@quoll>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-14-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724102115.2854-14-s-adivi@ti.com>
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

On Fri, Jul 24, 2026 at 03:50:46PM +0530, Sai Sree Kartheek Adivi wrote:
> +  "#dma-cells":
> +    const: 4
> +    description: |
> +      cell 1: Trigger type for the channel
> +        0 - disable / no trigger
> +        1 - internal channel event
> +        2 - external signal
> +        3 - timer manager event
> +
> +      cell 2: parameter for the trigger:
> +        if cell 1 is 0 (disable / no trigger):
> +          Unused, ignored
> +        if cell 1 is 1 (internal channel event):
> +          channel number whose TR event should trigger the current channel.
> +        if cell 1 is 2 or 3 (external signal or timer manager event):
> +          index of global interfaces that come into the DMA.
> +
> +          Please refer to the device documentation for global interface indexes.
> +
> +      cell 3: Channel ID for the peripheral
> +        This is the mapped_channel_id assigned to the peripheral in the PSI-L
> +        endpoint map. For XYMF peripherals (SPI, CRC32) each chip-select/FIFO
> +        has a distinct channel ID; use the channel ID for the specific
> +        direction and chip-select being requested. Use 0 for triggered
> +        block-copy channels (cell 1 != 0).
> +
> +        Please refer to the device documentation for the channel map.
> +
> +      cell 4: ASEL value for the channel
> +
> +  interrupts:
> +    minItems: 75

You can drop this

> +    maxItems: 75
> +    description:
> +      Interrupts for DMA channels.
> +
> +  interrupt-names:
> +    minItems: 75

And this as well, implied by maxItems.

With these:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


