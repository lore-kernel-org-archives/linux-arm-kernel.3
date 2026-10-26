Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084B6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zg+4g8IZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2m+DVXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GzuOsw4Snvbh+eEMcnVr9iJjEbAdsRsKBYi5VdtwjLQ=; b=zg+4g8IZpQlk2n27H69ioOZui8
	h6KPcnWBG1bmrl8ZhvkZpabjOzIU5p7qGpZiGPJpR9inP7MjhViaaNJFkDDG2Oes4whbbfwfM6zJu
	SwSzKhn0ITxNWKcbDuFkW7pNzi79XBXRPcMj7QE/68YxiNEttS61FgOwqOeyF2bchv9S1gy2RTRw5
	5IE5jarIO6KZHNckKfay/quhv94EZgNZtbV9e0fo/BiJ7TgTto2OpbsjHiZKWacLJb7jE8Fg0RY24
	T6D3tuTf9ydgwy9by0VyCp+6kPa0z9pQdvEHEDBir4/+VVlByVsOwi9HEuNbQrMDn6GKn2uxMXyAX
	COXhsoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFRV-00000001rYm-2z12;
	Mon, 26 Oct 2026 07:48:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFRU-00000001rYN-2eV1;
	Mon, 26 Oct 2026 07:48:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D67C600CB;
	Mon, 26 Oct 2026 07:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC631F01825;
	Mon, 26 Oct 2026 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793000907;
	bh=GzuOsw4Snvbh+eEMcnVr9iJjEbAdsRsKBYi5VdtwjLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I2m+DVXmL5Gv3nfNU/fb7mgDtrgNT54cGy11FezEf4gpsgiBmxi9/lrqb8MMm34Ma
	 T79ZROkG2cwpyLQQGA8JJfew/i+8LeLAl3+eGWlBZi8RKmeHO/3+9XmVCik2CMd6oJ
	 BZ5DY6VZyhKcSj5cRr3gp6zdU9Q4jawc0SN/jX/pGmJaOXRcRlhpp1ZyAUsfyyUQT4
	 n2gm7tcgMi887AUtZLmQKgpIdN9vr4nobt2yV+jYtG9i8rG3v1xMGLMDJWD9F+mTUq
	 R314cJFSSc8+yz9/nSgrMM4zmgDkgUTJGZkV/7du83bsTPtJED6LvPHOuZLuBkXR1F
	 2GnOdr36WwXZQ==
Date: Mon, 26 Oct 2026 08:48:24 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Chris Scott <gilroyscott1970@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com
Subject: Re: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in
 the NPU window
Message-ID: <at8FyOLeaMlpS7mR@lore-desk>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
 <20261024154150.45733-3-gilroyscott1970@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iVyAIniY1vyBr/dM"
Content-Disposition: inline
In-Reply-To: <20261024154150.45733-3-gilroyscott1970@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--iVyAIniY1vyBr/dM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
> higher addresses alias the lower 1 GiB. The coherent buffers allocated
> on the NPU device are all shared with the NPU: since mt76 uses the NPU
> device as dma_dev, these are the NPU TX/RX descriptor rings, the HW-RRO
> ba_bitmap/addr_elem/msdu_pg/session buffers and the NPU TXD buffers.
> On a 2 GiB board nothing keeps them below 0xc0000000; they normally
> land there only because of early-boot allocation order. With low DRAM
> reserved away on W1700K the SoC hangs right after mt7996 firmware load.
>=20
> If the NPU node has an optional "dma" reserved-memory region, attach it
> as the device coherent pool so all of these come from the window. The
> next patch moves the mailbox buffers to coherent memory as well.
>=20
> Unlike a restricted-dma-pool this leaves streaming mappings alone.
> Packet buffers are passed through to the WiFi DMA engine: on W1700K
> with 96% of TX skbs and ~20% of RX page_pool buffers above 0xc0000000,
> host-path traffic and sha256 file round-trips stay intact, at the same
> throughput as without a pool, whereas a restricted-dma-pool (swiotlb
> bouncing) costs ~22% of host-path TX.
>=20
> A device coherent pool has no fallback once full; mt76 and the mailbox
> use ~10.7 MiB with MT7996, so the DT region should be 16 MiB.
>=20
> This patch was written with the help of Claude (Anthropic, claude-
> opus-5-5).
>=20
> Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
> Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 4d3195eb00..069fd60680 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -693,6 +693,11 @@ static const struct regmap_config regmap_config =3D {
>  	.disable_locking	=3D true,
>  };
> =20
> +static void airoha_npu_rmem_release(void *data)
> +{
> +	of_reserved_mem_device_release(data);
> +}
> +
>  static int airoha_npu_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -776,6 +781,19 @@ static int airoha_npu_probe(struct platform_device *=
pdev)
>  	if (err)
>  		return err;
> =20
> +	if (of_property_match_string(dev->of_node, "memory-region-names",
> +				     "dma") >=3D 0) {
> +		err =3D of_reserved_mem_device_init_by_name(dev, dev->of_node,
> +							  "dma");
> +		if (err)
> +			return err;
> +
> +		err =3D devm_add_action_or_reset(dev, airoha_npu_rmem_release,
> +					       dev);
> +		if (err)
> +			return err;
> +	}

nit: what about creating a dedicated routine for both firmware and dma
memory regions. Something like:

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/etherne=
t/airoha/airoha_npu.c
index 4d3195eb00f7..9c9c754f82c7 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -693,6 +693,23 @@ static const struct regmap_config regmap_config =3D {
 	.disable_locking	=3D true,
 };
=20
+static int airoha_npu_reserve_mem_region(struct device *dev,
+					 struct resource *res)
+{
+	int err;
+
+	err =3D of_reserved_mem_region_to_resource(dev->of_node, 0, res);
+	if (err)
+		return err;
+
+	if (of_property_match_string(dev->of_node, "memory-region-names",
+				     "dma" >=3D 0)) {
+		...
+	}
+
+	return 0;
+}
+
 static int airoha_npu_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -729,7 +746,7 @@ static int airoha_npu_probe(struct platform_device *pde=
v)
 	if (IS_ERR(npu->regmap))
 		return PTR_ERR(npu->regmap);
=20
-	err =3D of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	err =3D airoha_npu_reserve_mem_region(dev, &res);
 	if (err)
 		return err;
=20

Regards,
Lorenzo

> +
>  	err =3D airoha_npu_run_firmware(dev, base, &res);
>  	if (err)
>  		return err;
> --=20
> 2.53.0
>=20

--iVyAIniY1vyBr/dM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCat8FyAAKCRA6cBh0uS2t
rFMLAQCYE9JZWHIX1d7DcMsUxNN7xuWi7j5iJa2g9JbmY1RtxgEAyosq5OPcK+vt
26iGn/wqVNypeFZFieGr4LBUSJkSDwE=
=L6P8
-----END PGP SIGNATURE-----

--iVyAIniY1vyBr/dM--

