Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A3EC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7kFj3CUvv/CS73sWzGwnm3tHKJMaqfmiaX3ddssg0U=; b=xwn1bMtjOve1FiLkS4qHftI1Nq
	dGIUX63nI2mYutxUQK6k5eDFpeNAQwGs0LljzqqbB3mH15RkeHCdbYzsYlMDmqz914au/CwwVCBB4
	dJYxMp0l4dS6XYP/SAPxgv6QDpq+p+LnX1/iUGDYeBA/hdBxhtWb2MLpjPFBjxMek5+fbY0u4fmvK
	UmuSN5zj9LafabXZoQn7uzqKk14GvtLqPOrLDRBSr4EICt2BIEzAoe3M/i/5yxHg5yXQ+xGcLsGxo
	TnTnt+m9jnMDcz7hsLnf3YyzJk8AuJqoYH1VoORGxXj6cavAQelYUG8Akjm58LeOjntYNy7bNVBK6
	pfplWb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqx-0000000EJeQ-3BfA;
	Thu, 12 Jun 2025 19:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjrG-0000000Dn1A-0OuI;
	Thu, 12 Jun 2025 15:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D104F5C6667;
	Thu, 12 Jun 2025 15:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58504C4CEEA;
	Thu, 12 Jun 2025 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742129;
	bh=t7kFj3CUvv/CS73sWzGwnm3tHKJMaqfmiaX3ddssg0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBJ1AJLi2/VBvcn8K3zZFaIdebMiKc4pC4pqU1oD174Nyic3I5Vc0tYsWBUagR3AR
	 dhN5uG49SFhLwzEphylzAUlEdaqgzBH9qYOpNbvbXJ84CycsJnzwvt1OMWLIBi+/sk
	 AelZxxiwy4IWq8CJ9KwdfplFJa1ffrGvIdnEov3hsqdrPZgOEbnQT3F0xN79BxCSxM
	 64O1AJCB+RBxUMbwUd5fdM9v2Bvbxt6vn90YdmeRBiat3KXXlYDWlG3U/INFGhf5hI
	 oJKLvjpF5D5LPgwG3pmKaH2CQcRlHkhj98dnUFeDAtcKm2u/VAOjF72WtKJvSvYIdT
	 PwREXpzfhGKKw==
Date: Thu, 12 Jun 2025 16:28:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: samsung,mipi-video-phy: document
 exynos7870 MIPI phy
Message-ID: <20250612-unpaid-slacker-edaf80ce160b@spud>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
 <20250612-exynos7870-mipi-phy-v1-1-3fff0b62d9d3@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f30wP9juoNGzy1L/"
Content-Disposition: inline
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-1-3fff0b62d9d3@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082850_172557_4E4BC381 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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


--f30wP9juoNGzy1L/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:39:29PM +0530, Kaustabh Chakraborty wrote:
> The Exynos7870 MIPI PHY device contains one DSIM PHY block and three
> CSIS PHY blocks. It also requires two sysregs, one for display, and the
> other for cameras. Document this device.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--f30wP9juoNGzy1L/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEryKwAKCRB4tDGHoIJi
0mqJAP9DJbUlkADvUrHdf81purqcXzTVeDAzhbMUmKO+F21UFAD/QjLSgELcwtip
njn3vQB/7wZoDC6VzVfnBVgIdy1XAwg=
=Bir7
-----END PGP SIGNATURE-----

--f30wP9juoNGzy1L/--

