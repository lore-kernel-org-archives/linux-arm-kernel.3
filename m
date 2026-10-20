Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA3F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1eQkemZL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oanCaXqW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xB8FYz4oxX2w21g5nKV4kypEOwJSPCjPKMx0/jwa8g=; b=1eQkemZLzfJ3BCIxCF+cPYGlj+
	+9NIHaY2GHvr6+C9JrE7pRlG6YRefxz5auuQPtE6Op2JH/qn2icsT+wBIfxapQWj0bOYSUwBD4qwb
	84rwT/2AsCIlYzhxFrOnkXeW76iHs71Cuxe/XdGkkfJFoHD+Yf4JpUQQ2yNBA+CVqKMEBSCtBpzZ1
	IpDpFQwLwCRRNdLFVs56X0JV6cEQqhRFTrdMyH2XgcB4hq/ua+T/izOQF4YmtLmtEtfcV6d/IW8ea
	xIxgnBHSJ9KqO3UG0k++yS/7la7QG+UwrEgJseZdYvfSqBPLRyj8X6R8MablqQ273eeChm6cgcOyz
	wr/mDYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4E2-000000091kI-3GjU;
	Tue, 20 Oct 2026 07:25:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4E0-000000091jq-43gF;
	Tue, 20 Oct 2026 07:25:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C2F060534;
	Tue, 20 Oct 2026 07:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9151F000C4;
	Tue, 20 Oct 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792481130;
	bh=8xB8FYz4oxX2w21g5nKV4kypEOwJSPCjPKMx0/jwa8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oanCaXqWqYLCzZkaQbIbhwCzF/OfbG8cZljO+8ElHv4AJidiUR5OLG9Mgw0cMn1Es
	 nHbL0bKTulNnHIn3YJGXbzhw0knur2ojwkMO6h72votLsJDQlHMnYaoBfNRPBUny0Z
	 rBv2fdhb8SLSSHmhvlmP2ChAF5zMYFkwENn97uyZAZQOAIKXgJjkTNqliK4MAFpP5a
	 rP0Cfmn9RfA8eBI4KoUcBTOnV87CuB8QeNwXrbBmvRgVhRyHgEycLu/XoQbmi/+mzH
	 HhxBLZzpelVoPBegoWypcPhyRapqRRVw6vaCyDn6ZFRrvndnxIL2PuU4eSMCBQhHxz
	 p5jhrDCDmIbbw==
Date: Tue, 20 Oct 2026 09:25:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v5 1/8] dt-bindings: interrupt-controller: Add support
 for Realtek DHC SoCs
Message-ID: <20261020-electronic-robin-of-infinity-f620ea@quoll>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-2-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018160653.3940371-2-eleanor.lin@realtek.com>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 12:06:46AM +0800, Yu-Chun Lin wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1319-intc-iso
> +      - realtek,rtd1319-intc-misc
> +      - realtek,rtd1319d-intc-iso
> +      - realtek,rtd1319d-intc-misc
> +      - realtek,rtd1619b-intc-iso
> +      - realtek,rtd1619b-intc-misc
> +      - realtek,rtd1625-intc-iso
> +      - realtek,rtd1625-intc-isom
> +      - realtek,rtd1625-intc-misc
> +
> +  interrupt-controller: true
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Contains the GIC SPI interrupts mapped to the external interrupt lines.
> +
> +  "#interrupt-cells":

Do not mix style of qotes.

> +    description:
> +      Specifies the number of cells in an interrupt specifier.
> +      For realtek,rtd1625-intc-misc, the first cell specifies the interrupt
> +      bank and the second cell specifies the interrupt ID within that bank.
> +      Other variants use one cell to specify the interrupt ID.

Missing constraints, e.g. enum.

> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - '#address-cells'
> +  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319-intc-iso
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: RTC interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319d-intc-iso
> +            - realtek,rtd1619b-intc-iso
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Watchdog interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319-intc-misc
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Watchdog interrupt
> +            - description: Uart1 interrupt
> +            - description: Uart2 interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319d-intc-misc
> +            - realtek,rtd1619b-intc-misc
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Uart1 interrupt
> +            - description: Uart2 interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-iso
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Uart9 interrupt
> +            - description: RTC interrupt

RTC should be second

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-isom
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-misc
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Uart3 interrupts

UART1

> +            - description: Uart1 interrupt

UART2

> +            - description: Uart2 interrupt

UART3

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-misc
> +    then:
> +      properties:
> +        "#interrupt-cells":
> +          const: 2
> +    else:
> +      properties:
> +        "#interrupt-cells":
> +          const: 1

Best regards,
Krzysztof


