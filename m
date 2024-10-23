Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B9CFA44F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGNPZ7L2+BANTdVwGnl+FyDwUhdNjCqHTPZtrrx98vE=; b=RwBB28O38KPOK6vToFiYxqZbv0
	U8+R7I6q7UTFVbz5XnUlPNabsTyBSWnW2fxtS21x25w+kSV81WxZ96JzxcSECROZjULpd8LZvDTyf
	h4hB60e/eB1kyWLx/8fdX1DKkBgRzfYZCv4TCyfMmChnW0KwL0ehlQmaftFDo1tc5x/Y4IQTjeJwH
	d1JGWK7YK285JZpUsMj2350EDPuOOvtmXnfkrkT4eSex2THI57jeoO3k98dPz3X6k2AntpmZFiwOR
	X2TBVHHS0QIq3F6nTq2h4ln1TB2g+2mmn4a5jAkMTbpmy2NgLKHjLic1+W1GA9KsHLrPg0BcQUIJY
	ss2Oui6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dx6-0000000F5fv-0ZA4;
	Wed, 23 Oct 2024 16:11:16 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d7N-0000000Ev4f-3Kts
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:17:51 +0000
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AC9DA891A3;
	Wed, 23 Oct 2024 17:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729696661;
	bh=mGNPZ7L2+BANTdVwGnl+FyDwUhdNjCqHTPZtrrx98vE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sYVNrfG5It5j42lroGwiscpQM1HAuIS/QdVO9YJ8HaIZyQh/dxCHxRnSvanFFc0RB
	 /XFouyNKsHh8IaqvMYdGocRO5QmCb6IgV2YRLoIpBfso+JPBFviVEIucykdLCrp6rq
	 limZl21TOiekCVm+qoeL4FxH47tmU5rMFxIjc1iKig0x3e4uGkpTNgeonHlo+HwSfl
	 d7bhaKDe43GxQjhyxyDqNhliOXHWemqZM++r+44vvzmEDNijbuYY/Ew1RnCU+jurse
	 G22qMsk1Z6r+p4oJmE5PwF79G8ywCQaJ1XkHYQC9FReKEOunztUPu0bN1Op0efXnZ3
	 cyxHgwISbA8/Q==
Date: Wed, 23 Oct 2024 17:17:39 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org, linux-spi@vger.kernel.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, Fabio Estevam
 <festevam@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: misc: lwn,bk4-spi: Add binding
Message-ID: <20241023171739.475a2bb7@wsk>
In-Reply-To: <20241023120015.1049008-1-festevam@gmail.com>
References: <20241023120015.1049008-1-festevam@gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EXs69__H/ReNKkpgChycJ7c";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_081750_189569_622E7514 
X-CRM114-Status: GOOD (  28.97  )
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

--Sig_/EXs69__H/ReNKkpgChycJ7c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> From: Fabio Estevam <festevam@denx.de>
>=20
> Add a lwn,bk4-spi.yaml binding for Liebherr's BK4 external SPI
> controller.
>=20
> Currently, the compatible string used for this device is "lwn,bk4",
> which is the same as the board compatible string documented at
> fsl.yaml.
>=20
> This causes several dt-schema warnings:
>=20
> make dtbs_check DT_SCHEMA_FILES=3Dfsl.yaml
> ...
>=20
> ['lwn,bk4'] is too short
> 'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
> 'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
> 'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
> ...
>=20
> Use a more specific "lwn,bk4-spi" compatible string for this
> device.
>=20

Thanks for updating this.

BK4 is another example of to be long-time supported device... :-)

> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/misc/lwn,bk4-spi.yaml | 54
> +++++++++++++++++++ .../devicetree/bindings/misc/lwn-bk4.txt      |
> 26 --------- 2 files changed, 54 insertions(+), 26 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml delete mode
> 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt
>=20
> diff --git a/Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml
> b/Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml new file
> mode 100644 index 000000000000..7fb86e6abade
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/lwn,bk4-spi.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/lwn,bk4-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Liebherr's BK4 external SPI controller
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +description: |
> +  Liebherr's BK4 external SPI controller is a device which handles
> data
> +  acquisition from compatible industrial peripherals.
> +  The SPI is used for data and management purposes in both master and
> +  slave modes.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: lwn,bk4-spi
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 30000000
> +
> +  fsl,spi-cs-sck-delay: true
> +
> +  fsl,spi-sck-cs-delay: true
> +
> +required:
> +  - compatible
> +  - spi-max-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        spidev@0 {
> +            compatible =3D "lwn,bk4-spi";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <30000000>;
> +            fsl,spi-cs-sck-delay =3D <200>;
> +            fsl,spi-sck-cs-delay =3D <400>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> b/Documentation/devicetree/bindings/misc/lwn-bk4.txt deleted file
> mode 100644 index d6a8c188c087..000000000000
> --- a/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -* Liebherr's BK4 controller external SPI
> -
> -A device which handles data acquisition from compatible industrial
> -peripherals.
> -The SPI is used for data and management purposes in both master and
> -slave modes.
> -
> -Required properties:
> -
> -- compatible : Should be "lwn,bk4"
> -
> -Required SPI properties:
> -
> -- reg : Should be address of the device chip select within
> -  the controller.
> -
> -- spi-max-frequency : Maximum SPI clocking speed of device in Hz,
> should be
> -  30MHz at most for the Liebherr's BK4 external bus.
> -
> -Example:
> -
> -spidev0: spi@0 {
> -	compatible =3D "lwn,bk4";
> -	spi-max-frequency =3D <30000000>;
> -	reg =3D <0>;
> -};




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/EXs69__H/ReNKkpgChycJ7c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmcZE5MACgkQAR8vZIA0
zr2JBgf9H8mKx1+O2rZSlkSQDdOlfnIg8XuozSSDbe6QLKtQYYnxuAEBbjooqYsY
kYYTOSSlLCNrb8sWtuZFf6zWWmWbPiri4J92hFv/ZC2h6bWIKgaO3fO2nCaar36+
ANiTgWo83oD1Vd6VfWRIvESzCh+attaDCueKbseaC+BB3uvcu/I+wYmYdv2Cno6C
Vu9yCAW4v50zPxu98/YtC0fHGmoowqrtXiXkoiPpmkTtzFuAmnKMq/HHMExMgR02
xp4IgKKS57UdyyEP7K/YA1slem9Hs2UVDQ1r1LnfqUu0T8tGjn2AXmsPGNsfctv6
AUsEjOKDz1+u8ma39DrHFlLCqtrt/g==
=OYo+
-----END PGP SIGNATURE-----

--Sig_/EXs69__H/ReNKkpgChycJ7c--

