Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64720CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHPfe0QYgHEmkA9TlmGkgKSd+x0zzxNMDdPgHzMMpeY=; b=k4p3RrDGCh25HAbKP0WpJZYxoc
	WXy3uqupYjZ7ag6Bn/An3yPIGrpXrszEJ9w/fh3fW4qt5rn8GqxW5NBp+96n7RSRtE7ieVrJ+KHau
	NnwxjSnH2jfoqByh7wTxaGlsOfKHEqm6yngrtDYITdH26ZjXqKA1kJiMfsjloN+ePO2T6WjBTzp1F
	NYlTd7nSXEe006eSptWm7CF8xY5Do87txHFr2w5lVJWGsRiPqr8Xp6dotISMVfkrd4QRb1ee4rmV8
	Zt85SNoT5r9RMuId4okGuYcIad+bxlWv7s2l458ggxEocnyp0+dEPcsVvJn76uHlM4/rty8d9wKhh
	N8xfcEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rpu-0000000CPE0-1PMy;
	Thu, 25 Sep 2025 19:41:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rpt-0000000CPDM-03Za;
	Thu, 25 Sep 2025 19:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A1C061219;
	Thu, 25 Sep 2025 19:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FBBC4CEF0;
	Thu, 25 Sep 2025 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758829260;
	bh=ViA5pc3Tho/YfhUjfRLL2YX34M7Tl+XYrQGrX1MRlWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOiLZG7qujcbYL14RHm0Jy1r66U2dBjwkUHV+/MnHyXa/YvI4dJWMgtWAYVfckoFY
	 eMUJcEhRLKgE137/qMcmLwc3Ayj2sICdtJxR0xsLVzRNbHw/I9BlK4Orza1aRR8A5V
	 cpfulSKEBcN6iFp8jejX6uhx2E5AGp+PPcMigZ5d2jWRQEzTg12t6fe9FqQ4CJlKCY
	 YgC2Zk2w7uEwLS9xuEklTvS/RFiWhSgUQ0m2lQvZdTxAt3+SlznIeI4+HZLkkqaVaD
	 3yVpxrwPP2hKtRZ06nhavgI0IF2031ZBnrFqaINDg1ekXCBKBa55E5x6a6BKM1ouF6
	 UFDv2nio5MFWQ==
Date: Thu, 25 Sep 2025 20:40:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
Message-ID: <20250925-outlying-causal-015d8ba33c53@spud>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-2-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DEAMv2iXlbCNcm+O"
Content-Disposition: inline
In-Reply-To: <20250925000416.2408457-2-svarbanov@suse.de>
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


--DEAMv2iXlbCNcm+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 03:04:13AM +0300, Stanimir Varbanov wrote:
> Document dt-bindings for Raspberry Pi's RP1 ADC.
>=20
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
>  .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,r=
p1-adc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.=
yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> new file mode 100644
> index 000000000000..5266b253fd2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rasberry Pi RP1 ADC device
> +
> +maintainers:
> +  - Stanimir Varbanov <svarbanov@suse.de>
> +
> +description: |
> +  The RP1 ADC is a five input successive-approximation ADC with 12-bit
> +  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
> +  and one internal temperature sensor.
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,rp1-adc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vref-supply:
> +    description:
> +      Reference voltage regulator 3.3V.

Looks like you're missing the io-channels-cells property that allows
this device to be a provider of adc channels to other devices.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vref-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    adc@400c8000 {
> +      compatible =3D "raspberrypi,rp1-adc";
> +      reg =3D <0x400c8000 0x4000>;
> +      clocks =3D <&rp1_clocks 30>;
> +      vref-supply =3D <&rp1_vdd_3v3>;
> +    };
> --=20
> 2.47.0
>=20

--DEAMv2iXlbCNcm+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWaxgAKCRB4tDGHoIJi
0pQHAQC21E9owOCVvJfNrBEbbj2dwuVJ4gWOmP4qMntXYj/OmAD/fhH7+LUL0aNT
IDpUD7965J1+1DOEDBP3AVDFKgEPjgU=
=5H4q
-----END PGP SIGNATURE-----

--DEAMv2iXlbCNcm+O--

