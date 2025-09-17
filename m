Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96800CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gr3F9g/r13IbodjkbswahgoO+gHnOjod7V4voFnQTMQ=; b=QdAAmyM6e1o6L47PizzDbqK5PL
	VKwSdwu79p2QY1LOSEjLJATM7fnYqsNP5SneCK1XoixOnDSrSVzBgJCZuaDidpTaniTbRvCl5SkY2
	5IoZ9+wdEIkR647cmjV/r/RZCbf9RXX4ClWMPfzZit6RQ3aOyZSrrWBQl92cVFOJ2XQ1bp0iYJU7A
	wsVpROCxiDymauh2Ryx/u71FiuqNXHdQQxk2Kta3vvW5FiiOoB+0NVBbiTS6Cu5hdDcMtWsOoKxj/
	BMrzGkCCKyRrGF/CyYF8zqxnnQFk9zhD7kBfXacUeG1tCr5pfgLYmU39srn8bLEZ76Ib45KdJFt0V
	83QtjSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxof-0000000EHQL-2wJ1;
	Wed, 17 Sep 2025 19:27:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxoe-0000000EHP8-1MwS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DEB26023C;
	Wed, 17 Sep 2025 19:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F9AC4CEE7;
	Wed, 17 Sep 2025 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137263;
	bh=gr3F9g/r13IbodjkbswahgoO+gHnOjod7V4voFnQTMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o593B8bhRSTEOjlj+wGHK1uCJ5fOkOv1NZ0b3Zc4xrlHoPteX4c8FuwXmyea3lKi0
	 xx4Dwqgc/qz0is2U2wsj6K2uyW0IfkZdxrOz1a+m3QlON7xkwZTo5XPQWL23hcA/pX
	 C8CO1Gc0z6eMH9Wr5wbL/RSqwzPcaEPsaiGkoZsuPPBvU3vDH6WzchAFrLtJi1h9ew
	 QhcszbpSHUUbMdf5boE60/ZJavCDUmmkYCf0xQn9KvjNe33vGFVpsZq5pLHup4hdSJ
	 OjR60akzeJssaNRF3Cu3RiOAIMUkrAwSaH7QGqdXTRO0bpfkazW16cOZUvDZ9Xo1W0
	 FWav0Up9PrmDg==
Date: Wed, 17 Sep 2025 20:27:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20250917-removed-grader-328f0a71bb73@spud>
References: <20250917075156.4043936-1-kevin.tung.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iJ0kmrmEVtt0EMQV"
Content-Disposition: inline
In-Reply-To: <20250917075156.4043936-1-kevin.tung.openbmc@gmail.com>
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


--iJ0kmrmEVtt0EMQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iJ0kmrmEVtt0EMQV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsLqwAKCRB4tDGHoIJi
0h+kAP47tu4UOEsK0a/6ISyjquXeGZE2vnuhAzzB52b1McFerwD8CfdmMddHrJuW
QtdHkVqKuD2OiurAWDrWSuXMWIdiEQ0=
=4008
-----END PGP SIGNATURE-----

--iJ0kmrmEVtt0EMQV--

