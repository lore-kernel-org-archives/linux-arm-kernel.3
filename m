Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595B8D29DE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiZxmY62qMIowyTzp7xRCLdxMkojzS+RhlTkCXmPUdc=; b=DfwHPmN5lE1Ror1GGAk1G5Dqgj
	K5Cqj14n0aJICRJWt/gkIC7ZewOH0xaaqwyrozOiiukhO2LKvxtAre8tTF5CVwyXWsYT8q0BgZKy4
	h2ajsuHixDYkO4gAQI5VEb9nbF4oHSSgg+YH8/H95b8nvOrsC2aBbH4qHO4FNd6w3ZvqvhTP90Q25
	CLAbiJmvG4ZltnCUv6h9NAYqVPs3XZjO6j7++H6rZTDiV5Jxm7P8l85oqznYIM6FzTTOxOCrpo31u
	dlNxcJO1LSyNPPNCGS2+HTTs0GF2OZMb9z/bv0shj8RwFCIC4CTBMVbM9Dve41a8D3Rg2ajzAhItt
	pIf7do7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZqm-00000006lAX-3qSF;
	Tue, 13 Jan 2026 08:34:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZql-00000006lA6-1meg;
	Tue, 13 Jan 2026 08:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 642E840B56;
	Tue, 13 Jan 2026 08:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B693DC116C6;
	Tue, 13 Jan 2026 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768293242;
	bh=jjUCjRQRE+P4dpfL4pcQVDUjSJrZEHUP4TE7rk2uXEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEKP2mr8PVEGjqZ/tiSEGkd/4F0WoFrcus8hDFhcRnbYyTHQyUcDORMuCxhHlqMbz
	 gDhlQWTcxfOyvkYOKfsiRayJCm60lC3tZOnSe5DXnmTFAsHi6NnbC0K9jbhZKUL1h7
	 tqWc6xVz16UOvQSC8JVAdzAymwaahi86G2ikDCcJvKuaTt9wXFac0pmwUmxXiO5XJp
	 rlQ1LkM9/UUHFj8/tTO5pdM8ec8DrWXW2P2UxU0Ncj7Z0QdKrce7PMlecimOLIZ6pg
	 giqHUrxeWLUEk1XtoG+8aN4fWlFdqzZ62NIwpKsve8RZ4ewwDiL4H0uHDiIQk/f2IF
	 6eWKUjnncmS4Q==
Date: Tue, 13 Jan 2026 09:33:59 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
Message-ID: <aWYDd4Pwi84gA6zy@lore-desk>
References: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
 <20260108-airoha-ba-memory-region-v3-1-bf1814e5dcc4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yz3hkU5huftspXAr"
Content-Disposition: inline
In-Reply-To: <20260108-airoha-ba-memory-region-v3-1-bf1814e5dcc4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_003403_504144_D4C1CD65 
X-CRM114-Status: GOOD (  14.78  )
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


--yz3hkU5huftspXAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml  | 21 +++++++++++----=
------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Hi Rob, Krzysztof and Conor,

Since this patch has been marked as 'needs ack' on patchwork, do you have a=
ny
comments on it? Thanks in advance.

Regards,
Lorenzo

>=20
> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml=
 b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..19860b41286fd42f2a5ed15d5=
dc75ee0eb00a639 100644
> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> @@ -42,14 +42,13 @@ properties:
>        - description: wlan irq line5
> =20
>    memory-region:
> -    oneOf:
> -      - items:
> -          - description: NPU firmware binary region
> -      - items:
> -          - description: NPU firmware binary region
> -          - description: NPU wlan offload RX buffers region
> -          - description: NPU wlan offload TX buffers region
> -          - description: NPU wlan offload TX packet identifiers region
> +    items:
> +      - description: NPU firmware binary region
> +      - description: NPU wlan offload RX buffers region
> +      - description: NPU wlan offload TX buffers region
> +      - description: NPU wlan offload TX packet identifiers region
> +      - description: NPU wlan Block Ack buffers region
> +    minItems: 1
> =20
>    memory-region-names:
>      items:
> @@ -57,6 +56,8 @@ properties:
>        - const: pkt
>        - const: tx-pkt
>        - const: tx-bufid
> +      - const: ba
> +    minItems: 1
> =20
>  required:
>    - compatible
> @@ -93,7 +94,7 @@ examples:
>                       <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
>                       <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
>          memory-region =3D <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
> -                        <&npu_txbufid>;
> -        memory-region-names =3D "firmware", "pkt", "tx-pkt", "tx-bufid";
> +                        <&npu_txbufid>, <&npu_ba>;
> +        memory-region-names =3D "firmware", "pkt", "tx-pkt", "tx-bufid",=
 "ba";
>        };
>      };
>=20
> --=20
> 2.52.0
>=20

--yz3hkU5huftspXAr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWYDdwAKCRA6cBh0uS2t
rFtBAQD0yo69p4xD8JEzaHh0K8d8OYSRtrHkmX343xvu19+f8wEA9FbT9Hg1SDZr
MxzoKUFGCDbNaLfe1G88bl8Ds5L68QQ=
=FNzg
-----END PGP SIGNATURE-----

--yz3hkU5huftspXAr--

