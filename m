Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3175C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23KGlzAt+WcwB7TgM1tqYpATLAeQI369KvzlaxAAIO0=; b=Exlf1UV9GD0p3Ot//SxAb72D8z
	kkSm9ENin1PbfpJH/bGtfmLu8u3oh9Pr269PXvD8+P9A6zCgOobTunZR+Q2/HIHR6DGWqUiwYJGIN
	+HjDcTE0m5DEi673ikfWxa5pgr+SmPNSOQH53D9TouHb6UeriDpLA5yAmRzt5S4w87HIuivFul9TJ
	gX2vSN3nfmr/BFw0x/0FigKVvnvt+1qJfYVc9udNj5nYBQBxHxoyxa8Jmqs08rmwl+3AtV2PaKSOB
	MMraKd+HYYfUAawsg9eUpQ4W5QyiFC+c21AYclsnXCqhQG7CPcWcD8JGhr5lHdZdufnfxxcChUMY0
	X329mXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvtR-000000050ng-0irE;
	Tue, 11 Feb 2025 19:26:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuq6-00000004out-34Vs;
	Tue, 11 Feb 2025 18:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2CC15C41C4;
	Tue, 11 Feb 2025 18:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DA8C4CEDD;
	Tue, 11 Feb 2025 18:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739297909;
	bh=cE4jcsAX2FB7uvZhLWO9AMcWcOaQ1ZV8xgeqqsLhxAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FO7tv1K6drxWVq7uoFgvOKH9m4xyJAD00rlHVuiIu/apLLCjiLCU2t0Z2ggEOEPCu
	 rM2PBdCJsX7wTz/49XKW4//7sk6YXeF8JEwDlbxd5FK0O1tGGvxgY+DVa5IRRGlHnJ
	 NKzJwKgcw1Hx2lyhPdbclbmVPpWcY7aNWDIJ8BaNlcPKPnXN7lRQ4EETZgevJWCCpG
	 fABcr+pxuuSY9JyiaRnwivJ5x3MVGihPBLldfdLIzZKvL9hypU5VLNPnAbhIhGX6ZB
	 KXh0m/92ptmm8D6NwXPnWEVt+p0WxBnF80K3Mad6OUVg3CCsANQJMBsQyhk3ztFSoL
	 M29vTBxJN7ySA==
Date: Tue, 11 Feb 2025 18:18:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: soc@lists.linux.dev, Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from
 riscv into soc, add SG2000
Message-ID: <20250211-squishy-blip-8ac4cf64d462@spud>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3/BNf11h93vTDDr6"
Content-Disposition: inline
In-Reply-To: <20250210220951.1248533-3-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_101830_862164_C5E9C10B 
X-CRM114-Status: GOOD (  15.28  )
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


--3/BNf11h93vTDDr6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:09:42PM +0100, Alexander Sverdlin wrote:
> Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
> all SoCs containing ARM cores as well. This already applies to SG2002.
>=20
> Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/{riscv =3D> soc/sophgo}/sophgo.yaml  | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{riscv =3D> soc/sophgo}/sophgo.=
yaml (80%)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docume=
ntation/devicetree/bindings/soc/sophgo/sophgo.yaml
> similarity index 80%
> rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
> rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> index a14cb10ff3f0..5d73d0ccc547 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: Sophgo SoC-based boards
> @@ -26,6 +26,11 @@ properties:
>            - enum:
>                - sophgo,huashan-pi
>            - const: sophgo,cv1812h
> +      - items:
> +          - enum:
> +              - milkv,duo-module-01-evb
> +          - const: milkv,duo-module-01
> +          - const: sophgo,sg2000
>        - items:
>            - enum:
>                - sipeed,licheerv-nano-b
> --=20
> 2.48.1
>=20

--3/BNf11h93vTDDr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uUbwAKCRB4tDGHoIJi
0iP8AP9Mc/wlam2GgeEuieW+XaQ1w6dG0Bj4kXG2xUCIG5ayXgD/UBsEkKFcu+7I
ozzxFKHl9x4z4ZZ2vx1qTuKO/mt7JA4=
=SHXJ
-----END PGP SIGNATURE-----

--3/BNf11h93vTDDr6--

