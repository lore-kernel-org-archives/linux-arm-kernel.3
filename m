Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA803C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgVXlBMcGsPkxpJRBTkCHYZHbhRpMkLW08bAw7XuaYE=; b=SSjiWeYJGNWMPLWh86c1IPCgKZ
	Q1JO+m/GMkUhb5reyxxQNDYMQ1Ol9v+dMgbUQMtLc+rLU8De5vy1sRNJhoe5iw8H3yyWB7Cvlo2fc
	Ejl99Jgfv7wxd19CEAza6B9g91mlgciD0lFB0o/WEvaSaVn+IBdApuhf/2w6CeKIVgdBazTtwGHqi
	ZMP5t3k2ZC3PiaHsn89NIws4KkMmGFXV05l0WUZQecYf9aRA7CUajZv11WstQvhdnkWBTHkNVS9Ju
	r1rIJDljffCDT+D5wZyGAzkg/qsx40LcOqVIPA06pTIeCx1ps0Zvryh4mMotSW0+stCJzjHGtcCvp
	bQHC1/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0CR-000000067Yf-1Y4O;
	Thu, 06 Aug 2026 15:40:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0CP-000000067Y2-1U86;
	Thu, 06 Aug 2026 15:40:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4D3A60AB0;
	Thu,  6 Aug 2026 15:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FEF1F000E9;
	Thu,  6 Aug 2026 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786030800;
	bh=zgVXlBMcGsPkxpJRBTkCHYZHbhRpMkLW08bAw7XuaYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AUu2y6wmi7Kt+aI/kQ4gij3whp0D8edr6xeRY+a7jg0HW1sKI4ilUoRulACej66Su
	 XOwxxTGUHDk8FSf+f6kGR/qOMWYc/d6Q40h5mNIDu4+MwdojMoLgI6YYRHc4nAOxNt
	 b4EXGEIKIUIeVfJdvGjx0HReNvfal3+wavUMsiEmxmeYs04gTPYOIehJ5rriF3JMLV
	 8eauKCX7dypXrTSuCjPM7hGR5WAgDm/S9GRwJipCYtx3zzwhy3Wn8sYVINJLj3aKAQ
	 GMcfgRgUSqnmtS+Q2Ix0IR7GrQrK6uE7jhvZmK/3CP24vXukkh7qb0GwMZvm3Zk5zO
	 yMFfSACpj+6pQ==
Date: Thu, 6 Aug 2026 17:39:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] net: airoha: npu: use coherent DMA for mailbox
 messages
Message-ID: <anSqzp8GZe921cYZ@lore-desk>
References: <20260806142816.511515-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bE6BQemWI+qryte1"
Content-Disposition: inline
In-Reply-To: <20260806142816.511515-1-pawlik.dan@gmail.com>
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

--bE6BQemWI+qryte1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 06, Daniel Pawlik wrote:
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
> Pass an optional reply buffer into airoha_npu_send_msg() so GET callers
> (e.g. airoha_npu_wlan_msg_get) copy the response payload once instead of
> bouncing through the request allocation.
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
> v3:
> - move coherent mailbox buffer into struct airoha_npu_core (buf/addr)
> - allocate one buffer per core at probe
> - add optional reply buffer to airoha_npu_send_msg() to avoid the extra
>   copy in airoha_npu_wlan_msg_get()
> - document AIROHA_NPU_MBOX_SIZE vs ppe_mbox_data / WLAN payloads
>=20
> v2:
> - allocate one coherent mailbox buffer at probe and reuse it under the
>   per-core lock instead of per-message dma_alloc_coherent(GFP_ATOMIC)
>=20
>  drivers/net/ethernet/airoha/airoha_npu.c  | 67 ++++++++++++++++-------
>  include/linux/soc/airoha/airoha_offload.h |  3 +
>  2 files changed, 51 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index b679bed952de..e1e0ddb92f03 100644
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
> @@ -161,21 +167,32 @@ struct wlan_mbox_data {
>  };
> =20
>  static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> -			       void *p, int size)
> +			       const void *req, int size,
> +			       void *rsp, int rsp_off, int rsp_len)

I guess you do not need rsp_off, just pass the data pointer (wlan_data->d f=
or
airoha_npu_wlan_msg_get()). Moreover you can define something like:

static int __airoha_npu_send_msg(..., void *reply, int reply_len)
{
	...
}

static inline int airoha_npu_send_msg() { return __airoha_npu_send_msg( ...=
, NULL, 0); }

In this way the change will be less intrusive.

>  {
>  	u16 core =3D 0; /* FIXME */
> +	struct airoha_npu_core *c =3D &npu->cores[core];

please respect RCT if possible.

Regards,
Lorenzo

>  	u32 val, offset =3D core << 4;
> -	dma_addr_t dma_addr;
>  	int ret;
> =20
> -	dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
> -	ret =3D dma_mapping_error(npu->dev, dma_addr);
> -	if (ret)
> -		return ret;
> +	if (size > AIROHA_NPU_MBOX_SIZE ||
> +	    (rsp && (rsp_off < 0 || rsp_len < 0 ||
> +		     rsp_off + rsp_len > size)))
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
> +	memcpy(c->buf, req, size);
> =20
> -	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
> +	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, c->addr);
>  	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
>  	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
>  	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
> @@ -189,9 +206,10 @@ static int airoha_npu_send_msg(struct airoha_npu *np=
u, int func_id,
>  	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) !=3D NPU_MBOX_SUCCESS)
>  		ret =3D -EINVAL;
> =20
> -	spin_unlock_bh(&npu->cores[core].lock);
> +	if (!ret && rsp)
> +		memcpy(rsp, c->buf + rsp_off, rsp_len);
> =20
> -	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> +	spin_unlock_bh(&c->lock);
> =20
>  	return ret;
>  }
> @@ -343,7 +361,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu)
>  	ppe_data->init_info.wan_mode =3D QDMA_WAN_ETHER;
> =20
>  	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +				  sizeof(*ppe_data), NULL, 0, 0);
>  	kfree(ppe_data);
> =20
>  	return err;
> @@ -362,7 +380,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *n=
pu)
>  	ppe_data->func_id =3D PPE_FUNC_SET_WAIT_HWNAT_DEINIT;
> =20
>  	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +				  sizeof(*ppe_data), NULL, 0, 0);
>  	kfree(ppe_data);
> =20
>  	return err;
> @@ -386,7 +404,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct a=
iroha_npu *npu,
>  	ppe_data->set_info.size =3D sram_num_entries;
> =20
>  	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +				  sizeof(*ppe_data), NULL, 0, 0);
>  	kfree(ppe_data);
> =20
>  	return err;
> @@ -411,7 +429,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_=
npu *npu,
>  					  : PPE_SRAM_SET_ENTRY;
> =20
>  	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +				  sizeof(*ppe_data), NULL, 0, 0);
>  	if (err)
>  		goto out;
> =20
> @@ -420,7 +438,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_=
npu *npu,
>  	ppe_data->set_info.size =3D sizeof(u32);
> =20
>  	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> -				  sizeof(*ppe_data));
> +				  sizeof(*ppe_data), NULL, 0, 0);
>  out:
>  	kfree(ppe_data);
> =20
> @@ -443,6 +461,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_n=
pu *npu,
>  	ppe_data->stats_info.foe_stats_addr =3D foe_stats_addr;
> =20
>  	err =3D airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
> +				  sizeof(*ppe_data), ppe_data, 0,
>  				  sizeof(*ppe_data));
>  	if (err)
>  		goto out;
> @@ -475,7 +494,8 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu=
 *npu, int ifindex,
>  	wlan_data->func_id =3D func_id;
>  	memcpy(wlan_data->d, data, data_len);
> =20
> -	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
> +	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
> +				  NULL, 0, 0);
>  	kfree(wlan_data);
> =20
>  	return err;
> @@ -497,9 +517,9 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu =
*npu, int ifindex,
>  	wlan_data->func_type =3D NPU_OP_GET;
>  	wlan_data->func_id =3D func_id;
> =20
> -	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
> -	if (!err)
> -		memcpy(data, wlan_data->d, data_len);
> +	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
> +				  data, offsetof(struct wlan_mbox_data, d),
> +				  data_len);
>  	kfree(wlan_data);
> =20
>  	return err;
> @@ -770,6 +790,15 @@ static int airoha_npu_probe(struct platform_device *=
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

--bE6BQemWI+qryte1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCanSqzgAKCRA6cBh0uS2t
rLa8AQCim3sEzkodq81UDGCSr42lQqC25sPkgT75z25sk3Px9wEA5HjnaauWDbDm
qZryftaJCspJnhlQ2cFlvC3yFalF/A8=
=6hv0
-----END PGP SIGNATURE-----

--bE6BQemWI+qryte1--

