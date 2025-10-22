Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD6CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5VveIwlzMg64g1uO8p0shQBvCA74sGldZVW3WldWOk=; b=I/RWbdGVq/z3JjERZf02X5uPRB
	9KwaaqEezYOUiCgqpMEfAiMXAG+AWgad44AT7HCpsqhpd36qOfMRNJtT1Tlw1rdTDJr8fcQ4btWm8
	A4Q3HKPvxOki2wQZQYoVgUH1vQtsLe7sXsrwo6fELgU0eBarQLzera+BpKuKGZEewkqVt7jVxNdLW
	luR7rP5SVzk4UrB+1YR6f+srBYO0xOp55ztAuTKhRK/2DLeRndHOqkffk3dGa64s5XKIo6ZAKSy4o
	i/50Y64xWX4q3P/cRr8YkfZKIljoxEMghhz+zJX+dXqMLJk9MGYqg1OmyVmmiU9x3+dH4wnCFR54V
	PqxU7iGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd5m-00000003ubI-4985;
	Wed, 22 Oct 2025 17:57:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd5m-00000003ub8-1Ky0;
	Wed, 22 Oct 2025 17:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AC9362676;
	Wed, 22 Oct 2025 17:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4B7C4CEE7;
	Wed, 22 Oct 2025 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155865;
	bh=F5VveIwlzMg64g1uO8p0shQBvCA74sGldZVW3WldWOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AU34OeuegcF7JRDM1HVti6EdJx6RvHtDJUWXpbJfrbW8FbyS3TnABPYKfYjd8wKD5
	 25oZY7mdnYmupTB82ID0/lkxeEi9q35fsxT7lDi9A//gJH208Z0AxQNa2dCjK3vBhE
	 0t7Hi7QOL9hw0c2gRrkKffHPTuX8qzPeKU4hYveqFSDu8jWCQ4I3FMpjNKpYn73CCJ
	 eBwoj3EKXmzcV2DG6d0kmIO0Hp2cdtTSymbT/07mgroBKFEY/MrWb1p6Mv7E5wKhm1
	 VTXT9P4rFQPINnC1YVxlWCoI+JtERSRwJofC8wRDlbMfRC85qFwVAHLYG7cDlpji7Y
	 ev4H5EJEeokXg==
Date: Wed, 22 Oct 2025 18:57:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Add rockchip,rk3506-saradc variant
Message-ID: <20251022-grandma-maybe-2a1cef529cf8@spud>
References: <20251021223107.193453-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BvzJ9qHNkAmrHkqA"
Content-Disposition: inline
In-Reply-To: <20251021223107.193453-1-heiko@sntech.de>
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


--BvzJ9qHNkAmrHkqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:31:07AM +0200, Heiko Stuebner wrote:
> The SARADC of the RK3506 is similar to the one found in the RK3528
> in terms of number of channels and the other implementation details.
>=20
> So add a variant compatible for it, that reflects this fact.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--BvzJ9qHNkAmrHkqA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkbFAAKCRB4tDGHoIJi
0kekAP46hDQAdkFN8x5rulWTl5bTH/twS3iTeXKtAKTtGqZMJAEAu0z8J53LF80z
LKPxNtL+/g+fxHm+dSHoTi/1UtGPqgI=
=ofxG
-----END PGP SIGNATURE-----

--BvzJ9qHNkAmrHkqA--

