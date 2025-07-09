Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5223CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLzBkzMZx3nXjkG3sA+Jz4ZTdOlB3LKpk4gjEGSP4Qo=; b=Bu4XMkNMoDgEBroo2zGfUcSokQ
	9r3NE4Px9+h5Udb1z8Ge4QaFMKQZKl0kqIjDyB2hSVwzpNQnbRlf2RUHJZHisGT79xRLIyZmp9XYZ
	LQzl4oyJ6hTgcWnJZvMpxTw9U7x6XPVCRtYwlYORCFl8lWZ8AXbt+7Yg4Z2LfuSGmWVN1Z3dM5VAi
	UfrTrSkFO3ssoqYEYfGPlUAlss4G4PCM/r3pXOvcQH6mQ2+qtNN6rbFENkUtPD4ku6SlIJUAjcuqb
	WGIJWULzEssWYS071dbKXn/rCe9VEh3SOPbmmB6BboVKYEMezhMYvDeu1+LCr01VNp0ZHELIdz+H2
	/cT+yUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQTl-000000081FB-498X;
	Wed, 09 Jul 2025 08:48:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPCG-00000007oA5-0Hqn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 997C85C6684;
	Wed,  9 Jul 2025 07:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE05EC4CEF0;
	Wed,  9 Jul 2025 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752045986;
	bh=XGJO1qF1W88jDv2eYg4J5OBrEhD7F5oGqMlB4fWt0hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArGgHdYCKZHsx/nbUhRZhct5u/CYQqQXkROnnVmQgUpnfnLwDBWZl2erF0xvtbu+z
	 3IX8+1MzKkeL5/NrksE78L5M8ciRQzZjAWXcF6sdvSgtPPfKttGcUokP1Zbv/JfKP0
	 RngaMY2AK3Votb88feOEXLXj5/xxYSKmePwl4/NUBpbEDBcTxZ9bKu0zAoOr5muHLg
	 CCuVzmR7GIJIImbeN5Ki635W7gHy30bbZYEdevgkoZnsTI/o7vzM9GnXMGwk8t/+1A
	 Eo+ymv0XAJ0u46oXlN7DPQtr2erqhFq967A9PSD12h7G6yo02PbfoT5ALlMuMkLTMR
	 UcVXDNBgOOzGQ==
Date: Wed, 9 Jul 2025 09:26:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
Message-ID: <20250709-misty-coot-of-fantasy-cfadfa@houat>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-2-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3dp6stoy65fmjbt7"
Content-Disposition: inline
In-Reply-To: <20250704154628.3468793-2-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_002628_167003_78FB9134 
X-CRM114-Status: GOOD (  15.86  )
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


--3dp6stoy65fmjbt7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
MIME-Version: 1.0

Hi,

On Fri, Jul 04, 2025 at 05:46:18PM +0200, Paul Kocialkowski wrote:
> An interconnect can be attached to the sun6i-a31-csi device, which is
> useful to attach the dma memory offset. Add related properties.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-=
csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.=
yaml
> index 1aa5775ba2bc..978ef2dc0ae7 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -40,6 +40,12 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: dma-mem
> +

Is it really optional? My experience (despite being a bit outdated by
now) was that it was required for some SoCs, and missing for others.

Maxime

--3dp6stoy65fmjbt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG4ZmwAKCRAnX84Zoj2+
dpfVAX4m0wIWlJi7yTBavd5fvPfWar3XkMuz34mrDcOQKDkPGg6ob/DSG06XQSRv
JJDzvQQBfiDmcqsRoWtB2xTB/bD41pJBDgPdtqT5a0O13DZ464l3NFGDW16/98ZH
pKK5MMhi4w==
=m340
-----END PGP SIGNATURE-----

--3dp6stoy65fmjbt7--

