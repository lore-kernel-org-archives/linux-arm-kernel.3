Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93DEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKajWv6iXD2DJpbp036dw7aZbKM62MvOz8OdjwDW124=; b=kgE0pBZpT6pudfNq8NcuR/6WaO
	fWJIqEqH5oBtUTdKDYqatckDduH3Qv7TwTAp8AOMpwBdTF1m2CC9Cmkn8ywmBZCBGXquC3KUMdk0b
	Szcr5riu02yqY5l0pXHpSSv7l7UxuSNqCBrJ5ryYAh20yQRsIoEdKaPSDbQDSCCkKZ1XE4aWkuvHv
	yygZMkZcTMkMFnPTLo925fQp+aTtxJp4iDeAHIYKM/+j6z5nVNnEGPBtNUk2dMwlRLIAHAUVaAGMt
	weCJ/BSEEp6GJvyzgbe5rP5yCur7vOz1GM42SLOaXgspGFAnLKHn6sdfm+3rdOMswVWJA4TyY1/eN
	7idh/ndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXGM-00000004ly1-0yeI;
	Wed, 23 Jul 2025 11:03:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXDp-00000004ljI-3WHV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A282A4DC96;
	Wed, 23 Jul 2025 11:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C9C4CEE7;
	Wed, 23 Jul 2025 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753268475;
	bh=KKajWv6iXD2DJpbp036dw7aZbKM62MvOz8OdjwDW124=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7WqLMq1gn6eEdTj3TMTutLL3KlZCoLBMjOI/EgQYTXCGlZq28Z4K6pLpJU2Qz1YY
	 Gh0CgCymRDVvjRrezkt4AdoMTM3tdUCA7mtRcTVJsD0K/6An6QRzxiNGC85SKmg4Q6
	 QghHba9i5AD6EbfhZVnJK/dVInLRJ/PNY/rPXXntKEc5YJEvfIUP2hIp+4wEiQH5cj
	 5+BwuYPkmNtrIP9lXHDg/VkMqDeR65oWkfjNalenSPudGEeELE4pSE01RdvrNQ2/qu
	 kYbjM6aFejmagJMp51vOcP8IBlusSTFRVCp3T0+2zoT/h7oxXpuzJvvV+h6k6LMxJh
	 BO2miA8JpLqvA==
Date: Wed, 23 Jul 2025 12:01:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org,
	oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <6e4cf749-d146-4f41-afec-6c07b025be93@sirena.org.uk>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-5-jeremy.linton@arm.com>
 <aICwaQZxK5Spjj8G@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pfS6fkSTDr7lad3R"
Content-Disposition: inline
In-Reply-To: <aICwaQZxK5Spjj8G@arm.com>
X-Cookie: List was current at time of printing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_040117_948724_BF1D528B 
X-CRM114-Status: GOOD (  18.58  )
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


--pfS6fkSTDr7lad3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 23, 2025 at 10:50:33AM +0100, Catalin Marinas wrote:
> On Fri, Jul 18, 2025 at 11:37:36PM -0500, Jeremy Linton wrote:
> > +/*
> > + * Unlike put_user_gcs() above, the use of copy_from_user() may provide
> > + * an opening for non GCS pages to be used to source data. Therefore this
> > + * should only be used in contexts where that is acceptable.
> > + */

> Even in user space, the GCS pages can be read with normal loads, so
> already usable as a data source if one wants to (not that it's of much
> use). So not sure the comment here is needed.

The comment should probably be clarified to mention that the specific
issue is the lack of an operation that does a load with GCS permission
check to match what we have for stores, it'd be a bit of a landmine to
have the operation available without anything that flags that it didn't
validate the permissions (even assuming people read the comments in the
header...).

--pfS6fkSTDr7lad3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiAwPIACgkQJNaLcl1U
h9C1HQf/SesyTkkHOj8BBOtDMpXqeILfxSDN+1YY9sPtQnVWuBzz/BNXvVGV8hKN
WowF+nRWnOeP6E9pP9l3iApYCIMK5dYebcLOVVipocUI0q25/gy+HRLs6cyLKT07
NYwlIXJyw09hqYru40+rmqtvXn1vAYiulM+H76WUOjTfhrqUHceh4ZjYx0pVzcHe
2SDiw7M3K6m8VlWHuhIMx30P+82hAet2hhdxPXC1ry8tFx2Zm00KGl1Nl1KJ3ps8
CICn1km24uu2V3zU2siImytm+2ICHBZsHM1lasvSrCT8yo+bQX8h0zleTnda+xYc
OFPi+6eatJNwJXE4rZXOejC7vw75WQ==
=F1EQ
-----END PGP SIGNATURE-----

--pfS6fkSTDr7lad3R--

