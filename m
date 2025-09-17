Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D040ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3Am9CZijzheAJRrJMo40O044w6jv7P7hbe11u4WcaA=; b=U/ydRDhKIesa7la5FBzvRkDPKU
	oD2s9/TsvavOVDk+1EjQmApPer7HtCNV255/SSr+F31l6i9tu1PEw1uAJQyZKelxCATbjh9ZcjugX
	29N50z4TXDOmi0xnMDXpCKOMWYoBDzipX2r8/PnNVJjV0uC0PA++GmQPEyclFVW2pyuYlfBwU2RhD
	SnT1RyUgyHX7JNHOZWPMQ/QQHHdUMg0Z/99qG4k/TEkcfYT/SienYCm4+BxgNO8W0JyAR/c4nUXAn
	wxG2ye7zPQlb2N29gSwbmSZg15Jv5IoGEWqLZcICGLbR8o054FHz0PySFDsBDA/xqelrpuPeOZSUe
	A6ek54Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxec-0000000ECiD-43WZ;
	Wed, 17 Sep 2025 19:17:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxeb-0000000EChN-1QWQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C04F3601E9;
	Wed, 17 Sep 2025 19:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74744C4CEE7;
	Wed, 17 Sep 2025 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136640;
	bh=u3Am9CZijzheAJRrJMo40O044w6jv7P7hbe11u4WcaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MW1GcNNWlRPw0CLjtk7TbSRXrcmpzpiwCmx2qHA9ImM0Yt1nmMDeQ+uY8a5n25+RT
	 dRiEHOMjWeAJ1iY9m4uwgVdDzvpTANohnpo5ryFeX5LIdyT0Wh1H9KTLg6bURSNMH5
	 jz+XKpHrYLgwOX5G9Y4IjJJ5z9JWMdRWivyI/Cy4EYoec3+v9SiU8aK8u9a/3HB4uQ
	 fTFRSIaDvd/2T0z42yUwVHI10Gjm5q3hpKo0p1Dg/ngnGEtlJ4XFIuhwurrtKJsfi6
	 HG05sHoBZIs1Ghf4UIZSzyG/J7q1sHvRIsNXmLCki/8+sxc4jhAZ5jTVhzxmGrVuJK
	 OG0DdLL84hRqg==
Date: Wed, 17 Sep 2025 20:17:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8
 board
Message-ID: <20250917-upswing-paprika-515d88bdc6c9@spud>
References: <20250917180428.810751-1-rebecca@bsdio.com>
 <20250917180428.810751-2-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evQnuMst3vf9IghK"
Content-Disposition: inline
In-Reply-To: <20250917180428.810751-2-rebecca@bsdio.com>
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


--evQnuMst3vf9IghK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--evQnuMst3vf9IghK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsJPAAKCRB4tDGHoIJi
0oRPAP9UJ57vJwVYjF7FY8AiEeYNHjjJsfTgCjQb95se9aB1LgEAnwvvzR9O6Qev
0yJLKjluBiyy80DVqbCAxm8AgQTA9Q4=
=U7SI
-----END PGP SIGNATURE-----

--evQnuMst3vf9IghK--

