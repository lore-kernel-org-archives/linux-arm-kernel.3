Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A909AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2vnMCPQOojSTe6uMJg0l2Vez2CaiS93NKFlwUuMrgA=; b=0Q1ncHdp4UA/nt8SM2dA5JbxnI
	DPI1gkNgI3vERZxMCmx9He1FVX1tND5cdPhL/cL+OfgOaUdEw2r6fmVXavPYKy9a/+yJD+coSGBbA
	yyK9Q6p53Dl84We72Dy+O+lIA9wemkGEjrikn8ZhSobZdPD+9JcGQIn3D9bEIcVsLxZCq0fTrqvBN
	tG2c2meA4l+rx6ECBkRJW8FPe0ZxqWWxabaz7Pe9RDQBh9yHXp/o6srk72lNWx8/+5a9RrpbC/swK
	RlpAr82D3Nz0WqZlFs4UT3hwnhVgfNLp29j+UuViyUJG6F1lh6Qd3xD+khpSGg6hdjTMItVHDsFD6
	eaBIagoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj48D-0000000GNiw-1q47;
	Fri, 14 Feb 2025 22:25:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj46l-0000000GNYU-3jwR;
	Fri, 14 Feb 2025 22:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k2vnMCPQOojSTe6uMJg0l2Vez2CaiS93NKFlwUuMrgA=; b=J+H356ae4zUnjMOSGBw1B3YZL7
	/T2/TQgh82Y03mrVH7Xlc4/P5f+G6nyffpsQd00bKp+zPTdNie2VrURG+797OKSxdjvDum5eiC+bs
	qHMk3BxdEHul+ZH7et+bTP4Y+o5gcsLi4SbnU0vuUSF8E7sEBNoQQzIRom+monEH+SLBayf15MBme
	2oMBHqCtLJkrptfSyladSdfbK3AvTfIvTdXdoi5VcHinbIQInl+jGlF+jW/0BesYnZSp4+lrQVfkJ
	IEAHmyvio8ATJxeWo2hzwsGIkT5/AgfdQ1OTp+p/BKxLIAeibHgUhXlnrzFD3LZY8cLnX8IzN/aDf
	oAE+TReg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tj46c-0003Go-2m; Fri, 14 Feb 2025 23:24:18 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v14 04/13] drm/rockchip: vop2: Merge vop2_cluster/esmart_init
 function
Date: Fri, 14 Feb 2025 23:24:17 +0100
Message-ID: <8686639.gsGJI6kyIV@diego>
In-Reply-To: <20250212093530.52961-5-andyshrk@163.com>
References: <20250212093530.52961-1-andyshrk@163.com>
 <20250212093530.52961-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_142427_921021_9D640610 
X-CRM114-Status: GOOD (  20.23  )
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

Am Mittwoch, 12. Februar 2025, 10:34:59 MEZ schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Now these two function share the same logic, the can
> be merged as one.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 42 +++++---------------
>  1 file changed, 11 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index a0d961cb5d21..844df4001159 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2424,18 +2424,18 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
>  	return -ENOENT;
>  }
>  
> -static int vop2_cluster_init(struct vop2_win *win)
> +static int vop2_regmap_init(struct vop2_win *win, const struct reg_field *regs,
> +			    int nr_regs)
>  {
>  	struct vop2 *vop2 = win->vop2;
>  	int i;
>  
> -	for (i = 0; i < vop2->data->nr_cluster_regs; i++) {
> +	for (i = 0; i < nr_regs; i++) {
>  		const struct reg_field field = {
> -			.reg = (vop2->data->cluster_reg[i].reg != 0xffffffff) ?
> -				vop2->data->cluster_reg[i].reg + win->offset :
> -				vop2->data->cluster_reg[i].reg,
> -			.lsb = vop2->data->cluster_reg[i].lsb,
> -			.msb = vop2->data->cluster_reg[i].msb
> +			.reg = (regs[i].reg != 0xffffffff) ?
> +				regs[i].reg + win->offset : regs[i].reg,
> +			.lsb = regs[i].lsb,
> +			.msb = regs[i].msb
>  		};
>  
>  		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
> @@ -2446,28 +2446,6 @@ static int vop2_cluster_init(struct vop2_win *win)
>  	return 0;
>  };
>  
> -static int vop2_esmart_init(struct vop2_win *win)
> -{
> -	struct vop2 *vop2 = win->vop2;
> -	int i;
> -
> -	for (i = 0; i < vop2->data->nr_smart_regs; i++) {
> -		const struct reg_field field = {
> -			.reg = (vop2->data->smart_reg[i].reg != 0xffffffff) ?
> -				vop2->data->smart_reg[i].reg + win->offset :
> -				vop2->data->smart_reg[i].reg,
> -			.lsb = vop2->data->smart_reg[i].lsb,
> -			.msb = vop2->data->smart_reg[i].msb
> -		};
> -
> -		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
> -		if (IS_ERR(win->reg[i]))
> -			return PTR_ERR(win->reg[i]);
> -	}
> -
> -	return 0;
> -}
> -
>  static int vop2_win_init(struct vop2 *vop2)
>  {
>  	const struct vop2_data *vop2_data = vop2->data;
> @@ -2484,9 +2462,11 @@ static int vop2_win_init(struct vop2 *vop2)
>  		win->win_id = i;
>  		win->vop2 = vop2;
>  		if (vop2_cluster_window(win))
> -			ret = vop2_cluster_init(win);
> +			ret = vop2_regmap_init(win, vop2->data->cluster_reg,
> +					       vop2->data->nr_cluster_regs);
>  		else
> -			ret = vop2_esmart_init(win);
> +			ret = vop2_regmap_init(win, vop2->data->smart_reg,
> +					       vop2->data->nr_cluster_regs);

						^^ nr_smart_regs
I think





