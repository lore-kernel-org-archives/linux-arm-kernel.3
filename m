Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618F3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zP7bMLfk/y3kcdTgl7DbKryqJaH2lXO8Bn7/SsVoFtY=; b=ULoGB3KXZLcX2FvUL1mzstwEoy
	I3A3d9NmkIsE/M+8x+qLOFSihvQRc27HyakElUYWWW8lPysJdF5hn1DGP3Y/aPI0qcQeTwJvoTSmP
	OG6RTx48kcawrGNVbDZ3RuT7aq/gqhhquwoAPLIl6V7P2POTficZS/T2dp6MS0BuGqonrfPKqIjfn
	OI8CjKD4IarB3IljhWw0sQcv0btmgsVnycm2q/1z4BstfuAv5hPSGhKJisuatxBNtNsj9Ld2gnSud
	3JVlEdcWcJwPUBKE1c8VgOG7hzqxqjqTmLvVg1s19eXwGiJGztOkJqBmrWB/XjQ570sl0uNStqj2F
	ExyB36Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6fh-00000000zou-2ymb;
	Tue, 06 Oct 2026 15:01:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6fZ-00000000zod-3BuZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEF096022C;
	Tue,  6 Oct 2026 15:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BF11F0089B;
	Tue,  6 Oct 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791298888;
	bh=zP7bMLfk/y3kcdTgl7DbKryqJaH2lXO8Bn7/SsVoFtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9P9NTJ2DITgGi7O1t/cEg7rvO7Nk5MQywPHqp0ukCx9CMbFC4b+tv4jWlIGjt8LC
	 WcCShLyQuWtxeSKpFvWzij97IKE78K2jiev2wgaLPGTAsVDyMS9OKvbStox0G4Gny/
	 sZGlD71l92zxyuGpUtzmosHzXjU6aDNx4C1XOaG7U1x6uuIiwNWtO57jW4flC0MR5z
	 +uEFxL8BOSz8+PP0mK/mzyK1Ec/q6aArxcH6+pGvKxTorSdlGTYB4uOO2JKkpwr6uL
	 SHeDJ5BvLDDw8Va8i2Yd9TEgUzf76cfb/8UAEBoFAJF2zHkuRv552SehMAXqrWUj4M
	 aF2Bk9ax77DDQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 383CE172A99A; Tue, 06 Oct 2026 16:01:24 +0100 (BST)
Date: Tue, 6 Oct 2026 17:01:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the
 locking test
Message-ID: <asUNRLuW4-zshydk@sirena.org.uk>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
 <asUIxt-XzxfWBW4N@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WTcFK7zLwtuPcd2Y"
Content-Disposition: inline
In-Reply-To: <asUIxt-XzxfWBW4N@arm.com>
X-Cookie: Use the Force, Luke.
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


--WTcFK7zLwtuPcd2Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 03:42:14PM +0100, Catalin Marinas wrote:
> On Thu, Sep 10, 2026 at 08:00:41PM +0100, Mark Brown wrote:
> > The API has been updated to return the more permissive -EPERM rather
> 					      ^^^^^^^^^^
> "descriptive" like in the first patch?

Yes.

--WTcFK7zLwtuPcd2Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrFDTsACgkQJNaLcl1U
h9D2Vgf9F8JtWBoktO7Uhu1XHssouxkmCvbDMt0+2dsV3P0CsnBTKlfKfVA0Av7p
ZTyEwDnIUm8YL4u3swJabYZO6zhbVnfMOJ9gFeA2k6eQ0xJOnHccyyMJsvCt7MN7
t87pPnXvEKoOom8Q02JpzfVTyO6RkSK14YuR/chrioW9KeYHq21/bjguDcF/K02/
uCLLqFLO41qlbteL3InrkjmfEAJqgFprIfaRCvu+SyOJWtsWJra70hoptjONgNaB
32iq21C2SARArB+m3d242txTFkGcQOIINt3N3iJvA99k+SMA2l+1LJoTou2Tpde0
XVBoE2PFpojw508zy5lNYW1a/YEDzw==
=JIsD
-----END PGP SIGNATURE-----

--WTcFK7zLwtuPcd2Y--

