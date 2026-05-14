Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B7ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je3icwAgyNEIcmqrJIpyrqTAzYaHKeseo3rwJSvT7HE=; b=GFvDA2kdPZGlVwZlAhgpXc296Y
	A194YndrffOUBorIrb48c20tu6nStFqMdQwDbu5BwZDC343951QEpl387OvhxiN526Krlo31tdcCL
	zysEYYMvqjoxyvH2KQ7fKJ0K5LhDG3d0vpvt/DFaqUrHNFnZn+U/1Tptz1zqVSmIfLq5cri/w1s+b
	5ZZdSu4R1Wkcb+JCcqS+B89JzwvFqpyUdNOwLv8KvqdZhcUcr6/Qh9FSsqmgZwIItPPL0aqI0/9sG
	H7zndCQh/IBZ/l3yNLk3nY/eK5L/Ybvw1bBNq588jyxzHugM9jEDIw+9fV9lumTdv5dKCQO5cDhr2
	FhPP6aSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWd5-00000005eTY-3vX1;
	Thu, 14 May 2026 14:01:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWd4-00000005eSy-2MrU;
	Thu, 14 May 2026 14:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C99360139;
	Thu, 14 May 2026 14:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078B5C2BCB3;
	Thu, 14 May 2026 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778767293;
	bh=c7NzlGc2Oa8BkxrzwZWZKrQ6FyrgJTWKz6ir2QBJXRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6invqMjY+PGy270uP9TV40zDHyH23UF+ovuq+zYQqNiU4YMZVAqRCU5bq8KPEmw6
	 zfuPLzUHJuhhpjAI0DYU8LF+zv5DlMHgYWZNGARHlpER27ETGKdSzWY41lcLM00CSN
	 tNFmnByX66E31B7ns4Cq+q8q2FuOVEB9wQs6myX7tVGmm+mb9s3cz5h9DLHnPvomEv
	 dI1DEpWMrJf6xrLAnwPaL+xFOV+pWiiSXglJ7BHyCb3AcHIXkfJP2A8qa0CuctK8Vz
	 fhAILwQNw7EKTvDtd/02mbr6mqsVMIcBfrSmBIG9yxPWcui3FjmLyaGqm8vIFuAued
	 1iwb9gjxir+Ow==
Date: Thu, 14 May 2026 09:01:30 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v6 01/12] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
Message-ID: <20260514140130.GA257001-robh@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
 <20260511-airoha-eth-multi-serdes-v6-1-c899462c4f75@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-1-c899462c4f75@kernel.org>
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

On Mon, May 11, 2026 at 12:49:27PM +0200, Lorenzo Bianconi wrote:
> EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
> or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
> As a result multiple net_devices can connect to the same GDM{3,4} port
> and there is a theoretical "1:n" relation between GDM ports and
> net_devices.
> Introduce the ethernet-port property in order to model a given net_device
> that is connected via the external arbiter to the GDM{3,4} port (that
> is represented by the ethernet property. Please note GDM1 or GDM2 does not
> support the connection with the external arbiter and are represented
> by ethernet property.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-eth.yaml | 64 +++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index fbe2ddcdd909..642f300c0945 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -130,6 +130,50 @@ patternProperties:
>          maximum: 4
>          description: GMAC port identifier
>  
> +      '#address-cells':
> +        const: 1

blank line

> +      '#size-cells':
> +        const: 0
> +
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              contains:
> +                items:
> +                  - enum:
> +                      - 3
> +                      - 4
> +        then:
> +          properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0

Why do you have these twice? Drop this one.

> +
> +          patternProperties:
> +            "^ethernet-port@[0-5]$":
> +              type: object
> +              unevaluatedProperties: false
> +              $ref: ethernet-controller.yaml#
> +              description: External ethernet port ID available on the GDM port
> +
> +              properties:
> +                compatible:
> +                  const: airoha,eth-port
> +
> +                reg:
> +                  maxItems: 1

Instead, 'maximum: 5'.

> +                  description: External ethernet port identifier
> +
> +              required:
> +                - reg
> +                - compatible
> +
> +          required:
> +            - "#address-cells"
> +            - "#size-cells"
> +
>      required:
>        - reg
>        - compatible
> @@ -191,9 +235,27 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -        mac: ethernet@1 {
> +        mac1: ethernet@1 {

Just drop unused labels.

>            compatible = "airoha,eth-mac";
>            reg = <1>;
>          };
> +
> +        mac4: ethernet@4 {
> +          compatible = "airoha,eth-mac";
> +          reg = <4>;
> +
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          ethernet-port@0 {
> +            compatible = "airoha,eth-port";
> +            reg = <0>;
> +          };
> +
> +          ethernet-port@1 {
> +            compatible = "airoha,eth-port";
> +            reg = <1>;
> +          };
> +        };
>        };
>      };
> 
> -- 
> 2.54.0
> 

