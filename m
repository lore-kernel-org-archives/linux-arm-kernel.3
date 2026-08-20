Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C07C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9+n6yZ9yz0WzKubwizayKc87+tB4M0rtZcS+dSKvDk=; b=sKo6JqHVj7gkBX8V4i5fybR+iZ
	oiPf1+YuLvZGzIiX+3PEuV5DaoeTtgeUPJ3HrByyGee7qf7qIfiZR1C3ogoIhm4C3YaPPD0CUFhe4
	iOBBrESdigUnkQ+akTzRZB34ogtPGZ7xCVWQc0ZAx3I8Eq/+9KNOIzXc6q+8cC6EKennRA9crtOTv
	D07/2JAqJbFxZWdIpiMdTLjASreju0SBwikhKoNMNOhJS4oZpX5HaQW+iw+P4fK+WbjQeJd4Ixmsm
	Ef2XM0MRO1+KzjvGLZDX7idH520ac15u98xrEIaiPOEhwOYt97NXlziyi63xUhqrmMxPl4iHeEWrh
	Ag0hALIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4qi-0000000BpPx-1I2A;
	Thu, 20 Aug 2026 15:38:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4qg-0000000BpPR-1Gxf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:38:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 535C060A5D;
	Thu, 20 Aug 2026 15:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718721F000E9;
	Thu, 20 Aug 2026 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787240313;
	bh=V9+n6yZ9yz0WzKubwizayKc87+tB4M0rtZcS+dSKvDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSZb22ewuYnt6n/5ebQy0fRjxHwe+rIGyPv9K0kDUxUF/JtoJiwf8pRcEV+Dt2Jj6
	 KAqa77aTLeQBSYdZ5FI0BY/pYKfeGecdOhbJ0Ss/DdcQ7fczVsFJQqoSPpT0ekoaa5
	 09eMB9ce0G/s1r5J2Xg2E3UNPvPgkt7MEss23qWCUB7m4v0HtT4X6Zg46/F/oOEo16
	 9PGVD/arRIdyu9IByaU7hV3ys4bcLn6g8ErrFXF2a+8epUPc3XiOdGiPRD/cDXdaUQ
	 +DVL1YfcHQWRJ6rLVBzHp/PdtwMrQ9OKSEaUqXLiJo5du4uPiDSI3ym0wMVD+aG9Tu
	 aF6Ujid77tW5w==
Date: Thu, 20 Aug 2026 16:38:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8094Vs83lBy8oqp0"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-5-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.
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


--8094Vs83lBy8oqp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by the MTE tests.

>  tools/testing/selftests/arm64/mte/config | 8 ++++++++

Is tooling going to pick this up or should this be at the arm64/ level?

--8094Vs83lBy8oqp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHH3MACgkQJNaLcl1U
h9A3ygf/fD/s3KwqoBJbnYpD4DV1b5+f0x52mtrtfy9QiCxQ1Tlo88eCciZJ6+Lb
m/RBF8aH8ZahA7xj713OT9ZQAUuZbYaOTatyDFfTm91LGsRACFxy2jjDM5H7vVum
HnzrmUMiudXte4z72/dSAT36uIV92pKUo0gndNnJd/3FEYa66oF+zerLrPMkaty9
I90leHzz0APaEqWbpq1jYyazcXx4UkKWZ8j0kySS35dXLTB18C33AFVIT9H6sz5V
b4ZzTa5JC7+r5whe3aQxYY6HQijv+kZtKnxziiFFd3luzjNITn8YTHzjdkBPGJAR
QZsmcg5eY8J9A30YgJxjmCipU+BQsw==
=NBXB
-----END PGP SIGNATURE-----

--8094Vs83lBy8oqp0--

