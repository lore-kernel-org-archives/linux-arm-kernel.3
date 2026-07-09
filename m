Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C86BC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1rwfWs0eVUYLQvnn313Ek+k2iZwPDLH9jg+S7+NtUA=; b=GofLITnQEDOyI8FBgeC3H8fy8v
	sg/dLX7A1mpol5Lw+haLKGAPPNEP1vHQqUPfCOeH9tJzzB227BeLHXOAjOaB5ESlkMlE1IwvRgzIc
	jvODjb531PKEqQ2wSmskZQyI9YdtF4r4AsJ3wynJyXj3YHdj1mPypLrmcaZQR+Y6DbR68JY60woAA
	nqHWZo+pPbdoOKPO0pploqSVadtFbGOws2XX22mu1KD4oVGz9PkWRgVaefeLZK8MpHd2uGNF7bXMz
	VrXnLLnA6rWQPMQNr7SnL4iCxF2lp6fiVKn9B0p/Zlgy2VvD5GKZ5Ho9qsG4sbSmU8WpGKloFs4je
	6/wVnENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWo-00000001ePb-20QI;
	Thu, 09 Jul 2026 08:54:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkTC-00000001aFz-3GXo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49F5243436;
	Thu,  9 Jul 2026 08:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6478A1F000E9;
	Thu,  9 Jul 2026 08:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587058;
	bh=a1rwfWs0eVUYLQvnn313Ek+k2iZwPDLH9jg+S7+NtUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxaMoZ7DMEct622BGXXQ2Ri8Sr/J+tvZNU6g0FIegAoymMY/llbxd69ppfm/oxOj8
	 F/ygKBf7/fmoDsb4JgXAudUtdk+OVg8nZMkEddDkCi+oINbIN2XjQMqrCqvvYyNcai
	 T++YqXgDP4X5eCQRe5sUImYg26aXYViq8185n4MMoadByVpazZw4C8lFvxMSTdnjhz
	 Iug1z0tdGaZ6DJPqWaNhmNrVLYwxK9IRWFk0GLyCD/rg3VNeX49FxbyvX2qGyWzvGz
	 QNk3i4hWWa7yOqO61Yw8sZmWB2wq/50RN15U9kBPW1u/NSS9f2ekmTeEqX07oEjgiT
	 o9qFAb6Fe4YWg==
Date: Thu, 9 Jul 2026 10:50:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
Message-ID: <20260709-convivial-classy-mouse-db0b2d@quoll>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
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

On Wed, Jul 08, 2026 at 03:35:53PM +0000, Gr=C3=A9goire Layet wrote:
> The ast2600 was using the ast2500 vuart compatible string.
> Make it possible to have ast2600-specific properties.

Then add these properties here as well. Adding a new device is one
commit: its compatible and its properties.

>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a807..8f22121381fc 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -23,7 +23,10 @@ allOf:
>      then:
>        properties:
>          compatible:
> -          const: aspeed,ast2500-vuart
> +          contains:
> +            enum:
> +              - aspeed,ast2500-vuart
> +              - aspeed,ast2600-vuart
>    - if:
>        properties:
>          compatible:
> @@ -106,6 +109,9 @@ properties:
>        - const: ns16850
>        - const: aspeed,ast2400-vuart
>        - const: aspeed,ast2500-vuart
> +      - items:
> +          - const: aspeed,ast2600-vuart
> +          - const: aspeed,ast2500-vuart
>        - const: intel,xscale-uart
>        - const: mrvl,pxa-uart
>        - const: nuvoton,wpcm450-uart
> @@ -287,17 +293,19 @@ properties:
>    aspeed,sirq-polarity-sense:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
> -      Phandle to aspeed,ast2500-scu compatible syscon alongside register
> -      offset and bit number to identify how the SIRQ polarity should be
> -      configured. One possible data source is the LPC/eSPI mode bit. Only
> -      applicable to aspeed,ast2500-vuart.
> +      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible sys=
con

This is a deprecated property, so it cannot apply to a new device -
aspeed,ast2600-vuart. You cannot use deprecated code for new bindings or
device support.


> +      alongside register offset and bit number to identify how the SIRQ
> +      polarity should be configured. One possible data source is the LPC=
/eSPI
> +      mode bit. Only applicable to aspeed,ast2500-vuart and
> +      aspeed,ast2600-vuart.
>      deprecated: true

Best regards,
Krzysztof


