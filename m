Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21826CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aocQ5BSz662k7TnnzdiDWN8srMNdEjEJUuzG2/8V/QI=; b=pJlWnCCEPDEVtYSNhYc7mdbixq
	HSJjq1arwqMa2vAb+P9C1UK/H6AwVwam+B7vyAxIqCCkINGpydHZvtHvSdnKrC+H72w30wlwkM4Sj
	8f272HCKfN4PCBptJ80mtcenlTQhc9W9kgNkLYSMN43D2CAGqQCag03inhp7yQUpLxwGlsPC/ZtkL
	UgKXS4TzVplZgIML9e9/Lo0BqQwYE23qxCgcrRwwD4rWgNhUhq0WnIP0R93vUtXomCIsrfyhZeVYy
	l9y+x1cWyv3RKcBxmxddFR467yakLOZzQkJWc5DwCYu+0qOb5EjmN/GF7qUr2V4I9FfB/cbUnBuuv
	+qSn/3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjQx-00000006y4e-0Yd7;
	Mon, 19 Oct 2026 09:13:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjQv-00000006y4V-27hC;
	Mon, 19 Oct 2026 09:13:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED60A42E5D;
	Mon, 19 Oct 2026 09:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5431F000C4;
	Mon, 19 Oct 2026 09:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792401208;
	bh=aocQ5BSz662k7TnnzdiDWN8srMNdEjEJUuzG2/8V/QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOT8TFo9InwqtTFbuE2Mghy2cRy3iqg9o+ICVbb7xwwPuxd9xAHTIeu26GDNKHacd
	 hnxU5ymoch6DZOXj6ELeLK1/2DlEOAW8OWrOdSD6zwg0ecFHYdNqa6rmS7LASdcpQO
	 sI22L5kBZyq9CZFHoMgdCJlJy48RKfJxKSMqErtVxlFUYL0q+H5W2fUM2vpBVQZ3aH
	 T8VxWBqlcDjjaA0DJjskyijiu6EOE9DhXTzDwkucAxUpaC88Ydw6wfv1x5QViaY4zS
	 3evYVNfrkslkf1mcfzdnp7X1lk6VfUH7iXq6A1cMLJcmoSB3WcRQkMULr3FVfN8LLs
	 3TT21O4SmwM+Q==
Date: Mon, 19 Oct 2026 11:13:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Message-ID: <20261019-prophetic-moth-of-youth-40dbd6@quoll>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018160653.3940371-4-eleanor.lin@realtek.com>
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

On Mon, Oct 19, 2026 at 12:06:48AM +0800, Yu-Chun Lin wrote:
> Allow an interrupt controller as a child node by referencing the
> rtd1319-intc-iso schema, update additionalProperties to
> unevaluatedProperties, and append a usage example.

I do not see that "update".

> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/mfd/realtek,rtd1xxx.yaml         | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
> index 717e29c37b36..b21e14df2879 100644
> --- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
> @@ -65,6 +65,10 @@ properties:
>      const: 1
>  
>  patternProperties:
> +  "^interrupt-controller":
> +    $ref: /schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml
> +    unevaluatedProperties: false
> +
>    '@[0-9a-f]+$':
>      type: object

What is this for then? Should it be removed?

>  
> @@ -76,3 +80,27 @@ required:
>    - reg
>  
>  additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    syscon@7000 {
> +        compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
> +        reg = <0x7000 0x1000>;
> +        ranges = <0x0 0x7000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Why do you have cells it your child has no addressing?

> +
> +        interrupt-controller {

So the binding requires children with unit address, yes?

Best regards,
Krzysztof


