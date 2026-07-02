Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnP9BAFcBr8YepGSjigXPELQUSougD4kTqP9JAMV/ug=; b=fMF7MtWEkpiKvJsz4v+GzE1dRP
	QQD5TK/GOC0lgqbs6joobIMyCDJZCFy+qiaFiBil237PzIdLkeAR+XO579NLUlrWmeeC2OaPXRGT4
	OOpI3eiLbFI6nZIFEAT8J7egyclS3/kzEXqVFwqM5MQuIeZ4Wjqq0yjZ1ajcRXoH8vbDLOiJRFgf3
	PgwxUMgBg2OA5b6/H7OeJljuVJ4FF3EUETJaadOL7Z6EChwOzfAlHO0h2yir3BUPhLVCYPHQhwcTc
	bkLhIYVuBfgUyXKfgiJnB0wLVUiugybgQe7eDqlLdjzJNXp2bjxHL3pQtivCEmqHwZP+lryNVOVbN
	A6lUrn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJV0-00000004q4A-44qe;
	Thu, 02 Jul 2026 15:38:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJUz-00000004q42-0TCi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:38:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9B6E403F3;
	Thu,  2 Jul 2026 15:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7391F000E9;
	Thu,  2 Jul 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006724;
	bh=gnP9BAFcBr8YepGSjigXPELQUSougD4kTqP9JAMV/ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kHlhXQYH0GjrVMC1tAgUsYs9fyR1QjM2zIIXfYqfpLr3ai15VbK4NWNzds7hq6U4I
	 WHkDLushfZAiOiRZwMjwMr3Mku+oFHAlG45XMUxOl0UO8jjXpuX5lv169Todzj1e9h
	 Df9zHgrdLPUKcIArJ8egVDAVC15BDrfgmlMZKhngo2Knjpe4sGKIC+kXn6nHgc8Qh1
	 +sWq85EZRWtt8bxDfRvHAy1zyt1hVqbvk7/1PgxijvvUwFhuWJvS2jOaqOZ76v/Agc
	 voORsSPR+7dCIgFkWGjrXkDtmmJohvh12bSK5hIhhOuum+BIjO7gqvIDKh3S97bxmL
	 UBRCMlO/11XUw==
Date: Thu, 2 Jul 2026 16:38:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: Sort registers in cpu-feature-registers.rst
Message-ID: <af54a933-f6c3-4786-a9a2-de679fa8d2be@sirena.org.uk>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
 <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
 <akaCJvZkdqigcQUZ@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P9JGLlGwTUGfsf3d"
Content-Disposition: inline
In-Reply-To: <akaCJvZkdqigcQUZ@arm.com>
X-Cookie: Reactor error - core dumped!
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


--P9JGLlGwTUGfsf3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 04:22:14PM +0100, Catalin Marinas wrote:

> The patch is fine but I just realised that we are really inconsistent
> with the non-visible things. We exposed a few hear, I guess in the early
> days, and then we stopped, just adding the occasional visible fields.

> Shall we drop the 'visible' column altogether and only document the
> visible fields here?

Yeah, I was struggling to understand the logic and would certainly
prefer to not have to type in every single bitfield in yet another
location.  I'll add a patch on top that does as you suggest, see if
anyone objects.

--P9JGLlGwTUGfsf3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGhf8ACgkQJNaLcl1U
h9C8SAf9E5KA5iSqdivlp96tse489VUFmODlF8XFNkfYBRH8kzOUXLteEaC6JLzm
wFF3CFAPVDwg1PSbY4wkgDoEdadpOou0L842z2zDjys1twMfeXK5gWY+wvNm4iQK
kiNW1OSaV4D4GirwPome2nswvkeTIfyxcYXcmzhAU2nPtFgzAndHycLm8AUs6daL
W2WsdJiwCFrvoNWKiLl/RjNDoSUM8ycGy882zcGJYnid1TIAhx0jXyQpABQMlNKy
MtSKq/c3TRPbUGmCl0Ut3cgiUa7XQ+actK18NJH9RfwowhOTHbhg+hbXUS+AoWG6
rz3p4wMc3FqUWGiDFUV49Bu/QVeuCg==
=GLCj
-----END PGP SIGNATURE-----

--P9JGLlGwTUGfsf3d--

