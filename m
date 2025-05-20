Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E072C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na7JhdnilcYOMSmY3FiOD82OSlegu9QIZHVGHZNYf+c=; b=aae41J+QHnhU6SxV56cSjy3AB1
	oNLmyQ6XrhjLBlR6ydNsxVuA0qhk3JfXmpAxEr8XZvUZrBDpjfRhfcODr0sdRAh4qgJUlmIFwLb5A
	tlFUq1Pvtc7SxPjpIC53WlYfFQY626+QA9RB7wAiLvNbIZAZAU3VIKw93motWCaq2TKCy7OitjGWU
	2Wwwk8eRufAV1RVOCmv1l3Hj9IODLwjXaVYWwv68VH4JmAD2C+q4AwriCuPUaERi0Rziqu4VSZClr
	C2uYL9ipESwwNiyCi+nOIiNDCLgZrapX0V7VigE8a4dysVtOH/0pDnOSijsq00oQZ+MMgQeP8lrwh
	cWfqUZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPzY-0000000DZ9Q-34IY;
	Tue, 20 May 2025 16:39:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPCU-0000000DP0q-0Y7k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 591B9A4EAC8;
	Tue, 20 May 2025 15:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F137C4CEE9;
	Tue, 20 May 2025 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756097;
	bh=Na7JhdnilcYOMSmY3FiOD82OSlegu9QIZHVGHZNYf+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzJbViYvKnuAovyYZe09dS8NHjgji+yJvJjuR77hWD1aTLvfIMRMqREH51Mgyw/N0
	 uHKKvfu7s81RbqRBRgxYia/WZO/dyro9Q/kkhBvveaZsuZXSKudaGql50akbvQQ0f0
	 jjtgC2yV/mQZSkdR/vToznC/FldLOt2sG6EXLsBQGhV4N6QNCbCeVD4HgWIMpEvB/Q
	 fPrC+/JqRvSVoOLdH7c5EDdDH2N02XOU5K4xpgz+adNfY2HuGXGa9v5bMLIW9DFyA/
	 ZzM4GiiVkqRWR4QTxFyk9/W+a70WuyagPXo3wYdnr+dChOLTJhGrn3CjQVUy2tFdso
	 IoF2Nc9Y1bONg==
Date: Tue, 20 May 2025 16:48:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [net 2/4] dt-bindings: clock: ast2600: Add reset definitions for
 MAC1 and MAC2
Message-ID: <20250520-exile-obvious-b72b7db702d0@spud>
References: <20250520092848.531070-1-jacky_chou@aspeedtech.com>
 <20250520092848.531070-3-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UvQk65mnV/tHD2qu"
Content-Disposition: inline
In-Reply-To: <20250520092848.531070-3-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_084818_235433_E25F83B0 
X-CRM114-Status: UNSURE (   8.91  )
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


--UvQk65mnV/tHD2qu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2025 at 05:28:46PM +0800, Jacky Chou wrote:
> Add ASPEED_RESET_MAC1 and ASPEED_RESET_MAC2 reset definitions to
> the ast2600-clock binding header. These are required for proper
> reset control of the MAC1 and MAC2 ethernet controllers on the
> AST2600 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UvQk65mnV/tHD2qu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCykOwAKCRB4tDGHoIJi
0giFAP9mpUDwyGsaZ4s+JSGA8E4mfSJLTl4kzfMX6Vy3keT5qgD/eKnvov8kgNkW
zNvHBzlyYwGeF2M/jKKSqLaqEjzsCwU=
=TAV4
-----END PGP SIGNATURE-----

--UvQk65mnV/tHD2qu--

