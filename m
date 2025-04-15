Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B703EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jQxFBP/JSAAUutzyrrqlrFbYucFls00Np41KWtf/mM=; b=4uUm23BNXxWNVxhxW44wrzFlGn
	LUjdZXu7+W6nBe4LnnU6UDLAcxYkyriXN69oghHm4yBCthA/nvS8+3pW44HhREwcLLiI02/MgP4f8
	ISkbQTTvWDW8ZHPgnwMtFivLNOMBRAN6ccFF73zS9rmZOqX6g9pTtKN4hkaYI8uxOQVwkl5YVPF7X
	F+mbsrEWdyvktEIhS+IpFvgCwMy0We8cQJUGCtw8MC3INEdZe+ydtUVA80glZKZuPUAyPhORWDp8D
	mJECT8ZkX9XQze1O7RKzaDhI6ilYKuRofkfeIGx74KdFDzLvuZ+0YBuUefnl/Ulg9bCHQHYHXPa3n
	ELrQjkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jFc-00000006QhR-1RQs;
	Tue, 15 Apr 2025 16:35:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4irK-00000006MlW-0hSZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B417A4A136;
	Tue, 15 Apr 2025 16:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B8EC4CEEB;
	Tue, 15 Apr 2025 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744733401;
	bh=beq2Ygwh38BLpBgBTdS0N0mql61y8fm0HHZQtool68A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUivVYM4WiuwVIKi7LaW7bAnj8AjndcYTbNttYoMJOjgRoAp04y1ZN6H0ebVhI1gE
	 2zaOFHjDfraMIQOzVXm965QBxeKMuoOGlfqVEEcPUxNELGpcLhDSHsMecQTWi3L29g
	 c3m7Yvf5eN2VAHfvdXKq9v24OECRleMWA4PIWOJe1tHLEJ360w4ahDCtpNQn98Sn42
	 olWxzk5XMRvGQqL0uYMIkbXv5ikUm2ittEUuhJq/CIbQZOq6RY8iZcnPJNmtPuqPro
	 aPDKR9NJGuRNdeGJ/z/FKxlxj6uo4zcRsuL/b4fFyjY9uPKAa7lXhVigRsyrFyNpmG
	 Wc+e08W1tyImQ==
Date: Tue, 15 Apr 2025 17:09:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Dominik Haller <d.haller@phytec.de>
Cc: robh@kernel.org, kristo@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, vigneshr@ti.com, nm@ti.com, m-chawdhry@ti.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC
 AM68x based hardware
Message-ID: <20250415-lark-deskwork-7850a95aa955@spud>
References: <20250415130458.33714-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sc/8E7LvZN4m53Ig"
Content-Disposition: inline
In-Reply-To: <20250415130458.33714-1-d.haller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_091002_273050_71B22A15 
X-CRM114-Status: GOOD (  16.36  )
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


--Sc/8E7LvZN4m53Ig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 03:04:56PM +0200, Dominik Haller wrote:
> Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
> and the phyBOARD-Izar carrier board.
>=20
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---
>=20
> Notes:
>     Changes in v2:
>     - no changes
>=20
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documenta=
tion/devicetree/bindings/arm/ti/k3.yaml
> index 18f155cd06c8..a03fdb9c0482 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -135,6 +135,8 @@ properties:
>        - description: K3 J721s2 SoC
>          items:
>            - enum:
> +              - phytec,am68-phyboard-izar
> +              - phytec,am68-phycore-som

This looks wrong, if I am not misunderstanding. Your izar dts includes
the som dtsi, so this should be configured with a fallback, so you're
going "phytec,am68-phyboard-izar", "phytec,am68-phycore-som", "ti,j721s2",
no?

>                - ti,am68-sk
>                - ti,j721s2-evm
>            - const: ti,j721s2
> --=20
> 2.43.0
>=20

--Sc/8E7LvZN4m53Ig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/6E1AAKCRB4tDGHoIJi
0iT1AQDyBsyo6j8AEVY9RFO8bjD7VGy2QOQTpOWBias0CqF4SAEAkW+ON/H7IAJ/
/J3fjUlnfBE6Tr8BX7hSROG1WsmbPA8=
=buBB
-----END PGP SIGNATURE-----

--Sc/8E7LvZN4m53Ig--

