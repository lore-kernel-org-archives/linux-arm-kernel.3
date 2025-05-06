Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D1DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ypU94/spMRuuaW8oUslWrYwTwesWHuCxWvGpHpQRE4=; b=eko9oEybKSOhtrORTwvTM2anJO
	/gh4Xm7FZlZyMEoRvSXtIEBw3WNGNvo5+z+hw1X0HnrjG4+GhmR23X7+AeHXVuEVoHtlZxnsgPy5B
	IeQ2NsoxIKqcV7saRyH9yYKtkV+2yjVPP8dl+jCqewziO8HYIn2TqSyaHxYiZrbIB3vjZBt5kBx//
	GdWcmuqo+gc1gQLibWJUExGa5l3LofTbt78RtxOouZeeBzvfjiGT/zONj76YjsQjgsI9A6JCATMsZ
	YHMKgxJ0B/8Nm5HkRD5oEivbxpTJGa6IhI+UT6STswl6sF1mSd9p1at20WGF1zoQlwLLjdwCsBH/G
	wBe1Fxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCObE-0000000DKVw-1yTD;
	Tue, 06 May 2025 20:09:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKwK-0000000Cdfq-2G6x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93BE75C5895;
	Tue,  6 May 2025 16:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A75C4CEE4;
	Tue,  6 May 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548079;
	bh=1ypU94/spMRuuaW8oUslWrYwTwesWHuCxWvGpHpQRE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVusvau3SFraqt+t3mhXCGUNHZNXuR8YT1Blj/uHtNCgOPPzKoJVfXJc6RMj2k1Uj
	 LGLZRcoOlXxUdx5HBUKSOL8hr/QRS6D0CKJPEIlUIbCW+u6gygJlUSn2HOzQkponZT
	 crySLupoTkG2s2SJnC+mnn39i/3EvwQN2otljBn6qbyXoOus9GpQsPyWlzkdNDEOpM
	 yi5rdgHSiEnAYM49pNKpGWJvWSCZgLqbjpuOqNvjTe7UM8mb1id22qqH04p2wOnMVV
	 9jsdq+djbJk0uQA7WLtZWJv2+wlILDuuc0KrZB3QLzDSd2Uo3Ge0jbxha48DlsMnVh
	 ZJ2aT39tzrggw==
Date: Tue, 6 May 2025 17:14:35 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
Message-ID: <20250506-pavilion-untitled-4fe58ac3ea8d@spud>
References: <20250505161933.1432791-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CYQGms6AKNaAAgzh"
Content-Disposition: inline
In-Reply-To: <20250505161933.1432791-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_091440_628920_B4F3A454 
X-CRM114-Status: UNSURE (   9.32  )
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


--CYQGms6AKNaAAgzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 11:19:32AM -0500, Rob Herring (Arm) wrote:
> The binding is already covered by st,stm32-rcc.yaml.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CYQGms6AKNaAAgzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo1agAKCRB4tDGHoIJi
0jxWAP9pzilu/jY6IaMdihNS0DPg0F+ztLgSX7uvqQmKhjOleAD+NeE9OmJMCM0r
+rVYYYXrjSJM8i8/MtW3R9duxH03fww=
=JA1k
-----END PGP SIGNATURE-----

--CYQGms6AKNaAAgzh--

