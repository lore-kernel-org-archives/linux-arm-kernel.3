Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q05Dk4GnAcD9flLY0jzjb7O8g5aZbymfPWWvQfTNr6k=; b=PP8fzlvAJ/ie+ZZcz1pqsKCIok
	vKyWQETkQxcwZk08Yu6fiGNSb26lDTWXI1LAoulLw/08eMEv8+8aIODSQYmec/6qDKL1U06is3D/j
	xVh/IBBIYUK4G9aurq43HNGoNcjJoBjaf1X/TuwJLFVwGzBQ0ibv/G0NvFKaSK29ZMKlKuqOqHblQ
	yM/pankmaxgfhuYWM8ipV9va7yJZVEF7EOGrB1Tfe40QXIEubMZ7t5C9mflgLoVcxI20FndM9mI//
	bbv9s3HYFW8bW55wDKzIJInQ/3bFUXanvD3YR+JQgHP2rD+kmtZ1Lf+BJkbAXR8TXa2taJ0bnxaK/
	8X1hIi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXMH-000000040rN-0g3J;
	Tue, 15 Jul 2025 04:33:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWkH-00000003wkN-2qIh;
	Tue, 15 Jul 2025 03:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71010A4B625;
	Tue, 15 Jul 2025 03:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE79C4CEE3;
	Tue, 15 Jul 2025 03:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551660;
	bh=R2NhqYJcsbfnwkDNnCnNVLiCMS9BTr1YY+cvgm42Mvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtQOE/I0sXT8utigzhHgXqTEOL3H7XlIUhkOTwDww2ZoRXAn0dS1ueUXDmLz3NYq1
	 ek37yiFG8NEZIi5+/29nMezHyKEYJZxwMxM/LBI4YtasXZFEwbLTRvpprg7rl7Nf5Z
	 xjop+gXI5FuaG/5xo2ZNtafgYDtOPHXDQeJhFHjhBNCCctj0t+JAHUBzdQtPIzjoHf
	 HGlU3w4UjPuCuezFH6hNHZf+TUINu/z1Docgsumb8XejYJepCi8+SG5kLw/w53OsXT
	 405VnH2SQOc6CdPbn9bU2l5v+d4JgVAs4uFaSDm5ps2JS4MeFzFm8zx3QgrwIJ/UqF
	 BSJ+OaMQW6HxA==
Date: Mon, 14 Jul 2025 22:54:19 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <20250715035419.GA11704-robh@kernel.org>
References: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
 <20250714-airoha-en7581-wlan-offlaod-v3-1-80abf6aae9e4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-airoha-en7581-wlan-offlaod-v3-1-80abf6aae9e4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_205421_803823_07715885 
X-CRM114-Status: GOOD (  14.57  )
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

On Mon, Jul 14, 2025 at 05:25:14PM +0200, Lorenzo Bianconi wrote:
> Document memory regions used by Airoha EN7581 NPU for wlan traffic
> offloading.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml    | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..f99d60f75bb03931a1c4f35066c72c709e337fd2 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -41,9 +41,18 @@ properties:
>        - description: wlan irq line5
>  
>    memory-region:
> -    maxItems: 1
> -    description:
> -      Memory used to store NPU firmware binary.
> +    items:
> +      - description: NPU firmware binary region
> +      - description: NPU wlan offload RX buffers region
> +      - description: NPU wlan offload TX buffers region
> +      - description: NPU wlan offload TX packet identifiers region

1 entry was valid before, but not anymore? If so, justify it in the 
commit message.

> +
> +  memory-region-names:
> +    items:
> +      - const: firmware
> +      - const: pkt
> +      - const: tx-pkt
> +      - const: tx-bufid
>  
>  required:
>    - compatible
> @@ -79,6 +88,8 @@ examples:
>                       <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> -        memory-region = <&npu_binary>;
> +        memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
> +                        <&npu_txbufid>;
> +        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
>        };
>      };
> 
> -- 
> 2.50.1
> 

