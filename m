Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426BEC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35MWvWUX+y9FbjxI6z260ZVWsxzfCHFj7/oCaThUJWA=; b=SqtFkPWuhPe2vMtzherQs1jb8W
	I32RrrTj5uxyHs+na2DLsQMdkou7nkd0zGtNGx93eopCDCW+G8JBXNdhbGq+UeMliVovvH+vfKqcp
	inoUuiLR/mM8P44Ej54uygDVhLckmUVHf1SBLFaXsLhdZAtd5O9HPBNzQ/TP2tkZ4bzbgVt7PDkY3
	R+/Mu/MUfu8oGLzVfY1QdM4kxNHA0iJNTJ6mwWXbSn6T2eTn7QoxQXwkLlCosFOKePHdkmFKhyl32
	k5YWzHi9uxvkdBUSyMcfRGwqCr4GZWFRmrL/zx64peucZZ+0pc4s7+Bs4VKvuEnrMrlU8HUF6+wif
	i2A2E5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taI7H-00000008UOd-3nkS;
	Tue, 21 Jan 2025 17:32:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taI57-00000008U3s-1D1m;
	Tue, 21 Jan 2025 17:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3123F5C5A44;
	Tue, 21 Jan 2025 17:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56442C4CEDF;
	Tue, 21 Jan 2025 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737480628;
	bh=Govg89tiGbSn5yl9wzSlsxsIzUrVeToBKInXCkUD1UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyfPVyKzB1Cw46YjJnd5wRP11zBPA/rGHs4f7GcLunyOZEkHoGCizSoVGwm19rN30
	 Te4LA5dXTAHtqlEc29+BhrS+BTDWI7F7QBkGtDnRPK1n6UwE5t1tQ5odrHZR9Geke4
	 WlD+XGkjWaTF/zkbEczagQMu/y7x9DQ23ySs9r2TJRWe55wk9y4m2ajTP2HuUHcFMT
	 IWIv1JkTsmHzaZob77Z+FLHV1gEYE76BqlhOnGDVHEFR+zP5czc0LQrECjJH+wrFv2
	 6D3KB+btja9yJE2tQfIakNmxcdvMUsvdDfAy7VW6dUO1inwgY1aBJXC8Iy58GEEaw2
	 iT5o/kW0yS8bw==
Date: Tue, 21 Jan 2025 17:30:23 +0000
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
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset
 for MT8188
Message-ID: <20250121-violet-widely-df3567b085a4@spud>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
 <20250121065045.13514-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="234HpXv0PCqVfF3i"
Content-Disposition: inline
In-Reply-To: <20250121065045.13514-2-friday.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_093029_409246_B2D85F95 
X-CRM114-Status: GOOD (  15.77  )
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


--234HpXv0PCqVfF3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 02:50:40PM +0800, Friday Yang wrote:
> SMI LARBs require reset functions when applying clamp operations.
> Add '#reset-cells' for the clock controller located in image, camera
> and IPE subsystems.

A new required property is an abi break, please explain why this is
required. What are "SMI LARBs"? Why did things previously work without
acting as a reset controller?

>=20
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index 860570320545..2985c8c717d7 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -57,6 +57,27 @@ required:
>    - reg
>    - '#clock-cells'
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8188-camsys-rawa
> +              - mediatek,mt8188-camsys-rawb
> +              - mediatek,mt8188-camsys-yuva
> +              - mediatek,mt8188-camsys-yuvb
> +              - mediatek,mt8188-imgsys-wpe1
> +              - mediatek,mt8188-imgsys-wpe2
> +              - mediatek,mt8188-imgsys-wpe3
> +              - mediatek,mt8188-imgsys1-dip-nr
> +              - mediatek,mt8188-imgsys1-dip-top
> +              - mediatek,mt8188-ipesys
> +
> +    then:
> +      required:
> +        - '#reset-cells'
> +
>  additionalProperties: false
>=20
>  examples:
> --
> 2.46.0
>=20

--234HpXv0PCqVfF3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/ZrwAKCRB4tDGHoIJi
0pWsAPUdBV9ZoeWHEnWqUr1Shp9vd4lHhIWVWH6d7kO3PIJqAP4xDK4Kgf1eou4H
43tgZR/e7RChn/6kgYrsxa86J5XpAA==
=x+CA
-----END PGP SIGNATURE-----

--234HpXv0PCqVfF3i--

