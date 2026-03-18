Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A9A10775EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miZ6HcEArp0pa1Zyoimv1vrDdydC563bhABgViCyzgQ=; b=F+yqOsAN7gQQtIitX719fsfW7W
	v0rxJ2GqBCBlMYqFSoZSfpxr7P0srsspmK44eilnSw8e99Bf+g9lq599Y8zcHLBFWSm+Cypt/j9v6
	VzSwcuX7YjIfh2weoGc/a39YylSR8ORvGT2LGXZ3sYBg01+u+t0s98hTp41ziGqlZ04wSAKqwzMhT
	VWn5JRieN8K/kOhgwG3TLXssLCHLkrYvDVodksn3TDKXNfzVb+4JEFXTYJorZq8e54G26+3v4dcJe
	KI3flrq2cfBGhRp39IRm4tS8M1xuC/msLBg1y1pXwG6raQI3053d7FVNSDJPAMO6mtYChOedgbzpc
	jWh04SQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2unf-000000095sW-3zHP;
	Wed, 18 Mar 2026 17:35:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2une-000000095s8-32WG;
	Wed, 18 Mar 2026 17:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2EA06183F;
	Wed, 18 Mar 2026 17:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D3CC19421;
	Wed, 18 Mar 2026 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855317;
	bh=XMV5inxjfKHIqVPnyCdwg/fTj3Azn9yJnNe7LuS48N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMDJvEc9eneBZHrpi8WbIrwzhbzxDlOCCstXE7RyyPYs1c5T5VyVoa+8Ed1Trc+cE
	 NUTYzX3iQtw4Uxx1MQd+DP+PzNulWD/x4yqfsXby20opha9QC24sWJuLZViLBolZ9w
	 Ds7t1ra7dcWnr7kJdTfAkc1PqlOvj7YLe8sK5wGVnszwSlscl96oechPj4t4GVlEtl
	 jdKylRXkz2hk6FYz99wmcf/zgRm6rzSQzNPhxFDiLgYbnFOyw/Vdphf3ALYh3znw/r
	 dgH0beGYsJfLMjeLxNuGKLQhVPMFcZMgL8jA686EaCpMbfbH7ENDlvIC4ddjumHkZC
	 S4gfrkmLe3S5g==
Date: Wed, 18 Mar 2026 17:35:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 3/7] dt-bindings: net: ti: k3-am654-cpsw-nuss: Add
 ti,j722s-cpsw-nuss compatible
Message-ID: <20260318-sustained-reshuffle-eaf180729a9c@spud>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
 <1382fed198246f1563dea091478757aebc4e4948.1773751309.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g8SSq65u6iP4ZaTS"
Content-Disposition: inline
In-Reply-To: <1382fed198246f1563dea091478757aebc4e4948.1773751309.git.nora.schiffer@ew.tq-group.com>
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


--g8SSq65u6iP4ZaTS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 03:05:25PM +0100, Nora Schiffer wrote:
> The J722S CPSW3G is mostly identical to the AM64's, but additionally
> supports SGMII.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.=
yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> index a959c1d7e643a..9ab8237c7f79e 100644
> --- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> @@ -59,6 +59,7 @@ properties:
>        - ti,j7200-cpswxg-nuss
>        - ti,j721e-cpsw-nuss
>        - ti,j721e-cpswxg-nuss
> +      - ti,j722s-cpsw-nuss

For all these bindings, why is a fallback not suitable? Seems like it'd
be possible here, since there's just a new feature. Is there some other
programming model difference?

>        - ti,j784s4-cpswxg-nuss
> =20
>    reg:
> --=20
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>=20

--g8SSq65u6iP4ZaTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabriTwAKCRB4tDGHoIJi
0rmKAP4oA9ZLXSHHUbsFb5/219KbRXIiAAlbMACiaWPxfR6W7gEA+bHWo2zEutXo
hbEedSyQOaJ/t3Kn1ZHU72wiR4Qnswc=
=lTAy
-----END PGP SIGNATURE-----

--g8SSq65u6iP4ZaTS--

