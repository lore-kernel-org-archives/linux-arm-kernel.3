Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C26C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhuOfydpPDweGCryBGUmTIm/uc1ALs1NJQ3i7qlPv3Y=; b=Lny0hds9j5SmzVjRzvNOXPXEPY
	kInQMVCe+gK7IQse68OlX/d1pQKcTwG/AX86ics7SiT6HWryZ+gjD+58x4T9F3ZS+d6i6kCDAAfHm
	g2v+5spN/8Zh5BOVmRu/ICKVU16je265BdOgzaJ9lP0rQTXJCGroVybwUwluqZ39VeEvDVayiDzZK
	uRNSl16+od7tuRZepJXDpdosbzHfQAPbiy68whhoNLupdp4vpY2+B7YMkCBNW03ulNW0ge2eptX48
	Q2mMpOSqLByEkJDxQfgcJjE6/t7Ck1MVZXQR1M2IlFoK4uxrCOa2xas5cRdxVYKJJQOOIUniCvK73
	8ijFfm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW41-0000000A3NM-42L5;
	Mon, 12 May 2025 16:31:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVaL-00000009xrj-146B;
	Mon, 12 May 2025 16:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73E69629D1;
	Mon, 12 May 2025 16:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30853C4CEE7;
	Mon, 12 May 2025 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747065656;
	bh=5ULX35j9SB3R6eiMUzUDP5ujKYpZ2GypHAV7cJiBd7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5DMF1CCQwsfnuCZaPECRkzPsK/Ylv2qXn7ckN/KWEtDtYIrlbcOMYTq8jpsWcCVQ
	 tTfYxCeg0COyKSK1Wk/ihRFGbww2B4gp5WRNa4aaAxduRShX6TyZqZdh4mQPO4l6Gk
	 UTf/wOh/sVwG66z9zT+nlVfg7Y2PBtI2yLeVJl/SWjbvjWejrtfcpC/4fuz7fiK8F7
	 xR5MXrl4muuymo/c0jQeRjoUeVgWK8Q+uWXs2CgvbsQIFr4yHWEYKOH048D+e8twQS
	 Vm+oHutQCDbw5BPW/keHAd0aQPcyYL1/mJj8nFkI5/DzRpjzmDzKqwMT4M1DXfdmvq
	 LJTBcngtPWtbA==
Date: Mon, 12 May 2025 17:00:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Sirius Wang <sirius.wang@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	xavier.chang@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: Add compatible for MediaTek
 MT8189
Message-ID: <20250512-ferret-willed-348cdc19fe4e@spud>
References: <20250512115355.923342-1-sirius.wang@mediatek.com>
 <20250512115355.923342-2-sirius.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BrIJKWHwbpK/JFHA"
Content-Disposition: inline
In-Reply-To: <20250512115355.923342-2-sirius.wang@mediatek.com>
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


--BrIJKWHwbpK/JFHA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 07:53:48PM +0800, Sirius Wang wrote:
> This commit adds dt-binding documentation for the MediaTek MT8189
> reference board.
>=20
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index fa1646bc0bac..05e827076a7f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -372,6 +372,10 @@ properties:
>            - enum:
>                - mediatek,mt8188-evb
>            - const: mediatek,mt8188
> +      - items:
> +          - enum:
> +              - mediatek,mt8189-evb
> +          - const: mediatek,mt8189
>        - description: Google Hayato
>          items:
>            - const: google,hayato-rev1
> --=20
> 2.45.2
>=20

--BrIJKWHwbpK/JFHA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIbMgAKCRB4tDGHoIJi
0kTOAQDIrab/1dzT8IHi2s3bi/oJO11J04QcoOlpQG0eV2hgJwD/Xw8+792O52zo
lP7EobzCjq5NJW4XO0avY+MeprkoxA0=
=6Pyl
-----END PGP SIGNATURE-----

--BrIJKWHwbpK/JFHA--

