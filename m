Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D7EC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtK4N2nV0cyw0wDbbUBhQ5HdwbhCZwPcY+S9Qz9vAuY=; b=rZUkvJcbvOnBeDqcePG3Q67tLu
	EGDOJyn4RNhGSxsaeOxyTUxOAM6eptiSzX51BR/PLRDlyl51/QX7ehltCA913FyI9zAzcdgQVyZyY
	qJ36k4VFqcf+UbHBBZswUoJ5gnnmJfID9h5jHitvfln17l16GG2KGbLA/6Xdl8bnQNcInVPjwAWSO
	Dhnj8sFHOTThclAQIzef6Y0Qb7Wt+IrxRXnvbFbjhZPIV5QVxbfNI7B6U9qhCxsnVroSUPvk5H5ad
	/E9tnuABWtJ8DmtpSu5cvctsm4HZbtdKlBKlC2N+aggbYY7j+tVKrXBKBqlphAnMaP3rOa0vWj5Xl
	AKcbeqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Cc-00000007rrj-2O31;
	Tue, 10 Jun 2025 19:00:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0kZ-00000007Gay-2U1k;
	Tue, 10 Jun 2025 15:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E69A8629C8;
	Tue, 10 Jun 2025 15:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CAFC4CEED;
	Tue, 10 Jun 2025 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749568734;
	bh=vtK4N2nV0cyw0wDbbUBhQ5HdwbhCZwPcY+S9Qz9vAuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCdD1UIF3pT9KlgGAozGLVfxpQY8eOmtWkSY4Z59Kck1u5g9v9xQ5uagNzvLhW3ZH
	 uK2UY/wkqxFIsuelWSaxH2SlmYipdfb11/Y/e/AqfTuJaaKvwR0a0GIrnnn4rDiM0o
	 WLRkI5i1I7aeD/UvW6QsgP7zBlSK3cQKkezSxFqu/bTXuSvhNDhxpaNWXVsh0ydEwD
	 0NPzKlXb1xOQ/vImGoNO+SiR/Ov7gsLwzt/f5UxH9s8i4P7PyFyRCG3R4/Dg6Z+ufl
	 WVmFD+kjZTHucIOqQfQutA+hAL//nPK/E39ud1svGLtV7X88+t1m2XLRReu1V//9wU
	 cYl36aeUzSdIQ==
Date: Tue, 10 Jun 2025 16:18:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: mediatek: efuse: split
 MT8186/MT8188 from base version
Message-ID: <20250610-magnifier-petty-6c5a2703a05b@spud>
References: <20250610063431.2955757-1-wenst@chromium.org>
 <20250610063431.2955757-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DM5pv65IWOkWZD6g"
Content-Disposition: inline
In-Reply-To: <20250610063431.2955757-2-wenst@chromium.org>
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


--DM5pv65IWOkWZD6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 02:34:29PM +0800, Chen-Yu Tsai wrote:
> On MT8186 and MT8188 one of the NVMEM cells contains the GPU speed bin
> value. In combination with the GPU OPP bindings, on these two platforms
> there is an implied scheme of converting the cell value to what the GPU
> OPP "opp-supported-hw" property matches. This does not apply to the base
> mediatek,efuse hardware, nor does it apply to any of the other platforms
> that do not have the GPU speed bin cell. The platform maintainer argues
> that this makes the compatibles incompatible with the base
> "mediatek,efuse" compatible, as shown in the link given.
>=20
> Deprecate the MT8186/MT8188 + "mediatek,efuse" combination, and add
> new entries with MT8186 being the base model and MT8188 falling back
> to MT8186.
>=20
> Link: https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@co=
llabora.com/
> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support fo=
r MT8188")
> Cc: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--DM5pv65IWOkWZD6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhM2QAKCRB4tDGHoIJi
0oO9AP9azxR15Z4FWTzZIHXzTVLpSbkeveExJbyNmwEG9jz1YgEA7QM4o5Pznk8M
kkIC1s0vwuNnCCBmMQrcnoicWNN5zQQ=
=3doB
-----END PGP SIGNATURE-----

--DM5pv65IWOkWZD6g--

