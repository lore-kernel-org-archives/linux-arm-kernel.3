Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A606DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BF1vDy5egjT7wK7AaB8z1mWQl1XgoL8p6zRqn0fvwPQ=; b=fM8UF4NmAOyRuYqA9jACyG9Ilf
	ScyRPBi3/qMtlR+PyNL7dZN6Wb01878gGLJjDuh3hjCu8Vi16obLPS/fc0TOxFEjiTcVtKSBig+Ju
	hRWvdlTtx0e8+uz2nhRJ+mnyCskBQPojJvOGWrD5zVbYU9qGwcMLTF+0oMlL2+2ONmUILHQUyIIXg
	naVbhAQvccRKkcETuIpgPz25i9YjLUtIGk6D4i1oHjGQzGs44YfvGL+vOSTYaw3RKqE2BUBcEKYuU
	S32/FoAY3lHKAwCW9V83BH6knZ0n8okpImBiLDIsuCJ039sflpiqlK6pL1agUJLgWPM4BLSFN1GQ9
	HqIL/PBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oNx-0000000FO0E-1vgf;
	Wed, 02 Sep 2026 17:04:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oNv-0000000FO02-3igy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:04:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25FAB600D9;
	Wed,  2 Sep 2026 17:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D9A1F000E9;
	Wed,  2 Sep 2026 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368666;
	bh=BF1vDy5egjT7wK7AaB8z1mWQl1XgoL8p6zRqn0fvwPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LP/2g6ONzXchC5R52wUOvmYJrPFHCSaxn95nBH+9awsyIickuT42kz+bC/jUcyGJV
	 X7w3T7K5N1MTjqfeL+LuIIY28FBXrIY23Xa3n9KGfsEPiBTi1Lop0cBwkoje/V5peV
	 XBcdZZoxfFFZNPVhdRtckiqSvGG3nVbzP2YRBHJRjrnLB3NthXRvTzrFk3h+B687w1
	 +d5XgGb9ua7c6w4tICVJQHqUO63bx2+KTezRXpfZP7e3TguPYtbV3Dh98VMUCDz6ZS
	 4etg8G85ur2T78HLcB0X+G6Du4J4jlX460nUzzdt1RP9neomf1R04CzM38Jvuu1tDW
	 wKOHjKUNOG57g==
Date: Wed, 2 Sep 2026 18:04:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, fabrice.gasnier@foss.st.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260902-dubbed-showdown-fe35274613cc@spud>
References: <20260902124018.606544-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oU6Ws+W7UKePY0JM"
Content-Disposition: inline
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>
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

--oU6Ws+W7UKePY0JM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 02:39:49PM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oU6Ws+W7UKePY0JM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphXFgAKCRB4tDGHoIJi
0qS1AQDHcYddGZziqomcQ98fOBIT7MZWZgQ/5EwurTOZzgjuFwD+Oqcdork48p7x
q0zGEHQN8C0Gpyip7JMTuw7QsSfxdwc=
=pVYf
-----END PGP SIGNATURE-----

--oU6Ws+W7UKePY0JM--

