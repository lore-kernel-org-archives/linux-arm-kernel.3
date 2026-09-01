Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E7FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6WIo0le5aCjppNEWyLWRZs3BwOlvsDBl4hM2DulWIE=; b=efHbmKxZ6GQv3FvJxzI+glMS+/
	7QFSfHGRybcQfoK3HQgbmWpVOvoCdgEsKPKZWl3c33zx/rInqM8BuqPOR6Qqwb2f5O2YQarzaQvjM
	ff2tAs0RZucH1paxF6C+50xwgdNNTY5ZYHOByNthCv6BJ6xc8BPD+LftwLzRZwkFRENnIUm33TmTB
	SlN4NZKSp0B4RC8j2xkPFOETGlVFUXoIc6qfrJ52e6zbsp/AwFG4ySoBjF5KRUz8t5AxFCDcHOBiw
	Hy1lQHGluLHbWFTivNAFecAYtag4ltl4tn3Ds2s2agtpz/lefASzTRVEU18cj/04C3rjlcjnFVrfl
	Ft+pyTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SUR-0000000Cqsw-02iw;
	Tue, 01 Sep 2026 17:41:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SUP-0000000Cqsg-3Wp8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:41:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC26E6020D;
	Tue,  1 Sep 2026 17:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB1F1F000E9;
	Tue,  1 Sep 2026 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284500;
	bh=z6WIo0le5aCjppNEWyLWRZs3BwOlvsDBl4hM2DulWIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQ/rpKo61z4uWgcE2dxBn1uB9Qz4RJzXzkFiyAN+YmFZ80FMWZnj0Z+tSgQgZQCbU
	 n9IYEavZvt/+Vt7JeVF/vl1KG/jzNiKqfe8wtJP64yBZm6lS/eFrKE0IbPduyD84Jj
	 E6S08167Y+ip85lt3GtLQBP7DFerBQ/awcwTd08tlLkhoUIveiaZx2xjXSl86jOL9o
	 5mMF1LyJ7E3NPWnxI9FK8j8kg56cAYD7as0d8W4ZGcZvxkPw9PZyx8ABJSh5Ap0a7o
	 fkCgXNrKmKzcJl8njX9P86tBIodoof6g72OQoTvV22dgGIIeRMx2mj9mpVHwOpsKkV
	 qLDuFU/8FHwCw==
Date: Tue, 1 Sep 2026 18:41:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260901-clapped-fled-2ae6126df5cc@spud>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hg5NX2NBXwQM0W36"
Content-Disposition: inline
In-Reply-To: <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
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

--hg5NX2NBXwQM0W36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 12:29:00PM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
>=20
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 29 ++++++++++++=
+++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..4e73083ecec3 100644
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
> @@ -34,10 +37,36 @@ properties:
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
> +    - interrupt-controller
> +    - "#interrupt-cells"
> +    - interrupts

else: false?
Or do the existing devices also support these?

> +
>  unevaluatedProperties: false
> =20
>  examples:
>=20
> --=20
> 2.55.0
>=20

--hg5NX2NBXwQM0W36
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcOUAAKCRB4tDGHoIJi
0t6oAQDdgxxRZq1b3END8pXTYQu7T4+mLdGrboIhqtjJLukvMAD9GVqu+LOfBqEZ
iS/zJektpRLtyh9L3LReuKM1rmeDbwg=
=+C9d
-----END PGP SIGNATURE-----

--hg5NX2NBXwQM0W36--

