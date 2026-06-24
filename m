Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83683CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONVxwC+Td25N43rGDzHnzsanpqUWTvIc0+6pDMU/MTc=; b=X9TPKPA8ntp6w8/i5D/JE+2iYO
	oApOtxjjrRFV+R8cY8A8O4qNk5kl6fU/Zt+o/ZOmYjqe5cQCsb9TCcIubm89wuMOvbZp8PgM7FtOq
	eF0OgzJLcP+fKTP7fYqWd6OYHLPtgZ5gAXDYkjzCOEj4iWc4KM5JiAEOIJAYt9uJhykQ/WqG/hzGQ
	TvAr5FBSI0CK6uKo/JDWPff1oZn7Zep3LdgHvtvLN9JxhMjPLsG+1uUpyUB2o2S7lxKJfLWWVXAeC
	vnnFK2X9ZLV3Wv3vnUWkx4iSRLBfKz+ItG3e/5e7FZXzvuVbynhO65XB21HDTJFK3z/4TC+5NRkRq
	2UHtJOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHpl-00000007HhK-1jZg;
	Wed, 24 Jun 2026 07:15:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHpk-00000007Hh9-1O1f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:15:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40203601F3;
	Wed, 24 Jun 2026 07:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24E31F000E9;
	Wed, 24 Jun 2026 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285339;
	bh=ONVxwC+Td25N43rGDzHnzsanpqUWTvIc0+6pDMU/MTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTBFnWrTnSlnRm7wA9VA1PKnERY9yuPOvIvAeqhs1Yt6aoGxjRIfYBkjLVOQMbeNz
	 kVBap/AwGkGSkpKtQ/39UY6tYC5h2Hxi7VKuzuAsEwE7Q8mVB/PU7I7Y4eJKS9ET6Q
	 zysZDCaCETP5NWRPz+SMh2iLvN3vwxYg3pK9Ax+i//noDUm+RX8Zntiq8Pd3FC1Ldt
	 PVyQL0gk9ZzMeM3ekhH4GVnrOpee7EB9Key3pzQBLLna0L0Ke76QM41Z4gJZ49GMV7
	 uKzysiCphyE2UP/cXefVGblMHKlA92DT3p3TmpOZ+BzGgY0nAwKsi+rplH5Naor63Q
	 2WpjSkr7z9qIw==
Date: Wed, 24 Jun 2026 09:15:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
Message-ID: <20260624-realistic-spiked-parrot-db1d9c@quoll>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
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

On Tue, Jun 23, 2026 at 02:25:39PM +0000, Gr=C3=A9goire Layet wrote:
> The ast2600 was using the ast2500 vuart compatible string.
> This change makes it possible to have ast2600-specific properties.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830

> ---
>  .../devicetree/bindings/serial/8250.yaml      | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a807..3cbd0f532e15 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -23,7 +23,9 @@ allOf:
>      then:
>        properties:
>          compatible:
> -          const: aspeed,ast2500-vuart
> +          anyOf:

This should be oneOf (by convention and actually more accurate meaning).

> +            - const: aspeed,ast2500-vuart
> +            - const: aspeed,ast2600-vuart
>    - if:
>        properties:
>          compatible:
> @@ -287,17 +289,19 @@ properties:
>    aspeed,sirq-polarity-sense:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
> -      Phandle to aspeed,ast2500-scu compatible syscon alongside register
> -      offset and bit number to identify how the SIRQ polarity should be
> -      configured. One possible data source is the LPC/eSPI mode bit. Only
> -      applicable to aspeed,ast2500-vuart.
> +      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible sys=
con
> +      alongside register offset and bit number to identify how the SIRQ
> +      polarity should be configured. One possible data source is the LPC=
/eSPI
> +      mode bit. Only applicable to aspeed,ast2500-vuart and
> +      aspeed,ast2600-vuart.
>      deprecated: true
> =20
>    aspeed,lpc-io-reg:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      maxItems: 1
>      description: |
> -      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
> +      The VUART LPC address. Only applicable to aspeed,ast2500-vuart and
> +      aspeed,ast2600-vuart.
> =20
>    aspeed,lpc-interrupts:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -305,8 +309,8 @@ properties:
>      maxItems: 2
>      description: |
>        A 2-cell property describing the VUART SIRQ number and SIRQ
> -      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
> -      applicable to aspeed,ast2500-vuart.
> +      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
> +      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
> =20

More important, where is documenting of the actual compatible?


Best regards,
Krzysztof


