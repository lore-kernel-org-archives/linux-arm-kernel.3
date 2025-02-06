Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11DCC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrTmz2SBK4dURmGKuZLN4gdB1lxoYEY9WviHWyvmlmA=; b=AsIt0+Vl7z+ldKKnwhia5aaDo4
	05eFVRyCa1bqASFEH9/UHNvW3/B7ViWeiMkZ2OE7rgqrWJ9WK29URcg76deB/gouriOlhYRy1p+4p
	S/mh6aUOFm+wAOznSkr/p6/BLf2hZF21dKaLJoyPFo10Bcx5zWSOJedVC4/GhTZ+R0u5XQgNoc+0l
	b/ffxSzo7K+eLftbxUur/e4xLRvX/AH9+JY6u1eDxvIjCrztSvkOULkah6Y9WC5A4TNCwX/zRLaGe
	LUT8cfQL/+IiVVn4hw/pyk9cWDsSk/uJI96Q/KP/at5CNI/QApWdCMzrEJhZdSmZ3l/kWaoQ5rOKL
	IOUFOWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg786-00000007IZk-2TC6;
	Thu, 06 Feb 2025 19:01:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6b1-00000007BYY-22gM;
	Thu, 06 Feb 2025 18:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0F87A444A0;
	Thu,  6 Feb 2025 18:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45CBC4CEDD;
	Thu,  6 Feb 2025 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738866446;
	bh=IJL45hof8EZ76ZqW9H/9ssbUlriH90R7kETPe0qwoQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFGuxbDOBC88PRxt7HKAdOjq3A0i/bQ8+C5XbqjQB39QEv99MNFUclW2JE/Zthi++
	 RmSkqwcMRCd4EacMzjQ7dY2MfrO7Ug21geRoyBE8dMtA0i4MCNzqkwi1MklY+at55d
	 Cfue6yNhEVHtPtNFBcPsIgdk/lW5wYL+P9W360ClAPhRpde4/L6hfW1koeu/eYyhvS
	 pjPAYcrX6ayQMQM6hDqaHbkR1XXbMcz8NyUS62uPQGoB/JTpRL2qQRLm2cdbc48rFr
	 0+u62LdUEVbGsFdGmIg+pcoZQB/3yzATztpHkdJB3eFaxEIe1zjijZ5PmdZhCSnGgf
	 cnod05VfazxDA==
Date: Thu, 6 Feb 2025 18:27:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
Message-ID: <20250206-drainer-vastly-34a3c738e2bf@spud>
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gSRDlsoD+Bdf79l9"
Content-Disposition: inline
In-Reply-To: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_102727_586697_B11774C8 
X-CRM114-Status: GOOD (  17.82  )
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


--gSRDlsoD+Bdf79l9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 09:18:40AM +0530, Dharma Balasubiramani wrote:
> Remove the compatible property from the list of required properties and
> mark it as optional.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changes in v2:
> - Instead of moving the compatible string to the other binding, just make=
 it
>   optional (remove from required list).
> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-dfc747a3d3=
fb@microchip.com

Why is this RFC? I don't see any complaints from Rob's bot, so I am
assuming that this actually works and the error you mentioned in the
previously version has been resolved?

> ---
>  Documentation/devicetree/bindings/mmc/mmc-slot.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-slot.yaml
> index 1f0667828063..ca3d0114bfc6 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> @@ -29,7 +29,6 @@ properties:
>      maxItems: 1
> =20
>  required:
> -  - compatible
>    - reg
> =20
>  unevaluatedProperties: false
>=20
> ---
> base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
> change-id: 20241219-mmc-slot-0574889daea3
>=20
> Best regards,
> --=20
> Dharma Balasubiramani <dharma.b@microchip.com>
>=20

--gSRDlsoD+Bdf79l9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T/CQAKCRB4tDGHoIJi
0heMAP9RIv6EPmFdFdH9C4KniHclVT6q7+ipdJy9MNtonSEGeAEAuKgviFIr+311
YAtp4FSk/X/xf6nVb9pNP7sDITwXVgc=
=vdJI
-----END PGP SIGNATURE-----

--gSRDlsoD+Bdf79l9--

