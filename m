Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42525CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qws8KeUV0f7eJ74CsFNYE5x8D+8Iurc9zlmEqbIBTIA=; b=e5h633vmXYB5RUXqjOM/xR1trg
	JepnPgTbMYEka8FeKhtDSdguGxXG7lA7TW32wwhYgKgeEsI1JOkvN1xHqIazYwy4GH/3BINvhXTBa
	qVVMBkVl/+tJjfBHtiqNBhz6foTpzW/DRZmQgTOSXf8EbDzCQStBkGnM9J426C9Dwe32HmN1TYUYB
	Jr2s4Vxwtn7lybBHf+vSiD8QxfatI+VEpkB2ua1BSzJ47wnPH6VcY13c4cAZVbAcs86DLftEkRN+P
	Vy3GtNw0qQUGolx6EcMBi5NowXsqEYCM7mqqhW9i6Xgem5M1W2CPGoMVdh3iPVGd7Iney+ji0yJbJ
	lWr4353w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLry-000000087P8-1Eii;
	Wed, 10 Jun 2026 16:33:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXLrw-000000087OZ-2DZS;
	Wed, 10 Jun 2026 16:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2530600AF;
	Wed, 10 Jun 2026 16:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFA61F00893;
	Wed, 10 Jun 2026 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109211;
	bh=qws8KeUV0f7eJ74CsFNYE5x8D+8Iurc9zlmEqbIBTIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEI0W6wN+zP2GlruuGOlP/StJUzT+xnRHu6ml3a5d6O5TILmGS05gnLL61kVXE/Eu
	 ANRUjZf/z1bCvX43kxc0eBDyJbe3tEGtXLFptSmMEc5AuctYKtf7Mlphqw+5NF5Grg
	 x9aFISqVu7FDmG0+BB2GWD2IM7rerZEhZdHzC3e3ObAAXYQHUL8t5adRTOiBcw0QTA
	 g4viCYJtdTyka6JtakdcyXXTpLxg27tVaPq1jHfNWesgKO+dI1wK//Spe8iJfQEfV7
	 mIcEsk1zdZX+ED+5BMldITShkyCFPkwN1EhHm/QeYzqlNMKusjJphc/djePvCR2ENr
	 aWieECpKi5aAw==
Date: Wed, 10 Jun 2026 17:33:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniele Briguglio <hello@superkali.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Youyeetoo YY3588
Message-ID: <20260610-synergy-stipend-f53ec049246b@spud>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
 <20260610-yy3588-board-v1-2-4bb7176b6826@superkali.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wnsuCdlmRqXDLuMf"
Content-Disposition: inline
In-Reply-To: <20260610-yy3588-board-v1-2-4bb7176b6826@superkali.me>
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


--wnsuCdlmRqXDLuMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wnsuCdlmRqXDLuMf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimR1QAKCRB4tDGHoIJi
0ofeAP99O0OxPFOWRn3QkTaBKHnpHFy/Nnpamnd3keTsXrrFngEAnmavcg8SYfTB
+pmd6v7amXOOjN2mSoi7mLd6wzjWzgc=
=pgbH
-----END PGP SIGNATURE-----

--wnsuCdlmRqXDLuMf--

