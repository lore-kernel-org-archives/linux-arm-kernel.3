Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176ECCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icNR1hHAkcJ1M76vFU+5TxUHRH5lg9WpifP45467krw=; b=gKadM5LsRY1fpg0fSXJXZkzW3N
	CFxPYYHbkRJpctcOZO1xw3CfiDGRhBrLY56SWAn1Oiiqt0uir4NMg/8S9L7SYlfbZPpHToe2AY6F0
	vQFb/fDDBVaa1J0JFzn/WYMlK4pINtKuO8MhFxbs8ZxiffBxsPeWLvoFA8c+tR0sxwm6UwfacnhHw
	xV+tXr03w4nXyaJRV51Ow9pqBilHKJGlED7ciGIbDodN4NThUMJOCnJvgHa86ehJtqobOHIfHPjSg
	ZoNMzEmTcpJMk21/lFLM8zOlyBkRD7ieAxqnF+5uMecitOF84wS0ZcHaWUroxmcQ6mBT1DzpZU54J
	cZQzwmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RQY-00000005Wrt-1T5n;
	Thu, 16 Oct 2025 17:06:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RQW-00000005Wr6-1Fa9;
	Thu, 16 Oct 2025 17:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C66CC43A88;
	Thu, 16 Oct 2025 17:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44AFC4CEF1;
	Thu, 16 Oct 2025 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760634367;
	bh=eskJgEswuM2KIOvIt6RczPdi3+e/Gu7TEutaJgkQaNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StUZULop3yfuwZFzcgU07+8rl7AoDfRwDxWR3fVzNsMYuJICsLtbGlFjtpIiEOOok
	 30mfl50ly7MNR/gJg/ejoZob8b2r5MH7ITg7BKQQs+CEKcJ6ogATPsK0mQPRK03yZW
	 vsuUhrCV/HAEDcZiZhQL82KEas1KB4yPtifk7O7bhgi7OKc2ipDr/w8jw/D5ySOlDg
	 eblw3vtIX5gF4pTjTdZZ2/PNXcsXhHMaZxY+8btMw4AO3tE2JTIFHiNbdFZOT6mQEn
	 bhwweXE/4/mvIV6UZ2QEfol6YddUhfs44cydLebviPgifWzeQMuPNd9dRdEuRlL5iO
	 W+qgskq36+qZg==
Date: Thu, 16 Oct 2025 18:06:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, g@spud
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 01/13] dt-bindings: net: airoha: Add AN7583
 support
Message-ID: <20251016-hypnoses-caucasian-5d08812740a6@spud>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-1-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9mL+XRXQMatgZUrQ"
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-1-ea6e7e9acbdb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_100608_398059_3834FB8D 
X-CRM114-Status: GOOD (  18.28  )
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


--9mL+XRXQMatgZUrQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 12:28:15PM +0200, Lorenzo Bianconi wrote:
> Introduce AN7583 ethernet controller support to Airoha EN7581
> device-tree bindings. The main difference between EN7581 and AN7583 is
> the number of reset lines required by the controller (AN7583 does not
> require hsi-mac).
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-eth.yaml | 60 ++++++++++++++++=
++----
>  1 file changed, 51 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index 6d22131ac2f9e28390b9e785ce33e8d983eafd0f..7b258949a76d5c603a8e66e18=
1895c4a4ae95db8 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - airoha,en7581-eth
> +      - airoha,an7583-eth
> =20
>    reg:
>      items:
> @@ -44,18 +45,12 @@ properties:
>        - description: PDMA irq
> =20
>    resets:
> +    minItems: 7
>      maxItems: 8
> =20
>    reset-names:
> -    items:
> -      - const: fe
> -      - const: pdma
> -      - const: qdma
> -      - const: xsi-mac
> -      - const: hsi0-mac
> -      - const: hsi1-mac
> -      - const: hsi-mac
> -      - const: xfp-mac

Pretty sure most of this diff can just be avoided by changing this list
to be
  reset-names:
    items:
      - const: fe
      - const: pdma
      - const: qdma
      - const: xsi-mac
      - const: hsi0-mac
      - const: hsi1-mac
      - enum: [ hsi-mac, xfp-mac ]
      - const: xfp-mac
    minItems: 7

All of these -names properties IIRC are arrays of unique strings, so doing
8 with xfp-mac twice would not pass. Your conditional portion of the
binding then need only set min to 8 for the old device and max to 7 for
the new one.

> =20
>    memory-region:
>      items:
> @@ -81,6 +76,53 @@ properties:
>        interface to implement hardware flow offloading programming Packet
>        Processor Engine (PPE) flow table.
> =20
> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - airoha,en7581-eth
> +    then:
> +      properties:
> +        resets:
> +          minItems: 8
> +          maxItems: 8

Same here fwiw, just need to set the min for this, and...

> +
> +        reset-names:
> +          items:
> +            - const: fe
> +            - const: pdma
> +            - const: qdma
> +            - const: xsi-mac
> +            - const: hsi0-mac
> +            - const: hsi1-mac
> +            - const: hsi-mac
> +            - const: xfp-mac
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - airoha,an7583-eth
> +    then:
> +      properties:
> +        resets:
> +          minItems: 7
> +          maxItems: 7

=2E..max to 7 here. Re-setting min here is redudant, since it matches the
outermost/widest constraint that you set when defining the property
outside the conditional.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +        reset-names:
> +          items:
> +            - const: fe
> +            - const: pdma
> +            - const: qdma
> +            - const: xsi-mac
> +            - const: hsi0-mac
> +            - const: hsi1-mac
> +            - const: xfp-mac
> +
>  patternProperties:
>    "^ethernet@[1-4]$":
>      type: object
>=20
> --=20
> 2.51.0
>=20

--9mL+XRXQMatgZUrQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEl+gAKCRB4tDGHoIJi
0on2AQCsGgDtbOnKMfcJ3xtmRPlJ8e6bbOl2Ha5gG8JXUfO1CgD/QxseQkLse1bg
s5COTpsvRS3yGcjqbh/LziflXULgVgc=
=rwvg
-----END PGP SIGNATURE-----

--9mL+XRXQMatgZUrQ--

