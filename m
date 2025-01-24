Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDDBC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTuo6szDcILbTqBXZ+g/puBJokmJnQf9Wc4cNkQ6dzA=; b=KZHDe9FQLdgwDFYp+5stPjDC51
	jK/6K3UgSCUNzAR1k+5ekr7GZzBJjZQKFkshLmQlItI3jbXkay1Oconih1BXb4otXcbshbscXlmkC
	kMIn8y6+KO1BLWSkjPV6PGd93ZAPiWWTxSD1y/k+bwpTp9kZG5mQaRyWtNCPVh/wVHmFTWUWhX2V3
	jcn2SppxzDE+UEold0ZyG8uinkWgjkdwDIUiFqExbxPuS8V1oqUzuN41K3uHNv96xAW9u2qHXwn3v
	QmMFvGUd6UFD8lZ6CCwXmEsj/xR1YzeQzx3rLERoz/nACMYAfIMQXWoY8dMny6n7bTCHZljFks3vq
	xGQQjIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMk9-0000000F8fx-27Ur;
	Fri, 24 Jan 2025 16:41:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMiq-0000000F8Xi-1qkl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 16:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD6575C5640;
	Fri, 24 Jan 2025 16:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87234C4CEE2;
	Fri, 24 Jan 2025 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737736795;
	bh=gxAjU9tvE1jlETOZTp5Bcxsm8BQQcCyXUg5i4sr/H00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n72B981pD+jYNl8Kb2ezStcA2V0kQBf7LL/8o20dInsX1yPEHO6gbECDqo0YEdDpP
	 fIb7o6L1vkdrzK6VsCeSv5BzEeCyYXl8ont9ZqQpcgs2zYQzFQGVNrBZCe7kEBgzGt
	 UpR5Cn7cfuIs9FGpcCQ8iikpIfg3EcVFVAyY/tYXEKarqN5meNOmdQv0CNgpnitiVT
	 SInM3+aQlGcdB2wo5xmBug/IIHlmDDTZlZcGZq/mb3QAIa2C8xO6ogaRjvfLzm270S
	 OakiWOj0A1eJpgao5I6CQtEdqXo3u2TZlSzwMytDHDMWRVhgmoHYqphQ6mXu1jjemK
	 xtctvOQcNxsrg==
Date: Fri, 24 Jan 2025 16:39:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC v2 PATCH 01/10] dt-bindings: net: ti: Adds DUAL-EMAC mode
 support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250124-reoccupy-music-3803c753f8af@spud>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-2-basharath@couthit.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cskVUvouOv9G4JC6"
Content-Disposition: inline
In-Reply-To: <20250124122353.1457174-2-basharath@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_083956_566482_220AFEDD 
X-CRM114-Status: GOOD (  20.38  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--cskVUvouOv9G4JC6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 05:53:44PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>
>=20
> Documentation update for the newly added "pruss2_eth" device tree
> node and its dependencies along with compatibility for PRU-ICSS
> Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
> (eCAP) peripheral and using YAML binding document for AM57xx SoCs.
>=20
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

I find this hard to believe. If all these people handled the patch, the
signoff from Parvathi would be first, no? Should some of these people be
co-developers?

> ---
>  .../devicetree/bindings/net/ti,icss-iep.yaml  |   5 +
>  .../bindings/net/ti,icssm-prueth.yaml         | 147 ++++++++++++++++++
>  .../bindings/net/ti,pruss-ecap.yaml           |  32 ++++
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 ++
>  4 files changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth=
=2Eyaml
>  create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Doc=
umentation/devicetree/bindings/net/ti,icss-iep.yaml
> index e36e3a622904..aad7d37fb47e 100644
> --- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
> @@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Periphe=
ral (IEP) module
> =20
>  maintainers:
>    - Md Danish Anwar <danishanwar@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> =20
>  properties:
>    compatible:
> @@ -20,6 +22,9 @@ properties:
> =20
>        - const: ti,am654-icss-iep
> =20
> +      - items:
> +          - enum:
> +              - ti,am5728-icss-iep

"items: - enum: <one item>" is the same as const.

> =20
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b=
/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> new file mode 100644
> index 000000000000..51e99beb5f5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ICSSM PRUSS Ethernet
> +
> +maintainers:
> +  - Roger Quadros <rogerq@ti.com>
> +  - Andrew F. Davis <afd@ti.com>
> +  - Parvathi Pudi <parvathi@couthit.com>
> +  - Basharath Hussain Khaja <basharath@couthit.com>
> +
> +description:
> +  Ethernet based on the Programmable Real-Time Unit and Industrial
> +  Communication Subsystem.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am57-prueth     # for AM57x SoC family
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to OCMC SRAM node
> +
> +  ti,mii-rt:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to MII_RT module's syscon regmap
> +
> +  ti,iep:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
> +
> +  ecap:

Why's this one not got a ti prefix?

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Enhanced Capture (eCAP) event for ICSS

Why do you need phandles for these things, can they not be looked up by
compatible? (e.g. multiple devices on one SoC).

> +
> +  interrupts:
> +    items:
> +      - description: High priority Rx Interrupt specifier.
> +      - description: Low priority Rx Interrupt specifier.


--cskVUvouOv9G4JC6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5PCUgAKCRB4tDGHoIJi
0uJFAP9ZxreR5UcuqvEpcbnYm2L4r5oA/Kscp36IjeTqNO8CoQD8Cf+6H7qjtg1s
NCLjqaOagU1YyP0Z2/RmSeGOuFnEfwg=
=GEG4
-----END PGP SIGNATURE-----

--cskVUvouOv9G4JC6--

