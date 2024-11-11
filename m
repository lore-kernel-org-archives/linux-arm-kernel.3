Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A13D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sowLwZu699PwyfGqXSwrO59uwPduv6eDK5d+b6fSKH4=; b=vjoru3EW17MoEeNO7UZKIL4vVe
	MTyVhFIEeObkSor9hpGF8/hrrCu3ciyUmYKZhpUEYlHEt+gADHy/P9VBcdu3e5RzlBIotldPBCDXP
	NV7PzpmjAY+Vo9u7dwUSydN8L4xrnhC7cAJexdZiCYajtmBbFmmkhPw0NXicbV4Ew69cKbYkG4WTH
	ChCJhkH605o0u7IpPcFnRbh8hPwM9/FiLJ8VTB/c8b/tc0yitx5g9f8+KLjIuZQo7Z/o4DUjEKmzx
	5BQ3s0HCeWGiA+dVyLH3vl2WlFu/hbTadW6sUbMx3uiUU/8aSEqgN7q7bs9pxDGp7HA6fvOhdzYJ8
	JilsMuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbHz-00000001EbS-2pD7;
	Mon, 11 Nov 2024 20:45:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb8z-00000001DFa-31Ex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD4FCA4087B;
	Mon, 11 Nov 2024 20:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E484C4CED7;
	Mon, 11 Nov 2024 20:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357376;
	bh=sowLwZu699PwyfGqXSwrO59uwPduv6eDK5d+b6fSKH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9YXFbsgp6NcANX/elk3FSTRwcO8Fvpileari4s9tVapV7npfw54WspALkK/FOB1j
	 AVN1dRXjV9OXonqa/iHVklbsIDNm5WopfEAHA84dyK9UD5+06b0Ny6uNsourJoGSuK
	 fFgzyzHnd89To/F3FyF1D0F/LL4qGj6ksErK4h51fqaKPsXpQhZtSCQrNIGmqRecay
	 5psoMITvoWeAd2oYdxX5fZd4sYtTjSs0z9FlwRAeEHGiS1NAGttRCVxp/Nrx987tdm
	 Wy0OvgebxLuibe3TlE5UonBit+MxkiQtiIKq3NBCpMf4vMKP+kjZn+wpdlgNiMgbhb
	 CRha8wNyWaxdA==
Date: Mon, 11 Nov 2024 20:36:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: i2c: mv64xxx: Add Allwinner A523
 compatible string
Message-ID: <20241111-yogurt-slacks-ae8993881216@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pTTvxdvgtpuRqDjB"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123617_844334_88A1628C 
X-CRM114-Status: GOOD (  10.55  )
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


--pTTvxdvgtpuRqDjB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:24AM +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner A523/T527 SoCs is
> compatible with the ones used in the other recent Allwinner SoCs.
>=20
> Add the A523 specific compatible string to the list of existing names
> falling back to the allwinner,sun8i-v536-i2c string.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pTTvxdvgtpuRqDjB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJquwAKCRB4tDGHoIJi
0sVCAP9FkjAH3fFo2Hcf+ZlfmmpDqgcCj8g44kJp6QWk/3cgIwD9Es+QU04KS2Yf
VkVqm2TK30nhRTNCt9eLkYyTwtRGGwI=
=NaZD
-----END PGP SIGNATURE-----

--pTTvxdvgtpuRqDjB--

