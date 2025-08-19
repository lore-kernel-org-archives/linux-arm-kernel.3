Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54844CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImNqnzWW+9w9BxQLnC3ZvD82tjRDoNDHtSzzNgeOCzI=; b=FfYCdMwP9viiVM3j3Hk4WNtSt/
	dJunrk4n4ma5s2qIsnyejesDOAk9uX3Qm3cSpGsJ0zWCKxYxL11PLzQ3f6Q0o55Kzqzz6BgH2gf9B
	pu801rmLo6E6Fl+cHhvJR/HhDoHlG9Y58c3M+c5MeKLP2Nz2OegfJde9a0k0bEZOf551oBjTOXbWM
	RO3GwEuzJSKNx+voJ1kA9yWYgUHBW4qRpmE29ZOE13Yw1UiyBSVW3kAuAMneKUmxMw1HDPPocxaP7
	Fq/zNPAzJgB32fEonrXyHGbDA3h9cOq4hdIImQgfDcvDLnb6cWhr9i8L9aXFy12D7tlYPVV9RE7hO
	5dO3ln/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSX4-0000000BUd2-3zxc;
	Tue, 19 Aug 2025 20:02:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQPZ-0000000B9iF-49pT;
	Tue, 19 Aug 2025 17:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4AD944FC1;
	Tue, 19 Aug 2025 17:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFD3C4CEF4;
	Tue, 19 Aug 2025 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625577;
	bh=ImNqnzWW+9w9BxQLnC3ZvD82tjRDoNDHtSzzNgeOCzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHKIV8jUMwsAWVEyTRPQYe2JrqREOYrKKGYGK1/hucnGGtvuwJFic4n/fuu0J7AKa
	 eRY0GzENfilScdchr8j631HB0bsTdrctytdU00q3UeS6HnbKby0bPGc6DUk7apJ6EA
	 kOA1E5dnsPpejkY1sexURA1vT2GGaKtHZwXjDSYqCEGGT+m1N5v6CJIhgvDKtKt1mQ
	 hIskctxhLynmpvXLKhwjlRTD1CLFXetAO9BC6vSYd3tyRdLQM9gY3ESSF94qIZwcU6
	 QmMXOvrb79Nl8fcAamVHVobj3pZFgv/UcI4nVD1AfwhYpIpk6RzThVQRD9P2DPe+Y/
	 pwKtAUWZrlYhA==
Date: Tue, 19 Aug 2025 18:46:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: angelogioacchino.delregno@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add
 grinn,genio-700-sbc
Message-ID: <20250819-lash-overbid-dd5d5c365811@spud>
References: <20250819130231.181571-1-mateusz.koza@grinn-global.com>
 <20250819130231.181571-3-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jirkf6aWu6p0wybH"
Content-Disposition: inline
In-Reply-To: <20250819130231.181571-3-mateusz.koza@grinn-global.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_104618_041733_ED739016 
X-CRM114-Status: UNSURE (   6.83  )
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


--jirkf6aWu6p0wybH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jirkf6aWu6p0wybH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS4ZAAKCRB4tDGHoIJi
0mcPAQD9P5ITPsJbve0AaJea1vqiyF4opZjUDdaHv6LL4uGiOwD/YhOB8NAiCzSo
meW2/u8QMm0VL0EhdPfA8ww9sfRNsQo=
=15MS
-----END PGP SIGNATURE-----

--jirkf6aWu6p0wybH--

