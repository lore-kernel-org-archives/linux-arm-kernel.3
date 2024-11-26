Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCCAD65536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIhnN3RgewEECsR6CKJsLcR2IBFDgyEZr8cfG+WwY4M=; b=HhDyXaizENwEez+MgPOk3oiA60
	kJzUUPH4jPhSmgiI8DmI2sMIZijrhxCEWjFN12+15zf9mAAkktSTBwSuSSu1xivKUll3c2RuTeIf0
	nPUC+febDeQep4klHS/Tl5lAopzEliBAbpHoFhS4jLM9MRZXHT7TbfZDBdOaSHBuJShE8bx+YzVMU
	OT337tHiTT8uw6VeDdIu/DmdCVI4kvPeq43CPPZRfxWmfKNDDWsfiGyaugFpLxgl3r1I0OPlTbbkn
	p0DW63g+XDjxcXNhoKhpMmn1h8Xuggwqvqifa6ROOj7PcrRLPmt1CdJ0a1QHKVHC5fR2mTMYdZgRg
	nTbbAJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzcm-0000000BLK1-2OBf;
	Tue, 26 Nov 2024 17:45:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFzbo-0000000BLBT-1edi;
	Tue, 26 Nov 2024 17:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63E865C4328;
	Tue, 26 Nov 2024 17:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27BAC4CECF;
	Tue, 26 Nov 2024 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732643059;
	bh=H+B1pmwxkp1dv88qtjfJSxvPjDOd7r063O1/Yfy0BFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpKV1Hhq7cwiwPfR81pTvR4jA9M2AofYd8uf7eG5wecW99jo0uQaBEdqORgLa3oAH
	 tGnAJxDhuxiPdPOzioql4BcjDMVVJf1nKlAdSX96ZXo2eVUBzFjq12DmeyQ3XCU5Vt
	 Zl0J40NLZvc8b9SftfW79MnyGihjfn6LoJyha71k90VWumhTEghsyIsyQOH8AEmwtX
	 WBryR76k5fhob/QWDKTrPuvMi56i46c18MI5Ttchh0ShuurAEN7o9JN6TL9ogPelZc
	 0ybUgKvLxPmHG70OcuhGCw8EAmhpTUJCIbatDuiVPdpiHpjS7JLeGV7ErKPfxqIAa2
	 Lyd2nq4sVde5g==
Date: Tue, 26 Nov 2024 17:44:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY
 schema
Message-ID: <20241126-pastrami-gusty-8b9df32ae00c@spud>
References: <20241126131736.465111-1-heiko@sntech.de>
 <20241126131736.465111-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g+V6TT2oeeGyoz7X"
Content-Disposition: inline
In-Reply-To: <20241126131736.465111-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_094420_474322_DB49203F 
X-CRM114-Status: GOOD (  15.15  )
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


--g+V6TT2oeeGyoz7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 02:17:34PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Add dt-binding schema for the MIPI C-/D-PHY found on
> Rockchip RK3588 SoCs.
>=20
> Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588=
-mipi-dcphy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-d=
cphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcph=
y.yaml
> new file mode 100644
> index 000000000000..c8ff5ba22a86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.ya=
ml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/rockchip,rk3588-mipi-dcphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip MIPI D-/C-PHY with Samsung IP block
> +
> +maintainers:
> +  - Guochun Huang <hero.huang@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3576-mipi-dcphy
> +      - rockchip,rk3588-mipi-dcphy

How many phys do each of these SoCs have?

--g+V6TT2oeeGyoz7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YI7gAKCRB4tDGHoIJi
0uLsAQCgiUeTJIfJn0aeODBRIBm/tzLSKrztICS5Y7I3++Ae1QEAljjpGbDuyu90
nr0OwQId+7pypocuTFIbd8uRgymesAU=
=OpzG
-----END PGP SIGNATURE-----

--g+V6TT2oeeGyoz7X--

