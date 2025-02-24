Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18693C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jm/8ruoAO9qULThvArgpJHnnXXQmdGEmsF1uURgFquw=; b=NxNIcxTGiwOcQKgcc3iKV74k9c
	pjZrxCSUMu7gIHWTaI+nA6kPQ9xuKt0QgkjITV2JHWYa6VtHKTxlb9LS6l3kuJhukpNUEaO++tak3
	KkKfIf3OUvbRePGRO1vUZh5ItZpg+hZIwIL1X9YEnhnL5BgnX1J2BPFtUgJ6vMls0I49e3+/Ivo5c
	pwSVAuOMTzZmYGOSC6Dvbewax7LI9eqJMek5LSvdb/Yc+eRugmO43gDpHVBTqLwbwLewQv1IGWJ4Q
	2KpMw8twMlc+MgugBGFABSFnys/e2ogNER9ZyeU/8x/lSUOnNZFlNt3BWV5ulC5n7+mThDR9wO8vV
	XZQLyenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUrG-0000000CwVG-0TTA;
	Mon, 24 Feb 2025 09:34:38 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUUT-0000000CqM6-0NcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B895A61183;
	Mon, 24 Feb 2025 09:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571D5C4CED6;
	Mon, 24 Feb 2025 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740388264;
	bh=paqcVaN+9js9H2BBnIzPb/KQmMraUhcTcdEAOrrYxGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVDyb9A6iSFEZR+LjdELpEgVGyTrHax22CwW4kimVb/iLXTObfEsv95EuplSKgtBc
	 5oUowBkfia/PWtbiRSow61VRZSQVmbFYD6RuAi+aQDfk5QP5t3a5vTE1HHtVr+B9CK
	 myk1UQDUe+goU/zFwEjgPNeMwTMX64NNYwl34jsmeunRzgU+oexHDv6r+OlHpWtxyt
	 TzfKctNBcaeHe1aHUHgRjNE+k5yxN2tN4eH9gAfY5kzqN7cN0P4vy0gQFGtG/5nylJ
	 p1CFFYYDurj9gQex5jiwi5Ba5lGwPbayQsy2BFTfJ4wzexIHkq5cC4FjIqPAZZz+Rd
	 260/jfeD3TjfQ==
Date: Mon, 24 Feb 2025 10:11:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Message-ID: <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
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

On Mon, Feb 24, 2025 at 01:59:34PM +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..356033d18f90 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -44,12 +44,60 @@ properties:
>      description: frequency of the bus clock in Hz defaults to 100 kHz when not
>        specified
>  
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus

Except that this wasn't ever tested...

Don't duplicate properties. i2c-controller schema has it already.

> +
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: |
> +      I2C bus enable dma mode transfer.
> +
> +      ASPEED ast2600 platform equipped with 16 I2C controllers that share a
> +      single DMA engine. DTS files can specify the data transfer mode to/from
> +      the device, either DMA or programmed I/O. However, hardware limitations

so what is byte mode?

> +      may require a DTS to manually allocate which controller can use DMA mode.
> +      The "aspeed,enable-dma" property allows control of this.
> +
> +      In cases where one the hardware design results in a specific
> +      controller handling a larger amount of data, a DTS would likely
> +      enable DMA mode for that one controller.
> +
> +  aspeed,enable-byte:
> +    type: boolean
> +    description: |
> +      I2C bus enable byte mode transfer.

No, either this is expressed as lack of dma mode property or if you have
three modes, then rather some enum (aspeed,transfer-mode ?)



> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.

For what? Same question as usual: do not repeat property name, but say
what is this used for and what exactly it points to.

s/i2c/I2C/ but then what is "I2C global register node"? This is how you
call your device in datasheet?


> +
>  required:
>    - reg
>    - compatible
>    - clocks
>    - resets
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-i2cv2

NAK, undocumented compatible.

> +
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2


Best regards,
Krzysztof


