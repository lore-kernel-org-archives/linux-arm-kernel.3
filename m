Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA685CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 02:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gU4iu/jxMJVno8QaMCLdahHidjmz5hXR/hIiNJxZ5Q=; b=qrUnocIsnhHvcGClK2lE51iimF
	q7tc/2wcJMjJ1ff33+4ZY7An6mgJ10fy8F2rUgOMsBTR5w+qO/Kx6t9J6nuQoYfgVBbk2Zk/nsGt9
	qr201a8DVMuiTwn8PvHO4KCVGSwi9EhZF7yyeorrL8DxJojnhzPfFHQZnI3etlv8TVjOzYDtRwHtW
	1kqBHf6WKk3ZIy1p+SIQfdMYmMNMP74GHDg+czDhOhhFN9m4K/QxXxvVCyx6ibkyKw8Y+bj+4mDWT
	G6S70GJiaPKHBm8/1pViZHKsnUSlmsEubSHA+x9Zgwayz3/p8XKWslo4UUum+LIQpsVKVHOSCI0wE
	dYoTBRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6xC-0000000AzYk-31wB;
	Tue, 04 Nov 2025 02:39:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG6xA-0000000AzXN-1KV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 02:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8gU4iu/jxMJVno8QaMCLdahHidjmz5hXR/hIiNJxZ5Q=; b=wzkJVWFwzWwRQDtieVeeWxvCTY
	N+AVdOv9y4J3HJ14l+7IfSo/8GyV3CWeLDyPv/tzevlhm4ggiJ7lt7q8cYRnsp67nL4cgromDXfZC
	0yE0P+zw8htEIQ4gZxOGG/tsE+54jXt0uNMLWeHNXowHaz9BfZhRgB8mk/hi39eZT8zA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vG6we-00Cqbf-KO; Tue, 04 Nov 2025 03:38:52 +0100
Date: Tue, 4 Nov 2025 03:38:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <2424e7e9-8eef-43f4-88aa-054413ca63fe@lunn.ch>
References: <20251103-rgmii_delay_2600-v3-0-e2af2656f7d7@aspeedtech.com>
 <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-1-e2af2656f7d7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_183924_361443_19E6F984 
X-CRM114-Status: GOOD (  16.84  )
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

On Mon, Nov 03, 2025 at 03:39:16PM +0800, Jacky Chou wrote:
> Create the new compatibles to identify AST2600 MAC0/1 and MAC3/4.
> Add conditional schema constraints for Aspeed AST2600 MAC controllers:
> - For "aspeed,ast2600-mac01", require rx/tx-internal-delay-ps properties
>   with 45ps step.
> - For "aspeed,ast2600-mac23", require rx/tx-internal-delay-ps properties
>   with 250ps step.
> - Both require the "scu" property.
> Other compatible values remain unrestricted.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/net/faraday,ftgmac100.yaml | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf..de646e7e3bca 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -19,6 +19,12 @@ properties:
>                - aspeed,ast2500-mac
>                - aspeed,ast2600-mac
>            - const: faraday,ftgmac100
> +      - items:
> +          - enum:
> +              - aspeed,ast2600-mac01
> +              - aspeed,ast2600-mac23
> +          - const: aspeed,ast2600-mac
> +          - const: faraday,ftgmac100
>  
>    reg:
>      maxItems: 1
> @@ -69,6 +75,12 @@ properties:
>    mdio:
>      $ref: /schemas/net/mdio.yaml#
>  
> +  scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the SCU (System Control Unit) syscon node for Aspeed platform.
> +      This reference is used by the MAC controller to configure the RGMII delays.
> +
>  required:
>    - compatible
>    - reg
> @@ -88,6 +100,44 @@ allOf:
>      else:
>        properties:
>          resets: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-mac01
> +    then:
> +      properties:
> +        rx-internal-delay-ps:
> +          minimum: 0
> +          maximum: 1395
> +          multipleOf: 45

I would add a default: 0

> +        tx-internal-delay-ps:
> +          minimum: 0
> +          maximum: 1395
> +          multipleOf: 45

and also here.

> +      required:
> +        - scu
> +        - rx-internal-delay-ps
> +        - tx-internal-delay-ps

and then these are not required, but optional.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-mac23
> +    then:
> +      properties:
> +        rx-internal-delay-ps:
> +          minimum: 0
> +          maximum: 7750
> +          multipleOf: 250
> +        tx-internal-delay-ps:
> +          minimum: 0
> +          maximum: 7750
> +          multipleOf: 250
> +      required:
> +        - scu
> +        - rx-internal-delay-ps
> +        - tx-internal-delay-ps

Same again here.

	Andrew

