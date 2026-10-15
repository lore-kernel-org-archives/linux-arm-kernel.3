Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C48CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEG361a6pDP+9DS65uWsMHb0ylN+/ee1WZlLzfsbLsw=; b=pqGgHwQUnWECxiCHAqzjrfH1S4
	aoEVK1fD6xpA0P9YAhQbDHHm3jBmoOe57IotJR8BmIt0FQUQuA5SX98dhRqSklfpULQtW1xNcrBou
	Bd/FAGvKWY/fLYGLfn6nz8PgTSxh8+bT6i28+EWHXoyQXrVOp/RYP+cjG1rlsxDshoQTJbbjjXlyq
	pzWJXez5c1l8qfmiL9oYWmS2edXq7BhwO/+XWVDBUKTDdRhTq7GyJ4G2RymiCkgokUvSaDOdyL7s3
	JvXtKSFiPhVEwtqW7qVm9pySs0J2xPtWbdAq7iMaEfE7we8gJjwThhBNYK1d3B9QSI42/OfRcRB3G
	QtJCa44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG8L-0000000H3Wz-1fmk;
	Thu, 15 Oct 2026 07:44:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG8K-0000000H3Wb-0q1w;
	Thu, 15 Oct 2026 07:44:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5115432BA;
	Thu, 15 Oct 2026 07:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B3E1F000C4;
	Thu, 15 Oct 2026 07:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050251;
	bh=LEG361a6pDP+9DS65uWsMHb0ylN+/ee1WZlLzfsbLsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J0a+FVn4WjRhHJ38DOu0W5/c8zAoX3QZ/kESKgLIx9ZhrIZoPfjBEpPHpJGpAFKkE
	 xuMX87ZqJjES76RQ/NYKYDv348s/FfCaN7UEtUnAnldt4dK67MnxjUIc+jjisg17DD
	 jWts+Ry4O0MdlYxGpXINFk+B896R8xt/zGhrwUeZhvAS10DRFqVRHuspHfQIqgk7IE
	 tyrKQktT1GgGykGoYP+6vDITeeawDmRqaLQOgr8KkQmaOdqpDzrCO7ll9S04y3Kvg7
	 05TCBMLJl1+L5GaDV2zAL1Erjjr+h0E4YzOkInoESwbJbnHxqfqBFyQEJKd+DYu5w9
	 bXba4Ztf36dig==
Date: Thu, 15 Oct 2026 09:44:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: SAYANTAN NANDY <sayantann11@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bread.hsu@airoha.com,
	sayantan.nandy@airoha.com
Subject: Re: [PATCH net v3] net: airoha: keep PPE offload when NPU refuses
 flow stats
Message-ID: <atCESCD8aDoR32nW@lore-desk>
References: <20261008094828.15458-1-sayantann11@gmail.com>
 <20261015045607.12999-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="as81oyFgOPbUaC9b"
Content-Disposition: inline
In-Reply-To: <20261015045607.12999-1-sayantann11@gmail.com>
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

--as81oyFgOPbUaC9b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Chad Monroe <chad@monroe.io>
>=20
> With flow stats enabled, PPE offload setup requests flow statistics
> from the NPU. If the running NPU firmware does not support flow
> counters, the request fails and the current setup path aborts PPE
> offload.
>=20
> Treat flow statistics as an optional capability so that a failure to
> set up the counters does not prevent normal PPE offload. Continue PPE
> initialization when the NPU refuses the flow-statistics request.
>=20
> Also treat a zero NPU statistics address returned by the firmware as a
> refusal. The host-side DMA buffer (foe_stats_dma) is allocated by
> dmam_alloc_coherent() in airoha_ppe_init() from system memory. The NPU
> statistics address (npu_stats_addr) is a separate allocation from the
> NPU firmware's internal SRAM pool. When that pool is exhausted, the
> firmware replies with success and npu_stats_addr =3D 0. A zero address
> does not provide a usable counter region and must not be passed to
> devm_ioremap().
>=20
> When flow stats entries are available, clear PSE_PORT6_SHARE_DIS so
> that PSE port 6 (CDM3 path to the NPU) participates in shared-buffer
> flow control. PSE_FC_CFG bits 26:16 control per-port whether flow
> control considers the shared buffer pool. Bit 22 is port 6.
>=20
> When flow statistics are unavailable, PPE continues to operate without
> NPU flow counters while retaining normal offload functionality.
>=20
> This combines the original SmartRG/Airoha fixes for:
> - keeping PPE offload active when the NPU refuses flow statistics
> - treating a zero NPU statistics address as a flow-statistics refusal
>=20
> Based on the original SmartRG/Airoha work by Chad Monroe:
> 5ce96ab ("SDG-9458: keep PPE offload when NPU refuses flow stats")
> 0ad8528 ("SDG-9458: airoha: treat a zero NPU stats address as a refusal")
> Fixes: b81e0f2b58be ("net: airoha: Add FLOW_CLS_STATS callback support")
> Tested-on: AN7581 with MT7992
> Signed-off-by: Chad Monroe <chad@monroe.io>
> Signed-off-by: SAYANTAN NANDY <sayantann11@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>=20
> Changes since v2:
> - Drop flow_stats_cap entirely (Lorenzo).
> - Keep the original airoha_ppe_get_num_stats_entries() checks (Lorenzo).
> - Guard airoha_fe_clear() with sram_num_stats_entries > 0 (Lorenzo).
> - Replace the error assignment and goto with a direct if check and
>   dev_warn() (Lorenzo).
>=20
> Changes since v1:
> - Explain the NPU SRAM allocation separately from the host-side DMA
>   buffer (Lorenzo).
> - Use airoha_fe_clear() and shorten the warning message (Lorenzo).
> - Include hardware testing information requested by netdev-bot.
>=20
>  drivers/net/ethernet/airoha/airoha_npu.c  |  8 ++++++++
>  drivers/net/ethernet/airoha/airoha_ppe.c  | 10 ++++++----
>  drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
>  3 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 4d3195eb00f7..b32a01dbe06b 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -450,6 +450,14 @@ static int airoha_npu_ppe_stats_setup(struct airoha_=
npu *npu,
>  	if (err)
>  		goto out;
> =20
> +	/* The firmware reports success with a zero address when its SRAM
> +	 * pool has no room left for the counters.
> +	 */
> +	if (!ppe_data->stats_info.npu_stats_addr) {
> +		err =3D -ENOSPC;
> +		goto out;
> +	}
> +
>  	npu->stats =3D devm_ioremap(npu->dev,
>  				  ppe_data->stats_info.npu_stats_addr,
>  				  size);
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 92611802801e..74ac3791cb63 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -144,6 +144,9 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
>  	sram_ppe_num_data_entries =3D
>  		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
> =20
> +	if (sram_num_stats_entries > 0)
> +		airoha_fe_clear(eth, PSE_FC_CFG, PSE_PORT6_SHARE_DIS);
> +
>  	for (i =3D 0; i < eth->soc->num_ppe; i++) {
>  		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
>  			     ppe->foe_dma + sram_tb_size);
> @@ -1454,10 +1457,9 @@ static int airoha_ppe_offload_setup(struct airoha_=
eth *eth)
> =20
>  	ppe_num_stats_entries =3D airoha_ppe_get_total_num_stats_entries(ppe);
>  	if (ppe_num_stats_entries > 0) {
> -		err =3D npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
> -					      ppe_num_stats_entries);
> -		if (err)
> -			goto error_npu_put;
> +		if (npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
> +					    ppe_num_stats_entries))
> +			dev_warn(eth->dev, "NPU refused flow stats\n");
>  	}
> =20
>  	airoha_ppe_hw_init(ppe);
> diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethe=
rnet/airoha/airoha_regs.h
> index 442b48c9b991..aee06c058586 100644
> --- a/drivers/net/ethernet/airoha/airoha_regs.h
> +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> @@ -72,6 +72,8 @@
>  #define PSE_CFG_OQ_RSV_MASK		GENMASK(13, 0)
> =20
>  #define PSE_FQ_CFG			0x008c
> +#define PSE_FC_CFG			0x0098
> +#define PSE_PORT6_SHARE_DIS		BIT(22)
>  #define PSE_FQ_LIMIT_MASK		GENMASK(14, 0)
> =20
>  #define REG_FE_PSE_BUF_SET		0x0090
> --=20
> 2.43.0
>=20

--as81oyFgOPbUaC9b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatCESAAKCRA6cBh0uS2t
rM+IAP9ikDHBBKnIbhaPOyfL3BDcnLXD91dFbc2vkrCv0RzncQEAo+k88MojIK0p
bkxd6hs4y7q3pCPiAxtvnW5InsrHnQI=
=UXx2
-----END PGP SIGNATURE-----

--as81oyFgOPbUaC9b--

