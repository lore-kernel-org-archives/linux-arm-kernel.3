Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AE8FED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwz+LQEDvhax0/Etk5/FnQP3mlusTw3Lbx69SBFO2xw=; b=lVf7eMP1/BwKBsCIIlCqubPRt/
	hmqERCZUORWTLufWOrMu3s4QsAtjF7dyOqBeUzv/SKz9xtmE1A0UPY4A9WLwoJt8c21d4k7HZQ3gw
	M9VjkzUYwjojirUX4p++xlb4C1iTfNwJO2gBQhKPRwCjQwhYSgDbHgtconzOAPTiDVh3i+hm5v4sa
	s3UrRzp6vGwAdK+ysx1LDmpcuEuC1hl9XZT0NL0WoMJbv1BmITkPvOw8u403XfWlz6PuIpqUU5gn9
	2FUqWOITDY/L7oEYjcC2NB2NdmYizdP3WPaoopENFNbcH2VglfTNHYyzivE7pFHAxCmLwGnsw4/d4
	sHvvt+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJyz-0000000DZcG-2j4J;
	Fri, 24 Apr 2026 17:06:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJyy-0000000DZcA-1VPS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 17:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB158600CB;
	Fri, 24 Apr 2026 17:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EAFC2BCB2;
	Fri, 24 Apr 2026 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050383;
	bh=xCE79Wvi8Mkp+ZGDctaw2DzfjgrYbScCrXQDDCMokJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soS8YKrqJfBO4XBWAY/r3mngcqtyBkbOm8Ya3Dw6bovRKTuOlbOKpmFdFqTA4EhkC
	 Q2hn+QQD8fqQwASYJb94Fkf8BPk2sYBXuPW0Vj/3xVdAs1OUii1XE/NRBRHAkPWUMK
	 moriP1FVBiXjoiD8txVJ3H1nnoUharRuugzbvcdOSIBlPiPfyFZRWp1U3r0N1OEZe6
	 7LnXlI3tyzqrRLYC6aY36nGLdPOFsn2McuvsBW+ahjgMbgsB4Yu8J5LyeU6ixWMcEe
	 RiEij5Wajx0XvZE5elE8qSGz7+cJIXmaAL9fuOGkP0bWGFw0d30q6I5ONPPBh09vS0
	 johWnH51n3CAw==
Date: Fri, 24 Apr 2026 18:06:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <20260424-sinless-unfiled-d1087a894da5@spud>
References: <20260424025735.1490772-1-hongxing.zhu@nxp.com>
 <20260424025735.1490772-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H0L8i4gwKKUpxCZw"
Content-Disposition: inline
In-Reply-To: <20260424025735.1490772-2-hongxing.zhu@nxp.com>
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


--H0L8i4gwKKUpxCZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 10:57:33AM +0800, Richard Zhu wrote:
> Add optional 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q
> PCIe binding to support PCIe event-based interrupts for general
> controller events, Advanced Error Reporting, and Power Management Events
> respectively.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

This binding supports lots of devices. Do they all have these additional
interrupts?

>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/=
Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 9d1349855b422..badc7fcbd556c 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -58,12 +58,18 @@ properties:
>      items:
>        - description: builtin MSI controller.
>        - description: builtin DMA controller.
> +      - description: PCIe event interrupt.
> +      - description: builtin AER SPI standalone interrupter line.
> +      - description: builtin PME SPI standalone interrupter line.
> =20
>    interrupt-names:
>      minItems: 1
>      items:
>        - const: msi
>        - const: dma
> +      - const: intr
> +      - const: aer
> +      - const: pme
> =20
>    reset-gpio:
>      description: Should specify the GPIO for controlling the PCI bus dev=
ice
> --=20
> 2.37.1
>=20

--H0L8i4gwKKUpxCZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeujCQAKCRB4tDGHoIJi
0sbBAP9Y8BcAd/MDAAh/RMkRDbsa5ilgaKCx0jwcHj/+rWm2twD+N71s+zgqihzj
hrfWyfc3pLzNgNi0wFP5B7kAHGteAg8=
=fyjc
-----END PGP SIGNATURE-----

--H0L8i4gwKKUpxCZw--

