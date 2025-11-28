Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC69D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXtdLdYNGI2Def47xLdO+K+KvZUz52lKdw1ZAleee5k=; b=YFHeeb+4U/L2D9wND2HgNzOi53
	34KLfYPhvR0QqUY6/Ov+N0ZgLsi1e8DdwiJX+Uwt+ygoNXV0tx9N2EBVfjVVjAQ9VbtA/MND/perk
	41xqPl3bVcY6SVJvq8sKjJFv/LwOWmD4dgJ6nPtcYB5Mar78npW2XDf4gvRFVkMXRc7LWxh0lXye0
	Y6gLGUwbXfHNEVnSPLAXl0xNI451fNsvNiekG8+l3IwZ1D1q4aG29+3nSzlXYtJTfiD8ogd5sybxX
	3shRvNQlod/p3601DnF2/4Wn2Y53qw205LP0Af9HQWjY6mEgWJJ4/qJNCetbCI2uyiDuN31S0v/9Z
	5MgbMgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2KM-00000000jhE-2NXr;
	Fri, 28 Nov 2025 17:32:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2KK-00000000jgj-3nPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C5FB560125;
	Fri, 28 Nov 2025 17:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C628EC4CEF1;
	Fri, 28 Nov 2025 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764351131;
	bh=DXtdLdYNGI2Def47xLdO+K+KvZUz52lKdw1ZAleee5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYkSpEqaLqnSBU6hF/5r6RXEsVVv5oXSmgzA8qNIH9Fn1IBazC9GKCNNXu3o6nbjM
	 mN8A+4UefvGHlGZG6yDmLE6EV/tKM0faRfVmKcw01Z4KRYVy1d9Q8bHRCdaNvZ2AMn
	 kjId8/Wqf2dDVWYrgRNTbeeZvlPSY3/3J3GSiaQ9pwebN+K/859W0Q/5Hu1M1CNLph
	 4pRhmMizHErz/2hqh8Z238J8fb9mkTwDKyFaud4dOg3SJSlx875Jv5YnqMl7qo1WJ8
	 ZKAXDbBGG7ug66gJLSVIF+7p4BNrbzSvPwvgum0Uvdnk2OPDDRHVVbn+RyJ3rwy+En
	 Jbr9/wLCexsUw==
Date: Fri, 28 Nov 2025 17:32:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700
 support
Message-ID: <20251128-ajar-headcount-a8589beec00c@spud>
References: <20251128-upstream_vhub-v2-0-1fa66a5833c2@aspeedtech.com>
 <20251128-upstream_vhub-v2-1-1fa66a5833c2@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PTCSciaf+pNNOYVt"
Content-Disposition: inline
In-Reply-To: <20251128-upstream_vhub-v2-1-1fa66a5833c2@aspeedtech.com>
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


--PTCSciaf+pNNOYVt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 08:27:30AM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
> controller requires an reset, so make the "resets" property
> mandatory for this compatible to reflect the hardware requirement.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PTCSciaf+pNNOYVt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSnckgAKCRB4tDGHoIJi
0lyuAQDcadUyChIKt4hLNny6wAUoqQNARS1SLjiQFJLqGfv2rAEA6tf88roWmvmr
QQPQ4wsg2bKnhY9WdzB5cH62ydNRGAc=
=yqmb
-----END PGP SIGNATURE-----

--PTCSciaf+pNNOYVt--

