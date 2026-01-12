Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AC1C9EC95
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsyIsgBkGIjphgcCMskKizrQMVbuRwnXGKfAose0lAs=; b=e0pldRj4n84yuO0AllrEnujs2n
	A0axKF98m56AToDetoz1ehC0G18UL7B52hAXlgtLxIGuRgqOHafFulXfkzbyD4f5aHc288nrXhH18
	v8wScUMAYG2iTBOBArfsB9mw/jLXaF49Omyw3nTFSl/zDEgN8glrGpD2lCpIUHYh2fN86MkcSTwNo
	BnBPrvBHh3tDiPCDHJ1TCCc84WX3883lYPaklJVREawgIf5LEu3EOIA46b03YSDTYYFmkSR0iWs+O
	jj2BfWgJ66mjglzz0EftNilPImRQ7fjeBTAtrGH5O99SBuaorb+h1KRw3yELrjJZ2po1yNjuj6bwj
	Xn4/29AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIYi-00000005UJd-3s6g;
	Mon, 12 Jan 2026 14:06:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIYg-00000005UJS-465b;
	Mon, 12 Jan 2026 14:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12F346000A;
	Mon, 12 Jan 2026 14:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880BAC16AAE;
	Mon, 12 Jan 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768226773;
	bh=rsyIsgBkGIjphgcCMskKizrQMVbuRwnXGKfAose0lAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dO8zo0MfJUeu+esVfJmzLFj/hOY6pZHBE48DHbyIQRhJKLE+8Ft2+eOUUzftvviFc
	 p4TPTuzTAiu1iMtHsY1JREqWmGJ+uWPaMcOAm+fGz2RUhnQW78PJAkeGe7mPqiBXII
	 hzxIa+6nHGaKvXJdE+mI/b9izlqB5vV6GFclPn/Bkd+FviP3e+JiPbDH/W93s+ANgC
	 E3/3J49y0bvE+kyWcm6+hztARA6/IGn1lbfq0GJfmszouQpF2Zpo8mzkaUQfxeOGaz
	 hiTPoS9hhPJdxU68U2WRV9mtX26B55TrF1cpoScrju4ESMzdT71FkQ4gdAlLfcXPjO
	 wIMBOI2ToUNEg==
Date: Mon, 12 Jan 2026 14:06:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Joseph Chen <chenjh@rock-chips.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] regulator: rk808: Add RK801 support
Message-ID: <affddac9-813f-4835-a8b9-e3bab520987c@sirena.org.uk>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
 <20260112124351.17707-4-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8DIUkVIkcTq+IojV"
Content-Disposition: inline
In-Reply-To: <20260112124351.17707-4-chenjh@rock-chips.com>
X-Cookie: Surprise due today.  Also the rent.
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


--8DIUkVIkcTq+IojV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2026 at 08:43:51PM +0800, Joseph Chen wrote:

> Add support for rk801 to the existing rk808 regulator driver.
> It provides 4 BUCK, 2 LDO and 1 SWITCH.

Reviewed-by: Mark Brown <broonie@kernel.org>

--8DIUkVIkcTq+IojV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlk/9AACgkQJNaLcl1U
h9BQFwf/cqOmYM+t/IYJjfuTxz15Dllx6K8nDXEsGWUFL5K556/wH+M0jlnOClfk
vvCt3aP8xVJdVqHOBJf/u0VGwYBjzjM2s5Apbh4FeYQbwAmE+ywK6ms8IRhS1nwr
HIZRZLUgj7ONflXNSkPqQltqVdT37idPD26jz/bCAM5/1lxcW8er3kmySBKuXQgB
rFIBhDjDGsS0Is5pVtudcvOU8dLQ0XHKg7kXSGGYXmT0nTkrK1TuceAg426MIPkd
+pAEMr/iMWoSSdP8qlGYADJnt9Yd6C+Z9wrMhyn5FAttKd+Pt1Dggb9O6XNl+kR8
yU3q3xHbm4SPQ98BSNUrIeqS2lpvpg==
=G4Z3
-----END PGP SIGNATURE-----

--8DIUkVIkcTq+IojV--

