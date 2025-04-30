Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205DCC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6C5ngD/WdyamiIYlUSJJx3LFYmQNm0bzccAaMQN0cU=; b=zoIms2ZA1OKtEcbNWzwsZ7QNq8
	5wCH6EsmrG39hoasPhvPpRIM7UVjvL22f3GYT0tup4zHKQ4oWkEFrXucyqznigzdDVx2i5xE+pmPi
	IuhxBVC7iepKVhWDO6pg0qyZP3kFWrT8e1cWPZyfcJq0e2trsO6liNfJbgndtOtILoQOjIxMeVnMl
	OvDV/3oB0W2aFbAmjA2sICY2eUOgPfVHUtAb0b7XfF/rrFyGh5WDdF6nWc7DSptbhnhktOIwao1eg
	BCfuF9L3mZ1yoXo0oLtGcXVaz+LxMpyAy4oJz1Bh6Cz+hnQkTksP3+dyTpoEiZiGGFtihNlD34xEW
	c2Ffy+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9QS-0000000DIDF-05RZ;
	Wed, 30 Apr 2025 15:32:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9OV-0000000DHwj-0iSf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E0D343208;
	Wed, 30 Apr 2025 15:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2366EC4CEE7;
	Wed, 30 Apr 2025 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027042;
	bh=opdeUvkVojRGTuPuV8xclDhdJWVmOXLGZEZAoQNAZ9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=El8iv2mafHvxjq4tRarbAiANk1Rhn09dQGIrTMMWuW9SOf1JTp2kKf/zYgmNdXFzC
	 yosNmtDTs/so4la7muAJ4puJcAQYxzAfwYIYMIwN3ujlQNvygiVkL6LEeaafCdgg1h
	 u9VZBBpjQ2AkXqgcafE4Ok1jvHODQG5AFNzvtQkcff421or2l1KPW1wk3RJyWHgkY/
	 f0PimYV43c8xE6Aba2/IhyZ0IEM4+jDdOFl5nSKuZaoq6J9o0mSQXjZXWWB+e178i6
	 twv3iLKf2v90MbvrHSQq2pRBTRNhhK0Uq4Oid0t6N8FmpQ9l4HKNFtLMra67Sbu4KX
	 JUVzcgnawUssA==
Date: Wed, 30 Apr 2025 16:30:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: arm: ti: Add Toradex Verdin AM62P
Message-ID: <20250430-stylus-reversion-a439538b6fc1@spud>
References: <20250430102815.149162-1-francesco@dolcini.it>
 <20250430102815.149162-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KMHDuPG9qmxNjZvN"
Content-Disposition: inline
In-Reply-To: <20250430102815.149162-2-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_083043_249059_E0C07B93 
X-CRM114-Status: GOOD (  15.18  )
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


--KMHDuPG9qmxNjZvN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 12:28:10PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Add toradex,verdin-am62p for Toradex Verdin AM62 SoM, its nonwifi and
> wifi variants, and the Toradex carrier board they may be mated in.
>=20
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am=
62p
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/arm/ti/k3.yaml        | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documenta=
tion/devicetree/bindings/arm/ti/k3.yaml
> index a6d9fd0bcaba..bf6003d8fb76 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -76,6 +76,30 @@ properties:
>            - const: toradex,verdin-am62          # Verdin AM62 Module
>            - const: ti,am625
> =20
> +      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Bo=
ards
> +        items:
> +          - enum:
> +              - toradex,verdin-am62p-nonwifi-dahlia # Verdin AM62P Modul=
e on Dahlia
> +              - toradex,verdin-am62p-nonwifi-dev    # Verdin AM62P Modul=
e on Verdin Development Board
> +              - toradex,verdin-am62p-nonwifi-ivy    # Verdin AM62P Modul=
e on Ivy
> +              - toradex,verdin-am62p-nonwifi-mallow # Verdin AM62P Modul=
e on Mallow
> +              - toradex,verdin-am62p-nonwifi-yavia  # Verdin AM62P Modul=
e on Yavia
> +          - const: toradex,verdin-am62p-nonwifi     # Verdin AM62P Modul=
e without Wi-Fi / BT
> +          - const: toradex,verdin-am62p             # Verdin AM62P Module
> +          - const: ti,am62p5
> +
> +      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Bo=
ards with Wi-Fi / BT
> +        items:
> +          - enum:
> +              - toradex,verdin-am62p-wifi-dahlia # Verdin AM62P Wi-Fi / =
BT Module on Dahlia
> +              - toradex,verdin-am62p-wifi-dev    # Verdin AM62P Wi-Fi / =
BT M. on Verdin Development B.
> +              - toradex,verdin-am62p-wifi-ivy    # Verdin AM62P Wi-Fi / =
BT Module on Ivy
> +              - toradex,verdin-am62p-wifi-mallow # Verdin AM62P Wi-Fi / =
BT Module on Mallow
> +              - toradex,verdin-am62p-wifi-yavia  # Verdin AM62P Wi-Fi / =
BT Module on Yavia
> +          - const: toradex,verdin-am62p-wifi     # Verdin AM62P Wi-Fi / =
BT Module
> +          - const: toradex,verdin-am62p          # Verdin AM62P Module
> +          - const: ti,am62p5
> +
>        - description: K3 AM642 SoC
>          items:
>            - enum:
> --=20
> 2.39.5
>=20

--KMHDuPG9qmxNjZvN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJCHQAKCRB4tDGHoIJi
0hFcAQDEbZ+iAmM7XPpfRyDtPTb9EQwMDttv6HFl1IfeSyudqQEA6v/ANrKiaOD1
ss42apT4hN+ggDMZdFM/hW8W9bCYwQg=
=Q1sp
-----END PGP SIGNATURE-----

--KMHDuPG9qmxNjZvN--

