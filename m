Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4983C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tmYJwzpiN82GM9eC7S0KdCW2m2qZCsDfpaJowDAzto=; b=kcpujlfJYsm8izTwLFdQQUsnOj
	T7zW+bB92/jempiBh4izY7l8Qbb4KerI5Vd3bT2MtcywqohU7FGsiLVA5F5O785iR4JFzaVL45iTq
	y2p+LaAeD8QO40Gdx6nv3NUu94pYOkO7NXbls4k74qU5QdWIw5z7h04PEFZNYLnz+mFpmfQ7OVr6/
	WTKcdLUdP3JP1xiMidcudA3dhgyJYP1L+Zn0ggN7VJLGcwMsq/fPqdbmowCDPMc1pPywpPujSFt65
	48uYjX30ffFOpsVFnuAqaGThY4oEpx6mlnSIJxcLA6kfPx4MXf66ye87J/7OCQDcXaNX9uHnj7wpw
	fONpUrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvTC-00000004w12-0vpL;
	Tue, 11 Feb 2025 18:58:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvHe-00000004tq7-2AlD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B5A95C53A8;
	Tue, 11 Feb 2025 18:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE34FC4CEDD;
	Tue, 11 Feb 2025 18:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299617;
	bh=1tmYJwzpiN82GM9eC7S0KdCW2m2qZCsDfpaJowDAzto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3vHm80V1MxuMz39kk4NM3szzMx4rPzzpzJotXcuUGH1lNYPtr1/oNQfbTpmBxqSn
	 yyIhrhosdxMk1GpUczZiiFJeVj1TqHuY98YF26akFbzplQhjXQXaXw+SoHf7ADsuOn
	 6CovGx+JH+3xYSPePtXxkPS/XstrF9VgyWbcIOkuRJi+fcAZ6q3IRvwhknLgvcJrLQ
	 eWEDPG2Tdw0UUgnEpEW+/EIqPnOrwWf9ushBGXa3DAzvJpwpkUX0zLOJxIaqitcIto
	 2Su4xegMFmqsDKAawORio6fpzyRFohGe42nYAELKovZkjOXbMii0TUjslLOv5xuEDo
	 ttrVwZslzkgFw==
Date: Tue, 11 Feb 2025 18:46:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH] dt-bindings: arm: ti: Add PocketBeagle2
Message-ID: <20250211-pegboard-dividing-24a17e921e33@spud>
References: <20250211181839.1575497-1-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dYxPXg4CmGsnpMpq"
Content-Disposition: inline
In-Reply-To: <20250211181839.1575497-1-robertcnelson@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_104658_596262_BEA26042 
X-CRM114-Status: UNSURE (   8.77  )
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


--dYxPXg4CmGsnpMpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 12:18:38PM -0600, Robert Nelson wrote:
> This board is based on ti,am625 family using the am6232 variation.
>=20
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2
>=20
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dYxPXg4CmGsnpMpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6ubHAAKCRB4tDGHoIJi
0srsAP0Raa76KzHP+t2mgKgp6YI9TNmYt2kXcJp0WcLoGAIXQgD9GaqOVcAWXDOd
Yu4ORkcOtXC6NV57PqJssUkKe9nyAgw=
=Y8Ed
-----END PGP SIGNATURE-----

--dYxPXg4CmGsnpMpq--

