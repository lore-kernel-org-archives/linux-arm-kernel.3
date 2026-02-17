Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F92AE63F2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6FclGj2g+RRuQaD0dmY2WV4ee+8RDBWNqd7Z0J0TSQ=; b=SHh0wO0D18N3oyxuk/jWF1OUhV
	jbTOecNEROS4pXED3fe8hV4UZkhn8paNRH5v2pGweXCc/ik3vPPBD9Z8UI7EaisP/5SjcxpfVjOuE
	F17eToAaKAoXer7ERwEyuj1cpllHgTeWJVkDaylo1a4q6DJ7I/MvSCAxfEtkPzmWp2yy0x5d9IV+k
	M5fr/XaeQZlnQQUiqND6jK8uJlPu2YfcS7uTW8/TTdLfFEB3mb3dSX7Iv3O5Hwitw+GkF3W/W5gIZ
	OKlVmChKw5sUyhlGXURmPDxgoLKffYg4Uc6+r4RbqSgVXTQ14CZMcXI/OkHcqHPsTgDEStakJjguq
	eqTgV/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFoZ-00000007mwS-43EY;
	Tue, 17 Feb 2026 07:48:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFoW-00000007mw4-2wJh;
	Tue, 17 Feb 2026 07:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771314483;
	bh=hV2LXUFRvp3gGdAS+sOIikPEF9/2c/sgwXOC2d/azYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X2ZlmpzjoC1o4Lr2vL4mNberYUWTbWNcNWOzF7fPy9rS4rztiPfQWulvVccX/qOwJ
	 rhB3Qgw3tPDe8X9VtMy0Qv1iS9ULe5oRYV7dxT3tLszOuLfpiLWL1CFkqQq+Ps6HrB
	 Nx99Fu68lVfUQmLl81wvvcV0BwC3ZUroShPvloIEN0V/YSzopp2UGiwZdAKpMfySrG
	 7JAxdKkPRGLiBqrAGrnHs3H0L3obTapJTwPMdu3AwB3ZCpQ+ROQOByKoFsCBtUr+jy
	 VWbCVqjaTr1AcCn/4oJYOKlTAJ4ndfeQls3MrmPJiewc8VG4sEC11cKBek9T44hoOl
	 WgYWLHIQnHR7Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4812417E114C;
	Tue, 17 Feb 2026 08:48:03 +0100 (CET)
Message-ID: <2c3f5c57-9ecc-4a99-9f8b-e1b09a98539b@collabora.com>
Date: Tue, 17 Feb 2026 08:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: synopsys: csi2rx: implement
 .get_frame_desc() callback
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
 <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_234808_984220_EE8F5716 
X-CRM114-Status: GOOD (  17.51  )
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

Hi Frank,

Thanks for the patch.

On 2/16/26 20:18, Frank Li wrote:
> Implement the .get_frame_desc() callback to fetch information from the
> remote endpoint.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> change in v3
> - use media_entity_to_v4l2_subdev()
> 
> change in v2
> - add csi2rx in subject
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index f03fe01280013bf9a832433c6b06dab691bf8f4c..bcbf109a0bfd040c568c0652e28752c94a1bc30d 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -429,10 +429,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int
> +dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			      struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +
> +	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		dev_err(csi2->dev, "can't get remote source pad\n");
> +		return PTR_ERR(remote_pad);
> +	}
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}
> +
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> +	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,
> 


