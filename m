Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8E2C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlOkBHzBvasYYnkUVjzKqrztOu7qV8bIX60v6CRdSPA=; b=1OTuK/M+KiaLsTwpR2TRcw47no
	Ha8lYNvp3rQ7eVKiAcSUFRH3U8l+ZsBG5WW5SQApPQ5HIfkH+/hOk+YlRmAoU7hmeEnHrURSVT8JW
	s+pGmINNooT3Ngoh3qYDdyiGnYvtuCYmgmFGKMorH+tP3xSGVv7oYDu81Yla4+tl8t8YgiHic+JhN
	6uZ9SCyx9sBwlM8HCLS3rdkYjop7Z0CAV2FaHLM8gigIFs8M4RqflXIZZOzMEqpxY+aXHR5ebrx7n
	yg4MmEuKw+m/cSzKwPBEQKIOyElkhx6SR1xblHshQ8UIgyXPs/3f3DK0tsTklDykJcyyuLtpoucjk
	Aqj9gOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzzTE-00000006Cwt-1NWc;
	Fri, 28 Aug 2026 16:30:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzzTC-00000006Cwg-3BgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 16:30:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2598943814;
	Fri, 28 Aug 2026 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A031F000E9;
	Fri, 28 Aug 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934622;
	bh=rlOkBHzBvasYYnkUVjzKqrztOu7qV8bIX60v6CRdSPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQKq5xOoOY5/B5Z4Vh2n01MowTbjOl8QdmjxZZswLx+1H1N0vFGl5cIjnsMfxJODM
	 rNYP8TYCDJnjQuprO1UHyigYqD5O3bKnlg5r6v6gYzPRaNg9rzyBHllpmOlcBpERMz
	 A5fqjaA+HpgyVHLiP7p0wLPvQqTb1n96g9Ah3TYx14DrI5FGxb/Mk0ImGh+OYJsP5w
	 aqYlYGS1p30URzwWnSabeypeQq163aSYX2YRFkYFTnifNIeQgN55kdT9qvopkWDOVS
	 3PC/KjZAVnfkMCDvzyENC4hnBI6Oie2wp9o7y6npdrpnrXO+jOaWM14i23RM7qP+5P
	 lROvk/HXmu+sg==
Date: Fri, 28 Aug 2026 17:30:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260828-stiffness-activator-d294624667ae@spud>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
 <20260828-t603x-spmi-v8-1-708d4d12e0fd@chaosmail.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kr68XvzKP7bsDbmd"
Content-Disposition: inline
In-Reply-To: <20260828-t603x-spmi-v8-1-708d4d12e0fd@chaosmail.tech>
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

--kr68XvzKP7bsDbmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 10:58:57AM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
>=20
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 31 ++++++++++++=
+++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..09d383bb4fec 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi
>            - const: apple,t8103-spmi
>        - items:
>            - enum:
> @@ -34,10 +37,38 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - apple,t8122-spmi
> +          - apple,t6030-spmi
> +          - apple,t6031-spmi
> +then:
> +  required:
> +    - compatible
> +    - reg

This duplicates the unconditional required bit, I would drop it so that
you can add an else condition and rule out the interrupt related stuff
on the devices where it may not apply?
Even if the itnerrupt stuff is possible elsewhere, please drop the
duplicated part.

Thanks,
Conor.
pw-bot: changes-requested

> +    - interrupt-controller
> +    - "#interrupt-cells"
> +    - interrupts
> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> --=20
> 2.55.0
>=20

--kr68XvzKP7bsDbmd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG3mQAKCRB4tDGHoIJi
0hBLAPdO6fCWIe7lCGuZKPTY7tTNQreiZQ7KMfF54OHN9jIPAP9UkSq+u+UDSm9B
NwDr89Jrz4qy63kCjhxx8iIj5bWTCA==
=ayCU
-----END PGP SIGNATURE-----

--kr68XvzKP7bsDbmd--

