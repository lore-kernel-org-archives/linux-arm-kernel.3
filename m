Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB209CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixwFdgEDV1vu1vzeg2qqQRwOw909mWVq2oy7W8xBU8Q=; b=D+xkE7cdxCUm4gCDqtx6VQLJvj
	kAwlMp9zk+UrZowE6n7MLafGdfHBwTV5J9XbCgJJdd3T2YYubIMCR/IFAzA4m7l7ZCqgkPxDR7Kjz
	xCzfkAECFQFasAIvhRAtZQTYFhWNuYZMfBlySIVVtQQfCMAgVp1reFMxJOLCuk+2X5y1wZYMzYSS5
	v+TE+/4l48Xb3bv1MV4PRk4jijkuS9gWUHv9vzhP/0+c7m2w2oDwb6aezGCXilIpiYUbiDVtHA7rK
	XGnG7VpSPxjWXZkdKlqzxkHEpqy1ao0flvSr3Ve1nNA8KrOWqks/ZL7/6y8s9B+RKtEhOkaAl9+Or
	tWq3qYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ORg-0000000EJSG-1ftn;
	Mon, 13 Oct 2025 19:43:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ORf-0000000EJSA-2vk7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 19:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD61161DB4;
	Mon, 13 Oct 2025 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151EBC4CEF8;
	Mon, 13 Oct 2025 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760384548;
	bh=ixwFdgEDV1vu1vzeg2qqQRwOw909mWVq2oy7W8xBU8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqxEukwIUDgo85pIstDgdKdZE+8YzI57ha+0WdxwRe9i2ov5PZOK2WtAwViW6mIRW
	 hkceeBaoWdDZNZ4v4FG17UGNiK4029Aispld2PGhF3CXts8gLz+OwSCFxyBzI5wh7q
	 dipFaT8oNyEK2VonPte6vulHKxLAo+qXp4R30GKLVlGqeYoOEQ6cwkOkFA2noNhXWO
	 fHOay3Ul5BE50A0Ay29/98aleZN8tsJOjy1OftGqkz8NULfFTAx1TuIfe1bH2WnYgG
	 H6kb55VjmmQ9TpNNcQs/HWh+oE5cm0lRCS7pRlkb7Z0l7nW6Ln/WEGnYdry8I77vMg
	 2RzaaOTTEdgvA==
Date: Mon, 13 Oct 2025 20:42:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Message-ID: <20251013-antiquely-unflawed-acba8cd30277@spud>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="POmQqzPbtUQG0SRW"
Content-Disposition: inline
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
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


--POmQqzPbtUQG0SRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--POmQqzPbtUQG0SRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1WHgAKCRB4tDGHoIJi
0md2AP93sXHNI+r51S7+e52a5fQ3zBG8dz6mP6G+x+3DQmyQeQEA+pvsrxIei9Rf
epAILOGpCNuTKgdzwuz6M74yE/by1AY=
=/GHk
-----END PGP SIGNATURE-----

--POmQqzPbtUQG0SRW--

