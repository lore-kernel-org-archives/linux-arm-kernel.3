Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1316BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXEL4pwfPMVz7iJb43Gvy4V5PhxsUFD/gCBxQEtwy8g=; b=y8UfFkoCPLdR+FspYGLXal8y1N
	d93QLDLXzfpjaazp1hCSCUp6ncT+ryAqS7PK+HPPbc8/PQZVgW0AggZShGrK18z6aWq4vy/dUmBD/
	3zrEV5TT8SOzdjUm1b9w01pFn7JDeWWzBtHwKsS4W8PbWmxn6kEDftlOpRUQfP12hHOBfhH9OtSaG
	dRTgOXXu/NOg+fqvpd8HQYifQK2c6lsfGjUsEVQzrCsFT7GAxOCv5OT/49LpR/nwN6F6+4dKoYLqq
	wWpLiZfGP9oV/2ZxiluzKfxNsMmvS8ldjhArblLQxCA2eh53fakvzy0xc7lN5vZzLRzYpg5KHDiSt
	ZnpvS9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSTE-0000000DVwn-43p5;
	Tue, 02 Jun 2026 17:00:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSTD-0000000DVwS-2Fkq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:00:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C24246001A;
	Tue,  2 Jun 2026 17:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A6B1F00893;
	Tue,  2 Jun 2026 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419602;
	bh=aXEL4pwfPMVz7iJb43Gvy4V5PhxsUFD/gCBxQEtwy8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqn5sFCk9Gvk5MQ7a/oBBQ1+0KnpNVzVsNgERJHir3cW8slvMQ+h7DfI5X3owfXWD
	 yaoVqBHOnyep+/kld0J65qgMHBPo8MxXdXBzXcRPgP0f666v/1lXt2hemMLszNKK5o
	 bSOqyunDtFpKXL9T3vZwPHr3zV4+T7wiXsDr5DQeeubDFYlxh9zAr5ICEhwEMI5CGP
	 RstELcE6izDm6itOOogAcqL766P6clMh5X/O6NnSaUrnTKdGK3dYR20jtq5Zu4Pa44
	 eDr1YobTBhfQ/QCxqw4JxlpO0VvDONJv11f8L0FzBTdeeRGcF9zkckWecb/xveAOgz
	 tGNlOtjyzw7zw==
Date: Tue, 2 Jun 2026 17:59:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add ASPEED AST2700 compatible
Message-ID: <20260602-refresh-crawling-e6852feb9dcb@spud>
References: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
 <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sSlNZiJes0XynWvQ"
Content-Disposition: inline
In-Reply-To: <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
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


--sSlNZiJes0XynWvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sSlNZiJes0XynWvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MDQAKCRB4tDGHoIJi
0srpAQC+gmj4JJGrXIWGVt27womZpP49QqQ/L1k3k5X9ws77DAEAt4Hn4w2ksqmf
SI39dQOHYZ0+bCvn00VuAoOoxWr/Bww=
=kyAk
-----END PGP SIGNATURE-----

--sSlNZiJes0XynWvQ--

