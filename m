Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A883CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QabSLVPA7fSl4+rR677b3m8JFRZcswd5u1cf4GSmO4s=; b=po79BIv+YTYCKIjl8MwnywNVG3
	hKmWg3if9rfWkBKc8DiyjJBY6TWEgCkuS/2Z8poDuAL4+D9tIH/4F4U/ez8zanbApHk79x0Nkg4ZY
	ggWKfTMamGkFDCX86A8pxutMxS/3MFPWbnsIFskBGxNMdDc8ulAX54hFVtRdqLMx28xaKgHKbbVCT
	krRmS3ucrF1m0urVADOwhMAt3VJySDQNGZIdwCCj3DVdnDHfv0yVqf7DRI7xjHPvSp34vVg00K3jU
	ZaVokhsnoR8T0gasBE3CiU/siR5BKNcFKgMehZ8/gYRNYDxqrh7DfxD5nbhCeX3x1Bh0XsMIoEnLs
	WxSlyuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMfL-00000006kSW-1IBm;
	Fri, 08 May 2026 14:58:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMfJ-00000006kRM-1ddm;
	Fri, 08 May 2026 14:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0A2243D59;
	Fri,  8 May 2026 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E094C2BCC7;
	Fri,  8 May 2026 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252336;
	bh=iU8xvemEPvi13FOszxkwNqtqWHubaRoaKkMRSG+6ycA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHZc6wPeiZFMKCv3PPNH/MsE9nhhIcWtz8SLdXtZFdiQSGW0KCJ7ntCNcdeTt8hst
	 VXPAm2llVXvR8ObNmmTXsD7762ZhjI/Iyv5dMGfbv3YAEaigSXhsNAZBKv8q3y5acF
	 XWQ+LoLWePEVaan/qddmPNfWzUIPFyrQ1iUJ8ub38XT8KL+7RneMLiKfhA37KEAUqc
	 mEpY3G+/+SSfxTJQPfNQ3uMtKDG3yFkl6ZalpNBYdHOx1VwRSHGmL5yO6X88Te/Qwx
	 8ofX4rUQlFdho6YTjU+uiqNVxl6rEtQyksap4yoOqS6Z2Uo370sMEE/QkLpkPT6IGW
	 G2yqqGUPTEqJg==
Date: Fri, 8 May 2026 15:58:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
Message-ID: <20260508-lasso-catcall-393c97e3a258@spud>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-1-cf8d725d8821@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="89dAeV3S41oOtMTA"
Content-Disposition: inline
In-Reply-To: <20260508-rpi-otp-driver-v4-1-cf8d725d8821@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_075857_469350_0FBECA64 
X-CRM114-Status: GOOD (  15.83  )
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


--89dAeV3S41oOtMTA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 04:42:44PM +0200, Gregor Herburger wrote:
> Add a compatible string for the bcm2712 firmware. The bcm2712-firmware
> is compatible with the bcm2835-firmware so allow the bcm2835-firmware as
> fallback.
>=20
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml        | 11 +++++=
+++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index 983ea80eaec9..a3a5243b9170 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -21,9 +21,14 @@ select:
> =20
>  properties:
>    compatible:
> -    items:
> -      - const: raspberrypi,bcm2835-firmware
> -      - const: simple-mfd
> +    oneOf:
> +      - items:
> +          - const: raspberrypi,bcm2835-firmware
> +          - const: simple-mfd
> +      - items:
> +          - const: raspberrypi,bcm2712-firmware
> +          - const: raspberrypi,bcm2835-firmware
> +          - const: simple-mfd
> =20
>    mboxes:
>      maxItems: 1
>=20
> --=20
> 2.47.3
>=20

--89dAeV3S41oOtMTA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf36KwAKCRB4tDGHoIJi
0ny3AP4uWOY9MtPYzPYsTZvAtLSYdIfWpcZzL4yudt7quTegjQEAwzBXfuk5eRM3
cvjo/yvG+jikUFJNznNFJlR/HjTKpwI=
=mT8k
-----END PGP SIGNATURE-----

--89dAeV3S41oOtMTA--

