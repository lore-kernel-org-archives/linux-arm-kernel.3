Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866E3E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0ATrIW5UmsXjG0M+E3OY4XBnQlH/p5LBOiOgE9mP8w=; b=aBU112K4AYcTeOfevtcKi2KES1
	CRaU9EwWa80eczSrUTwCQUqXvFmAbBIDZVDuAh263nUipFMfrrbxYoNvzV3E5j9NM02ZarB2iKYpZ
	cPzA3SuBsA39yzVEfD6zSdrDK7P7e/7bhAo2JP0SbJB0OpB0NQoZ6r8HhbOToV2UdpEmuwkHAyUKD
	nJKzUKNZkyBec6t8QkaRQuGXdW7q2jwfNiU5Wq1cMR26t5I0rAuTxTaHgOAMPNqwVvPOGEPdcZpbq
	6HLrWD5NzfoKX50weDaH7ZPbcll1Ss1lDJFWTrquJh4NBMWS4IveSJcmfyrjEN4WWD/5jwPz7UzgZ
	S3yV9bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tREL9-00000000jvs-3RqM;
	Fri, 27 Dec 2024 17:41:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tREJz-00000000joO-2MqV;
	Fri, 27 Dec 2024 17:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF6825C586D;
	Fri, 27 Dec 2024 17:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DC9C4CED0;
	Fri, 27 Dec 2024 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321222;
	bh=J0ATrIW5UmsXjG0M+E3OY4XBnQlH/p5LBOiOgE9mP8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G55cB9ZD43x64IkyWPMSD3L75JCZ0fYzOiZr+xEyYDf0vJHiwYTyeKO4dNRNYhUCq
	 mqvrRP2oCQdUyDv4m2Lyacf9qb6ypjdeC2onHWErLX/wz01wmq8enpeNEofpHYWMJN
	 VejPCEItnHHbTDCFynWmFNNmC4uy3R/PaizM4Ck58+gLjERb2Hr3woWSa3aqUsaFTz
	 Ez2uLD1Lyrg7bre+ZJCVONe+VHLNNW6W7oPX2oFlXVdhcnm82ibi14wkXV9dHxOewF
	 1mLLdZF409LVDyzUlazGmGyXegRS9ieTJb9gyKnU17ZvitYHeZe78XFEAmCDMBdTEM
	 YJDgzda6Livog==
Date: Fri, 27 Dec 2024 17:40:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Jagan Teki <jagan@edgeble.ai>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: rockchip: Add Edgeble 6TOPS
 Automotive Edge AI CM
Message-ID: <20241227-tactile-recreate-9de95e933e49@spud>
References: <20241227133420.169714-1-jagan@edgeble.ai>
 <20241227133420.169714-2-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V32klBqQoWD9BeHs"
Content-Disposition: inline
In-Reply-To: <20241227133420.169714-2-jagan@edgeble.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_094023_654115_EF722361 
X-CRM114-Status: GOOD (  10.18  )
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


--V32klBqQoWD9BeHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 07:04:18PM +0530, Jagan Teki wrote:
> Edgeble Edge AI CM6C is an Edge AI Accelerator module based on Rockchip
> RK3588M.
>=20
> Edgeble Edge AI CM6 Industrial IO board is an evaluation board that
> would compatible with Edge AI CM6.
>=20
> Add bindings for it.
>=20
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--V32klBqQoWD9BeHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27mggAKCRB4tDGHoIJi
0mE3AQC+09x5ioHgVwKJcDofflS/irAVJwe6Q9jkSmmlbO33dwEAwU4/+49hOw+6
ZN6DN17kLUxKDhF9diGKOEuJZM7ycQI=
=vQ8D
-----END PGP SIGNATURE-----

--V32klBqQoWD9BeHs--

