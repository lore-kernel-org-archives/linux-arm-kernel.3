Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D6C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4QRP0LSSY1+4wNQDfdTqX7gGpMupN8PmdBWu1jst2c=; b=DXOi6Mq/bOGIrS20NhaM9+/fz5
	nLPkSW0CjUXyQn2U+6uEC+rQIqBj1ZKRUOw6a0OJNo5dhUwjz2CxTD0IlDbINtzEXEHnVwKktdwXw
	L7u8P+tA4H45HvBRC7EbyHg00ZXvOtWHVUyFzpC7EIsXEl+THeI3tyQpx+nMJF9LzgocyornfVLRT
	/DrvMC4dEADSM3MDuwEr+Wwtu7zKz83TfL3Uv39ljUn06LDy2G/phfGg7Pn0v56h7qA2fJxI7x7I2
	whXaqrI4SyOuuVPxSZ9L/U/8XNSH++58BYunmmpc6JfVTda/zjVY7XyJU42lqw04ad+ibSJwkmAi2
	lIb/gq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qHh-0000000AKt6-2woD;
	Thu, 10 Apr 2025 11:41:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2q3V-0000000AIQ2-3jeo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C70A15C54B4;
	Thu, 10 Apr 2025 11:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075F6C4CEDD;
	Thu, 10 Apr 2025 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744284408;
	bh=/4QRP0LSSY1+4wNQDfdTqX7gGpMupN8PmdBWu1jst2c=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=OabO3AHx9XrOritNLNk+T+lzS6wUFA7IK+HvL6Ph37t0tuo982CSxzsVwedi6kAgt
	 tuSTOvURZ8oWdnknwvMh9XsrdM3YPxFKyT5fevb7hO7EG9Ker+uuk0YrzTG6MRCrMc
	 Tka6QYJ58zr5ffZkITqC69UCcL+muGYuU/WuPv6PfMuWORmLgBSJnINk1mt55E3zIf
	 bVfjK2LLIAjeml7eEPqz5EqQzBWaCPos03gMwA8nSf7NeMHQwVEijbEQW5dq1Psy9z
	 Rbamjm1BgSi2MsXZAetwmWLB0W+FjpwS3+ps7xTOz9/DYx5za7QuPkalhm4RlnZCFS
	 Q+gITr1nWtv/g==
Content-Type: multipart/signed;
 boundary=ad55f64d21a9492004b5049814098a828c9f0c6ce5dd548f52b9a2e1c6dc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 10 Apr 2025 13:26:44 +0200
Message-Id: <D92X7T33NU3T.VSZM5K7U602S@kernel.org>
To: "Manorit Chawdhry" <m-chawdhry@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
Cc: "Kumar, Udit" <u-kumar1@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
 <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
 <ea82dc29e93d53b659916f2fed10982b@kernel.org>
 <20250409103303.dkrrvp7mdctx32pd@uda0497581-HP>
In-Reply-To: <20250409103303.dkrrvp7mdctx32pd@uda0497581-HP>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_042650_039298_8DE720EF 
X-CRM114-Status: GOOD (  27.35  )
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

--ad55f64d21a9492004b5049814098a828c9f0c6ce5dd548f52b9a2e1c6dc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Manorit,

> > > > > > > > --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dts=
i
> > > > > > > > [..]
> > > > > > > For completeness , this is ok to add this node but
> > > > > > > should be kept disabled
> > > > > > Shouldn't it be "reserved" then, see [1].
> > > > > yes, should be reserved.
> > > > >=20
> > > > > With marking status as reserved.
> > > > >=20
> > > > > Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
> > > > Thanks.
> > > >=20
> > > > > > > similar to
> > > > > > >=20
> > > > > > > https://github.com/torvalds/linux/blob/master/arch/arm64/boot=
/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
> > > > > > j784s4, j721e and j721s2 have them enabled. What is the rule he=
re?
> > > > > J784s4, j721e and j721s2 SOCs has two TRNG blocks,
> > > > >=20
> > > > > example for j721e, one is used by kernel [0] and another by
> > > > > optee [1].
> > > > >=20
> > > > >=20
> > > > > > You also disable the hwrng in optee in your evm according to [2=
]:
> > > > > > CFG_WITH_SOFTWARE_PRNG=3Dy
> > > > > We are planning to use this hardware block by secure firmware.
> > > > >=20
> > > > > Therefore request not to use by optee as well
> > > > How will you be able to access the RNG from linux and u-boot? I'm
> > > > asking because I'll need it in u-boot for the lwip stack and the
> > > > HTTPS protocol.
> > >=20
> > > For now,=C2=A0 If you need TRNG then I can suggest to use optee TRNG =
(ie
> > > build
> > > optee with HW TRNG).
> >=20
> > I'll be using an uboot TRNG driver. But how will that work in
> > the future if the RNG is used by the secure firmware?
>
> Wondering if this would be of interest to you [0]. I think since this
> device only has one TRNG, there has to be a master around and we can
> mitigate that from OP-TEE as of now, incase anything changes in future
> then the communication channel between OP-TEE and the secure firmware
> can be established but currently it's still at work. I think the best
> way to go forward is to get the numbers from OP-TEE atm IMHO.

I saw the optee rng. But as of now, the instructions are to use a
software PRNG for optee. Thus, if someone compiles optee by
following the instructions, it's unlikely to work.

Would TI willing to agree to change the building docs and enable the
TRNG in optee and then work on moving the TRNG into the secure
firmware and build a channel between optee and that firmware? Right
now, the TRNG seems pretty useless as we cannot use it neither from
u-boot or linux (and being future proof).

-michael

--ad55f64d21a9492004b5049814098a828c9f0c6ce5dd548f52b9a2e1c6dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ/eq9BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i2vwGAuMOEvrofoPrJP5EJ6QI8mOmjikMnoom8
48SaS2AWc9/dl3cB6//QpAgW4ddQa5K2AYD49R4EajQsRRXYldYv0a3WRj0OVWCG
BGFmggZsgVeCah5BcwYrWW3pMdL9bnXeUSo=
=1UR3
-----END PGP SIGNATURE-----

--ad55f64d21a9492004b5049814098a828c9f0c6ce5dd548f52b9a2e1c6dc--

