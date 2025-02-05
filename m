Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37C9C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxmPkxju0bqkthdY4DxuNKOG1AYb+XTMaSuW/Yn7jbs=; b=GSjDRs3TNRLvIBNcuoo4+qsehW
	iCU1OcYbhRHsX5yuZbxlw9+n/6lNgHi2zoGqrwBRAnZGnAM+He1+1LMsbRfs6T8xNXc/PPi/QfQFG
	PAeV71LL6o9z61pTsPiq6waBSguUwhIXFBwWcyZ2t0xuwKEFwQGZWSuGunHhT8bF2bXB5d80iFqNN
	FUCj0ht809BfWSUvCTXntB5uM58RHM8ld+VYKaE/EQULks40ps9l39PURNelJQEkTYbX4aA6Zx41g
	KPNE4G02Rrgkt4N0fx/2dRvu6nqMoWct5ywNAwIo9rSgWBjCLmnIxHGe2A0+p6rXCiQVBc/QblDYQ
	3uvCw2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkoc-00000004MXq-0BR3;
	Wed, 05 Feb 2025 19:12:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfknD-00000004MNO-43jb;
	Wed, 05 Feb 2025 19:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3BC35C6E32;
	Wed,  5 Feb 2025 19:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19032C4CED1;
	Wed,  5 Feb 2025 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738782634;
	bh=ETdqFpdQWKnBh+I298fz06UxdSXFr90lIy6URSg4kaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW9+39AID1lcEbXaiCKZIk7Cm+9fGecb98BRFaRHhP9a1Iyi3q9gmTF0VE+8Gqdz6
	 6Gn3MD174LfUMy2NeBzeXsMH66CTU4yWmleh54TGTdYvywqkeSWFULL3UeTmJ4UmpO
	 EhrA66XdJDnwXnJCUSt/+6KbgSDUsy97XJflygurMKjb6jH27FBAJR2IcqHGqzBuQ0
	 rXCqaRMa4d8QxePE6ZYQl2vTvHym5SKVhHHeF/vFQsAe8f+2rML9WgboYcBcubtXzq
	 9gyiIdc5MukId3ZAjg6yjOEwoXCW92eam1wc3FM9/L0LUxgr//JEP52TxjR7MzWPtu
	 IzvlMlC6Gb90g==
Date: Wed, 5 Feb 2025 19:10:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
Message-ID: <20250205-cleaver-evaluator-648c8f0b99bb@spud>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JnOj/fdaK/Kw9pqY"
Content-Disposition: inline
In-Reply-To: <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_111036_110311_0ECFF8EB 
X-CRM114-Status: GOOD (  17.40  )
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


--JnOj/fdaK/Kw9pqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> Introduce the airoha,npu property for the npu syscon node available on
> EN7581 SoC. The airoha Network Processor Unit (NPU) is used to offload
> network traffic forwarded between Packet Switch Engine (PSE) ports.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a20230b0c4e=
58534aa61f984da 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> @@ -63,6 +63,12 @@ properties:
>    "#size-cells":
>      const: 0
> =20
> +  airoha,npu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon node used to configure the NPU module
> +      used for traffic offloading.

Why do you need a phandle for this, instead of a lookup by compatible?
Do you have multiple instances of this ethernet controller on the
device, that each need to look up a different npu?

> +
>  patternProperties:
>    "^ethernet@[1-4]$":
>      type: object
> @@ -132,6 +138,8 @@ examples:
>                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> =20
> +        airoha,npu =3D <&npu>;
> +
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> =20
>=20
> --=20
> 2.48.1
>=20

--JnOj/fdaK/Kw9pqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6O3pAAKCRB4tDGHoIJi
0r90AQCPFWieY3rJFPgYre/U5p5JhiHPBES11cYsO6z7cPd7JgD+LbhWNBtMLabp
sVw4Vk5SnTfpxAWmdYRThF4q2n8QHAU=
=ee/X
-----END PGP SIGNATURE-----

--JnOj/fdaK/Kw9pqY--

