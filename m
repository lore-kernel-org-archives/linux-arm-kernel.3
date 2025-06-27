Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE50C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu6rdjzGYFWzv/HJ3WLJXjU9sii8p6hgsGJ6sN7yeZ8=; b=Hu1jhZwK9SagKXjgUDaHjfrg9c
	6xJ2FTNG9ADJ/RV9v86vHKss0E7Ag1X0uEyhEcqRi/ek8dguNBule9F4zxG6KOutswZ7H7E8H+qFI
	KxuDo9zYbLuuLPcgARidAc+68nTmmF5JPf3pEjSTwv4Fx3/Vk7aqUt8iWaHfYiK10dwA+aTjRle/9
	F0J/b0ve3Ifq4NyTUGbQ0Ir2HUGQOw2xj4zVmsTu9siOP56KMvxiGxmqcp3K8uvCsxgIaGOcrUoqv
	O4M6fNyDggqyGTg0limpXuQp2nL4eHBTcMZZnGdinkKHU5UFkOzjOmVIjG/csR5svB3lv90PFdECW
	RHxskD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV78S-0000000ESa4-25s4;
	Fri, 27 Jun 2025 11:20:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6k7-0000000ENEy-0yI6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A70A261120;
	Fri, 27 Jun 2025 10:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB677C4CEE3;
	Fri, 27 Jun 2025 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751021738;
	bh=w8uGM8V3BeOaxaupPf60FQSG2Cnb6F/+ZSO18HXNtkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fj360n+blrE4iYL1vzNpEIzzok3rcXkLm2AN1scyQgysvlldpZEhZHz9kA9cud+rM
	 AYJulATI+pF8PxE1Xce9WqZiS6v2SnyOrJ60B25q3bSU0iBQg5jfDiVQnRm1QdXZmM
	 X7ibljFytuz/nrxp9j9HodGkOSUks8ovvY1kKYQ7jwBwugNuuzec9nGQkvgqeShwfz
	 qQ0NcGnoeycpOX6wjlauz/8FFfxHk42dRhSua98b8+t4idIktSr9Wge6Twg8NQ0jjX
	 ZpFOxChEOHm29VEUyu0GsfpupQtBL70UERgF8DxIyDCGPDWRPjeDdIt9F46tHoHqsD
	 xxprjRGnLyAog==
Date: Fri, 27 Jun 2025 11:55:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/arm64: Prevent build warnings from
 -Wmaybe-uninitialized
Message-ID: <aF54phWq1IGlaphz@finisterre.sirena.org.uk>
References: <20250625020138.3777454-1-anshuman.khandual@arm.com>
 <dd3dee5a-b030-4658-8cef-c777928368d4@sirena.org.uk>
 <af5cbd48-6312-481d-8e91-7739612493c1@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0uBnPjIGKotRgbPj"
Content-Disposition: inline
In-Reply-To: <af5cbd48-6312-481d-8e91-7739612493c1@arm.com>
X-Cookie: Do not cut switchbacks.
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


--0uBnPjIGKotRgbPj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 04:15:09PM +0530, Anshuman Khandual wrote:
> On 25/06/25 3:54 PM, Mark Brown wrote:

> >> -	int status;
> >> +	int status =3D 0;

> > This will shut the warnings up, but it's a bit of a heavy hammer that
> > means that the warning can never trigger warnings for that variable
> > being unused.  Is it possible to fix this by updating the control flow
> > such that the compiler can tell that the initialisation follows the use?

> The problem might not exist in reality. In the test function test_fork()
> in the file tools/testing/selftests/arm64/gcs/basic-gcs.c there does not
> seem to be a path where WIFEXITED(status) might get called when 'status'
> has not been initialized as there is a preceding waitpid() which would
> ensure 'status' gets set. Similar scenarios are present in fork_test_c()
> and write_fork_read() as well.=20

Yes, it's a fairly common false positive pattern (in this case it'll be
that the compiler can't understand the constraints with pulling things
out of the exit status).

> But the compiler still throws these build warnings. Seems to be false
> positives and this fix just works around that.

Right, the problem is that it works around it with a big hammer that
just shuts the warning up completely meaning that if we do cause issues
in the future then the compiler won't be able to tell us about them.  It
would be better to suppess it by changing the control flow such that the
compiler can follow it.

--0uBnPjIGKotRgbPj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheeKAACgkQJNaLcl1U
h9BoAAf/cLJ4iO8ZRetLgVRyylvU3LbHGcwMSRactvuK8r9ThRrcNDQIDZWvFoVe
+QensBvEaIO8IrQCbE0FpKQrE199O7hwkT3Lv56V2uMNlXCm8B+Usm+iPLdn8nRO
8GgVuezQqAJxkjfUA1LBcmblqVikDLtnIGT863TEqd4Wexnliei+Xd/jL5WJJis6
s1qr7wo83A2RIuMPNPzdEJMiwhkSNRQbenLCXeXiNt754TyQBTnw8BhGf4Uyy6E0
0sNtuHLmxtxiFqSXJQPDotg04tyrJinM6GlHDjHmRlyDopBKRSaQTZwQHclas/oK
0klJ3MGVJSlx89Bj/Wyfucqhm6ZEsQ==
=/LTI
-----END PGP SIGNATURE-----

--0uBnPjIGKotRgbPj--

