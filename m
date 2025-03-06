Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16799C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 05:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQKtHFDdhQ3Yo3y25Nq5gKNB0XaDYanapvwpAjYjGCE=; b=e69ZbHbDVOZ+n94M0hKm/YUG38
	4UeQC6xPGC1i0bZgR/6qpXzNV1SWMBk/2Sh8o+Tebbld4OM0shKBAInTh3em0WH2VoutPxZ5IcfGY
	rI988ShQx+fYUVXTGKZ1B6r6vdLvcKnu91mo0lCYjVmmJd4+oavRSJGoYQr/FvDGkVIwVFPQ2jMZV
	e8FtidHry9if8tPNFoERhvUm5HYYmjxlPny/9Lzihpb2Gf28XwEMLneDqftuxCsnttuaGL4SumxDl
	QiCnDK9iM+QzyRKBkS0T3JalbDGlTSBD07lf8/kFmH8lA0LZ9BC4ytkaQoQfrHG6ZNxfF/Fgdk6wW
	AJTE21cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4A1-0000000A4nn-0XcA;
	Thu, 06 Mar 2025 05:52:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq48O-0000000A4eu-3RKo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 05:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B42B5C5434;
	Thu,  6 Mar 2025 05:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF60DC4CEE4;
	Thu,  6 Mar 2025 05:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741240263;
	bh=mQKtHFDdhQ3Yo3y25Nq5gKNB0XaDYanapvwpAjYjGCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHM+s7revVxn/DFM1r0AOx7CFBYgPk0FX7CpopgiuFK1PjeWsb/OgQs1SNOcohqJj
	 W/8Os9yMuKOr5Odk+IuGfk5ZArAT1YQFAk/3OCMrjLL8PIVRKOjaLGqOAsXLmLdYHT
	 flmbzTJl3fcp89t82nZlntfWO3CU91C1eTxNEcE4YEvcmtWCbNaMGR1JGMS8vkYbFM
	 0RTXLHFt/ig6mffCXqytD4Fj19Q+VE+TPSYn+aa0MEJTtskE9vOvmT3jIfKfaRS5wQ
	 wNnYY8uSzebFA+2WO6zqcvkgILegPgPgnNi3pZXQnMjTe+XIwzcqrihgDH4SRmCsIq
	 2o8jXNE6d3hiQ==
Date: Thu, 6 Mar 2025 14:51:00 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v7 2/2] counter: microchip-tcb-capture: Add capture
 extensions for registers RA/RB
Message-ID: <Z8k3xLaR2c1IR9uu@ishi>
References: <20250304155156.374150-1-csokas.bence@prolan.hu>
 <20250304155156.374150-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9nsbFTYlHPaQ7KFg"
Content-Disposition: inline
In-Reply-To: <20250304155156.374150-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_215104_901168_B7D300B8 
X-CRM114-Status: UNSURE (   8.49  )
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


--9nsbFTYlHPaQ7KFg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 04:51:52PM +0100, Bence Cs=F3k=E1s wrote:
> TCB hardware is capable of capturing the timer value to registers RA and
> RB. Add these registers as capture extensions.
>=20
> Signed-off-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>

I'm putting my Acked-by line here to be a remainder for myself in the
next revision that this patch is fine and I already reviewed it.

Acked-by: William Breathitt Gray <wbg@kernel.org>

--9nsbFTYlHPaQ7KFg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8k3xAAKCRC1SFbKvhIj
K1vkAP9uzi11I3Aa+bUH23E5MRlm7xr1Gf+8eHmAyANXwrZqHAD+IYkv2pqOFQuq
eMxDEEY7ZcqlYTgk8j7gNoFb72d+oAI=
=7c47
-----END PGP SIGNATURE-----

--9nsbFTYlHPaQ7KFg--

