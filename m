Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C409ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BFuayuRHD9cnf4hcu9JV5RJ1bQm30ztJTJFQ5UYRtA=; b=qkGb0junmX974OwubKJusCVNJI
	cLpRYlXAYYBfg9bybueBP+v2uFJ/juVvMze/wTF5QwgrAG4S21QJp/OqXg9Yb7TL9oPAQmvjJWQbl
	nMSHcEY/H0vfoa4DALZgnDMhXgoTWJQiJ2+rLckoN1YeJIEIje1UgOkITdzwAHp4VI8wZoczHZTWp
	qT3na0Ngv351DstuIGDBGazBP5B6wdT2eN0vK3GOryKcoo5ISH5OXurpu0WOwum+jcpK1NImq54kL
	k5laF0EvjAanvq1NFpPLVhwtEr0y9tybY8o8aKp7qdQ2r9AKmZWOY7+Vryx+pNwU0TlAD4zYBGBEi
	k5UYPHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3g70-0000000652J-1XWR;
	Tue, 30 Sep 2025 19:34:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3g6y-00000006527-0DE1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DE28611ED;
	Tue, 30 Sep 2025 19:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863E4C4CEF0;
	Tue, 30 Sep 2025 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759260846;
	bh=AB3Cn/2WSkWkpQ+CwSIc9teOxb7tKtOz/f1rUMk3pcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8lFubbW2uWOomJHlf3qiQFsUVib7KkwN466zwBY7I2J9LcBqzR+AE3IoTrKJf3Ou
	 uoV4XEOsb97uHTWW/ujSLXmsci/NoRXc8qBgFUcoX8crQkgApt10Avc9ukN6uWNtlw
	 wVwhINIvmsclBbo+9B2IOqoAPmqjgTf9htMz7pC0jdeN4V7+XSPcDLFKfbDXF7IXr/
	 zuVBpm4odxIFIN6miWczAcm8m9bQ96WOY0uyqSQSWTDajwVLpr5Wv77iQ5aVCT5xyy
	 cGTbaqzx10IvI3de5J3BLl+UK1tpK9GqKWmhLjVZm6aAMib5vH0dxuQpxm149QDHOK
	 VPAnDVGK63ITg==
Date: Tue, 30 Sep 2025 20:34:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20250930-manhole-buccaneer-c22c71586e01@spud>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20250930-slapstick-volatile-60ad540f4b66@spud>
 <1bb0f2f9-d3fa-42af-aa55-e9f0771ed5be@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ONkA3jF2McKxioA"
Content-Disposition: inline
In-Reply-To: <1bb0f2f9-d3fa-42af-aa55-e9f0771ed5be@broadcom.com>
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


--7ONkA3jF2McKxioA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 12:09:01PM -0700, Florian Fainelli wrote:
> On 9/30/25 12:03, Conor Dooley wrote:
> > On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
> > > Adding brcmstb-hwspinlock bindings.
> > >=20
> > > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > > ---
> > >   .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 ++++++++++++++++=
+++
> > >   1 file changed, 36 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,br=
cmstb-hwspinlock.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hw=
spinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspi=
nlock.yaml
> > > new file mode 100644
> > > index 000000000000..f45399b4fe0b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinloc=
k.yaml
> > > @@ -0,0 +1,36 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Broadcom settop Hardware Spinlock
> > > +
> > > +maintainers:
> > > +  - Kamal Dasu <kamal.dasu@broadcom.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: brcm,brcmstb-hwspinlock
> >=20
> > Is "brcmstb" actually the name of a single platform?
> > Looking at the "brcmstb" pci binding, it looks like there's a whole load
> > of different devices there and none use "brcmstb":
> >            - brcm,bcm2711-pcie # The Raspberry Pi 4
> >            - brcm,bcm2712-pcie # Raspberry Pi 5
> >            - brcm,bcm4908-pcie
> >            - brcm,bcm7211-pcie # Broadcom STB version of RPi4
> >            - brcm,bcm7216-pcie # Broadcom 7216 Arm
> >            - brcm,bcm7278-pcie # Broadcom 7278 Arm
> >            - brcm,bcm7425-pcie # Broadcom 7425 MIPs
> >            - brcm,bcm7435-pcie # Broadcom 7435 MIPs
> >            - brcm,bcm7445-pcie # Broadcom 7445 Arm
> >            - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
> >=20
> > If "stb" means "set top box", it sounds like a catchall for disparate
> > devices, which isn't permitted.
>=20
> Unlike PCIe, the HW spinlock hardware has been stable across all Set-top =
box
> chips ever since it was added, which is why the catch all is IMHO adequate
> here.

I see. Now that I look more, there are other places where "stb" is used.
Sounds like "brcmstb" as generic fallback would probably be okay then.
Either way, the duplicate 1/3 patch needs to be sorted out.

--7ONkA3jF2McKxioA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwwqgAKCRB4tDGHoIJi
0uE8AP4mcav5juIgZKkbUSFyxSFX4BuQoKb9S9jqDChoCJwf+AEAkId6yQePlp+T
Q0DQHR+eHcnvaWXrdZvIeGiVlUXNRAY=
=ozXO
-----END PGP SIGNATURE-----

--7ONkA3jF2McKxioA--

