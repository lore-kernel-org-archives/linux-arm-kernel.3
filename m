Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A89CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8x/eMZ4ysHf6169CDhNGxNw96kygqzrg9hkanFrlGg=; b=XdJp7peR5C2Zz8zfwkpHVb49La
	YatnmorbYYrQOo4C3ili6qrf9PDk0+Q2g25OLhFgnx4owvYK5PntQlhktIT8+StOYsUVPvQxY3KGh
	2mTquyZqwRQRCxcGgnqarS+QeIn7KxCjZDIhvdMWJoA+6h+1GxnWO2WNUi4Oam/upK3sfaG7Su92D
	D2mNL5RfukqCOdwaUdIt3z8J6ygH0Qk/eLTlyqBCAa2HycxTSKW5MphqqPOsKcwFErQF0r9HBpiaA
	mptZp+LVWGoIE59DlMF4TwviotPEEdM9/lpyTtSJqm8PCxwuhlWPhWslbdHXkTfwOpTGEtihKEdRB
	/3UkIWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzemB-00000003eRw-03DY;
	Fri, 19 Sep 2025 17:20:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzem9-00000003eRl-45IH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 17:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E2B16013A;
	Fri, 19 Sep 2025 17:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04ECFC4CEF0;
	Fri, 19 Sep 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758302401;
	bh=P8x/eMZ4ysHf6169CDhNGxNw96kygqzrg9hkanFrlGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mlhjjq8WDK42H4gNlUa4mYvFKEzxmrU5EI8zJv8/w8qWavmR/5R8F6plDcxGBgQCH
	 DUbFcBRjxDQ8xCqlrYIAlLuiJyoR+uOkcsn85uWMEbMk8zr4rHRxm28IQZeFZ7tx2E
	 Q3Nf1zcQxLKh6HWkTywOj6dYC8tdWRzrj/c9taFU483ZLbuULWTRcq7yyKwDvOdcRN
	 HV6Qq7QXzeezUCD3WSzgOIrkeB7EPv+nhJxt0pAaQvLYmscvp8GCpHs/HOIC8IWeli
	 my2Gg/BbGOdn0yN9o1Dv5oqaVXLJqgAe7c1rn8xXTj8VuSYKqZ6ebt9hkHoYt1J7mn
	 K+nHrgqqf4NEg==
Date: Fri, 19 Sep 2025 18:19:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc3-imx8mp: dma-range is required
 only for imx8mp
Message-ID: <20250919-margarita-upon-689b3c7a7739@spud>
References: <20250919062534.2443959-1-xu.yang_2@nxp.com>
 <aM1+3WMeFln6pHwF@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vz/GWGcyBaaMSPo6"
Content-Disposition: inline
In-Reply-To: <aM1+3WMeFln6pHwF@lizhi-Precision-Tower-5810>
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


--Vz/GWGcyBaaMSPo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Vz/GWGcyBaaMSPo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaM2QuwAKCRB4tDGHoIJi
0h7GAP9NaCBsLswpHXyt3d3r8bi33aL/tmxH6vAEgQ4e/NCLDgD/cEWbZPVs3LvQ
ztFKwMCIwRmQvql61+SgPZIkT7tIRQk=
=7Jw1
-----END PGP SIGNATURE-----

--Vz/GWGcyBaaMSPo6--

