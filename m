Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BE7C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7lI/EUSb1UnQsHiI7dhsmMP7inV1Q2tEA9azOkLIHo=; b=HYFCva0AK/L11YT6Tu4Q5TXn5M
	CQioKMhLszTVIXKahvhhPKxy387XJgvbsdakxglynIeaG/owjacgSvYIu/55ZVBWPRtLP0Fs7DaZg
	xnKAy4TL67qNy+Ro3OgmUhVGC4HIMcAIgAc1PVR5M7UusI/m/F7WEfLELzQB6Y7Nn0VqBVmluaSCu
	fZKkFbXSC8ZrauUVydSEJKbKjjWtUrcVnd4EcF7z/ccZbaQywKSFTmSO2rUC6ck5pggGjMj4EyL+d
	LGO+RrG/pwRTRD3CQWvTrWIvgV+SGenvgsrnIkociWSIaAoge6Qi/WLvOC7WEiFM14RQ1Xt6dJkC6
	0D38I11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF5a-0000000Fm1x-0bxD;
	Wed, 14 May 2025 16:36:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEWG-0000000FfMp-0vTo;
	Wed, 14 May 2025 15:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F576629C6;
	Wed, 14 May 2025 15:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71BAC4CEF2;
	Wed, 14 May 2025 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238381;
	bh=y7lI/EUSb1UnQsHiI7dhsmMP7inV1Q2tEA9azOkLIHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqRXpvtM+aCchvhVgaI8UPqSbyWxbqOeyJxTrq+aZZRQIZBMoOo8tdKEuTIo95M/s
	 Pn40frK80HCGWRFgwNWfsQ1mJTucCSOlpmlHb654blx/t70VWNyls9hUxPjhTjDtBf
	 dyRaaUxX/gwGwORRA04plJL1qFaWJdEbijEcEjIsw6ligpJS+mJGj8aZQbiO0mZH8q
	 KTA274Fj0EO3iWdhSNCjlJRQING53jUy5AGAsDRBu2buOu5/g1QCH9ZSEKWf8L86v7
	 xNTmqZ57D5t9gx2MibL7ccuQRoNDt0jq0T+mh+3QwP6zHSf3R7me7/S+R2UWwfQSV4
	 M0BofCvxDEERA==
Date: Wed, 14 May 2025 16:59:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsun Lai <i@chainsx.cn>
Cc: Fred Bloggs <f.blogs@napier.co.nz>, Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Message-ID: <20250514-affair-reentry-8e444e692da7@spud>
References: <20250513163515.177472-1-i@chainsx.cn>
 <20250513163515.177472-3-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ACMaEZG5UXjrJyTL"
Content-Disposition: inline
In-Reply-To: <20250513163515.177472-3-i@chainsx.cn>
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


--ACMaEZG5UXjrJyTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:35:13AM +0800, Hsun Lai wrote:
> This patch adds device tree binding support for
> Sakura Pi RK3308B, with compatibility for the
> Rockchip RK3308 SoC.
>=20
> Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce
>=20
> Signed-off-by: Hsun Lai <i@chainsx.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ACMaEZG5UXjrJyTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS96AAKCRB4tDGHoIJi
0rvrAP9oquino9oJcGaDDnOhQt80+WydCtQhZ8xc6BuMGbI1RgD9Fo88RXe8PJsi
2YQ6plMxSYt78zIfs/wnXeFYBl0wegw=
=QJPp
-----END PGP SIGNATURE-----

--ACMaEZG5UXjrJyTL--

