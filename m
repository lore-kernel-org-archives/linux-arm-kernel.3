Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553D4C36016
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTB1LkdaHYhKeBp8RW+H8cwXDQYd31I062iUErSVSVY=; b=eJ5wnnN2H4UklYgfGAz44boaoy
	yLYOmoEhk6pJkZBrUH0RZV5gSL8G5L5tMDkaiYgeBM1cmBiEk1R3lg3WlVOhEqnpQkUXMJ05EII1W
	jECDJDYtdKKi3+SxoZkijpqTg7eiSRi57PJUqaWhPBwqmWY0nbMH+O3y+6ckqPkXAdoDpOtsZiphe
	3OlZzHnrAWaLYfXsygijuGZPtmc4uSDr8ChFr6ZMFG+aGVJVtTah7dtf0izG2ropfZtTZBeIpCb0x
	TXi4yYnT+jB/3y9P6LjFWVXEOsHBs/fN65G3K4xNfGBSpJWNNrO+ql3TGdjypHGqQbCEkqhQ7v44l
	W4WZpq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzV1W-000000025HT-2xdg;
	Tue, 01 Apr 2025 06:22:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUyn-000000024zi-2d0W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A5056115D;
	Tue,  1 Apr 2025 06:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68046C4CEE8;
	Tue,  1 Apr 2025 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743488408;
	bh=dTB1LkdaHYhKeBp8RW+H8cwXDQYd31I062iUErSVSVY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Gz7wAA6USP8ewDFFeflTH5OPGhu3BdQrL61rJoUMluPZ6qAdN0fTn72GgyLQjLUuy
	 wTHyz2n/xWJHxjkWVrZLNmV/3YpZNKH3uDcPeJ/4vN6oRJCzQyJ8EYmp2WvZBR1DRf
	 qdnwR00ZR6UU00NotYdO0BPr0SHC87MFdbIl7PMhmfmzR+O+pvqq/tLBouD+BDTnga
	 8DGRgMWOWL6LGz1OnO7kq7W3Smto1Ko7do+93L9aMHOlskb/trMKRt7eoSTZvZFWbc
	 +QPoMwa5Q2HtTK4ZnaYiMrzDzAveXnZsTCAoRIRZZ2nOJnRLXt64wT79ZeBdwqt5Wl
	 yNhb7sAVj7L6A==
Content-Type: multipart/signed;
 boundary=469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 01 Apr 2025 08:20:04 +0200
Message-Id: <D8V323NBB32P.3P8H103L83HZK@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
In-Reply-To: <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
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

--469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Udit,

> >>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> >>> [..]
> >> For completeness , this is ok to add this node but should be kept disa=
bled
> > Shouldn't it be "reserved" then, see [1].
>
> yes, should be reserved.
>
> With marking status as reserved.
>
> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>

Thanks.

> >> similar to
> >>
> >> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k=
3-j7200-mcu-wakeup.dtsi#L662
> > j784s4, j721e and j721s2 have them enabled. What is the rule here?
>
> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>
> example for j721e, one is used by kernel [0] and another by optee [1].
>
>
> >
> > You also disable the hwrng in optee in your evm according to [2]:
> > CFG_WITH_SOFTWARE_PRNG=3Dy
>
> We are planning to use this hardware block by secure firmware.
>
> Therefore request not to use by optee as well

How will you be able to access the RNG from linux and u-boot? I'm
asking because I'll need it in u-boot for the lwip stack and the
HTTPS protocol.

-michael

--469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ+uFlBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/huuAGA6VxJSqcfwEyp/l9Eacmq8DPaOSDcw5jB
HiLqus4Fg9DFl1wj0Zb6OF3HAbHYx/b/AYDCesqMKY8du6brSiVP+2172bjOgXHc
VLGr5Zn13LMKzakCwP54O+nZSy0OjYhrx2o=
=MziH
-----END PGP SIGNATURE-----

--469ce2c5ee7b2eb876e9826f3995ee5ce86afad1f0f363e3357fd49a768e--

