Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3C1CF6A86
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP5Y1FSRwCqzAnnLSFikm8nTdE6iNexDjFDnaqD1dbk=; b=l8Br3ghipc4tqYu+yb3l8fbdxR
	MZKPaxERbmduiirF66kzuZVoAEjSWV77cPwU8oyX+CRNjbyRlwLmwQ+gO7mXEZkBdsinukAEeX3xv
	e8fqYh97us6Kc4kUSO9V8uUHCY2xIqktk9Mffo59ccIrt7tagDYhkgyF20CpBn65dPt3CKyeBmCUn
	pQ2936hykPoqA81XUxSyrqGlpQBm4uVLai8atSL/r4eTMueijteZ8O25CuQvNRr3o6FJdLSHGfIZu
	omt8ectRLe7SzWWZjy6Xjue2SGUUSbt77Q57OaipOfHGIOoJTNZOo39PadLzkM3zPniyJ7VBE7CC/
	GQSvxRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlmG-0000000GM7E-0nzb;
	Thu, 08 Jan 2026 08:53:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlmD-0000000GM6G-204M;
	Thu, 08 Jan 2026 08:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B842743E20;
	Thu,  8 Jan 2026 08:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1858FC116C6;
	Thu,  8 Jan 2026 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767862432;
	bh=+Y3pmCrSWmzwJE7Z9VU/gWsBpMcei7lqxHoCxpXUJ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnbQJI6GX0z9Bph2xDSMz7Es6JYAT1Nyholi12t4kaW7FSFRxe4wFpZ7uDVhJGHnu
	 EaC/592YAPLbcZYi1BsmhhqAD87ndt8AhRD7iDTMYp8JlRcM2lxuszvPxsCJSxaaIh
	 03PIoWPd7SnH6vg0hrZoLTdzYhqSMruJhsgP/kKwkqe5N+DI7jvh7cuoY+kgzJM/eY
	 46EurBV3G9UzXMpMUNQGix9UWimERDGX8WadNA+i7ay4c4kaA1QLgMyU7Y+4UW8N6H
	 68Nu9UTA/RIJwPE7U9Jkq1zbockXKCJA5ZU/kf53U4NzgbKN8JFU+B4FqnLckh9e2z
	 E3dhJxOd6+5Kg==
Date: Thu, 8 Jan 2026 09:53:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
Message-ID: <20260108-shaggy-smart-okapi-efd3b7@quoll>
References: <20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org>
 <20260107-airoha-ba-memory-region-v2-1-d8195fc66731@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107-airoha-ba-memory-region-v2-1-d8195fc66731@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_005353_539447_F4F49263 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, Jan 07, 2026 at 09:29:34AM +0100, Lorenzo Bianconi wrote:
> Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml   | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..42bc0f2a42a91236c858241ca76aa0b0ddac8d54 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -42,14 +42,13 @@ properties:
>        - description: wlan irq line5
>  
>    memory-region:
> -    oneOf:
> -      - items:
> -          - description: NPU firmware binary region
> -      - items:
> -          - description: NPU firmware binary region
> -          - description: NPU wlan offload RX buffers region
> -          - description: NPU wlan offload TX buffers region
> -          - description: NPU wlan offload TX packet identifiers region
> +    items:
> +      - description: NPU firmware binary region
> +      - description: NPU wlan offload RX buffers region
> +      - description: NPU wlan offload TX buffers region
> +      - description: NPU wlan offload TX packet identifiers region
> +      - description: NPU wlan Block Ack buffers region
> +    minItems: 1
>  
>    memory-region-names:

missing minItems here.

Best regards,
Krzysztof


