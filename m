Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CEC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4Gmw8/uuiv7Srrf+S8V6/FU00WMyV/pS+FzEwCYa7Y=; b=2iu1zjDxdm+2Mu1JfIBFgdO7at
	STctuhFsIm5aAs1euhLo2g9+X6OB8VB3Jg6/WQUTIUdDE+lYafYElBdmbHmO6HG8l+L9wuKAlP1qM
	7YtqXm1829I9uiyaiVWZfZqK4ho996zN3KVJBIsW7Feb4ghZejvnPyI7nrrC1iJwwszXwomEFmBUu
	4ZlqimAJod5P79ZsogDuWVTpApOpvTgLaSOUreW9hFFx5d4Jczv8CrrDKP8BY6m0JaB1yHrcIc/3j
	pK0umkBSmnVea0IWrI/UFWrEPs6gvWNTsUhq3mF/+H1XGd6rhNKYM8eaijFZYYstWYwZgoqvKkPK2
	rV9+dy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wslSw-00000009ZQl-0bbw;
	Sat, 08 Aug 2026 18:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wslSu-00000009ZQa-27sr;
	Sat, 08 Aug 2026 18:08:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5674B6001A;
	Sat,  8 Aug 2026 18:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882581F000E9;
	Sat,  8 Aug 2026 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786212490;
	bh=T4Gmw8/uuiv7Srrf+S8V6/FU00WMyV/pS+FzEwCYa7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FnlxsRaBTaB1sdbCBqF+do2XEPVqlg5fMt/mPx7AiiA9M+F7veVKwNx9eXROczqWp
	 zoXiMOCYT/ef6XJPLZUWJAD7Do5xqOMG4w8q+fAW84UXoplFAjkxTe9AcfaG1ULjVl
	 ogwaijnV9SKg9rA61+HduVgXmDSfA/Dr7M5UsUxRcPhtssArot4ZFzJXpzNGPxscUs
	 38lHtwa0zatvBtN2K2M93w5V96y4yXjZ6b2gMVzUP99Q+xJV7mIT81R06lqDfhfSBj
	 kzv4YPm4JmZ6VDTfpl2Yc6pM73zBN3LHFIj+xLfK5TJvp4psYSsvsY3pM8Us4BCfzR
	 TxwO1fnTfUZ3w==
Date: Sat, 8 Aug 2026 20:08:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5] net: airoha: npu: use coherent DMA for mailbox
 messages
Message-ID: <andwh-dKjkWQJE-p@lore-desk>
References: <20260808142704.1873849-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="flxUo8/Ss8/xFs+E"
Content-Disposition: inline
In-Reply-To: <20260808142704.1873849-1-pawlik.dan@gmail.com>
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

--flxUo8/Ss8/xFs+E
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
> airoha_npu_send_msg() as a thin wrapper for SET paths that do not need
> a response buffer.
>=20
> Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).
>=20
> Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buff=
er")
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608050=
70851.2885888-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608060=
72601.1815487-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608070=
64058.1117747-1-pawlik.dan@gmail.com/
> Assisted-by: Cursor:composer-2
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> ---
> v5:
> - use u16 for reply_len and split the reply length check
> - drop inline from airoha_npu_send_msg() in the .c file
>=20
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
>  drivers/net/ethernet/airoha/airoha_npu.c  | 72 +++++++++++++++++------
>  include/linux/soc/airoha/airoha_offload.h |  3 +
>  2 files changed, 56 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index b679bed952de..907e7ef6cf75 100644
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
> @@ -160,23 +166,34 @@ struct wlan_mbox_data {
>  	DECLARE_FLEX_ARRAY(u8, d);
>  };
> =20
> -static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> -			       void *p, int size)
> +static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> +				 const void *data, int len, void *reply,
> +				 u16 reply_len)
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
> +	if (len > AIROHA_NPU_MBOX_SIZE)
> +		return -EINVAL;
> =20
> -	spin_lock_bh(&npu->cores[core].lock);
> +	if (reply && reply_len > len)
> +		return -EINVAL;
> +
> +	/*
> +	 * Mailbox payloads are bidirectional (CPU request, NPU response).
> +	 * On EN7581+MT7996, streaming DMA_BIDIRECTIONAL against the
> +	 * caller kzalloc() buffer can leave WLAN_FUNC_GET_WAIT_NPU_VERSION
> +	 * reading as 0.0 despite MBOX success. Reuse a probe-time coherent
> +	 * bounce buffer under the per-core lock (also used from PPE
> +	 * foe_commit under atomic context).
> +	 */
> +	spin_lock_bh(&c->lock);
> =20
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
> +	memcpy(c->buf, data, len);
> +
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, c->addr);
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
>  	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
>  	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
>  	val =3D FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
> @@ -189,13 +206,21 @@ static int airoha_npu_send_msg(struct airoha_npu *n=
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
> +static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> +			       const void *data, int len)
> +{
> +	return __airoha_npu_send_msg(npu, func_id, data, len, NULL, 0);
> +}
> +
>  static int airoha_npu_load_firmware(struct device *dev, void __iomem *ad=
dr,
>  				    const char *fw_name, int fw_max_size)
>  {
> @@ -442,8 +467,9 @@ static int airoha_npu_ppe_stats_setup(struct airoha_n=
pu *npu,
>  	ppe_data->func_id =3D PPE_FUNC_SET_WAIT_FLOW_STATS_SETUP;
>  	ppe_data->stats_info.foe_stats_addr =3D foe_stats_addr;
> =20
> -	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +	err =3D __airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> +				    sizeof(*ppe_data), ppe_data,
> +				    sizeof(*ppe_data));

I do not think we expect any reply here, you can just use airoha_npu_send_m=
sg()
as before.

Regards,
Lorenzo

>  	if (err)
>  		goto out;
> =20
> @@ -497,9 +523,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu =
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
> @@ -770,6 +795,15 @@ static int airoha_npu_probe(struct platform_device *=
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

--flxUo8/Ss8/xFs+E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCandwhwAKCRA6cBh0uS2t
rCdsAP4iMeM3Km6U++eJp5M7QeczcgyOI5+Shx7ygeaDZ8G/cgD/SMQovPrgM7LI
BpdAmjjcQj+l93aIYzmp6PqLK0wxdAI=
=ITgL
-----END PGP SIGNATURE-----

--flxUo8/Ss8/xFs+E--

