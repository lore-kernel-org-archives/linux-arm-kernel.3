Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1D7C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okAOZ1OZXDNLdQS8+y+ojELqtzlRQHXn0iFJZw+WtfE=; b=j0se/naC1vpIVK3/suLIGML/jh
	dDMCDNPRHf0jzH8B1PaJQEF+wt7n7lX1rpYQHrnTR+gSpbBP0v9qB4y/T6fjkpIKcTHttMq+8Z4QK
	HaJD6waoHEOt+ajP/zSKlbK45M5iLBU6n1VtrtmQAKbFbc+Tl65Iq7yIPZjkeEcK3byjEtnxjgCTF
	X4FuEvp/LVXBY9pmIOYEOFZrmDPF7A005IgBQp9gTpNKq75njAsQZ/0jqGawt0Oi2OulpLd774gUq
	BIFIMBCnhl0sgdKFtSUkjyFv2Gu3zgvSkuZRbiUCFSkw99a0uKegfgI3Jq9jvzECsDyQ06i4nw5kg
	SoPv6Qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMGZ-00000002oP5-0Q8M;
	Fri, 08 Aug 2025 12:32:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLqb-00000002khG-1DyJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA96061419;
	Fri,  8 Aug 2025 12:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2C6C4CEED;
	Fri,  8 Aug 2025 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754654720;
	bh=okAOZ1OZXDNLdQS8+y+ojELqtzlRQHXn0iFJZw+WtfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDuVOPbaXqhauqjuwvjo+RegfMk1odWWcnKa7n788sSa3zx7gOQj42MbHCDhQEWAN
	 jFVGaDmwPdn/j4rC+ba6lwWfxDFXmDcCmhb8h9ot0mXosiKajritWRpua//F2VkQKF
	 ZWJJkUfvCn9BMPAvpjnCARu8Qt6VRPhRvC9Qw/lFCxzdqoYKp6/++FvPMubBRfTW+l
	 bXZgTsCmabKpfJAdijwQw7TWztH/FnsmwyW3L3utjbpmmmxVg4QDho5oFuCXvLnvec
	 AOziUS/RylraXtcwOiXD/tDFB8ui8Utm7TrUCQEeTFhhz9p/DHgpdWye7iKAOZHDND
	 W5/t1I488x9bw==
Date: Fri, 8 Aug 2025 13:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: arm64: Check fread return value in
 exec_target
Message-ID: <4f2e8b38-4112-4dc6-82cf-51c33c2daee6@sirena.org.uk>
References: <a72e8741-a63a-487e-838e-daeed3458c0f@sirena.org.uk>
 <20250808080955.41735-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="re9NTMx0eutBKzqo"
Content-Disposition: inline
In-Reply-To: <20250808080955.41735-1-reddybalavignesh9979@gmail.com>
X-Cookie: What an artist dies with me!
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


--re9NTMx0eutBKzqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 01:38:30PM +0530, Bala-Vignesh-Reddy wrote:
> Fix -Wunused-result warning generated when compiled with gcc 13.3.0,
> by checking fread's return value and handling errors, preventing
> potential failures when reading from stdin.
>=20
> Fixes compiler warning:
> warning: ignoring return value of 'fread' declared with attribute
> 'warn_unused_result' [-Wunused-result]

Reviewed-by: Mark Brown <broonie@kernel.org>

--re9NTMx0eutBKzqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiV5/sACgkQJNaLcl1U
h9AOYAf+PIjSO8FWmG6yjgk8l/Ib09wzXRxt8Cw48r9nogN2rqHzMn43s+A2YR5G
YGp6Jd9fGOD+UbVNdmSkQicz4UhlXGh2edRtExagl3kUJe+tOTEDKYwn5Fth/Zi9
MgduTuwK0E00JxFzkSGlnrrsz1GrTzABWyLDxFFGSJW86gtFbA+Q+Y2T9YT2jio1
HI8BoNLcYz8gSy7u6VLxfU450sCLh8Loze74fBSNP533UEMCwRpEknbAeEDpiC9A
8b44RNDXA4o6ZF4J4xoDMLjKOEtrGt2frkfIoj/fFRwhyUr297P2fgBKp0vD8U4B
SIhBCSVsn4w9WmiETpeLiiMLDRpyZw==
=DZio
-----END PGP SIGNATURE-----

--re9NTMx0eutBKzqo--

