Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36FFC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69bnCVQM5n3sV/AN5VtraQEwkW0YanBMdQC8pbKcydM=; b=n1wuHpk1lk/pdZxc0ohlwPU4VF
	O90VtQ0XQnUuNyf6BUh/NR95kn62XdqMR7SkvfRjeOnUHtLSqIgFk5o4DHurQQjq3/fMjH9yTnJdc
	N0k/p/fqNGmfxLeaASULgEBh9NO7DOEAhOdBYcpuAVlMp834RClzWx8WNcrY9L0ynCAhlLXzAiBok
	+itxPAyvuWpytK8aSde3/PhA3a/9q8z6dthpTC0AR0UxCPVHJRVt9swqRTjC1kPQBqh0C9MYY77Z9
	HYTko85Ut+14DFg6kdYZp9OCiRGkGrneHgRJj6nvXgzL1yv1xaY9Aoo3miy5lEsM+4p4TjS4psYtX
	civDKsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NI3-0000000D8IT-1VSA;
	Fri, 18 Sep 2026 01:21:23 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NI0-0000000D8Gz-1BEf;
	Fri, 18 Sep 2026 01:21:21 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 76870D0766;
	Fri, 18 Sep 2026 04:21:14 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 76870D0766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789694477;
	bh=69bnCVQM5n3sV/AN5VtraQEwkW0YanBMdQC8pbKcydM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ax2GgqebXNR2R2lP+6/CijC3VqGvyDb08ILb0eZ6Ema1QmO+nzkiVt/qRo7PjqTGp
	 omF5ojiR+tFY2fkhlBSOfp1uhXyFE5u1MkIs/42ovtNJ+0FF/txHSbBXiE5YlIqqXz
	 7ZfxK8+GnM/1UaO/A/wiJz4RukrOPn8ziE+7vEOamYCHnXcUjxPRGUakAtZoryriXd
	 hzMZ+JCt9n9yC1f1spnVcwlt9shjLNaDYXtF4nrnK/oHV7gCM1A9PdtfQYADHAkmYd
	 vd+8dsupfkAL9T2QqNdP05m/gXaJ7VZc2W+030SRS9tXyKQrP6cko254BVWIod5kye
	 4hJvIM4Oow2Kw==
Message-ID: <2b23ecf7ae8baf0266c3701060858abec901a71c.camel@rendec.net>
Subject: Re: [PATCH v2 6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
From: Radu Rendec <radu@rendec.net>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Anup Patel
 <anup@brainfault.org>,  Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT
 Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong	
 <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>
Date: Thu, 17 Sep 2026 21:21:12 -0400
In-Reply-To: <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
	 <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_182120_500381_04614E31 
X-CRM114-Status: GOOD (  20.22  )
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

On Fri, 2026-09-11 at 03:27 +0000, GUO Ren (XuanTie) wrote:
> The last enumerator of this driver's firmware IPI id list is a bound
> for the VPU mailbox protocol, not a generic host IPI limit. Follow the
> existing naming in this header: IPI_VPU_INIT already carries a VPU
> prefix, so the terminator should match.
>=20
> The same convention is used by the SCP IPI enum, which ends with a
> prefixed SCP_IPI_MAX rather than a bare IPI_MAX.
>=20
> Rename IPI_MAX to IPI_VPU_MAX and update the descriptor table bounds
> and range checks. No functional change.
>=20
> Link: https://lore.kernel.org/linux-riscv/20260908222349.GA2324870@ax162
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h |=C2=A0 4 ++--
> =C2=A02 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..b3e9f8c4ab7a 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -211,7 +211,7 @@ struct mtk_vpu {
> =C2=A0	struct vpu_regs reg;
> =C2=A0	struct vpu_run run;
> =C2=A0	struct vpu_wdt wdt;
> -	struct vpu_ipi_desc ipi_desc[IPI_MAX];
> +	struct vpu_ipi_desc ipi_desc[IPI_VPU_MAX];
> =C2=A0	struct share_obj __iomem *recv_buf;
> =C2=A0	struct share_obj __iomem *send_buf;
> =C2=A0	struct device *dev;
> @@ -221,7 +221,7 @@ struct mtk_vpu {
> =C2=A0	struct mutex vpu_mutex; /* for protecting vpu data data structure =
*/
> =C2=A0	u32 wdt_refcnt;
> =C2=A0	wait_queue_head_t ack_wq;
> -	bool ipi_id_ack[IPI_MAX];
> +	bool ipi_id_ack[IPI_VPU_MAX];
> =C2=A0};
> =C2=A0
> =C2=A0static inline void vpu_cfg_writel(struct mtk_vpu *vpu, u32 val, u32=
 offset)
> @@ -296,7 +296,7 @@ int vpu_ipi_register(struct platform_device *pdev,
> =C2=A0		return -EPROBE_DEFER;
> =C2=A0	}
> =C2=A0
> -	if (id < IPI_MAX && handler) {
> +	if (id < IPI_VPU_MAX && handler) {
> =C2=A0		ipi_desc =3D vpu->ipi_desc;
> =C2=A0		ipi_desc[id].name =3D name;
> =C2=A0		ipi_desc[id].handler =3D handler;
> @@ -319,7 +319,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> =C2=A0	unsigned long timeout;
> =C2=A0	int ret =3D 0;
> =C2=A0
> -	if (id <=3D IPI_VPU_INIT || id >=3D IPI_MAX ||
> +	if (id <=3D IPI_VPU_INIT || id >=3D IPI_VPU_MAX ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 len > sizeof(send_obj->share_buf) || !buf) {
> =C2=A0		dev_err(vpu->dev, "failed to send ipi message\n");
> =C2=A0		return -EINVAL;
> @@ -748,7 +748,7 @@ static void vpu_ipi_handler(struct mtk_vpu *vpu)
> =C2=A0	s32 id =3D readl(&rcv_obj->id);
> =C2=A0
> =C2=A0	memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
> -	if (id < IPI_MAX && ipi_desc[id].handler) {
> +	if (id < IPI_VPU_MAX && ipi_desc[id].handler) {
> =C2=A0		ipi_desc[id].handler(data, readl(&rcv_obj->len),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 ipi_desc[id].priv);
> =C2=A0		if (id > IPI_VPU_INIT) {
> @@ -934,7 +934,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
> =C2=A0#ifdef CONFIG_DEBUG_FS
> =C2=A0	debugfs_remove(vpu_debugfs);
> =C2=A0#endif
> -	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_MAX);
> +	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_VPU_MAX);
> =C2=A0vpu_mutex_destroy:
> =C2=A0	mutex_destroy(&vpu->vpu_mutex);
> =C2=A0disable_vpu_clk:
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index 3951547e9ec5..44ab631ec904 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -49,7 +49,7 @@ typedef void (*ipi_handler_t) (void *data,
> =C2=A0 *			 handle VP8 video encoder job,, and vice versa.
> =C2=A0 * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
> =C2=A0 *			 handle MDP (Media Data Path) job, and vice versa.
> - * @IPI_MAX:		 The maximum IPI number
> + * @IPI_VPU_MAX:	 The maximum VPU IPI number
> =C2=A0 */
> =C2=A0
> =C2=A0enum ipi_id {
> @@ -60,7 +60,7 @@ enum ipi_id {
> =C2=A0	IPI_VENC_H264,
> =C2=A0	IPI_VENC_VP8,
> =C2=A0	IPI_MDP,
> -	IPI_MAX,
> +	IPI_VPU_MAX,
> =C2=A0};
> =C2=A0
> =C2=A0/**

Reviewed-by: Radu Rendec <radu@rendec.net>

