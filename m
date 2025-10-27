Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FC5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zy5oeeZYFnehUdPPoTES70H7E8Y6e4YZbExOOF6RO4=; b=YkzEIo41RRKjmLVo3Afpx3SaWe
	q9OldRczXElpigDXKlP8qQbqhLKbkWlqiXuFVO6F2BOWbd9NNdgzcmXbQaxOYN1Wj6fNKWTRa7PMp
	S9gXvAo10GMV6qUSmpFbVvCCAuDB2pEBIOjPczGgNihir+OPzp84U93TLCN6BKUt5XF7x/Mvb3bNh
	KVijSTrY1NSQOSYJ5ap3HlNNGLjB0PGNHAK0ObM8X2a7q/livKHYuN92Nr7btrAKtinXhA9Sbg3Pu
	1drkvsYRyXBO+/ZZ/Prf2WWkCQQ8blDdafVX8a0o1MCAVDtFcfTkStZRQTawAXvE5lP0AhKhw+TVo
	8J0CnMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQIw-0000000ELte-1BSp;
	Mon, 27 Oct 2025 16:42:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQIt-0000000ELsn-2YF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3182F406B1;
	Mon, 27 Oct 2025 16:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41562C4CEF1;
	Mon, 27 Oct 2025 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583363;
	bh=3Zy5oeeZYFnehUdPPoTES70H7E8Y6e4YZbExOOF6RO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEOaY8i2CA368n555Cyivloi0NKa+GHB+dqed1sOLk3b8HIh2EBlvQ6J/03mdxy4r
	 QfAyN7TW9G5l/VCdjs64nTYKIWvjiWxbqvdSgpndg8683ztsIHAL0wdEXxJItiiR52
	 cGFsh+Wr7gJoZ9OYPRnCUoD1ofoXK/tUaNuGO4xogPjZeHao2zKcmfXOgq8Ls+rUAL
	 6ySja4/O/NLpoN0Wkd/Evdw3pnpX5IfuunHfYaIHPfSIHK8Jk+TKJWypv5vvz7IU8Y
	 +X1G27czOq8/JE7Nio+QxZ+H7CVNgQn3qQVsCN6krMKKuwclEGbh2rfGAGm8egMPp+
	 fvUmjjSFjZAdg==
Date: Mon, 27 Oct 2025 16:42:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add TQ-Systems boards
 MBLS1028A and MBLS1028A-IND
Message-ID: <20251027-rants-blah-e2cb48f029e2@spud>
References: <20251027110459.420857-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MaDd/w6OphELE1T"
Content-Disposition: inline
In-Reply-To: <20251027110459.420857-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_094243_666258_9951B3EB 
X-CRM114-Status: UNSURE (   9.68  )
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


--1MaDd/w6OphELE1T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 12:04:55PM +0100, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>=20
> Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
> Layerscape LS1028A.
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--1MaDd/w6OphELE1T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP+g/gAKCRB4tDGHoIJi
0iGlAQCoFN3hxghANDls800B6MI+ZpPw4ts8AIPh6HSc+dI9yQD+LX9iEoHKH5pv
9BOFPHyf7oUMd01SAxhwCtj2dhNp2wc=
=gTmS
-----END PGP SIGNATURE-----

--1MaDd/w6OphELE1T--

