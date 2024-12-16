Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8DFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JsiBQZM3JoW4LS4kKv+6GCIOBTm+9qFs1+V83GVDEk=; b=nlW3FN0yxhX4VFjVSC9Di4n6xB
	Z13Vptj28zNofml4g6y0tsIamkaQqvyj1612rQ1B98bFqSfDM+lma0D5pKjGI83hQwgSkSQxgOZkJ
	Wbd6cHi5ESw+RRsWudIL7LVUhErZ6C8ljjpjZQyKB2JWo2akuBkwa5OPGfRJ4+EmWbGt0k5SZaUie
	Tn0Bwhxw5hR5PRxmaK404i9gnmdw2rbPYoljxjZB3BSXem7jpAgIsesMocFuvy23Lf37Km7+Y1lpq
	PdjHtThWikJht6wo5y0gmtM33+Ic4JK8Efc5sqoiABsDUJqfX4oh1YlvUoYLXKoDnjey4/VIPxWrM
	zxVGhp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCrZ-0000000ANeG-0EjN;
	Mon, 16 Dec 2024 15:18:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCqT-0000000ANUC-2q4T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E96715C5857;
	Mon, 16 Dec 2024 15:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B25C4CED0;
	Mon, 16 Dec 2024 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734362236;
	bh=4JsiBQZM3JoW4LS4kKv+6GCIOBTm+9qFs1+V83GVDEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jphz7nSY5kfiVqUjBmYHcaoAzxwdYOujihN6UScSdXLVrgI59Y7bsWV0L5Upcvilh
	 MsPaFdOpvbYo2smFOaz/7pD5/zhEkBO/5ieC2gFbfBMZwrPgfQta5IwgCqHVjOMj+/
	 aYCcD3y1koznHBsz/GIcmuRw3ytkCPXP3eJJIz9UPBstnMwZ6xH+AyXI1tn2Cdq39x
	 hD7osbhdWcLvlZZPGljyHQq/0u6Dxvypl6sq5EIX+AC/yf04XgXr3tAXO3c/BW93XS
	 pnFmEyTBLjXUS174NNdZ9RdHllu88nyOzSHWB5wHmDq1JRRhgKzvHQIxbFzy+ZUp1p
	 mmIJpgeOXr63g==
Date: Mon, 16 Dec 2024 15:17:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 07/46] arm64/sysreg: Add register fields for
 HFGITR2_EL2
Message-ID: <a953ea06-af70-4fe4-a4c4-0a4e87aa88cd@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-8-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5iAGL54R8A4spMz"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-8-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_071717_754686_DBF3B57F 
X-CRM114-Status: UNSURE (   7.70  )
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


--y5iAGL54R8A4spMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:32AM +0530, Anshuman Khandual wrote:
> This adds register fields for HFGITR2_EL2 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--y5iAGL54R8A4spMz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgRHcACgkQJNaLcl1U
h9DJPgf+MpiiCWY7iBGxX6+TU5DxbG+SW++WJE8bgS2sL0s5nfRQYCbN1wVrq+ma
7e3cNEmGuQBHiIz6tPCTxZCdM0ahpk1MSUq6ga9LYYaKJDIv3Ued1xriHv4i6w89
Kdt8AmurobdHLQc2jwGkICNYe6NzUs1XKDsBRZA0GPjHuqsYrou986XTuxSMEwk6
i7fwKgDcRrZd1LL8Y3s5vsMqMO+yLX7dYKKhhPxTqiV7xyhKNlC08A99npkIMk4u
5LgY0fhlwqAVaEG8Fa+pi2Izf9X24/wPyz6nd/Ns3L0iJf1t3unwJjyBi5NKR3+9
ouUPgTnRgYX1JM25IX4wgmMEYiEW8Q==
=nx3K
-----END PGP SIGNATURE-----

--y5iAGL54R8A4spMz--

