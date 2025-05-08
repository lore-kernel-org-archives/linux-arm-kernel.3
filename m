Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1289C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djj95qnFO40rxDHNPDqQ6vDEoKiJ9+VbkQQvMeIbrLE=; b=mzeiHAqlbCvw3mF2+T205AgYbD
	L1NQY0Z8RNcxJB/oB1OoM6pN/w6+YekQBvZ3KITxRbiJRBP+IEXnux1EbhqsdnvqNeE1GLLhpYkiJ
	UwNb0WDVuPlB08KiuCmrSJt8Oe2vBvYpk4OpS6/OtLNACEDY7JRRk7/+B7LX4TBLrUdxA2LJqEvdF
	Y3WRyBOkAM/I6Oz60SLKwMt079PvTf8zOWnGwcH2FS8YZoe8b6O4kgIQPmzX9H5izCyg1Def43JhB
	plrsneBm4ieAifWql8vhLaq+Ww/DDszgdxYrdkOMmznl4CxgGAIYvkGTDFGs0XqyUDt3c9Tr0sndC
	7pOPjkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3i7-00000001E3x-3Tfa;
	Thu, 08 May 2025 16:02:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2mB-000000012Bp-2oVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBB475C6352;
	Thu,  8 May 2025 15:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54750C4CEE7;
	Thu,  8 May 2025 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716587;
	bh=3DNsZF/rv9M8mb8kdwzH/JQLJ+WZ40H/gUZWj96QXyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dR+pekXDvSag6gWmTVpXa6O20ICVVYkjfE/GasaYdL3+F9TUw3Tb9Q2d/SZqrD+zM
	 aGntAW6TR3VfEKycYDJZaKFxhppvioZFVjEhyGG5D5Vo6/ys9f1oGSR+w7CAMfHD9M
	 w4MapSDD2uUtXbNV6a2Q5/e6KHabQXFbr3GOvbOMMRZQ0DSM0U49BZjbe832edfQOu
	 77wgx9FbMWc3xcpmh8TrxjM4L+WaO+Dj/7Cq6wYHQG+1MXNWz1K0+Sly/3gjHK+kmB
	 KFjDG9k6h3582IC8z+H3Tnctafob54WWCEmncdlU4wyu173Ie1njqRvH3jHx03nEb3
	 fix7C51qweXlQ==
Date: Thu, 8 May 2025 16:03:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yannic Moog <y.moog@phytec.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, upstream@lists.phytec.de,
	Benjamin Hahn <b.hahn@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc
Message-ID: <20250508-harsh-refusal-523e1a67d5d0@spud>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
 <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
 <20250508-statistic-creation-ba17442921de@spud>
 <7819efd4-bf7f-45d3-b2b3-a3d33092f476@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xPi/7yiMGX4/St+Y"
Content-Disposition: inline
In-Reply-To: <7819efd4-bf7f-45d3-b2b3-a3d33092f476@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_080307_789259_49630AD8 
X-CRM114-Status: GOOD (  17.28  )
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


--xPi/7yiMGX4/St+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 04:59:08PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 16:57, Conor Dooley wrote:
> > On Wed, May 07, 2025 at 03:13:12PM +0200, Yannic Moog wrote:
> >> imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX =
95
> >> Plus FPSC SoM. Add its description and binding.
> >>
> >> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> >> ---
> >>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Document=
ation/devicetree/bindings/arm/fsl.yaml
> >> index 447054b52ea391f69d11409d51751a88bb8b539a..783550c61cd7e9aa12ffe7=
8bfaa74478c19e0797 100644
> >> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> >> @@ -1366,6 +1366,13 @@ properties:
> >>                - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
> >>            - const: fsl,imx95
> >> =20
> >> +      - description: PHYTEC i.MX 95 FPSC based Boards
> >> +        items:
> >> +          - enum:
> >> +            - phytec,imx95-libra-rdk-fpsc     # Libra-i.MX 95 FPSC
> >> +          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
> >> +          - const: fsl,imx95
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
>=20
> Yes, but this still needs indentation fixes.

Oh true, I didn't notice that the bot was actually warning here, not
borked.

--xPi/7yiMGX4/St+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzHpQAKCRB4tDGHoIJi
0n2jAP97O/s8ByCOsS91A2ZRQ4MCxwcULpEMDFOih3J5T6H1qQEA+tXf7LZjNWop
dlDT8OjObbKJwd/QRKHvuESKTwmRSAI=
=Sp3/
-----END PGP SIGNATURE-----

--xPi/7yiMGX4/St+Y--

