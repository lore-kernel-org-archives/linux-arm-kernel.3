Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF66AE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7+SDGELbAyJq1LZCuLfvUnhbJvW59fo46nN0aJT224=; b=MN+9aUuIMkP1Zn2CM7oB+I0nWq
	i0UtfQEEtO/3lQAfVaY5ZencJ+oVu2ephukztjitGY/qaQsnLNx/RKxNcHgZG6PMCnUDTTBSZiEg6
	InLBnmJ3s4EIkBQKOsgxDyXOTECmwgbT8+U9Pqi0QmbeIK3wn+LjekQX7/HRsU4zrSx3hWM9kDvXT
	cNdAHqz4O6kN+P5iUh1v//kPnl38jlpoHyX/qn/EXDJphtXhUFi4lNQSg0ESWdmqsdcGTQ8UNY3SC
	PaLL3cCQ+mY4q20pNXGwjJruOntPw5bAKb8qi+V/do2FICqVFo1Z/8LKwDgdpNuhZjyMgV0Gr/4a+
	pM1BMr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFa6-0000000Gw4P-3Gqm;
	Thu, 05 Dec 2024 17:24:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFRF-0000000GtvE-437B;
	Thu, 05 Dec 2024 17:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D3DC5C6817;
	Thu,  5 Dec 2024 17:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CC9C4CED1;
	Thu,  5 Dec 2024 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733418893;
	bh=g7+SDGELbAyJq1LZCuLfvUnhbJvW59fo46nN0aJT224=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFMM5tRhbGnzovi/e8YXVlVcPDjANcJGVSm62j9E6Gj0vVBliR/ga5hhj1AvCLGyu
	 YQub5g7U3pBlh0xanTfRSsJGLHClq75InhM3MaAjUQGH478lpajGT+8fURg92oHyfL
	 Le/WruIBgMcWmrfOCcJmBOPNhIQq/JEfcRux5c1izPJO1TV0Osklt+Ic0gbvZmxI92
	 JfVZ/OPMyEG6gm4G9jCXAcvoX/+mjS+3IEhgueYUJSOMq0tJ3bCka8a3FNoHJO0ahY
	 dKI6Y3qt9KGWHL29KF8gOzcAZXtjap/anVuDdsA+gqEybkSECbyEj9lh5DN1keYgyZ
	 qxkCjFUo561sw==
Date: Thu, 5 Dec 2024 17:14:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>, Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Tim Lunn <tim@feathertop.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: arm: rockchip: Add rk3576 evb1 board
Message-ID: <20241205-judicial-drainpipe-645f3abe07fd@spud>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
 <20241205103623.878181-6-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="89wR+2nktXHU//fa"
Content-Disposition: inline
In-Reply-To: <20241205103623.878181-6-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091454_058008_2FA2DEC7 
X-CRM114-Status: UNSURE (   8.30  )
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


--89wR+2nktXHU//fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 06:36:22PM +0800, Kever Yang wrote:
> Add device tree documentation for rk3576-evb1-v10.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--89wR+2nktXHU//fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HfiAAKCRB4tDGHoIJi
0shFAP9NJhNby/omP3OSVIPt7iBoPmiCeczc02OwtSuAdnOpTQD/TO4/+CmmangR
TKe77msc4wb+4Bz0oxPAjaXMaHiiZAE=
=Xfhu
-----END PGP SIGNATURE-----

--89wR+2nktXHU//fa--

