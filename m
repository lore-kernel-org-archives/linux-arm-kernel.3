Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CA6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEBCki9ayMbV6Qed2l65ek3aCSGWyzF7EZ3e2n1c7SE=; b=fmL+6e06goe86GLtAhasgNfsOP
	yQ4qH52ROoFPww0XTfMDuo/lHhBnPGn+WvjMQGZxXzf29BWVizqCjvbVxGVjjMLOtceINzYJzF7jg
	imRjAgJ/osbokcrEm+HbxgUJHDx6hbV4DM7lR1uoVeN7XH6k1GAvr39zgp4AmQMULFmjNfKSnOkwz
	u9VCjLTMpI7u+RHIC+ClwhUjrJYiXPmpwQuugW/XzeCXTFeAX5rGikCvlh3LntxV4Rd6bxXsOAGrK
	iEbfu4OXGW+4jbux7y85YmkDWpJ5E19I7sfPXb5XuTCcHNwfOoN+Gk2jfIBDox93JKQUt5k11Utxe
	0OVs8iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNHv-00000008Pby-1bpv;
	Sun, 22 Dec 2024 14:50:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNGP-00000008PQW-2eYz;
	Sun, 22 Dec 2024 14:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 410C45C4C02;
	Sun, 22 Dec 2024 14:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BDFC4CECD;
	Sun, 22 Dec 2024 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734878940;
	bh=+0JuRS1+pxAE7ViJS52geGKtFuPTzF7INi/AI1l7fkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwOLa0NHJg75u0bw8qHidkLoSBn5jKkmZC1XT8plBAgmnxG/sNYZiGlOccGTI5au4
	 R5DZYXI8LnEul7stQRXMANXJTpszvPGv1tgzUoI05NzCWx/NdKT6YcqwqU2rMDXYOT
	 SYJrVHIkcPWgafe0I9yxj+9V6OFG8/aGMMXC8xLBWx9kQZ2CEwSB66o7jMle9QuO35
	 PMTBxpTonZtnvnVSjp107MUWp13uevi4ycI+cuMYYDiHkBpk6AIbPWB1iCoPHOafbw
	 FKrCr2E/WL5Oa1B0/4/i/AGfxjRTAKq2wZgzClIo7/e440NCKW2b/rs9lmQGX9XD3C
	 z9IBxv7un4sEg==
Date: Sun, 22 Dec 2024 14:48:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/38] dt-bindings: pinctrl: Add rk3562 pinctrl support
Message-ID: <20241222-moonscape-humongous-65531a3f1f3d@spud>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-5-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ALomkr6kdjlU1kTz"
Content-Disposition: inline
In-Reply-To: <20241220103825.3509421-5-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_064901_722690_55FB63A4 
X-CRM114-Status: GOOD (  12.07  )
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


--ALomkr6kdjlU1kTz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 06:37:50PM +0800, Kever Yang wrote:
> Add the compatible string for the rk3562 SoC.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>=20
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 6a23d845f1f2..80a2b1934849 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -44,6 +44,7 @@ properties:
>        - rockchip,rk3328-pinctrl
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
> +      - rockchip,rk3562-pinctrl
>        - rockchip,rk3568-pinctrl
>        - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
> --=20
> 2.25.1
>=20

--ALomkr6kdjlU1kTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2gm2AAKCRB4tDGHoIJi
0rJ+AP9jKt+goJkQoANa5w9EFvOUIPEWZxBmo2FrqduMEy2E+wD/Xk92XG4/tpD1
TvQLAzDCEXwa95oanEMJEx9Ov5WmpQg=
=cZw4
-----END PGP SIGNATURE-----

--ALomkr6kdjlU1kTz--

