Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A5C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r9cx91prR1RlUD/MerxbFSo2qyoqIcVaQSnEppgX1A=; b=4LrO661mAX1G/CvMeaTzi0U0J2
	MIHOjW2NBIgjXFPfIwpwXVKjKA4p5sNVIR79cUWnDs3PFZvIqkGyhbkbsgXDzyXOw5KaOq/Z1WDAd
	L1M15BG0kkXngdAfOnpQ+h1nGkNOtXHSByoEIYg+t9SBqZgu4f+pcny4QW8yJTBOaa/555EgDWFSK
	pJo8HajfG3+SIGdHHx5BdQKVwUVQ4VfY24StfEfs2cq3sRl2d7rtQMORSyBWWVkvq2xvO1Eao6/JR
	RNhgzw24618oFOLrJq4vArdJzkM6OhZ9+c9h8rnwGYP9L8lPiw0MzIfDd8hgt2fIkHJPqQdsTfWBh
	4B/zcTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIQr-0000000GFQy-1a3P;
	Wed, 14 May 2025 20:10:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIOp-0000000GFAz-0NDV;
	Wed, 14 May 2025 20:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDB0045191;
	Wed, 14 May 2025 20:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C649C4CEE3;
	Wed, 14 May 2025 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747253298;
	bh=3WUxiz74QfrEkVVFQDowE0+qUL29wRFq5sAQpUVQaOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3TDn86sJuOiIpUlS3N/aQHf1Vundgo9YCoc+bwdDkKux/jkXJacNmbXRTiW7WvdO
	 DjSdaW+j2jJcRyK+RUx9PiHIZ0gdg90lmLKjTeaLslXtsqlPvzTTE0IG9rhB5rgot4
	 pChbLMyxVHy46X/c90eDi5gqQ/DIz7IBBSe3bmtOl+LN9hnkJJfIWISIkmnuRMQ+Eb
	 kuhYO8iXV1cjbYmyl55NeBqz818v1WYcoyPdGGACtrksGSMZsfSyUFiLMHoJD6HA9m
	 aJbU1sh4FbaTyCUC7756UVtI5klo1RjldtCXLaj6gvWgtLam3ar89RAdL3oOpvvEau
	 9wu/mJwzdA+zA==
Date: Wed, 14 May 2025 15:08:16 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: Add EN7581
 memory-region property
Message-ID: <20250514200816.GA2934563-robh@kernel.org>
References: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
 <20250509-airopha-desc-sram-v2-1-9dc3d8076dfb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-airopha-desc-sram-v2-1-9dc3d8076dfb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_130819_143696_49DC35E0 
X-CRM114-Status: GOOD (  16.19  )
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

On Fri, May 09, 2025 at 04:51:33PM +0200, Lorenzo Bianconi wrote:
> Introduce the memory-region and memory-region-names properties for the
> ethernet node available on EN7581 SoC. In order to improve performances,
> EN7581 SoC supports allocating buffers for hw forwarding queues in SRAM
> instead of DRAM if available on the system.

But 'reserved-memory' is generally for system memory which is DRAM 
though we unfortunately don't enforce that. For small onchip SRAM, you 
should be using the mmio-sram binding and the 'sram' property.

> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-eth.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index 0fdd1126541774acacc783d98e4c089b2d2b85e2..6d22131ac2f9e28390b9e785ce33e8d983eafd0f 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -57,6 +57,16 @@ properties:
>        - const: hsi-mac
>        - const: xfp-mac
>  
> +  memory-region:
> +    items:
> +      - description: QDMA0 buffer memory
> +      - description: QDMA1 buffer memory
> +
> +  memory-region-names:
> +    items:
> +      - const: qdma0-buf
> +      - const: qdma1-buf
> +
>    "#address-cells":
>      const: 1
>  
> @@ -140,6 +150,9 @@ examples:
>                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>  
> +        memory-region = <&qdma0_buf>, <&qdma1_buf>;
> +        memory-region-names = "qdma0-buf", "qdma1-buf";
> +
>          airoha,npu = <&npu>;
>  
>          #address-cells = <1>;
> 
> -- 
> 2.49.0
> 

