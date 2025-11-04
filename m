Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D68CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmu6OyWnBMfKHX6Zj0i7cFQhUadJ2xlzy+K+HbdcDLs=; b=GvphVKZ07XEFfspkX0fzWxDSPA
	WciP1Oj04ZCCgGPAOkSEuPPQ18BwAWFcklX33a/oVKJtCW31qcxAcPpzLYSxGQrrqaC8F9A4Uz1Xa
	urYB3UmuO5ORMdFr8T4XHJ7e/PWHFV9ZtNlbD9FyLZsTOUv2jQmJY6g1CO9twIaL76tdB/CbXrhsq
	WbSkeMZPbY5IvA20C1+bRcEqre3jn5XkobUiXwkYlGO/mkQY0RX1TkzvprkxwfnKzOLNDZkt20o5B
	FMJ6yhs2eUX80+bfyYEf5uFWrnpspXCcw36aKLhmHtkLjr9WyFqc9APhrRKPaLSBveHRwIH9bYHou
	0pBTFB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKi3-0000000CG7i-1Src;
	Tue, 04 Nov 2025 17:20:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKi0-0000000CG7L-1m9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC23543931;
	Tue,  4 Nov 2025 17:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3005FC4CEF7;
	Tue,  4 Nov 2025 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762276839;
	bh=jmu6OyWnBMfKHX6Zj0i7cFQhUadJ2xlzy+K+HbdcDLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wiyp6CfSiFTBpq0MyIPe5kAEf43OVKzhCk9j1lClY2xTc3246kr3Ek4gwZ3x67gcY
	 pUaFKlViKPZ1Sa6BSvDg9MkcxnFSqOK4NWlAJAX7f1gBwF6gMN9d1GRUe+YzmVMnBe
	 JjyPzbyrEwIWdV8mxoPR77le5GCDewlixY26QlpQYx0sRQLPVTOH1y9OjT9BA13UdK
	 luHRPBLLpl5fZxvs2z/vPhVonz9jVN5LEJkk3J/mww3kAbA+cIGrdmvibcRbeAHZn8
	 K3gTxcvRuRwt00jjq7GdIm2AAoi/yd64MhuKTn7SDM30V2SsM7QryoU0+XlI2r9uil
	 znvBTyN1ZYxwg==
Date: Tue, 4 Nov 2025 17:20:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: ti: add Toradex Aquila AM69
Message-ID: <20251104-spiny-tumbling-87cb4d754be6@spud>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X2GGlsUyBYvruX+g"
Content-Disposition: inline
In-Reply-To: <20251104145240.61219-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_092040_488253_97282D36 
X-CRM114-Status: UNSURE (   9.36  )
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


--X2GGlsUyBYvruX+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 03:52:35PM +0100, Francesco Dolcini wrote:
> From: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
>=20
> Add DT compatible strings for the Toradex Aquila AM69 SoM and its
> supported carrier boards: the Aquila Development Board and the Clover
> carrier board.
>=20
> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am=
69
> Link: https://www.toradex.com/products/carrier-board/aquila-development-b=
oard-kit
> Link: https://www.toradex.com/products/carrier-board/clover
> Signed-off-by: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--X2GGlsUyBYvruX+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo13gAKCRB4tDGHoIJi
0sxkAP4+vHqzJhRKRiGqUGCwTfOBg6kzrwpHR4sIHF8nStqKFAD8Cym+92y4xamh
7UzbMTgSKxHrqRwnyTHjSSTQQTOHtw8=
=oY/v
-----END PGP SIGNATURE-----

--X2GGlsUyBYvruX+g--

