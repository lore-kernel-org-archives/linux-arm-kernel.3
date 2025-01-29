Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5899EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+jOFll2kOTmnmqVegSeBVoiXuZeu+Ws8hNjkbVfmjA=; b=v2wcknYgiYrxmItWtxXjN11sG2
	QxbWoZq0kfMfae6cFl6I2ic2qB28RUMtKTREFLFewfyvEGHmWLeXatWxH4WF41M8WYubvm5VH0YCt
	KiiJLAKX5+JGU4NV30K5N7+fajtEiV7s2EIVjbikAFXmEENNhrbnC6hhePa9eXeTE9VReSL03dUpp
	17Z3Px0l9UeOP4sM7+kJKqoh+RD11u87lV2L5bMSkRQ9JZjVCyC4VRGe6DL3AGeby03Tk2HHvMgxR
	Ax7SNJFKRJM9fiM93O+V/FUrFzFe3OugZsz+h6/nncHW6spwxeQmjOnHDx05CNV+GkVGV5scXuT9K
	EVtX64Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCE5-00000007Y75-3ZO8;
	Wed, 29 Jan 2025 17:51:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCBL-00000007Xf8-2NYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 384A05C5838;
	Wed, 29 Jan 2025 17:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042FFC4CED1;
	Wed, 29 Jan 2025 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738172933;
	bh=0mZICetq1ltZupJqnsMYF9aRp1+EuIM+7AJJ0xhWLcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmkrBs4tG5uJa6hwyPpvaVotnf8N0VRhPwtJ3ohE52yAXNMk2Iw5JzfpenDYEFMe7
	 ISsnDpGGu8V8ATfjwqdrXYuj/ZZvjgZy7GEiuM6ZmeOrcmWUQpyv2ozQ+S9JP7EDmA
	 OE9N4rcRKwqwT3HJZo0ITJeGoSUucA1nh3Cj2WBJ/BQZiWQAD66ftYNsspaiDSXlTZ
	 qPjhCgBcZQQcGC47W4PkjxSqhA1PrQzxJTitJ5yuLSioUS5pmMKRvzvyuKGFbCFEnG
	 ThmlHwpv2MhArFedU7xHyMFQf7NrZw1uZ5Y/zoblJvGfxemZmypCIY++mLxBi1NZGz
	 wU2AC3qoaiosA==
Date: Wed, 29 Jan 2025 17:48:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250129-vowed-dingbat-cfb5c5b8ede4@spud>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-2-basharath@couthit.com>
 <20250124-reoccupy-music-3803c753f8af@spud>
 <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A1ip/677/ZYHkwQO"
Content-Disposition: inline
In-Reply-To: <504387436.449923.1738127812232.JavaMail.zimbra@couthit.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_094855_817958_4A586C67 
X-CRM114-Status: GOOD (  29.76  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--A1ip/677/ZYHkwQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 10:46:52AM +0530, Basharath Hussain Khaja wrote:
> > On Fri, Jan 24, 2025 at 05:53:44PM +0530, Basharath Hussain Khaja wrote:
> >> From: Parvathi Pudi <parvathi@couthit.com>
> >>=20
> >> Documentation update for the newly added "pruss2_eth" device tree
> >> node and its dependencies along with compatibility for PRU-ICSS
> >> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> >> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
> >>=20
> >> Signed-off-by: Roger Quadros <rogerq@ti.com>
> >> Signed-off-by: Andrew F. Davis <afd@ti.com>
> >> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> >> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> >=20
> > I find this hard to believe. If all these people handled the patch, the
> > signoff from Parvathi would be first, no? Should some of these people be
> > co-developers?
> >=20
>=20
> Changes are about multiple modules. We have added our sign-off followed b=
y original module authors.

I think what you're trying to say is that these people are
co-developers? Anyone that contributed to the content of this patch
needs to get a co-developed-by. If they're not co-developers, and you
just want to put them in the maintainers section, they don't get
sign-offs.

> >> ---
> >>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
> >>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
> >>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
> >>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
> >>  4 files changed, 193 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-pru=
eth.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-eca=
p.yaml
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> index e36e3a622904..aad7d37fb47e 100644
> >> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> >> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peri=
pheral
> >> (IEP) module
> >> =20
> >>  maintainers:
> >>    - Md Danish Anwar <danishanwar@ti.com>
> >> +  - Parvathi Pudi <parvathi@couthit.com>
> >> +  - Basharath Hussain Khaja <basharath@couthit.com>
> >> =20
> >>  properties:
> >>    compatible:
> >> @@ -20,6 +22,9 @@ properties:
> >> =20
> >>        - const: ti,am654-icss-iep
> >> =20
> >> +      - items:
> >> +          - enum:
> >> +              - ti,am5728-icss-iep
> >=20
> > "items: - enum: <one item>" is the same as const.
> >=20
>=20
> Sure, we will modify as below.
>=20
>       - const: ti,am5728-icss-iep
>=20
> >> =20
> >>    reg:
> >>      maxItems: 1
> >> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> >> b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> >> new file mode 100644
> >> index 000000000000..51e99beb5f5f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> >> @@ -0,0 +1,147 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Texas Instruments ICSSM PRUSS Ethernet
> >> +
> >> +maintainers:
> >> +  - Roger Quadros <rogerq@ti.com>
> >> +  - Andrew F. Davis <afd@ti.com>
> >> +  - Parvathi Pudi <parvathi@couthit.com>
> >> +  - Basharath Hussain Khaja <basharath@couthit.com>
> >> +
> >> +description:
> >> +  Ethernet based on the Programmable Real-Time Unit and Industrial
> >> +  Communication Subsystem.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - ti,am57-prueth     # for AM57x SoC family
> >> +
> >> +  sram:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to OCMC SRAM node
> >> +
> >> +  ti,mii-rt:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to MII_RT module's syscon regmap
> >> +
> >> +  ti,iep:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> >> +
> >> +  ecap:
> >=20
> > Why's this one not got a ti prefix?
> >=20
>=20
> We will add "ti" prefix to ecap as "ti,ecap" in the next version.
>=20
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to Enhanced Capture (eCAP) event for ICSS
> >=20
> > Why do you need phandles for these things, can they not be looked up by
> > compatible? (e.g. multiple devices on one SoC).
> >=20
>=20
> ecap is another peripheral similar to IEP in ICSSM/ICSSG. We have created=
 a separate driver for possible reuse with ICSSG in future.

That's not an answer to my question.

>=20
> >> +
> >> +  interrupts:
> >> +    items:
> >> +      - description: High priority Rx Interrupt specifier.
> > > +      - description: Low priority Rx Interrupt specifier.
>=20
>=20
> Thanks & Best Regards,
> Basharath

--A1ip/677/ZYHkwQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5pp/AAKCRB4tDGHoIJi
0j1XAQDUL9qTPiwK0zX2laAS1VtLc/BPBORTGaY0J9aaaWzQzQEA3B7TIVYm6bzB
4hBCMr4G0YOuHuOpH2AJFTavyt3K/ws=
=od+I
-----END PGP SIGNATURE-----

--A1ip/677/ZYHkwQO--

