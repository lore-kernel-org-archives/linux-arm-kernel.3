Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B30BC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IANzF0ECqfYvNW6o6lUVxR7BnQHMG2/Ia6EKNLv4V7U=; b=j24GJ74ZvQbnBBavHZRk70aO3X
	9CYkbbBFfBjZtj2RCpCbFXgyADiONdXzMp7wtaQPk/qK0iYbGszmSpxi/YsXe9EF6M1WoZQMae7OP
	aP6AehyM9TWpxE/VAZ3DgWg6MKpRTKiQfPmfRrzCM7IYK0Knbuyv1PGl3Aill3fsq+cW/pdjEwuLl
	R8OWRxyU4bePt+gJ/7/NjPnkDnPohBnceEEz6PbpUTvQQHWp/oyJrjv9C2aljfzqf1QvceBCsG7My
	anmo4q8oVe9/gTv9kwCC7So1IfIM7jagHPrhkaMmH3OZLQzaF9yO6nu4A0iCBmu2P5Kdj9WLyP2VP
	pqRIjGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGvz-00000007Wlh-1Vs7;
	Fri, 07 Aug 2026 09:32:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGvy-00000007Wl1-0BJq;
	Fri, 07 Aug 2026 09:32:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FAEE416DE;
	Fri,  7 Aug 2026 09:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92BB1F000E9;
	Fri,  7 Aug 2026 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786095129;
	bh=IANzF0ECqfYvNW6o6lUVxR7BnQHMG2/Ia6EKNLv4V7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vy4vfCDZFH8U9cH+bjQQHEgS2fvGgOSfDBUTJNaxbud290GK0chUox81FUVfjYg6R
	 3D2kF8uFiOhRp4ZTdgX08mxKIIOCwk0CByMtDgdw8VrKE4HyZK3Uqdot/M01udXbjF
	 d+zLRz/6yuX2MeuVz/N2eD5Ch99Fu9wXQAwgB4FCdEVJJx9wKqPylzLz9BL5xJYnGV
	 9NaCxFaZ1Nc5my5YC3wPke/7BYlhHDRnZZaPpo2A3cu1VZdHYDgCPdVIxyX61/C/8M
	 0W8Ne5Kpd4kw60U1ZYN+AkKqDLy7YERpluujRY2u3VJRZmJAzK4I+uy2sLSTx9byx2
	 Xdxv036z7kNiA==
Date: Fri, 7 Aug 2026 11:32:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4] net: airoha: npu: use coherent DMA for mailbox
 messages
Message-ID: <anWmF-BsC-gKAvNF@lore-desk>
References: <20260807064058.1117747-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WZcbrwvPngP5YrRS"
Content-Disposition: inline
In-Reply-To: <20260807064058.1117747-1-pawlik.dan@gmail.com>
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

--WZcbrwvPngP5YrRS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
> buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
> non-coherent CPUs invalidate caches before reading NPU GET responses.
>=20
> On EN7581 + MT7996 that change regresses probe: the mailbox completes
> successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
> mt76 never binds NPU offload. Healthy boards report 0.1111.
>=20
> airoha_npu_send_msg() is also used from PPE foe_commit under
> spin_lock_bh(), so per-message dma_alloc_coherent(GFP_ATOMIC) is a poor
> fit. Allocate one device-managed coherent bounce buffer per NPU core at
> probe and reuse it under the existing per-core mailbox lock. That also
> keeps the buffer valid if the NPU completes a write after a mailbox
> timeout.
>=20
> Introduce __airoha_npu_send_msg() with an optional reply pointer so GET
> callers can copy the trailing response payload once. Keep
> airoha_npu_send_msg() as a thin wrapper for SET paths.
>=20
> Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).
>=20
> Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buff=
er")
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608050=
70851.2885888-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608060=
72601.1815487-1-pawlik.dan@gmail.com/
> Assisted-by: Cursor:composer-2
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> ---
> v4:
> - drop rsp_off; copy trailing reply_len bytes into reply pointer
> - split __airoha_npu_send_msg() + thin airoha_npu_send_msg() wrapper
>   so SET callers stay unchanged
> - fix reverse-christmas-tree local variable ordering
> - constify data argument; clarify reply copy comment
>=20
> v3:
> - move coherent mailbox buffer into struct airoha_npu_core (buf/addr)
> - allocate one buffer per core at probe
> - add optional reply buffer to avoid the extra copy in
>   airoha_npu_wlan_msg_get()
> - document AIROHA_NPU_MBOX_SIZE vs ppe_mbox_data / WLAN payloads
>=20
> v2:
> - allocate one coherent mailbox buffer at probe and reuse it under the
>   per-core lock instead of per-message dma_alloc_coherent(GFP_ATOMIC)
>=20
>  drivers/net/ethernet/airoha/airoha_npu.c  | 70 +++++++++++++++++------
>  include/linux/soc/airoha/airoha_offload.h |  3 +
>  2 files changed, 54 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index b679bed952de..74da3c4d06e4 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -23,6 +23,12 @@
>  #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
>  #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
>  #define NPU_DUMP_SIZE				512
> +/*
> + * Mailbox DMA payload size. Covers sizeof(struct ppe_mbox_data) (28) and
> + * WLAN TLV messages (header + payload); largest in-tree WLAN payload to=
day
> + * is 16 bytes (INODE_TXRX_REG_ADDR). Keep headroom for future commands.
> + */
> +#define AIROHA_NPU_MBOX_SIZE			256
> =20
>  #define REG_NPU_LOCAL_SRAM		0x0
> =20
> @@ -160,23 +166,32 @@ struct wlan_mbox_data {
>  	DECLARE_FLEX_ARRAY(u8, d);
>  };
> =20
> -static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> -			       void *p, int size)
> +static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> +				 const void *data, int len, void *reply,
> +				 int reply_len)

if you use an u16 for reply_len you can avoid the reply_len < 0 check below.

>  {
> -	u16 core =3D 0; /* FIXME */
> -	u32 val, offset =3D core << 4;
> -	dma_addr_t dma_addr;
> +	struct airoha_npu_core *c =3D &npu->cores[0]; /* FIXME: core */
> +	u32 val, offset =3D 0;
>  	int ret;
> =20
> -	dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
> -	ret =3D dma_mapping_error(npu->dev, dma_addr);
> -	if (ret)
> -		return ret;
> +	if (len > AIROHA_NPU_MBOX_SIZE ||
> +	    (reply && (reply_len < 0 || reply_len > len)))

maybe you can have a dedicated if for this check

	if (reply && reply_len > len)
		reutrn -EINVAL;

> +		return -EINVAL;
> =20
> -	spin_lock_bh(&npu->cores[core].lock);
> +	/*
> +	 * Mailbox payloads are bidirectional (CPU request, NPU response).
> +	 * On EN7581+MT7996, streaming DMA_BIDIRECTIONAL against the
> +	 * caller kzalloc() buffer can leave WLAN_FUNC_GET_WAIT_NPU_VERSION
> +	 * reading as 0.0 despite MBOX success. Reuse a probe-time coherent
> +	 * bounce buffer under the per-core lock (also used from PPE
> +	 * foe_commit under atomic context).
> +	 */
> +	spin_lock_bh(&c->lock);
> +
> +	memcpy(c->buf, data, len);
> =20
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, c->addr);
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
>  	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
>  	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
>  	val =3D FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
> @@ -189,13 +204,21 @@ static int airoha_npu_send_msg(struct airoha_npu *n=
pu, int func_id,
>  	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) !=3D NPU_MBOX_SUCCESS)
>  		ret =3D -EINVAL;
> =20
> -	spin_unlock_bh(&npu->cores[core].lock);
> +	/* Copy the trailing reply_len bytes of the response. */
> +	if (!ret && reply)
> +		memcpy(reply, c->buf + len - reply_len, reply_len);
> =20
> -	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> +	spin_unlock_bh(&c->lock);
> =20
>  	return ret;
>  }
> =20
> +static inline int airoha_npu_send_msg(struct airoha_npu *npu, int func_i=
d,
> +				      const void *data, int len)
> +{

if you put in .c file please drop the inline.

> +	return __airoha_npu_send_msg(npu, func_id, data, len, NULL, 0);
> +}
> +
>  static int airoha_npu_load_firmware(struct device *dev, void __iomem *ad=
dr,
>  				    const char *fw_name, int fw_max_size)
>  {
> @@ -442,8 +465,9 @@ static int airoha_npu_ppe_stats_setup(struct airoha_n=
pu *npu,
>  	ppe_data->func_id =3D PPE_FUNC_SET_WAIT_FLOW_STATS_SETUP;
>  	ppe_data->stats_info.foe_stats_addr =3D foe_stats_addr;
> =20
> -	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +	err =3D __airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> +				    sizeof(*ppe_data), ppe_data,
> +				    sizeof(*ppe_data));

why not using airoha_npu_send_msg() here?

Regards,
Lorenzo

>  	if (err)
>  		goto out;
> =20
> @@ -497,9 +521,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu =
*npu, int ifindex,
>  	wlan_data->func_type =3D NPU_OP_GET;
>  	wlan_data->func_id =3D func_id;
> =20
> -	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
> -	if (!err)
> -		memcpy(data, wlan_data->d, data_len);
> +	err =3D __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
> +				    data, data_len);
>  	kfree(wlan_data);
> =20
>  	return err;
> @@ -770,6 +793,15 @@ static int airoha_npu_probe(struct platform_device *=
pdev)
>  	if (err)
>  		return err;
> =20
> +	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++) {
> +		struct airoha_npu_core *core =3D &npu->cores[i];
> +
> +		core->buf =3D dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
> +						&core->addr, GFP_KERNEL);
> +		if (!core->buf)
> +			return -ENOMEM;
> +	}
> +
>  	err =3D airoha_npu_run_firmware(dev, base, &res);
>  	if (err)
>  		return dev_err_probe(dev, err, "failed to run npu firmware\n");
> diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/so=
c/airoha/airoha_offload.h
> index 7589fccfeef6..16a988ad7467 100644
> --- a/include/linux/soc/airoha/airoha_offload.h
> +++ b/include/linux/soc/airoha/airoha_offload.h
> @@ -173,6 +173,9 @@ struct airoha_npu {
>  		/* protect concurrent npu memory accesses */
>  		spinlock_t lock;
>  		struct work_struct wdt_work;
> +		/* Coherent bounce buffer for mailbox cmd/rsp */
> +		void *buf;
> +		dma_addr_t addr;
>  	} cores[NPU_NUM_CORES];
> =20
>  	int irqs[NPU_NUM_IRQ];
> --=20
> 2.55.0
>=20

--WZcbrwvPngP5YrRS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCanWmFwAKCRA6cBh0uS2t
rCrkAP9Gw4KU6cTCczB4RER9jrHGuEfMkiF0nhbpGGqA0MdPIAD/f88pv8Q2mc+6
TPT97YWkH/jbYGN6PM1gFTdB6aMhQwU=
=QdxD
-----END PGP SIGNATURE-----

--WZcbrwvPngP5YrRS--

