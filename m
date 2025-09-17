Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EFCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgDwTFTcAIYXCbk2aWAR0KmQVMiewKIO3OkY42d+t0c=; b=UOek+pizd0gKM/tvyaR9bsRxjI
	wABxt069fgl49AXaOuhX0Gz205xlitsc1IbqYihdzOqNI4h70ld4UcS2+AZ3nXEsjNLyObbhrAoSE
	XyE9aWe6cP4cYjzAKiOqC0gGc4/fPPU/MnXmw06426gfOs01VzL25VzjMfkSRWE4MQPigLvGaOJBo
	0cFiH9bbGqY7XXG492hhQA3t58pS+00dIFWpMLuwqg00y4w/I/A0OByfw4d31c2fAwpHO6ADX3Jrl
	M2TWRhthRCUr+SfNvidqst3N/5im5mYwwbdOCWgofPBN3CIh71zIzkLcykje1eTroflrIzrn2Jwv7
	KwT7HVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqjM-0000000BC5z-1dcC;
	Wed, 17 Sep 2025 11:53:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqjJ-0000000BC5T-2iz8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 11:53:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55BA943245;
	Wed, 17 Sep 2025 11:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608FCC4CEF0;
	Wed, 17 Sep 2025 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758110025;
	bh=KgDwTFTcAIYXCbk2aWAR0KmQVMiewKIO3OkY42d+t0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJTBlI3/BU5wm3NkHaq8qLP6iyFGjYJSq9l4RO7B61RwFZ9bZ3U2rPGWbr8Esk2gx
	 UPtk6omSt0dmFHftiNR4ahoD9IhVaXI/gZmDbo0kjGyD0I2/lOjGlZ88kLHc8toJZL
	 bu0fJm4P44QXEvA5gWxa/I3hwy1oGSGDA38jmO+Meo/oLZ8DjGi/0itbOYa+ZUDkJi
	 +x9cu03Wt6GwC5OjWOII69V7KCW/qUPn2+zpd2j9veN90OFxk7cWaq3V+yKFpowqHH
	 AWO2ZA0GV22vh20NwTEkl7Bt2drYm03fuaTBbW6iMNRyybTqUYKle73tcMtIpjFLYd
	 UobXjV9LaTnUQ==
Date: Wed, 17 Sep 2025 12:53:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] kselftest/arm64/gcs/basic-gcs: Respect parent directory
 CFLAGS
Message-ID: <28ff3ed7-9380-4baf-aee4-ce1ffbd2a40a@sirena.org.uk>
References: <20250916-arm64-gcs-nolibc-v1-1-ee54aa65fc26@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ISLF/TkZCujUpmvw"
Content-Disposition: inline
In-Reply-To: <20250916-arm64-gcs-nolibc-v1-1-ee54aa65fc26@weissschuh.net>
X-Cookie: Lake Erie died for your sins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_045345_708736_3A660058 
X-CRM114-Status: GOOD (  10.74  )
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


--ISLF/TkZCujUpmvw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 06:51:35PM +0200, Thomas Wei=DFschuh wrote:

> Restructure the rule for basic-gcs to respect the $(CFLAGS).
> Also drop those options which are already provided by $(CFLAGS).

I think I was concerned about CFLAGS having things in it that weren't
appropriate for nolibc since the build setup is kind of fiddly, but I'm
not sure how real a concern that is:

Reviewed-by: Mark Brown <broonie@kernel.org>

--ISLF/TkZCujUpmvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKoUQACgkQJNaLcl1U
h9CQgwf/bLFOwIs2jkw3RDKB9zUPQtfr4oUjZO9/Uw3NYf+Fj5E3Dax5YHsFGp10
SMs0hl0qxzSdoqxQFxXrBTA5Snou6ROQcrA6I7BF3h8USWOsEwftWPXfDiPwjZN6
RMsSUObazIbzgmAs1WpS2PqL4jG4mbb/1L+x6+XSDnDASJs1e0iYaM/lAs/pYMvv
8+UUyDivkV9H/9cWd/bZiuxScG1YTOzQk9BoKqIU/OyncPlfUyjfumvJs9kDsytg
LqTH+tbD3FIZDUbBbByV2mzqeQGqcA0Xb9l1W+d83LvzccdvBSIMe5/tvghUCp8O
ZQ9qT8t0jyNW9OL4yVyj26xowXK81w==
=y+g6
-----END PGP SIGNATURE-----

--ISLF/TkZCujUpmvw--

