Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B271C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7lq+Jdw49wzHYtiACi4TPpAStVCMFKChSjpVwdcLeI=; b=4zDxOwr/+864238PcfQAO4eF9k
	+V8uAXPrK2kFg6CReGMaOcZj0EDzut0zJX0M8dB8DMFWfQwaMhX9PX/b35IVtzEIxlBGxtJWE1rMZ
	1LtwNNo1H2pjetTttsxnaOOQ6CFQHtiw9cTxVX7jTbsUsrQd+t0WoXJMtMjdC1E93mh/dhLlrs2qV
	JHhCOdAXkst5eCZWSlCAvC3g9hYZtp+WWzWngqxudhGgSNh+BY1khSc5j4EThU9yaW7M3iSvHxx+/
	kjLlQzXk9UMtbqA2rEJdZT5P7sqx7QbxBgrvEXSiMjRFrY4dhwtOdd82tcS+txj6i3NBScWDNXhBs
	wpocehog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTj3-0000000ArGb-0uBn;
	Fri, 07 Feb 2025 19:09:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTew-0000000AqH9-12vj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CB8D5C711E;
	Fri,  7 Feb 2025 19:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF2DC4CED1;
	Fri,  7 Feb 2025 19:04:59 +0000 (UTC)
Date: Fri, 7 Feb 2025 19:04:57 +0000
From: Mark Brown <broonie@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix uninitialized variable warning in
 FPMR test
Message-ID: <ba0dddf4-e4e4-482b-95f3-52eb4e31a643@sirena.org.uk>
References: <20250207-arm_fix_selftest-v1-1-0d6eeb04299e@debian.org>
 <89da135a-8c14-478f-9830-0b03ecd0b14d@sirena.org.uk>
 <20250207-small-marmot-of-opposition-e7afd3@leitao>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FDm01rLVQI5sIA6w"
Content-Disposition: inline
In-Reply-To: <20250207-small-marmot-of-opposition-e7afd3@leitao>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_110502_337723_5E8B9C1F 
X-CRM114-Status: GOOD (  14.54  )
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


--FDm01rLVQI5sIA6w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:45:39AM -0800, Breno Leitao wrote:
> On Fri, Feb 07, 2025 at 05:26:06PM +0000, Mark Brown wrote:
> > On Fri, Feb 07, 2025 at 03:06:42AM -0800, Breno Leitao wrote:
> > > Fix compiler warning about potentially uninitialized orig_fpmr variab=
le:

> > > 	testcases/fpmr_siginfo.c: In function =E2=80=98fpmr_present=E2=80=99:
> > > 	testcases/fpmr_siginfo.c:68:25: warning: =E2=80=98orig_fpmr=E2=80=99=
 may be used uninitialized in this function [-Wmaybe-uninitialized]

> > This seems like something that should be reported to the compiler
> > people, we only print the FPMR value if have_fpmr and there's an
> > assignment to orig_fpmr in that case.  Which compiler is this?

> Good point. I am using:
> 	# gcc --version
> 	gcc (GCC) 11.5.0 20240719 (Red Hat 11.5.0-2)

> Clang, on the other hand, isn't upset about it.

Right, and I'm not seeing it here either.  I'm not opposed to applying
the patch if enough people are using toolchains that have the issue, but
these sorts of sledgehammer assignments aren't ideal since they mask
issues.

--FDm01rLVQI5sIA6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemWVgACgkQJNaLcl1U
h9D+tAf/Xm9j1E6SpVemvF2m33NlUWK3E1tEJsTSJrt4XEkozF5hb4Qf+COjmmg8
wKWFw6higqVPG1lUlScw5fbRQ+jzUgAI4PS6zmBDKNmutTF3NZxByVEvVKKMqDca
VtDTu1fgWcCJbo7GTBX63tG6SYrCVf2DwaG8208uq0J+kVXZ3pR8K8JaLuE4JBUD
tf8q6Aa/Plptr/QRRjD9Fx73ARjz26m2J4Lgu/goQuFC/dYJsxh8mZe0/+if2gZm
AlEOUGPZC69sv7ROAow4GyZiglXh2jrLg52MbtM8ZaJ69izZd64MgAOFiru3DGw1
Puhv/NRAb5vIqBU/TQ6/cFd9WGc/Kw==
=uGMp
-----END PGP SIGNATURE-----

--FDm01rLVQI5sIA6w--

