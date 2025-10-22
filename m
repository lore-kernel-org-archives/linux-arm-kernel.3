Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C914ACCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr9JB+acUWFLl0PRQSeU+Vdvre5khnKT1FDyCMV0CLs=; b=Iab5f75Znq9IqAwVXFw2gJlYy1
	jEwMt3nBYZ/x49SfSWhpSwsOzr6FaPAuxJEwQKkL0d5RsxUWu+bYogSOrErf9j8C74uCPXfnqJCgr
	D2rANfoEMtUF1zZMq1T9u9IjR/e2JxHHmtOFasUrOD0eRpVPDu6OlIwdztuvW0oo14iqjNh8zRUxy
	hAQgZ3086rYFQYuIWpU3WR1TfYAZzKXy8tpoIbDVUvTAiABBwWKf6tE2RVEhHL45md4UBDGXr6/H2
	SThR+5CG4VOQe8Ot02tLavaE9lSixvhCYpVsLOVDd9rjSGhHZAFzDEshBuNb6+/pJ5R3GkXbsVlBV
	AQlONvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd6A-00000003uiO-2Qvm;
	Wed, 22 Oct 2025 17:58:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd67-00000003uhk-2mF6;
	Wed, 22 Oct 2025 17:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FEC049BE8;
	Wed, 22 Oct 2025 17:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23184C4CEE7;
	Wed, 22 Oct 2025 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155887;
	bh=jr9JB+acUWFLl0PRQSeU+Vdvre5khnKT1FDyCMV0CLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7h2pCjUS3QZ8ZD5neVd3YErybx5CULzDQ9huY8d1OH4XKhvNP3nHfVBpAAh9/oax
	 +4/gpP0B+2p4/nslO+zsJQgiMv+ET/v/3bTEPbI8mmgmpmUyF2pEjoC9pK56lKMMJN
	 k7p1SAaWcz+EhNOCwegklcmbGEVCQATBr6lfy12TnAgIX6DZb4mc/NCOYDuMkiTLKA
	 Cy2hgwbE+AHxG+pfGcb0nyN7PzIDMljw0DPsPWWFGXCzFijBPW2hrhMRHjdDE47omq
	 xvkkL1LmzuK1K3t99lQpWyLMVK4+C1/6SWqCEHKI+cu6Z/PvLDkDxnrqAuK8ioxVDn
	 1mXhSBZD7WNnA==
Date: Wed, 22 Oct 2025 18:58:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: rockchip-dw-mshc: Add compatible
 string for RK3506
Message-ID: <20251022-selector-matron-e1c0331f821b@spud>
References: <20251021222955.193323-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Keo+0uZWAkw8FPLF"
Content-Disposition: inline
In-Reply-To: <20251021222955.193323-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_105807_715675_96D7BFA6 
X-CRM114-Status: GOOD (  10.26  )
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


--Keo+0uZWAkw8FPLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:29:55AM +0200, Heiko Stuebner wrote:
> The dw-mshc controller in the RK3506 is compatible to the one first found
> in the RK3288 SoC, so add the RK3506 to the variant list.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
(too late I know)

--Keo+0uZWAkw8FPLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkbKgAKCRB4tDGHoIJi
0qQFAP9rodx4+UEvE9Qi13OZz2yDdQL3rr3ZChSxpq7Kd1E2IgEA/+4ccILN26B0
FgWsR2Y7VQTJloYNoFuSVSBTnwzILw0=
=iD8Q
-----END PGP SIGNATURE-----

--Keo+0uZWAkw8FPLF--

