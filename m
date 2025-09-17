Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756FCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PHckU4/rAfzUeggg94CCl67R0R1GyRq81SlcnTCUKU=; b=1/iNlsdAblJ5hxSnPemTzI+8EA
	M7xeh/eYCTZx+q4pt1axwtCJo84R80IR/eLlQ76S2Uu3OGCYAhwddjhiZJbzS7yDuJqxto4EihTyd
	kMcv9OF5DTi+vDDWQO+gnopl/xROCCoIRgnKbjsmBbrMqRIBPAsU3cmHs5u1MdIuLmaC/RGRsCEfd
	mnrBkN6LArqgsoI1K47xz72xzPqDs0FZrauQaDFHHfhJkSgavEXaXED9d6XOwIVOZDH6g2kR9/sup
	dq8ZKN8uM0Kk4r10UxptxoBD8c/sGbfBsagRo2qmKEJm36ezQJ2iqfl1/QeONvlAg6ybPHb8e42ZH
	ScB6a4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxz9-0000000ELJi-2kUR;
	Wed, 17 Sep 2025 19:38:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxz8-0000000ELIZ-204u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6C73601E9;
	Wed, 17 Sep 2025 19:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4B6C4CEE7;
	Wed, 17 Sep 2025 19:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137913;
	bh=I2AI4BKkKagGVUrVHimGZofS8/2mTShePgfHGGxipNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFbRYeMGR/o/BJukbFrXOw9dXANO1Q319+ChFzDZz1efuhl2AvFA4ZkUpf9Ja5Byj
	 kAs2X3gD0hX3u+p+r5xqeicUbv6YWx4CRoURTLTM31KVA8xnO1fKX2kbOZT3k/pzzx
	 SJFUNlBfWm0cugPN5PMsh8WVgZSWouoWOyEQ/3S1Wn5WB10C/e8sAABoEeynKJIWxJ
	 MpDSc/I2Kr86NiO58vERp3J9nVueHTa0VzHluvRKyRywO5PXfA8DVz1rdCTpOQ9nYS
	 WNveoFVE18QI60NNTM3cs4H/LXBZgPzL7nSVQ9RCqgzhEcBz01dE5xTJw77myyQozJ
	 vtcHLQtlQnumA==
Date: Wed, 17 Sep 2025 20:38:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: claudiu.beznea@tuxon.dev, sre@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	linux@armlinux.org.uk, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: reset: atmel,sama5d2-shdwc:
 add lpm binding
Message-ID: <20250917-zeppelin-stoppage-0d0f876df93e@spud>
References: <cover.1758051358.git.Ryan.Wanner@microchip.com>
 <d8fc40a97008cb0b4001684b3c9e1cc4bf3fb706.1758051358.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b4L9u9zjttjH2OaC"
Content-Disposition: inline
In-Reply-To: <d8fc40a97008cb0b4001684b3c9e1cc4bf3fb706.1758051358.git.Ryan.Wanner@microchip.com>
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


--b4L9u9zjttjH2OaC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 12:50:30PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Varshini Rajendran <varshini.rajendran@microchip.com>
>=20
> Add microchip,lpm-connection binding which allows to specify the devices
> the SHDWC's Low Power Mode pin is connected to.
>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> [ryan.wanner@microchip.com: Add sam9x7-shdwc SoC to properties check]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../power/reset/atmel,sama5d2-shdwc.yaml      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-=
shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-sh=
dwc.yaml
> index 9c34249b2d6d..668b541eb44c 100644
> --- a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.y=
aml
> +++ b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.y=
aml
> @@ -56,6 +56,13 @@ properties:
>      description: enable real-time timer wake-up
>      type: boolean
> =20
> +  microchip,lpm-connection:
> +    description:
> +      List of phandles to devices which are connected to SHDWC's Low Pow=
er Mode Pin.
> +      The LPM pin is used to idicate to an external power supply or devi=
ce to enter
> +      or exit a special powering state.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

This sounds like you're some kind of power-domain provider. Why doesn't
that generic kind of thing work for you?

> +
>  patternProperties:
>    "^input@[0-15]$":
>      description:
> @@ -96,6 +103,18 @@ allOf:
>        properties:
>          atmel,wakeup-rtt-timer: false
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - atmel,sama5d2-shdwc
> +              - microchip,sam9x60-shdwc
> +              - microchip,sam9x7-shdwc
> +    then:
> +      properties:
> +        microchip,lpm-connection: false
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.43.0
>=20

--b4L9u9zjttjH2OaC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsONAAKCRB4tDGHoIJi
0khOAP4w+nqJZTDRdwIeHuDir6MUFS8oTf5bETZiaLu4/AUpSgD/X3WcFvUR5xsN
MyuU9dCTT8Z0XR1E5SE8px0sU/PsJgs=
=OrR5
-----END PGP SIGNATURE-----

--b4L9u9zjttjH2OaC--

