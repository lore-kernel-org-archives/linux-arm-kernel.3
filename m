Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E93C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBHdR/XKw+ncRBOTsEiR5P0jDNGwmge63wqxa7fnTpE=; b=yVoiJY081gdIb9Xvycolq+xcO5
	iqmbxG4k9UgXlCY2Xjf0Tup7Mm7GODi4vQKmMmCyuw0JHWfMHOJvMQOSGewdL0oin9pSApzCr7901
	TJ27TWvAPDu3V1B5ZJqqX6B3gpUKQKQG6FNEgFwmNzhfRNEr3qvl+lUyKjJZRb9glHejmiteSe0GA
	SsjJ5b6YrM+OEAPmJZkvzv7goqb1gWT6y+ofo1gRX1zSuNhbVbyWAGghLxQa8JtvS4m7+/cHt1Wjz
	vxyJbvbgg0FfrOiGatpJNr/4da7sF5vM9r9I6f0UhHWwm9gT9hKO+/1MtWe/M8uGEGkyzfgoK7Hdi
	Vvgaz+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrhp-00000000ut9-2Q4Q;
	Tue, 25 Aug 2026 14:00:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrhn-00000000ut3-2rbz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:00:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 60A9A4172D;
	Tue, 25 Aug 2026 14:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B421F00A3D;
	Tue, 25 Aug 2026 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666447;
	bh=NBHdR/XKw+ncRBOTsEiR5P0jDNGwmge63wqxa7fnTpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXEQRgt4rDbLlY6oHy2hGkfrveHcvS6Oz+xVum88PAu3VlI7EwRWHzIYB3dK7Ummq
	 feiD+1FVpx67xZjNDZx0qGHmSDcTj1O9eMlLo5+XLxQuHdDwko5Vd/Rs4fB5SeMgxU
	 ZC05gzKtLH881s3xELKgW7i6EYcJ6Yrex/P9TpHNL/nRS39QEreapTcPjLlujkKq31
	 glT+Z6eyo1D2bEuvs9A1Zpy5NxMJa1OLes+zu3Z4nLV4l208yEsgTXZfotmAfbMv1F
	 w+LH8ddftMwh0NBhCtS+fHqgjHzuNK1dk6MWiJuSK2NrbwCI/H9+/P+cS99FREhE+Z
	 Ok6qxr8mFjOJQ==
Date: Tue, 25 Aug 2026 15:00:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] selftests/arm64: Treat KSM merge_across_nodes as
 optional
Message-ID: <958fbe2e-5e92-4109-a495-5398b5f3962e@sirena.org.uk>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-3-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GpWg8yZJ/4P394v7"
Content-Disposition: inline
In-Reply-To: <20260825111929.2882324-3-usama.anjum@arm.com>
X-Cookie: Exact change only.
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


--GpWg8yZJ/4P394v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 12:18:35PM +0100, Muhammad Usama Anjum wrote:
> The MTE KSM test requires write access to KSM sysfs but does not check
> that it is running as root. It also unconditionally saves, enables and
> restores the merge_across_nodes attribute. The kernel only creates this
> attribute when CONFIG_NUMA=y, so a non-NUMA kernel prints the following
> message three times even though every KSM subtest passes:

Reviewed-by: Mark Brown <broonie@kernel.org>

--GpWg8yZJ/4P394v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNoAkACgkQJNaLcl1U
h9BJMwf9GsxMO6gf7tHBaM7W1iZyGFsovU2OcihEdyKoM3Ay2cIVXqJHbEDT3kAi
hnJxIeyWPrzPLjJlS/DiWWRY1bdv+KwfH5uv4NwEHqqrVJmgF5rAwdzIE8oACoTs
yqtNpIGDUaEqkB4lwzBeSbZDEZgxYO7hBtF3qUF80NbQewSrk83AiA8079xhUJyJ
UFBQtx4fEl3NpRKrzvZ9Byht9d/AQ6A8wGTmIst3/mD9AwaSGRlxEB9q03Z4tjWX
uiLu1krdxiWYLDjAS4HLTbJwigjDP3hJN0VoSj+l5dcvReEJ6ho/8v4GkbpDteFe
0iTvpujt0GSaKEnLvPDBti4oH5EWYg==
=zHh/
-----END PGP SIGNATURE-----

--GpWg8yZJ/4P394v7--

