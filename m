Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0BBEA4FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLUnkmg3SzsUVlg149GGfb3y1qg7Z5CDjvwX43oPQEw=; b=D6b2Pn5PmZRdlLPSjtb1TjNsjo
	Y0SqLh8icAflwUKm70PBG/xGK3HIRsqHPxDq02IoAyeBvkPYjnrgozysg4lYJ4I3ULrU6C6VCJ0iw
	aTYy3JPWk0TSLMXJD4cDKH+9SMWRnO7t7jX1g8ZPmHS4sJJCndNNLaxGIvBwyRoLfIvEGzxgkH69w
	a12L5vp6P4d5y92nRxJkWKwri64qiL/VnI93Dk31rIHZaJfS0I1ZywZPdKULPZnv0jhToQIzhRNUf
	2/7Ve7voCANQGP1/XBRDkLBNKfwy2ELfXPzNXvJ0ZfMK8KNXwye8EoARKJ1A3SK1d8jNgPPoWDIBo
	PYMe72hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWul-00000000T12-0uIv;
	Mon, 23 Feb 2026 14:27:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWuj-00000000T0v-3ROz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2B21600CB;
	Mon, 23 Feb 2026 14:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EF9C116C6;
	Mon, 23 Feb 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771856876;
	bh=Xu/qpZ8MrYMsaZJT4hMSe8XVOwxu0IZGwImZRtSZlP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5Yv5FZQoTig+ho19Y7LTHAo+iOvINI3/BmGjRxJAsnIk+FjoEAAc5aZ9pqoatnoH
	 yBTmd2ABqtSueuL7cJOv0U+qJJgGkU81jxBdj1Rb9wIqnaqETPolb5iwdpdF0VHM3p
	 UvpjEuZlzqymZ3deaCin1xLH+WcrFWGeSDqu5obZd8tL6tPaCuyfENveZ3YRoUX0FV
	 yQT1O88qQ0jyCVR26peI1a4mKDItXqimmNZMxGBXyc408l16EVPgEw6NyqaRHkguWG
	 uCjmCeExIeDH8BCzSBxqRKMTwsy0Vq6vPaqRA5/+/5tczg7yEz5mKFGo4Sq0+kMjin
	 9wU4T9en2yE6g==
Date: Mon, 23 Feb 2026 14:27:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: pKVM breakage in mainline on n1sdp
Message-ID: <fbe627c3-02fd-48e9-84f1-c6587da13d94@sirena.org.uk>
References: <60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk>
 <87bjhie67o.wl-maz@kernel.org>
 <87a4x2e60i.wl-maz@kernel.org>
 <aZm2XCZLYxgxL99d@sirena.co.uk>
 <aZwmevKcvW2HxdJ5@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kedVc5uWqaZsu8rh"
Content-Disposition: inline
In-Reply-To: <aZwmevKcvW2HxdJ5@J2N7QTR9R3>
X-Cookie: My LESLIE GORE record is BROKEN ...
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


--kedVc5uWqaZsu8rh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 10:05:46AM +0000, Mark Rutland wrote:
> On Sat, Feb 21, 2026 at 01:42:52PM +0000, Mark Brown wrote:

> > It won't be vanilla v6.19, that specific log will be tip of Linus' tree
> > from yesterday morning UK time which should be 8bf22c33e7a1 ("Merge tag
> > 'net-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/n=
et"),
> > there were a few results for commits over the day prior to that showing
> > the same behaviour.

> Are you sure? That log says:

>   CPU: 1 UID: 0 PID: 1955 Comm: qemu-system-aar Not tainted 6.19.0 #1 PRE=
EMPT  =20

> ... where "6.19.0" means that's the 6.19 tag, and "#1" means that's the
> first build against that.

The UI claims that we're seeing this in 956b9cbd7f156 (Merge tag
'kbuild-fixes-7.0-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux) but
unfortunately the build logs don't clearly confirm this.

All the builds are fresh builds in a new container so it would be
surprising if we reported a build number other than 1.

> Is the build system overriding things such that this is misleading?

I believe that to be the case here, the builds are not building from a
git checkout but rather the build coordination is packing a tarball of
the source up then handing that off to be built on a separate system
which means that the magic to figure out the git describe and put that
into the version number during the build can't do anything and just
reports whatever is in the Makefile.

> Is there potentially a problem with the build system?

I can't 100% discount that possibility but it does seem to DTRT for
other commits and has done for a long time.

--kedVc5uWqaZsu8rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcY+YACgkQJNaLcl1U
h9ABJAf/bmikUHaa7X45/hwLAckp2UmAK5tgs7Vm7Z/8ttuQZzXQ+73y+8mOT332
cm7iaTK+2auzw/EBIzzBX2khEjak/35SiZaVa92c7vXpzEAwSV/DypoRgEBADSMq
2mg1RghdBoCoRkHeVBUeQjL5Q2VOFJQRkefDNtAnBWr4/rEV9UUQRAf+bUTRwFlN
p+s6HGgx5M+Btx80EJGK7pWkQJf+n8nXHDW3YaDfwDA/DyxWKJ0DxGLT7nrIxXfe
HS7V6k4+Vd/4j/PnF1tISRTK/ZgKS/TLX6uwu/W9Aft14/D6WFNSpvATa8HgBnfu
WhvzSJ3gNH2CHkYJYgvq9Sny/6R4Mw==
=q1pY
-----END PGP SIGNATURE-----

--kedVc5uWqaZsu8rh--

