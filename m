Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA00CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cw+o/adxZ1OQUe4ju5FIcmtrobfTztXH9YL1mh9xmQ=; b=hy+OGCoBa18WlzKJZrdnf8N1gx
	fF3LVI4WzUV9gtWhT2HIZJ3PVlPaEF2Y6G1vkG/T3XwEV/xsOgd5Wk2pSMcWXbPB0tq5bUVKtHKht
	PQuAfdX2D8xV+P7PnIYcDHVFWmewb26Mffi369rjQVWSJbY3VW99RBaDqUHGpJ2LixBs0ln2fJk27
	vt2o2/vIm6K9t1E32VCcbrPeNoJw+fAuX5Qt5BdeZhykwwg5UK0uIz480sZQhWI3axiKd9qMi+tWb
	Iz6mg+Eo7NhzRLxOvlA+06NHFhgM5d5AfpL2S2BRD01ffMkCP/VzBZD/tUuX9ch1RxJeCuB/x2sNS
	JLq+Cr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCL1J-0000000A2Pk-3HwI;
	Fri, 24 Oct 2025 16:52:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCL1J-0000000A2Pe-00st
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31E2E6035C;
	Fri, 24 Oct 2025 16:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56878C4CEF1;
	Fri, 24 Oct 2025 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761324723;
	bh=lgoCh5NfGUWOtbjiChw+bb2GcRy5VqS7KaWQ/o8KLXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVBBqno+lUi6yslcWHVf4Vr0KEp50KgDLtx6xiZARKFaq5Pm8J1KyMZfJ7Zn1Q9wb
	 e2hZbvYoclgsVmq/VPppgS/8n6wIUtOeRD51/wGoPvf2SCRqJTADRtr9e17gq2kkbf
	 F3fJ6KnkJBplQT5JW5aK+GjXYmurNcPExJPZ0o5iilCJsAA/JySIDah0V/BOY2LDzC
	 U2ugWTZ+ZBZ+d7QQ9jZUjtN5Ab4ydi6Si5OTCE/tzdfvLH3IWroDSHKZ92Wj6jaK+9
	 EDFFuj8B/eb9K4fvprVOVAm1mm7qfTEQyNd2nt9wVbbeN+HyHs1FzuYYDKhD1ksJ+e
	 GXMcgJwCe/Kaw==
Date: Fri, 24 Oct 2025 17:51:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: PCI: dwc: Add external reference
 clock input
Message-ID: <20251024-mandolin-starlet-f7cfd8ba4210@spud>
References: <20251024024013.775836-1-hongxing.zhu@nxp.com>
 <20251024024013.775836-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wn545wI6sdJnFSMd"
Content-Disposition: inline
In-Reply-To: <20251024024013.775836-2-hongxing.zhu@nxp.com>
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


--wn545wI6sdJnFSMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:40:11AM +0800, Richard Zhu wrote:
> Add external reference clock input "extref" for a reference clock that
> comes from external crystal oscillator.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.ya=
ml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> index 34594972d8dbe..0134a759185ec 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> @@ -105,6 +105,12 @@ properties:
>              define it with this name (for instance pipe, core and aux can
>              be connected to a single source of the periodic signal).
>            const: ref
> +        - description:
> +            Some dwc wrappers (like i.MX95 PCIes) have two reference clo=
ck
> +            inputs, one from an internal PLL, the other from an off-chip=
 crystal
> +            oscillator. If present, 'extref' refers to a reference clock=
 from
> +            an external oscillator.
> +          const: extref
>          - description:
>              Clock for the PHY registers interface. Originally this is
>              a PHY-viewport-based interface, but some platform may have
> --=20
> 2.37.1
>=20

--wn545wI6sdJnFSMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPuurgAKCRB4tDGHoIJi
0qtfAP9syKT1Z8zD9ng04ytzgsxPxEic8yXDd2w7tDb/8OUUKgEA7ZWAfIKWjjfL
CozvH+SLFOAb9sAqsRNoc8HC8+RRngI=
=S1Ab
-----END PGP SIGNATURE-----

--wn545wI6sdJnFSMd--

