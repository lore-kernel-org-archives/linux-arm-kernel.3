Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKdtDTaecC+HUonkVnwkzk/WVKXHYxo/bin0q3mo6cI=; b=esZb0HdnPS0uoJtyDrxAfEp5D4
	szUzdn/dnH6KWuHMUO+SgVMFsEyVyLLCsKHBvByXQHgDrwUDvx/bPvIzXP9umu8+8vhe3vb4otYPb
	kFpvW4SXtSdDrGX6ZCqdkaG0lkL5gz/HXwDxDkobprvfsqxJqWs9k2oYN41+sa0cA6AbvpEBrRUZI
	SvPFZSGVckY8gW1jVTavd8lxOIBmEkPbiIbTWx6dUAivCIN/X5P9BseRMd7pT4Tmqf3kicNaxRH0w
	u4EpDZeFf4Gxj+r5KaWN+VBOSyireFGtSltrDxEta7FVbn2J0ADIs6v36VM+69uhPGM3uFI+SkdYf
	eoHZluhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webtg-0000000HXQE-3kJu;
	Tue, 30 Jun 2026 17:05:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webtf-0000000HXQ4-3b6L;
	Tue, 30 Jun 2026 17:05:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FE4540B6E;
	Tue, 30 Jun 2026 17:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A30F1F000E9;
	Tue, 30 Jun 2026 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839119;
	bh=CKdtDTaecC+HUonkVnwkzk/WVKXHYxo/bin0q3mo6cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QWhGdiLk9DzqF3DaLu1vpSJ7yQJrFmB8W/+Sa1OCPTqCdKtpqn0ssYGwuSeOduNO2
	 oLzCLIqwjsR9Bi9LLwl/KQz2AXp3sh9zCP8Ve6JfO9JKcOQiN7bWYsOHjzlYIaHR18
	 uKLhH1ujQ6yREHvpEPuN2e/+2FwBKhH1C/O6BK/13sZks5Ngfkgi9r/gomicPxtDVo
	 GDGehdTp1d5BZlALab2CBT1er8cyxoYYWKR/4A7R76mOYJ3OoYzfSr1/n7yPUTifLw
	 puKZ+uQQJSP07LMxeUI/QNmdRrgE7Ng494kFEpgw3hKJatwdbB8VLhRbVw4VZUWtyX
	 Z2epO6g5EwFyg==
Date: Tue, 30 Jun 2026 18:05:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Gokul Praveen <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, nm@ti.com,
	robh@kernel.org, sjakhade@cadence.com, kristo@kernel.org,
	vigneshr@ti.com, vkoul@kernel.org, yamonkar@cadence.com
Subject: Re: [PATCH v3 net-next 2/2] dt-bindings: phy: cadence-torrent:
 Update property values to support 3 clocks
Message-ID: <20260630-chowder-unpleased-162d2c891ead@spud>
References: <20260630134324.61085-1-g-praveen@ti.com>
 <20260630134324.61085-3-g-praveen@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="claZfrcYDscXuJ3R"
Content-Disposition: inline
In-Reply-To: <20260630134324.61085-3-g-praveen@ti.com>
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

--claZfrcYDscXuJ3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 07:13:24PM +0530, Gokul Praveen wrote:
> Update maxItems value of "clocks" property to 3 as description of
> this parameter already indicates 3 clocks(refclk,pll1_refclk(optional)
> and phy_en_refclk(optional))
>=20
> Update the "clock-names" property as well with the 3 clocks.
>=20
> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> ---
>  .../devicetree/bindings/phy/phy-cadence-torrent.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.ya=
ml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> index 9af39b33646a..54fe78da297a 100644
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -34,7 +34,7 @@ properties:
> =20
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      description:
>        PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for =
PLL1).
>        pll1_refclk is optional and used for multi-protocol configurations=
 requiring
> @@ -47,7 +47,7 @@ properties:
>      minItems: 1
>      items:
>        - const: refclk
> -      - enum: [ pll1_refclk, phy_en_refclk ]
> +      - enum: [refclk, pll1_refclk, phy_en_refclk ]

This does not do what you want it to do, I would think, since it means
you can only have two clock names.

Additionally, please restrict 3 clocks to only whatever new TI device
actually has 3 clocks.

pw-bot: changes-requested

Thanks,
Conor.

> =20
>    reg:
>      minItems: 1
> --=20
> 2.34.1
>=20

--claZfrcYDscXuJ3R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP3SgAKCRB4tDGHoIJi
0mY1AQDA1BtEt2XQX/AY8otmFWna4lcOAOS4LCkehrqayL71ygEArP3hoqxqdl54
tnTH5YezNgF9fglzhsf8H1wpoHH5nwI=
=Og3T
-----END PGP SIGNATURE-----

--claZfrcYDscXuJ3R--

