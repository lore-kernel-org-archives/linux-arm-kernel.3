Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1621CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJpNb8Qtpz2hwjHNteWDG0Ok5lFWuSPHXqUIWwJ3X0E=; b=r2pzRN4ybVHN8tHPu1W7Ba9Bkb
	qyHwG/s7AjV679d6Gcf7ncabOdH5JTz99zdOuTGdFzP5X4HDcdyOzl4cujF8tjqV/+cD/B+sm6lac
	XRy/gaYwSrvfTqdxaDdZzOpUcesJ2+RDz4Ulmqmmoe07Aa5iTnW84Fk3lYklXdSXJLmQhfqvdHxiT
	e8X1eGsop2SEXf+NcHX0QlFMmVgG9y7GZ6eoAgMFd/h02F3K4PBryBc+URs8AnmN8aZ7lnKT91b4o
	f78jvNye1FZrtOgQgPSFTtC9AlQDBu0jWZ1JCS8FqaA0LmrpU3W+m9b4jU4nMzL7RGwzJn6Nl78g5
	IVZTquQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIN0F-00000005iak-2fNt;
	Sun, 18 Oct 2026 09:16:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIN0C-00000005iad-1veP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 09:16:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAD4241470;
	Sun, 18 Oct 2026 09:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA9D1F000C4;
	Sun, 18 Oct 2026 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792314981;
	bh=oJpNb8Qtpz2hwjHNteWDG0Ok5lFWuSPHXqUIWwJ3X0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UNcKJzteRecOB++h4s47oRngj6bIEl2xSyUQ3iuYcf24gPYwX0750CiaIZpsAYwkt
	 TGPM+DdiUbT1tHGEOsD9V0P3ynmmmlm9zc3atfWSOTkhVonU+gJXIf54DkXhZ151+G
	 4qJ3jomtTMpWHlXIkoSpysFbGcQwHrNOU7mnmeA6K9DuxdHxazLYqCuiciJ2sA/Dbr
	 4B4dVvzfyKUP3H/UFCUPYXREWO5GJShLQZqdbvuOzsnChGTR/c6H/XHNu3bnqjXvUn
	 S4URbA7FwiNPhr4Fob4+sE3F8tkM5AgKyO0JmwIzC1oUU/V2lm3HdgwqCYl285mhwt
	 LgnLQRQx+IcBg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id E0CF21C270ED; Sun, 18 Oct 2026 10:16:17 +0100 (BST)
Date: Sun, 18 Oct 2026 10:16:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Abdalla Eldoumani <aamsdoumani@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: Re: [PATCH 1/2] kselftest/arm64: Report test failures in
 vec-syscfg's exit status
Message-ID: <atSOYTo_iTfUUnDp@sirena.org.uk>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
 <20261017182455.1884-2-aamsdoumani@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QF5T/0szQhvGCOW0"
Content-Disposition: inline
In-Reply-To: <20261017182455.1884-2-aamsdoumani@gmail.com>
X-Cookie: Whoever dies with the most toys wins.
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


--QF5T/0szQhvGCOW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 12:24:53PM -0600, Abdalla Eldoumani wrote:
> From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
>=20
> vec-syscfg ends with ksft_exit_pass() whatever its tests reported, so it
> exits 0 even when tests fail. The kselftest runner decides whether a
> program passed from its exit status, so failures in vec-syscfg are only
> visible in its TAP output and the run as a whole is reported as passing.
>=20
> Use ksft_finished() so the exit status reflects the results. Unsupported
> vector types are reported as skips, which ksft_finished() treats as
> passing, so systems without SVE or SME are unaffected.

Reviewed-by: Mark Brown <broonie@kernel.org>

--QF5T/0szQhvGCOW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrUjkwACgkQJNaLcl1U
h9AQnwf9FMPtO7q3lZ82Vq3n5m6oUf9l15G+1ObgOfoDBOWQ/dhb+USFEF4jxycS
tX4jwat3sc4po1SOrzSIqK4IOswiDCDFqimecKi0wY+rz+5zHafbGJrbUy7jVPxa
hfmdsrRPUO1oU/OSXHFteZnuT9dbv0IaDh4J6nI6WMrZnoqsi2xP5lv8n3y2Rbd0
JrHWiQHysi4ikantM+xWbEkrqSQ5NXdG49m2GQv/IURg1n7o64t5xmopNneAoskb
Xv9ZFUiusAB0T54f0vnJDnmEOO9SSd77yqU7f/Uxg54nOZeOpqyQe4/hnpgNHyUX
s5Oqi0WtcYpuu8per1Qcm4I6jlB+dQ==
=MKPq
-----END PGP SIGNATURE-----

--QF5T/0szQhvGCOW0--

