Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF6AD6A223
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6dBykdwh+0xG81aAM8UgAaNh3vOpi5NLR1+ZZkgWB4=; b=Kq+3j+hlu3IlNCPYiE7z7KV6mi
	FNBBgYjHARR4DAK0ZLxd24k1kMxexrg4aFZTjcUNelrOxK1RR6NG4EdrL8+kgTdRkae2MmiZ1nCjo
	umgqLWaBmW9qYraPs2BhV36Mzu5reX63C3k4tHhbCggs7APrSBNPGQQQfMLVjOkYPdq9LBjK8JX31
	iEaKpzZji6f0+wLlwxCvKNufuLsgPAy/yxjZp/C2sOkjrODdkVr0leczBPnaDP0Exhhz6Sqa6zYXw
	Mabg4zX93clfWaDLlp494ADOhj+CBk+3yr6Rfxino4EdIBSh6EMNUls7NSYbRK/oEI3uRtvW3bW5X
	Lcy8GEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdv4-00000000NT5-2sKw;
	Thu, 14 Nov 2024 17:46:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdu6-00000000N1H-2nsw;
	Thu, 14 Nov 2024 17:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF3E1A40C92;
	Thu, 14 Nov 2024 17:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF05DC4CED0;
	Thu, 14 Nov 2024 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731606312;
	bh=g2Nti/vf3sUh6QVaYsrF23szsr80tZFZx8AOgvPabRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+fsqv1glf0GmgzH6OSjBqoombd9ydRBitGr7WMDXZ7M+kbjT0zIQHzmfVmKwMWoa
	 fE+ilVhIy3AfBcBmjSUsQSk+8DHW5ORHxtCGp988nYZXeC/VyvLAGm/4WQHhCkVtwO
	 G9H6V3P03U1g07EebDTsHjOFSwgRx9TXoHPoS1BNkZvRBCayrSGDWTvlIHTSRYB3dx
	 fWYf36G1GPwYZXBEJzKEE1OB2VnYCr2z31aemas+incrKM6EOvrmq9K3M5/kgbsibP
	 1ZZfUJ0PcFchtMGZulz+q2n3Y09WJc59G7TKz/pMhrroyugMM/Nieq3e+5Ji1h0NFm
	 AOOeeuVUt6HUA==
Date: Thu, 14 Nov 2024 17:45:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to
 usb-switch.yaml
Message-ID: <20241114-marmalade-bottling-8fe656515ee7@spud>
References: <20241114102203.4065533-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tOtGMvqBontwFfXh"
Content-Disposition: inline
In-Reply-To: <20241114102203.4065533-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_094514_772252_2B2D9997 
X-CRM114-Status: GOOD (  14.90  )
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


--tOtGMvqBontwFfXh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 06:22:03PM +0800, Xu Yang wrote:
> The i.MX95 usb-phy can work with or without orientation-switch. With
> current setting, if usb-phy works without orientation-switch, the
> dt-schema check will show below error:
>=20
> phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb=
-phy.yaml#
>=20
> This will add a condition to optionally refer to usb-switch.yaml.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

$subject is not what the patch does.

> ---
>  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yam=
l b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> index 6d6d211883ae..1238792157f8 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> @@ -118,6 +118,8 @@ allOf:
>            contains:
>              enum:
>                - fsl,imx95-usb-phy
> +      required:
> +        - orientation-switch
>      then:
>        $ref: /schemas/usb/usb-switch.yaml#
> =20
> --=20
> 2.34.1
>=20

--tOtGMvqBontwFfXh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzY3IwAKCRB4tDGHoIJi
0lZiAPsGD+L5kP752Lq06LoPa8MBvAshVTvc47iKq4VPeQ5BmAD7BdOzlk6wBkqL
VeQlwYSD0nAuy3ALgJk41OF0j5zyiAA=
=c160
-----END PGP SIGNATURE-----

--tOtGMvqBontwFfXh--

