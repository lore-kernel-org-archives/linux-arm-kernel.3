Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+bo73FsDgYGeRUjJ/0NdTtaHebHYRzVCqW9peXF2KU=; b=rsP/1aIWYUdwn2EFkEz1XzJVBT
	8dSe1eGc4BT3UVyRKXRYhSI+ycO8R5RVLFNcmX8UTu9FgSLVsE3YzNTHZMmTclxNjASbjpGOFPVXJ
	IBVOUhZpzHXURaYLmk+iAscpWiJFq8WRtfd8ae+Rz4ASWFK7MkWD9EXZ9dsy8TR8EW0nfhFxp2BC3
	xpVsKOJspYB7ho3GMlG7jcTS3SPvXmh8y3TWzo1DDRPV7UYPoaVtRNAG2WjPVIUQ+LmbgegFPzt1Y
	RSMp8C7qIbundCRBjw5tZKw2X5JDBoPrso3IvQ6XW1aBrpuT9OSR05uLvskB8TNvxV8IeuaYWSD/h
	r0cKjmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCsk-00000005A0g-10J0;
	Fri, 10 Jul 2026 15:11:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCsj-00000005A0Y-1Tet
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:11:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05AD241502;
	Fri, 10 Jul 2026 15:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77371F000E9;
	Fri, 10 Jul 2026 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696272;
	bh=N+bo73FsDgYGeRUjJ/0NdTtaHebHYRzVCqW9peXF2KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DQnE0rcDKiBX4PGfTTTLtfYgsIfg95iCzdLHLqGrpDOWPummpQWg/K1OKPhK6rF5m
	 3CVJU7nMXufN5GkbySHqozVddegwSpJQtBfqBFOhj1BNk/apnaLcS8kk3Om7zVYtNF
	 pYbsPtVOZ1jhLUj/H0E63Dr1Rn0jNcQfNSdVtWZDc8cG/2g5r/lNViPXL8K4rSO5Pb
	 ssDP4UtyVo9s1xRzytuOiSOb9Gqj9vm0lrBMINOzBLd2rbFAYdsORR1LxZlFQnjvsr
	 p+WcsJmzmhj5NWXoiDMXMPcUwn0tqHh35o0Czu6X2rOTKwyEYElVYVjQJyjllHHCmB
	 iQbwgJ+KUaXjQ==
Date: Fri, 10 Jul 2026 16:11:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62
Message-ID: <20260710-rewash-dripping-a2fe778e75ac@spud>
References: <cover.1783687321.git.stefano.r@variscite.com>
 <10775b12b801255546c9cdefdb153e421aedf910.1783687321.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hva4XXWYreE104rb"
Content-Disposition: inline
In-Reply-To: <10775b12b801255546c9cdefdb153e421aedf910.1783687321.git.stefano.r@variscite.com>
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

--Hva4XXWYreE104rb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Hva4XXWYreE104rb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalELiwAKCRB4tDGHoIJi
0mi3AP9e7YZotIexjzXQFo+xO4mLAfJgv6LSzjoZE0fCdgVqyQD+Nbe99SRnIk+3
iJOnnR480ww9jQD2dmn/FPMmVvG6qgc=
=vrLM
-----END PGP SIGNATURE-----

--Hva4XXWYreE104rb--

