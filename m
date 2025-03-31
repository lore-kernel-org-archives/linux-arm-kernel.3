Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B03EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WWbDoAe5Uj+6IIcnlHQgVQJ8kmdW8I+husCAEqDy08=; b=j2zJ/3fBXq9XeGIu7aiGj6uaqV
	JWl2ymUjgQAEow+8gBcBkULRb3h+RgWV/xIn7h2zqPQGsmZ0at+kDKUw4w1QhCpZhls4A8HgHlt94
	CcDYbplNbvuHZa2ge/mdyLRgVtHVn0kJ4C//vA0G0kXEchxb7ELbMGO9+sd3IpxIEDQZqZ2SUDoYf
	STzYWcf44Hiq604Phlm5DYWVMwbJJjE1f+PhME0Xp3ESDeSCsARmmruuZs2KoD2Rw5/8ZrBa+Z3Hv
	o9Qrrr8F6kC3FhGGJQYPLwnZ3TxSwGQ/SbKakVc1J6luqi+Y3OWcqp8eZpRhRYB9SzJQRL8MJ5icH
	j5ddcNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCsL-0000000088y-1HRv;
	Mon, 31 Mar 2025 11:00:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCqd-000000007uY-2r5I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9991244071;
	Mon, 31 Mar 2025 10:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4A2C4CEE5;
	Mon, 31 Mar 2025 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743418710;
	bh=CTlH+g2+HuA9vbv12bz+ImaQjIZbbactsMh++cN1GI4=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=PkSqrkpIkH/7OzaaxJ6wbsMQMmgWRl5eEdFES3St71VRm5H+dk1F6VyKWslwo4JA7
	 4pyTCcYTZii9Gm1D7Yeb1W2RiTTY4rNAiNSmZd7BMZdjc42yt1Sd9XKrwFewVPLafF
	 uY1C814Uf0ZsL5omntg7q91K3n9syNGDOM0CuU/JqgTJhE2XkkEnFnglqlsEkBiu6k
	 SI3qSKP/WdNpJW2GX93YXisUK+bLsVBRJTKup30Jz23M9G16AiIlA0biCTp3t5R1W8
	 E/YlpNGGQ/2Lpbucy7Vlgs0UyxiTLM7L61FOiOcXZRWVtBl1XC8IuT164xCx7PL4Oh
	 16bhAg71L6VfA==
Content-Type: multipart/signed;
 boundary=afa0541fe8431cb3d37f46b7af78c11e8bfa2698ff6820e4842879430dbc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 31 Mar 2025 12:58:25 +0200
Message-Id: <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
In-Reply-To: <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_035831_757989_15CEB242 
X-CRM114-Status: GOOD (  19.47  )
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

--afa0541fe8431cb3d37f46b7af78c11e8bfa2698ff6820e4842879430dbc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Udit,

> > Add the node for the random number generator inside the crypto module.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > This was tested on a J722S/AM67A. Also, according to the TRM this is th=
e
>
> Could you re-confirm please , after adding this node.=C2=A0 you selected =
trng=20
> offered by Linux

# cat /sys/devices/virtual/misc/hw_random/rng_current
40910000.rng
# cat /sys/devices/virtual/misc/hw_random/rng_available
40910000.rng
# dd if=3D/dev/hwrng bs=3D16 count=3D1 | hexdump -C
1+0 records in
1+0 records out
00000000  92 f5 44 09 fd 86 6b a2  39 d6 ad f3 e6 ec 03 4a  |..D...k.9.....=
.J|
00000010
# dd if=3D/dev/hwrng bs=3D16 count=3D1 | hexdump -C
1+0 records in
1+0 records out
00000000  a3 73 da d2 5b 94 83 2a  75 11 ca b3 99 d3 87 88  |.s..[..*u.....=
..|
00000010

> > MCU instance of the SA3UL. But it's defined in -main.dtsi. Is this
> > correct?
>
> Yes this is correct,
>
> please refer
>
> https://www.ti.com/lit/zip/sprujb3=C2=A0 SPRUJB3A.pdf
>
> table 2.1 Main Memory map, this node falls under main domain

Ok. Not sure, how I came to the conclusion that this is an MCU
instance.

> > ---
> >   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/a=
rch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> > index 6e3beb5c2e01..e868e006318e 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> > @@ -227,9 +227,17 @@ crypto: crypto@40900000 {
> >   		reg =3D <0x00 0x40900000 0x00 0x1200>;
> >   		#address-cells =3D <2>;
> >   		#size-cells =3D <2>;
> > +		ranges =3D <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
> > +
> >   		dmas =3D <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
> >   		       <&main_pktdma 0x7507 0>;
> >   		dma-names =3D "tx", "rx1", "rx2";
> > +
> > +		rng: rng@40910000 {
> > +			compatible =3D "inside-secure,safexcel-eip76";
> > +			reg =3D <0x00 0x40910000 0x0 0x7d>;
> > +			interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
>
> For completeness , this is ok to add this node but should be kept disable=
d

Shouldn't it be "reserved" then, see [1].

> similar to
>
> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j=
7200-mcu-wakeup.dtsi#L662=20

j784s4, j721e and j721s2 have them enabled. What is the rule here?

You also disable the hwrng in optee in your evm according to [2]:
CFG_WITH_SOFTWARE_PRNG=3Dy

-michael

[1] https://devicetree-specification.readthedocs.io/en/latest/chapter2-devi=
cetree-basics.html?highlight=3Dreservered#status
[2] https://docs.u-boot.org/en/latest/board/ti/j722s_evm.html

--afa0541fe8431cb3d37f46b7af78c11e8bfa2698ff6820e4842879430dbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ+p1UhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j8pwGA48YnnE9XmW12Xb9i0N07RIC3iMPccKhd
cjprpG75JZaQmW/v8ZcZZd/K8uJSE+VgAYDPVCPTWLrtYn9/oDmr+W4bVK9RMMvx
4f0ciSTzQAxeV2R2AEjz1GcqFgnzpW68JgE=
=t5tD
-----END PGP SIGNATURE-----

--afa0541fe8431cb3d37f46b7af78c11e8bfa2698ff6820e4842879430dbc--

