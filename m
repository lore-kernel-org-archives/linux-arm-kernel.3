Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B119C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrE+TT5CMysUYi6uOrS9D9UYzezaxTPWZXRKKi9heC8=; b=a59sr4s4OfC0QG5j5H52dYCy8k
	RSWA8v6Z1eW7Z6hf5FF12F5ox18N5j8T5nHr00Lm/pVzQ8GFqadmhP1CLmIAnQwX+Txp/zmG3mnaf
	h/AZcWYqNoNedTN/jKMKNWHWseQ+bspO5LlUPqiKr4OMvI4V2icBqiNj0HicY8X3yC30gK1CGlGV3
	5BVIWOQTsioaSRD1v3++BQAURiBYwr8wa2C9fAsWTJuy+iv6f+rkR98HIRQYnqUSz0FUZF5L1vdVG
	uA5V8s17MsNhvAv47DcPz0th2+bb7+a1PcuINMagsx6PXi1Xle0BORortPpvrDITvBJVVrZj0uBmH
	zlxySjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8UT-0000000CpKD-3rrW;
	Wed, 15 Jan 2025 18:51:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8NM-0000000CoIL-0Fg3;
	Wed, 15 Jan 2025 18:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD2EFA42064;
	Wed, 15 Jan 2025 18:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D768C4CED1;
	Wed, 15 Jan 2025 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736966662;
	bh=G4PzYBU8G9Uar4bPlnrhRRps7QPD3CQ7Vc8IyR3W9OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LugFm7/95m0CLhvMD/7uWtivH5QpL+9k0pqN+JjWvb3Z2IQZ4mukW8/TzB40NF1a7
	 9DHfE1gVk5X9+b0ogSrhsvRxQE5urfgmti2EcbpRHJKvHE1XBCHzbFUQ49xTOb5OuI
	 DgMuZ9eRVFndwnIHklT0WqHIBrqXbtqTXDT70vsPt/hWFk3Iz3WKAuDMBKWOChH/IX
	 bRGLotsQE7RksHsd/TVpwapJ9oBzvFr45J1YZXwLLwCXLqDC/zHHJ/1qHe2a+4KPC2
	 xuyGF1B4x8zTCKS2og7mKnR0gSSDhKlIV9zmtUc+6/4CQ3LIPRqRGdvZragFR9qdPY
	 +SsaQ5ZXGd73Q==
Date: Wed, 15 Jan 2025 18:44:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	kernel <kernel@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: add mt8370-evk board
Message-ID: <20250115-preformed-lilac-15ccb03e7119@spud>
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
 <20250114-dts_mt8370-genio-510-v1-1-8517ee0fdbe8@collabora.com>
 <ef8bbe7a-64fa-4e51-86f3-4f7fc0bb3760@collabora.com>
 <20250114-lily-defensive-3383449a7945@spud>
 <19469767d9c.d70b2edd1099115.3136795565203045474@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vpJ7qZAU57snQZoU"
Content-Disposition: inline
In-Reply-To: <19469767d9c.d70b2edd1099115.3136795565203045474@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_104424_163979_BF077CA1 
X-CRM114-Status: GOOD (  15.78  )
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


--vpJ7qZAU57snQZoU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 11:16:00AM +0100, Louis-Alexis Eyraud wrote:
>  ---- On Tue, 14 Jan 2025 18:54:54 +0100  Conor Dooley  wrote ---=20
>  > On Tue, Jan 14, 2025 at 11:32:47AM +0100, AngeloGioacchino Del Regno w=
rote:
>  > > Il 14/01/25 08:38, Louis-Alexis Eyraud ha scritto:
>  > > > Add bindings for the MediaTek mt8370-evk board, also known
>  > > > as the "Genio 510-EVK".
>  > > >=20
>  > > > Signed-off-by: Louis-Alexis Eyraud louisalexis.eyraud@collabora.co=
m>
>  > >=20
>  > > Reviewed-by: AngeloGioacchino Del Regno angelogioacchino.delregno@co=
llabora.com>
>  >=20
>  > Can either of you explain why there's a fallback here to the mt8188?
>  >=20
>=20
> The mt8370 SoC belongs to the same family as the mt8188 and mt8390.
>=20
> It is a less powerful variant of mt8390, with less A55 and Mali G57 cores=
 as main differences, and like the mt8390, its hardware register maps are i=
dentical to mt8188.
> That is why I added a fallback on mt8188.

Seems fine then,
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--vpJ7qZAU57snQZoU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4gCAQAKCRB4tDGHoIJi
0vNJAP9hRxZkfQhseHe1QQ9f6Z5WQKGw1EgiIuWo5Aq35jBUZwD/S+nJx4NxwpUN
ZvVMB0l5bDODSLpz1FaMo24PT6XN0Ac=
=UM9R
-----END PGP SIGNATURE-----

--vpJ7qZAU57snQZoU--

