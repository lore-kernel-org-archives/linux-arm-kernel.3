Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BEDFEC0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0A2EBPOCbbbBE+krLjw8biQKVDzGTXdjm43j+QGjoE=; b=ZGueZGScUmyFvulNV+Hg8GIUxI
	9HD2++6PokwFaFIK2SlR7Ti7lxHLSstC8DQQnvBxkMmy8dSGerZievIuk9NaQp3sQ5L70nSAIvovK
	R9Fw7FdyjH39t+A7ddnprujmg0qZHD0v6ke83x2co1MYC7DE63AvW6Hmv76RdPy02Af2ynhSgqXWH
	Ah3Kw7nSdfLLEO3X7SyA6gU+FiMES+QZeJucnrF9w+XWZyHX4ntCCsHyVrDHkTrEdyHofrySkGA3F
	I0l3IwvoIkSkx44an35UwmtF1CDH463BMJ9gTNViUqVXniynRilt8HTm9ULCF3XuF1vTSFC6REVIM
	/iZkmbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55n6-0000000213U-2Hm7;
	Tue, 24 Mar 2026 17:43:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55n3-0000000212g-2NdE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE1AB416C1;
	Tue, 24 Mar 2026 17:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738FFC19424;
	Tue, 24 Mar 2026 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774374220;
	bh=x0A2EBPOCbbbBE+krLjw8biQKVDzGTXdjm43j+QGjoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPGsrbpOBQ7mYpAAe2gj2rcJMV9g+o/YGciUJbP3EpOEQTRFiY0TcbegVgFi2Q/iN
	 oy5eZ671x4gFd5bJA/qQhMdBEZLM7tmnWLEgjpjVf4UrHMCxLNrEMWa7vIXXPF5VTe
	 egkzxRLOLpxnpdGLwwCzbAwbUjtozmE6VF9vwGEsn5rwlSay7OuqccAEuB8+vWlyX7
	 yCWOHFIOiHK6QI5L75fSL0PA/Oi1lMGxuzdKTWGnw4J8mBPR/CAli7h5DnosGADiYb
	 iuMaUDU1H2KndHwFxVMLlNbwy31jJbW3Gm5o/jb2vGR0yIR/kHhZzf+/y6OdHOnvjq
	 +6NLylCrjry6Q==
Date: Tue, 24 Mar 2026 17:43:35 +0000
From: Conor Dooley <conor@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next 2/2] dt-bindings: remove unimplemented AXI
 snps,kbbe snps,mb and snps,rb
Message-ID: <20260324-lustiness-contest-8b576dbb24c3@spud>
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
 <E1w4ydt-0000000Dlph-3WvI@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rQa+yvbosfZFTy1W"
Content-Disposition: inline
In-Reply-To: <E1w4ydt-0000000Dlph-3WvI@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_104341_625056_7FD269D0 
X-CRM114-Status: GOOD (  10.65  )
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


--rQa+yvbosfZFTy1W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 10:05:45AM +0000, Russell King (Oracle) wrote:
> Remove the AXI snps,kbbe snps,mb and snps,rb properties as they have
> not been used, and although the driver parses these, the code hasn't
> ever used the parsed result. This parsing has now been removed.
>=20
> These were introduced by commit afea03656add ("stmmac: rework DMA bus
> setting and introduce new platform AXI structure").
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--rQa+yvbosfZFTy1W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacLNQQAKCRB4tDGHoIJi
0kc0AQD8Fdqu9e8zpFe52VG7zrmCtL+z47MkS5ZSvp1U2lhQmwEAgx0GK1qbgkQW
5E9TdD4nGRoAcgomDUF8g8DK8XIrnwk=
=486U
-----END PGP SIGNATURE-----

--rQa+yvbosfZFTy1W--

