Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74EFC54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO+3IyFvCCK/4tEYVBTK7x1BGidnVIKOJDEzSmiLFVQ=; b=V5VXmkjzYuWuTop09rNQXecTnZ
	kfyNqri95eeCnqXMUdbx+z5T0/cJC5X4f4TUqkcPqLN19/XyAZjN7FDgbcSBLXFHVhxO7sgg00oTu
	X/qX/iYLaNkwBOk+kYosl33lN0WMLMe32QHJk7JGwMqzeUp/xKXIWWgXCr9AtEcd7h9wx2JkTQwvY
	yTp05ivPRXEavlrO+1hSgrWRBPhHiRfcrqcS19BbWIvdkPgzI17rGhxN+G75TWL8EupTcVBCrh2qb
	U3cD9nY9g2R1z3DbEE61o/1POry8PbIZtjE0JzMQ6sMWj5J+dg4B8yRzsGtX16ObZXZn6zBrRcsgp
	Z+5K356g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4I6-00000009xxJ-2yEe;
	Mon, 19 May 2025 17:28:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Wa-00000009q4u-1FHF;
	Mon, 19 May 2025 16:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C28024AAA1;
	Mon, 19 May 2025 16:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31193C4CEE4;
	Mon, 19 May 2025 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747672775;
	bh=GX9Qj2ylG5i74myAAsHfk2ONtONtLM/ds6uhY2pLujQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRHp0jDqfAOLN1wEFih56Maz86WsbkL/gu6gA+5rOc/aO64DCVaZ0DfysUKuSoHy6
	 fJAPNV6o9ertPmlCBxSpHolI9X3sp39HesR24mMb/sChtjyDRF0/5WvUg7u1do1v5S
	 28EpEMut/7CPrAs0iTBPNOgjTxKeuZ+evOLwhzvygU5CkPYfyZYMHYgdrbDPAOROLD
	 0o3ftPGARPKXvF/QnlhWGwJ7E1qCi4D9u15OBcWd2ag9ffLO4k7SkNpZW3GAUHqhE5
	 LjpQ7mbT3FFzUWdvtd1S+TNyHXxcNLz6Ykqg6OkY+1XSRvINiO2e5JyjQGvGvpCJlc
	 cAV8MYSAsT8fQ==
Date: Mon, 19 May 2025 17:39:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <20250519-smell-exhume-df5ee34e31bb@spud>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TLrji4TZnIyWLWDI"
Content-Disposition: inline
In-Reply-To: <20250519161612.14261-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_093936_352430_1310BA21 
X-CRM114-Status: GOOD (  14.87  )
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


--TLrji4TZnIyWLWDI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 04:16:08PM +0000, Yao Zi wrote:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 888e6b2aac5a..969d7b1850d6 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - rockchip,rk3528-naneng-combphy
>        - rockchip,rk3562-naneng-combphy
>        - rockchip,rk3568-naneng-combphy
>        - rockchip,rk3576-naneng-combphy
> @@ -102,7 +103,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-naneng-combphy
> +            enum:
> +              - rockchip,rk3528-naneng-combphy
> +              - rockchip,rk3588-naneng-combphy
>      then:
>        properties:
>          resets:
> --=20
> 2.49.0
>=20

--TLrji4TZnIyWLWDI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtewQAKCRB4tDGHoIJi
0lfYAQCtx96m/d5SWp3Mrz93mwH0LkNmQvVyWrBwI/VYaC49sgEAuh+Qt21wI2md
Nx9jIB2xPDYbGdylaq36IjXZQc6inwQ=
=eg7H
-----END PGP SIGNATURE-----

--TLrji4TZnIyWLWDI--

