Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA54FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjn1ZBaz4ZIn2D113VXtuXFy4b0UXtv2oTvsQCSMMg4=; b=QLoDVKyBbHP+zzAgXBXD+LlUH8
	kyHpn6tBOX48Qhb7OUsUlAq2AT/q1c7nnqLI8xJfL94xLI+j0wnDIWhIwSBVcXl/qI/PdIukEvXew
	tJOsknW0i+B6174L6l8rWDQc64Dn5UrN/jtl+a+EUzbZdgv13EBhEVdLrA7Qr/vzA/7RBM1NuV5SV
	SUS/oThsiXFvOShdqRf4D1fJCpc4I465MZxwRETLg3tz4lCJ5dh9lNE7a5ANOaJpbiaa0SFqhuh8K
	LUEHLjGtiV1PMFuFgRKMhEsPh5U0Lp7iW3OVN5VzcbXrEk4QUsRUZXBZOlUrSEVxz7eC0WaDLH0c7
	RpMiyCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKZm-00000004jru-3qku;
	Thu, 30 Apr 2026 06:08:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKZl-00000004jrl-0PmT;
	Thu, 30 Apr 2026 06:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FC6F6014C;
	Thu, 30 Apr 2026 06:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A934DC2BCB8;
	Thu, 30 Apr 2026 06:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777529319;
	bh=Cjn1ZBaz4ZIn2D113VXtuXFy4b0UXtv2oTvsQCSMMg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyXPaxak4PnGNe+8ki6nvZGL9g324v0yLAudvontCHHxXvMkTJ6/Y3mES9v+ZRSnp
	 q+MaH6v+1dPRVD1gy9qEYyrQ6uIh6ocYk3FjmJHigNA9Llxv4O+wYHdUVcAmmXre2Q
	 RevnnXl+SBaN6tU2AJiD+CmpG90hckQ4h8WZNnrgL3v1jgfizKUhU2Co4CfPNaJ/dT
	 7QKnSeJexmDmwfRQGjjzvYOZc3TWpT0P4XmS2jQw4Bzy922Q9jbeoXBBACTH7QbObs
	 xmX5DZmkwVjKiAwRalPW9jXgPDQRyAGyH10KOuM2EguGe1SO5OCi5aWpyydPGvfKXP
	 7AF5wUPiSi5Dg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 71F8D1AC585E; Thu, 30 Apr 2026 07:08:37 +0100 (BST)
Date: Thu, 30 Apr 2026 15:08:37 +0900
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Message-ID: <afLx5bJJykXE_gea@sirena.co.uk>
References: <20260429074113.3720271-1-wenst@chromium.org>
 <20260429074113.3720271-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTWikjTYTWdVqHms"
Content-Disposition: inline
In-Reply-To: <20260429074113.3720271-2-wenst@chromium.org>
X-Cookie: 667:
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


--eTWikjTYTWdVqHms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 03:41:07PM +0800, Chen-Yu Tsai wrote:
> On the MT6397 family each buck regulator has a separate supply. LDOs are
> split into various groups with independent supplies. There is also a
> supply for the regulator control logic.

Lee, this seems like mostly a regulator series - OK for me to apply this
patch and send you a tag for it?

--eTWikjTYTWdVqHms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmny8eQACgkQJNaLcl1U
h9BgzAf/byt1RH1nlHQ3FX6eWSFu2xX9esj6k2nbapayxMx4rHey5B9brr0mpB5i
9TDNXYmte5933g6dsYhR/2i1u0VNfwMdZry+XOUgQjM9KJETXo76rYYwZg/0SLe4
WVN9kIX8JEmVyY97zI9pROXuYkQJHZO+Ot1CGm2QYVsP02vgk+T/f8gekGWoZa7B
dztjGlyXUhxUe1s9eqriAY3vlcj+sUKl41rZ5ZRgETHOZ9Oc72q0X1k/YKRlgybC
nfImtDn9cytIEtWYPqZzM3C2D7Fse8syXjCvLXdRMQUzb8Uq0R5j6iBCAJvFp0tI
1ztjAGUoGrdq2y84+G1ZyVk6LM9rOA==
=aOxF
-----END PGP SIGNATURE-----

--eTWikjTYTWdVqHms--

