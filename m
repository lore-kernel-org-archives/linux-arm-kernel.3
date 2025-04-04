Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39D5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COkpL8fQE5l7P6GCduMEpuUwx2Y747Dacd8yAPOq3cM=; b=aRuS2w1RysxunuALzD8lbb6Vmy
	XwArHdDMwyfpd7OvWRjHsQbDRsyHmFnmthV94z34So0suv4k/hNOG+SCXH5XBudTfjQjx1rW9zUZb
	6Q5CvQAqTMm00JF5cAInwZ2nRgSm3fdjHg7wTGatMMx2SKrB33XKxHE5Pr/VKTB0FVUoNG1aQIR+D
	uM2jH8aAAvbGLqOPNfJ66SgSLR1+4DRv1HN+ycCkEAOG1HtUJmMytZhTy2vnEk1M05YPlySy45A+D
	ewFWrlfWrbE5YaPGFaVa+W3+WCxHuEDkwQY/Kxjc6aZ1/3rrdqzZo+UtYNOjVrA2gib62SpVJLTO8
	/zK1E2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jS1-0000000CEpD-4Bm2;
	Fri, 04 Apr 2025 15:59:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jQI-0000000CEZh-1Efb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1941061135;
	Fri,  4 Apr 2025 15:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4588DC4CEDD;
	Fri,  4 Apr 2025 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782257;
	bh=COkpL8fQE5l7P6GCduMEpuUwx2Y747Dacd8yAPOq3cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaAzCsNV9bb7/b/DCVXJZMr8AOzHbm8sYUd/1in+O4L19O/jri9ohRKONwQ1bZM2t
	 rW/ee0rYCpf9zSDqgTTqFj7Xvi0RChS7KbJQHZTDx0+JMxTsdVzFoRJVXGY8IUSq3Z
	 yCf6eK+jheBHf7pewipOGfbiP5bY32e/7TeWgSRt31E0zrPSLqwrbE9Fh9wwVDGST/
	 yShbbacq/1+FoSOQyQOYZrEop2tWPys2YwAIdye4y20R/kNcTtYaYMVusd1Yqp9zTF
	 oPngEc8ZWI+jCyUZvTfjgIKJNED6rAeHak5Nfwhk0ER8boKAEEAy7m6hFiOZKT9alW
	 bcO1YfhcVYYsQ==
Date: Fri, 4 Apr 2025 16:57:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v2 3/3] tools/kselftest: add MTE_FAR hwcap test
Message-ID: <0803d010-9e71-423b-9ee3-931a976e4670@sirena.org.uk>
References: <20250403172758.67106-1-yeoreum.yun@arm.com>
 <20250403172758.67106-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbQ9cK3yItVK93le"
Content-Disposition: inline
In-Reply-To: <20250403172758.67106-4-yeoreum.yun@arm.com>
X-Cookie: You will soon forget this.
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


--fbQ9cK3yItVK93le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 06:27:58PM +0100, Yeoreum Yun wrote:
> add MTE_FAR hwcap test on kselftest.

Reviewed-by: Mark Brown <broonie@kernel.org>

--fbQ9cK3yItVK93le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwAWkACgkQJNaLcl1U
h9Cv8Af+OaSzBEMLiXHx8k7AGPbYlF+tWFCoZqeNuTxThXBEVt5tG5MUGTJodjTs
6NtewEVZolnUSqZdsZEW2K6LH69L2s8ZhHn8jixuPz/k/wbWUwm3ZF5ugjg2DqTT
huL0ZyoizumKfT+lt8D7s6Ja8jIQIOs4KpPNQKPfQ0mXMDfYr2nOqfbO77gkOTm7
Q+vIsUg+eud3yt6uMVl3cLXLIHsf/P3vWFuyGj4Ct0Nij5XfhQF8HZQfv4stSkTZ
cGNls83Gr/Oim4vLXWbVrHtE4uBmRxlXinKqBLNZnA0N7RbUQLW/DX3uRIBETmc+
Ldf8YcDngw69rzEGdeAN60CsdmxP+A==
=J8O6
-----END PGP SIGNATURE-----

--fbQ9cK3yItVK93le--

