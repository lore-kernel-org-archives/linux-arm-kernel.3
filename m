Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50B5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAkXzjPt8X/XOE0CbwOaMJf4t29lQ3cTGBGCsqKltRU=; b=M3M6f/dPbkFTjIXnf8+vjwzEWc
	EfPdx7JCIzWTdFlzBBroIWLBDd0nHYisKIbiNWt6aaO38S4s18tVirzhrdLsH8cRoeDpS2BTpozCr
	YyxkVicLKuIHPliTDuqZ0gnoDhiQhM5MQ6XSnHfR/eVzvlENR1277WcrmeQC0Ijax1NYcUyZnds+L
	/TpXD5np+IWN6I4+j1B9gNMAuyt0plSVhZLVJ1SurvQ1Iq7BUDucmyig3nAy1ohlQPvYktaNCQfcY
	gtgU5X6aEvvQotNqwvZ2KRkMO2gT3sX6+9QEonB+h+OurBBCRGOSo1AlZg9/8W4fSry26Mr+cmTEK
	uLNVHBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJmM-0000000AIU7-2a2R;
	Thu, 02 Jan 2025 11:54:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJkf-0000000AIFu-3BoP;
	Thu, 02 Jan 2025 11:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zAkXzjPt8X/XOE0CbwOaMJf4t29lQ3cTGBGCsqKltRU=; b=19pNoYzq8aMvqfvQhqk6BfloHt
	FGPBL1odDg6I8xokNeEptw/nvH7VUF4Ny+Z2/wUaSHGd4nK2rRJ85bxIFsTd18VBE7OxAoY6kanDD
	J6wWfBrx7VhniAVwUjKPR68Dm46azJCXSu7c131ek39CbZXHE5XkpCX7ZynR1utgd1Ez21HK9D0iN
	deTngyouwkrlo+Lmq+3UXh30wY4FQW90Utg3v3q5qvqQEDd4cNT07wnQC/giq52dsSl8tFU4f/2kp
	+Lmq6RQA2YOIm+3W16yCe+/kTePjBtMm8LgzSIazNu61tIV9xmsgWkDeoOn0T3yXFalFxKmllvnEe
	4K3ofz1w==;
Received: from i5e860d14.versanet.de ([94.134.13.20] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tTJk7-0007gM-LR; Thu, 02 Jan 2025 12:51:59 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, mripard@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
Date: Thu, 02 Jan 2025 12:51:58 +0100
Message-ID: <2175680.OBFZWjSADL@diego>
In-Reply-To: <20241225103741.364597-2-andyshrk@163.com>
References: <20241225103741.364597-1-andyshrk@163.com>
 <20241225103741.364597-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_035233_846276_89E9AA12 
X-CRM114-Status: GOOD (  24.28  )
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

Hi Andy,

Am Mittwoch, 25. Dezember 2024, 11:37:29 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> There are some control bits for IO and interrupts status scattered
> across different GRF on differt SOC.
> Add platform callback for this IO setting and interrupts status
> handling.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 81 ++++++++++++-------
>  1 file changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index c36fc130b734..b21e868e7c16 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -62,6 +62,12 @@ struct rockchip_hdmi_qp {
>  	int port_id;
>  };
>  
> +struct rockchip_hdmi_qp_ctrl_ops {
> +	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
> +	irqreturn_t (*irq_callback)(int irq, void *dev_id);
> +	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
> +};
> +
>  static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
>  {
>  	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> @@ -226,9 +232,47 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
> +{
> +	u32 val;
> +
> +	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
> +	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
> +	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
> +	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
> +

nit: below val = ... and regmap_write don't have a blank line between them
which makes sense to show that they belong together. So the blank above
can probably also go away.

> +	regmap_write(hdmi->vo_regmap,
> +		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
> +		     val);
> +
> +	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK, RK3588_SET_HPD_PATH_MASK);
> +	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
> +
> +	if (hdmi->port_id)
> +		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
> +				RK3588_HDMI1_GRANT_SEL);
> +	else
> +		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
> +				RK3588_HDMI0_GRANT_SEL);
> +	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
> +
> +	if (hdmi->port_id)
> +		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
> +	else
> +		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
> +	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
> +}
> +
> +static const struct rockchip_hdmi_qp_ctrl_ops rk3588_hdmi_ctrl_ops = {
> +	.io_init		= dw_hdmi_qp_rk3588_io_init,
> +	.irq_callback	        = dw_hdmi_qp_rk3588_irq,
> +	.hardirq_callback	= dw_hdmi_qp_rk3588_hardirq,
> +};
> +
>  struct rockchip_hdmi_qp_cfg {
>  	unsigned int num_ports;
>  	unsigned int port_ids[MAX_HDMI_PORT_NUM];
> +	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
>  	const struct dw_hdmi_qp_phy_ops *phy_ops;
>  };
>  
> @@ -238,6 +282,7 @@ static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
>  		0xfde80000,
>  		0xfdea0000,
>  	},
> +	.ctrl_ops = &rk3588_hdmi_ctrl_ops,
>  	.phy_ops = &rk3588_hdmi_phy_ops,
>  };
>  
> @@ -282,6 +327,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	if (!cfg)
>  		return -ENODEV;
>  
> +	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->irq_callback) {

cfg->ctrl_ops->irq_callback is checked twice, I guess one of them
should've been ctrl_ops->hardirq_callback?

Patch looks good otherwise.

Thanks
Heiko




