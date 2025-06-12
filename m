Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97622C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSawF9ebc78ryHIqklO5r3z28OGmxw8RdjKALoXzVZQ=; b=e585N5L4uh6quu0vRmYp6JwKUQ
	S75Y6jcarl1KiWJHDM5e7YdpQDoq9y9IqE/Su4rjW0QWL64JmUtodSv7CrbsvolBO5mYyyvhlRGxB
	5wbZJP3S/Z6+sV9UIewUiULRxE+J+GK8t9LMlCMwX+bt8p9dTlTblar5pH9vGSIk5exMMdu0SpPTX
	ERXOWCBhkMIQnfOHTidCCzZKAmlkp7GGbFE9SnkxIGmyatPvB8+/wU5KO+iyUap8FWvh4MuxNEr4/
	SNxFkNz8tg6WXjHcBTpQ2kLD3QBAjZPi/k/yZFP8GDLYgie0oc3kRWbVQ5AMMJsZC2j7TjUVQ4USi
	aZpxIRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnr3-0000000EJsP-1Dhr;
	Thu, 12 Jun 2025 19:44:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjwk-0000000Dntz-17t8;
	Thu, 12 Jun 2025 15:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D4986113B;
	Thu, 12 Jun 2025 15:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797ACC4CEEA;
	Thu, 12 Jun 2025 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742468;
	bh=WvdhfgNJT5v5cFAw5+htw1gcZlt/xJmT2/R10D/S/u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHCXl8OM0W3Li5mbXc8STHlocqBbXXzomS0PWwgJWbz9cPCa54iJ2BC06tl1CtSSD
	 o9DSbjNJbGQfrRPz7e/uZiNZllbuyP4YtV7NsDuUMzv56drJTilCdRnnEFmTB40vp5
	 lvClEDILxGEBM6Q6n6kMN1sBtbvz6dnslKdPM193Zth8kHhv9XvOINgAdVdjlZ2WPC
	 79K0gR+Lbgh0HEbQYC994/TP0yWkoA/iEr7w9JSQJAFCR6AFiPUYE9l4Z3qHpahe/1
	 RDhCm4kvzNw9ZGUItpYK6VDaTBN04njeKSdtFYA8aNiY9okUmbkSmBEg0OeoKOmvWJ
	 zeJYrFQ3IqPKw==
Date: Thu, 12 Jun 2025 16:34:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
Message-ID: <20250612-scholar-crown-517f28582edf@spud>
References: <20250612135559.2601139-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rBD6QiyAktVQ2uJs"
Content-Disposition: inline
In-Reply-To: <20250612135559.2601139-1-uwu@icenowy.me>
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


--rBD6QiyAktVQ2uJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 09:55:58PM +0800, Icenowy Zheng wrote:
> My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
>=20
> Add rev2 to the compatible list of base hana DTB to allow depthcharge to
> match the DTB.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d9..7d13547ff57ba 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -132,6 +132,7 @@ properties:
>            - const: google,hana-rev5
>            - const: google,hana-rev4
>            - const: google,hana-rev3
> +          - const: google,hana-rev2

Ordinarily I would complain about inserting a compatible like this
being a problem, but these chromebooks are all cocked up so w/e
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>            - const: google,hana
>            - const: mediatek,mt8173
>        - description: Google Hana rev7 (Poin2 Chromebook 11C)
> --=20
> 2.49.0
>=20

--rBD6QiyAktVQ2uJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaErzgAAKCRB4tDGHoIJi
0q7hAP4+dlT8mJ7UwIKnCYl2qYuKoPNuL652IQfNk/cSnsBByQEAxsWxRVNvWavo
iouK9N1MJK5viXIHp3ANj69LAdfTdwk=
=vB56
-----END PGP SIGNATURE-----

--rBD6QiyAktVQ2uJs--

