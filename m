Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvqCJgn8JrvX/wqRcJdBnCeJJvGQqO6u4dEBjS3ynJU=; b=B+K76PeRYYvsKVbZfRwCltoDR0
	ymVH3yVW60pWmTs7mwNggcBRblnH0jXfIxSKFyX6eGxGWR6MwioVSc6PrfRQWGdK7cLLiNDs/hMq+
	5cgPBJPcq/w97PZrBk+5E3TWPP1/Y5xLQBcS/vRry4lg2z93w0zUibiSu5Aa48mpe99GYe1bUTKJR
	WXt4ujSSNwp1FxjPdaPmq8B1v9M2VNl82MUQBJIIIC3xKSi1Uy5lysbrb9qg6vvNt8YpdoCk3FLvi
	n81lhdaLtb/ygoXEPocNwSQE1Euab/O84Jc37Q2KWO2INPAQGdEMA0bNA7Z+ot0PuUTcSvKPCtvt1
	2mxgmn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXSU-00000004cLa-1u1p;
	Thu, 30 Oct 2025 18:33:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXSS-00000004cKe-1FIg;
	Thu, 30 Oct 2025 18:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF33D44070;
	Thu, 30 Oct 2025 18:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5346EC4CEF1;
	Thu, 30 Oct 2025 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849191;
	bh=JvqCJgn8JrvX/wqRcJdBnCeJJvGQqO6u4dEBjS3ynJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uc3n00xcX2apahvQe+vOAxBTIP7QlaGSOysJWttTvoz8CF5WhCm4Inx7CKbgcsyvp
	 FMHQ8uvIu1k2j3aWsbR0vFulwKd54VbMtPwe1wc1YvMd/syHapKHw5QRy1dIE31aNP
	 pp5PXeHLaAudnWWG59ST7SoU6KMOJYjz2DWBHaMeF2GJmfrs4K/Bmg95XX2A7kXIWw
	 p9iirwk3LlZ+6FOQKkaLKjamzAroKf4MgfCFUR+G4gn6tfbfswOXaZxR+r8OvGdGrY
	 v1PkUebQysUlEZcYHVXYzEX3cCErawNt1JtrqkeJ8C05e7wosQ3j19rYB74Rk8y9yp
	 oigdXlMNfZEmg==
Date: Thu, 30 Oct 2025 18:33:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
Message-ID: <20251030-smooth-agony-bea253b919fa@spud>
References: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hd7qwYh7dn279Ibw"
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_113312_493953_765F214F 
X-CRM114-Status: GOOD (  10.75  )
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


--hd7qwYh7dn279Ibw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:40:07AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the watchdog block on MT8189 SoC, which is
> compatible with the one used on MT6589.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hd7qwYh7dn279Ibw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQOvYgAKCRB4tDGHoIJi
0oimAP9o2MEl59jifVvyPGLCWbSwGzDMmbIfyk1LRXRhAcGMcQD+MdAmHKkHucGO
9XwvmdiZ/DSlgirQirhb+GL9vuMRdQY=
=Qv/D
-----END PGP SIGNATURE-----

--hd7qwYh7dn279Ibw--

