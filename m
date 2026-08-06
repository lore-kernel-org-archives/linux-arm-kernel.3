Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D59C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PipOiU3WDi/ShqcfhWwddc2/xW9Ic+f6bHEQmclKRiA=; b=KwtjnnpNZQ5q1QiN13EADvGaza
	losCv/++Ypk88gqWn2WLdfptkpQqChp9Ai6IBdr2ninjFge8q8NSxYrQXPrLEXcndj/4WOneEXZwR
	BBe3L680FFlMeijvbngEjwfgeiXUwLo+3AAF0GGqW7F7349wMyrkOEQ6NmWd/IhJizZerZCMhIKrS
	sTOu5Eiyk1qgp1HU3rIizHDZTmDpbrnZ1+2Kr3Fnw5H2VnitTEgfr/Z26zwwxLopSDTRQEVZPbU7j
	kSSfowf6THUvuIUkzVOEWbjwceREnIGelHAJtSbdKnkFn4gQUudCj1xjZLfNKSNbHeUBfZC+nDPrk
	6Re7A/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwkI-00000005hQd-0k1W;
	Thu, 06 Aug 2026 11:58:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwkG-00000005hQW-2Z0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F33740169;
	Thu,  6 Aug 2026 11:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA81F000E9;
	Thu,  6 Aug 2026 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786017524;
	bh=PipOiU3WDi/ShqcfhWwddc2/xW9Ic+f6bHEQmclKRiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOJXKEpYVV95XhacNsHdG5GB19/T7i6BhFc7ZR3q1IC6p3XOB4VgOcow9bUabrHWP
	 +Zf6HUkvX1sjH/s2efi48HmNIZJ0Q7KxqeIVB6X3EFQHhkWA8Vx7WmbsfZHIz1t73x
	 H/zCocTWlmFTDzLgtIcI2HL8ETBQGs2znXSMLx6aEb/Gb2WJ7FHMMi8aHRxK6lTLN4
	 ywxkPNDqwjLo0heK02XtDD1SRqsawWLPhjXhy5ylt8WwtYTwY0MH/zvo9zmyAbY6U+
	 Ge9t+fRR7bJnW1kG1inKbdPKsd/ZQW9olH6diK1eVNuqeB+BwLVdNseyGTH0Ldu+6L
	 CdARooEV/JIZQ==
Date: Thu, 6 Aug 2026 12:58:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v3 1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
Message-ID: <d37ac12d-1e19-4711-add5-6f3cf82f48ac@sirena.org.uk>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
 <20260728021122.2640104-2-ruanjinjie@huawei.com>
 <a9ef63ac-6012-4788-8fd7-5902b6448484@sirena.org.uk>
 <bd1db584-ce6b-46b5-ab66-11fb7873007b@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9kq+jgVm4G0pwUVj"
Content-Disposition: inline
In-Reply-To: <bd1db584-ce6b-46b5-ab66-11fb7873007b@huawei.com>
X-Cookie: Brain fried -- Core dumped
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


--9kq+jgVm4G0pwUVj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 04:22:31PM +0800, Jinjie Ruan wrote:
> =E5=9C=A8 2026/8/5 23:04, Mark Brown =E5=86=99=E9=81=93:
> > On Tue, Jul 28, 2026 at 10:11:21AM +0800, Jinjie Ruan wrote:

> > The relevant definitions ought to be being picked up from here, there's
> > a copy of a current version in tools/include and has been for a while
> > (since at least v6.18) but there's no Makefile update to ensure that
> > gets picked up.

> Will add -I$(top_srcdir)/tools/include to CFLAGS for this test.

It turns out that's actually getting pulled in already - the issue is
that linux/filter.h doesn't include uapi/linux/filter.h and the
definition is in the uapi header.  I sent a fix for this yesterday.

--9kq+jgVm4G0pwUVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0du8ACgkQJNaLcl1U
h9AvDwf/fQZl+XgNBHgNp8Whb+LhD5qXRzfbnZn8Rj+a1RP0C6qrKxHB0clVOlWg
UDkOIK3qALyXI2VivsHf3CLJPVVD9vGRnqvYe3ZFH88KcHsQGvsKYjo3OB50Iw3u
4sqjREgnWhdVBWQIbUDudgV5o71l7EDuzCqEo9t7cnbYdcOwMVITaqMp1p6hzWIi
LyvcB4XiayAsGcUIFjOQctHLVpfOxleL0JAGSTeHEqMWjDLtJfuebUUqvK29hT6I
RUIdoxwdtivcwZN9hWUN56+1sJKFWFZbn+w6qY00iIy6drwLKafX78E5CgUyUcyc
qLov6Jd+xvES3sJpZ4MaV6p4X84mgQ==
=dtmO
-----END PGP SIGNATURE-----

--9kq+jgVm4G0pwUVj--

