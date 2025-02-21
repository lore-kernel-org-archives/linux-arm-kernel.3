Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31E1C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cFf3ZwDxIYx/5yEXExCL4qhSuwo33een15heIA/zVk=; b=h5KJCR4ufKc3D8IbSIyWnC7dKj
	v530WC8eRdPX4VKDfyvvLRIM4IHTT+xICAFtGeZX5+hgoCjcRsO6CdErEnZpwVFAbw48s7mACah8v
	XMPMQ/eTtplvB6V6Ty5nMkRhhAYABxqfcCr33s/NpJuXmngBFBYDmoaZMRwvp0TG1oDLoi/wEi5QQ
	A2m2ek3oIspSjs2q5pTldZxocTksMGpr7YGRU2cSuQa6XqcBfW51XxX3coaFmWzLN7byxd67oCuX2
	oLDb8xpntrK52xQDsA4q2uSygx0d6jSzZIh+7HETMzp41rGQ3bPPxlf1vjX1gQpeCp+6kYicyckzD
	xaJT23wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWMT-00000006HXk-05fH;
	Fri, 21 Feb 2025 16:58:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWL0-00000006HLu-2rZj;
	Fri, 21 Feb 2025 16:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A65C76150C;
	Fri, 21 Feb 2025 16:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB91BC4CEE2;
	Fri, 21 Feb 2025 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157037;
	bh=Zermek77njNBefiJAHShs4Pi/BmVFoEIkevP8SsNO7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjnfJHw4iEGxUc/9qW1y7MXbhibKG8rh7AogVr9UljZJegm57+LQQHRNYxKckJ7CF
	 FWayh52wKAV7sxOYBy2yRP1kIBucfaUT//Oz6Smay5wM4rX3aDy1XWtHwWW7TEQmw3
	 SptwbeiWbL/fTdM1HOAih5VwfFervTEScmXCZsx8pEdHzYHE8WrTynaqiBwG4OZ6Ke
	 vDGpq5FRy5051igtlr0CdoKc2Eih2iIJKMOuJP390ZByyLDQ2pj0Fwqyp9YV6FQXND
	 O04FwzPPaYC+BJYhF3zEGDLtqIbpBXVRvhPU3jEGlY5r9nvEPOEH4m0Pu+KdL2FdgE
	 +dM9ARU52UE5A==
Date: Fri, 21 Feb 2025 16:57:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Yong Wu <yong.wu@mediatek.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Message-ID: <20250221-cavalier-property-7e7eceba7bc6@spud>
References: <20250221075058.14180-1-friday.yang@mediatek.com>
 <20250221075058.14180-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+dgGrOCgl0PEyxI6"
Content-Disposition: inline
In-Reply-To: <20250221075058.14180-2-friday.yang@mediatek.com>
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


--+dgGrOCgl0PEyxI6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 03:50:53PM +0800, Friday Yang wrote:
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
>=20
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
>=20
> For previous discussion on the direction of the code modifications,
> please refer to:
> https://lore.kernel.org/all/CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=3D
> wXpobDWU1CnvkA@mail.gmail.com/
> https://lore.kernel.org/all/CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8ey
> hP+KJ5Fasm2rFg@mail.gmail.com/
>=20
> On the MediaTek MT8188 SoC platform, we encountered power-off failures
> and SMI bus hang issues during camera stress tests. The issue arises
> because bus glitches are sometimes produced when MTCMOS powers on or
> off. While this is fairly normal, the software must handle these
> glitches to avoid mistaking them for transaction signals. What's
> more, this issue emerged only after the initial upstreaming of this
> binding. Without these patches, the SMI becomes unstable during camera
> stress tests.
>=20
> The software solutions can be summarized as follows:
>=20
> 1. Use CLAMP to disable the SMI sub-common port after turning off the
>    LARB CG and before turning off the LARB MTCMOS.
> 2. Use CLAMP to disable/enable the SMI sub-common port.
> 3. Implement an AXI reset for SMI LARBs.
>=20
> This patch add '#reset-cells' for the clock controller located in image,
> camera and IPE subsystems.
>=20
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+dgGrOCgl0PEyxI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7iwaAAKCRB4tDGHoIJi
0uzgAP4v0yoFN7BfxFWWiitccUXoshHXQp4HLPtHW7d1YoN4TAD+IQ2jThGJf4Pc
L5rsRAnTiFrghIbu/VG+WOs0atI7nAI=
=soR+
-----END PGP SIGNATURE-----

--+dgGrOCgl0PEyxI6--

