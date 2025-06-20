Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3B4C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXG/AivZAenzGBIGKaECDIg+iGpwiWQE1Xvg8g0ytx0=; b=WCJtFnl00yLZbZ4O3bfNSy3RfQ
	N2qoRpj2KDU3Qki7C5er7YytQaVWg/aNIKSEp5FFf1yYIgHKOjLs13/vs2T5sloRvUQ/qjA9HbSyA
	wk6EyKdlxFCjJgXB/F8sialwvIaNnvsEMVOPTTSKZFQKYuJNB54jdBuqytO9GjxiF+JPPaqDGumwI
	YOLoyQcpZXtnTgGsuavQ+KrWwAGSiOrsqIm6bszYbbB8kQiQefhXZgJ34i90FzJRD3XVzW6jNjXMJ
	E90Jj0IhiLZKjn/kDXh3ZoqQ3vwFdJsNJ/OiKbb9ORNng+mmDkcLoVb9Vzy2F+/+1UCWn7bJr0WOg
	TJc7xD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScad-0000000FpxZ-1axA;
	Fri, 20 Jun 2025 14:19:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScYP-0000000Fper-0syH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 052A8A524EF;
	Fri, 20 Jun 2025 14:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58825C4CEE3;
	Fri, 20 Jun 2025 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750429035;
	bh=WXG/AivZAenzGBIGKaECDIg+iGpwiWQE1Xvg8g0ytx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBc35g6I659KGOTPfykwRzlur/3XShBZTklwpr7pxPucow48iGbOlYnDOAe95hMT/
	 huU4Ovm/Lml3dHTwSjFs5JpQ9Y2XjEtyZuF3OxFIVi3bE2jEzZnq6GUmGKhVUZCYY8
	 W0bZDKtNep0j/a+iKZaoW2iBWBUxkb2jH0tuCx1ZoPlkI3TU1z8EwVIBNxcvngWEbI
	 BmAr+4A7REMFv0CrppUd61dATPzut/2e3bO2OCXfz/oauZaS9StolVHLSI6T45uJ8E
	 ERs2Y1GVo/uSXZKcYCdFM6Rzr6+kCk6l1sdA6GVZcBNUx25kiW1RZk9fjVX+a76zrs
	 pDnYrasLCgnYg==
Date: Fri, 20 Jun 2025 15:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A
 board
Message-ID: <20250620-bronco-stir-e1ecbea744b5@spud>
References: <20250619173007.3367034-1-wens@kernel.org>
 <20250619173007.3367034-2-wens@kernel.org>
 <20250620145422.26fdd14a@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2OXM8q8Pau5maNhk"
Content-Disposition: inline
In-Reply-To: <20250620145422.26fdd14a@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_071717_313734_704D3489 
X-CRM114-Status: GOOD (  13.05  )
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


--2OXM8q8Pau5maNhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 02:54:22PM +0100, Andre Przywara wrote:
> On Fri, 20 Jun 2025 01:30:03 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>=20
> Hi Chen-Yu,
>=20
> thanks for sending those patches!
>=20
> > From: Chen-Yu Tsai <wens@csie.org>
> >=20
> > The OrangePi 4A is a typical Raspberry Pi model B sized development
> > board from Xunlong designed around an Allwinner T527 SoC.
> >=20
> > Add its compatible name to the list of valid ones.
> >=20
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2OXM8q8Pau5maNhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFVtZwAKCRB4tDGHoIJi
0suKAQDd6jGsqSTRe+mxpECzaPvfrzFdj6AgjB6HGbdTMP0WbQD/YOGeSVE8pFbP
w/bDsvdNud0cRV2TPv76oa5kfAob8AA=
=9v/4
-----END PGP SIGNATURE-----

--2OXM8q8Pau5maNhk--

