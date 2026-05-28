Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F86ACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JybsP6neEqqAoTM7Pmz67kz4XFEEsypjyO3C0cAT568=; b=Ld0L8E4Jk5RU1W3kgGZSpElhf5
	Zmu6mPZGzHDgSTro31swHmE+1Wcj2Sye3u3MzVDnj8hmnJzH0R0s5xsoca83HKrNqjrSlHHJAWOr6
	bI/7ywTwT0CT1KyHam1uMrwmtA2X060XnC6tShabVIzeZGOws1kv/0Kz5scM+ClHstRA8bPJuc1PR
	PFMqRy0vGsS3US36z/1G4T0/Vrbeu/o1rqkRC3MyKRHYnxyLOf0bnguKVVBhhazAJLizeHbvGVIC5
	h7MF/xnc35HayNnfWDeTuptcUfsfDYCN3gaK1sXdSUlwYjLdUKH7U/MA8aweqdbC2tZM7lS7NtsT3
	tZbamxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeMd-000000064q6-47br;
	Thu, 28 May 2026 17:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeMc-000000064pZ-1YRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:17:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40374419AF;
	Thu, 28 May 2026 17:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D671F000E9;
	Thu, 28 May 2026 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779988665;
	bh=JybsP6neEqqAoTM7Pmz67kz4XFEEsypjyO3C0cAT568=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FlKbuqVoxin9BLegA3sg3biseLmdaVMO1PnqCdx8LvD1f8DcBffox7650Yc260tK2
	 gP0GEPhu5hN2/kkH+OQGQrDTMacga0OXZSzLs6laneERn1UyKrAAlbSkYOtpNKYvfA
	 YFbIIHnYwezbCQSL7JVTfh3YB8QycgpfbP/RJ9wOgZOce37OBJeZ87FyFTTbqNhVlo
	 /HAeLxd9QeHu9eLIBQC9wrIF5565tv8NkXkG+HXn76gqdFeAQUdby29tEKnWTFQEPC
	 fG2ObPech+/o/yGAgMxM10GWvn0sBBTNKGCFBR+K2FvaLqLSjWaLjsQiZxNm5oKGXC
	 eTuGNOLyq5TiQ==
Date: Thu, 28 May 2026 18:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, vladimir.murzin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v2 11/18] arm64: fpsimd: Split FPSR/FPCR from SVE
 save/restore
Message-ID: <9259e443-6fa3-4ba3-9aac-42f78dc7e72e@sirena.org.uk>
References: <20260528165446.701944-1-mark.rutland@arm.com>
 <20260528165446.701944-12-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q8zKy3wNANHFD/wm"
Content-Disposition: inline
In-Reply-To: <20260528165446.701944-12-mark.rutland@arm.com>
X-Cookie: Someone is speaking well of you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_101746_471881_BE86E05B 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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


--Q8zKy3wNANHFD/wm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 05:54:39PM +0100, Mark Rutland wrote:
> Regardless of whether the vector registers are saved in FPSIMD or SVE
> format, we store FPSR and FPCR in user_fpsimd_state::{fpsr,fpcr}.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Q8zKy3wNANHFD/wm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYeLQACgkQJNaLcl1U
h9DDEwf+J+W4JjW776kpG0Xg7vg+iA+6PmZWSrsUvZskElWJSW1cuu6mvBAsYJyT
H6LykUmBu71WW0og4iNP+pmNr0KHfKZ/AhcQGtpHTbgHaykmBMqRO0msDWaFcdJD
wzUs3JZUTcK89tSPKTMqTFNG8BafpifqpRn54Z0LZVz+LST2WF8Bf0WedhrMpwiL
CW23BHGS8WQy8w1CCpcaJ43lsJe45yPl45mJfm+Rv37xuCZh/DZZsE6ywL0Lj8vH
V3MTUyQ+zZR9g4tlED3/W/kmyU0Fc6bCeUwN7dxp1BjwMvHyPae1r7zj/4Zs/q95
eh/0jEU3iOF4VGECfL0h3qnRHinzFA==
=BXnO
-----END PGP SIGNATURE-----

--Q8zKy3wNANHFD/wm--

