Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3744AD35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POcsNmLN0SCWlrTO0moi7W9PCblhnaTgmuDGBIJLrBY=; b=TB6X6pGLP0GgEQEOhe3jFVuoj/
	LVrLZ/BtHp9Jnug+00EQ32fDA4s1o2BQuQ4wzsAAt6nRNKW3u++mPybthCbs0ayToNGPesjRCW0DX
	UwTd37yfcMBSvpfdk0PU1nusle50gNztQz4Dx1O90KDPHEQlHY/puKvXkK1gIEqSy6aSY45R+b3ek
	dqLdMTe7YGn4NSeXR3Lp5GCD42fWaa0Ua8Lz9FY3oPIrQpc/osGP+M1mnD7xUo3Bmlw2QN116pUui
	JBTMXpTW2CT1kv6JmIeGNYjSnrVErpGUoxSQmiZBCcJYrYw/Om+bP48j5YS/WpPjjNDk617TtXmFA
	HruYVHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90AV-00000006Zbh-1ve6;
	Thu, 07 Nov 2024 10:55:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t908C-00000006ZFG-0hcS;
	Thu, 07 Nov 2024 10:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730976770;
	bh=cnpp2TKMHv1gK8Yy2Zpt8olDnfx3n0TPEPZ9lucWymU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gHOmQb2gzrh17lPVK0V41gcSYPwvUfOVnvZPfNkDhFRD2ruZlgjqo2mqNiyqdLELn
	 UedWM4hWzT0LGQetXp1QTN4MMTnp1XtrqcchepmWo4dI9M3hCMxfKwEDeCOIH9M/9z
	 Nqu7SM6F/E49HialrekHtJFcr3TKvWgz4r2wzMWkAaA8D4+XtlKuTZKanrV76dx3GZ
	 ZbXL/uyODk9XNtdOKS8cJJ5Z2JhiHbsHD2bY+fvl0oZuEOeurB/Tm4gzHAPgdv9NWG
	 dyp8z2XjxfcUwjtdReLPNTKFe/kqgflUIuXeF2M3x5O23BpjNAdeC5r579cU7pzfxD
	 iQoTKTUqohyDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F330217E35DC;
	Thu,  7 Nov 2024 11:52:49 +0100 (CET)
Message-ID: <90fe898c-0352-46da-aee3-898cdf2b5d26@collabora.com>
Date: Thu, 7 Nov 2024 11:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: mediatek: vcodec: support extended h264
 decode
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241107074603.31998-1-yunfei.dong@mediatek.com>
 <20241107074603.31998-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241107074603.31998-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_025252_415365_3906C7C7 
X-CRM114-Status: GOOD (  18.62  )
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

Il 07/11/24 08:45, Yunfei Dong ha scritto:
> The address end of working buffer can't be calculated directly with buffer
> size in kernel for some special architecture. Adding new extend vsi_ex to
> calculate the address end in firmware.
> Adding capability to separate extend and non extend driver for different
> platform.
> At last, hardware can parse the syntax to get nal information in firmware
> for extend architecture, needn't to parse it again in kernel.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
>   .../decoder/vdec/vdec_h264_req_multi_if.c     | 487 +++++++++++++++++-
>   2 files changed, 472 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 886fa385e2e6..1e697bc810b0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -17,6 +17,7 @@
>   
>   #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
>   #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
> +#define IS_VDEC_SUPPORT_EX(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EX)
>   
>   enum mtk_vcodec_dec_chip_name {
>   	MTK_VDEC_INVAL = 0,
> @@ -42,6 +43,7 @@ enum mtk_vdec_format_types {
>   	MTK_VDEC_FORMAT_HEVC_FRAME = 0x1000,
>   	MTK_VCODEC_INNER_RACING = 0x20000,
>   	MTK_VDEC_IS_SUPPORT_10BIT = 0x40000,
> +	MTK_VDEC_IS_SUPPORT_EX = 0x80000,
>   };
>   
>   /*
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> index 851a8490b828..d0aecd9621d9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c

..snip..

>   	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
> @@ -816,8 +1260,17 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   	if (!h_vdec)
>   		return -EINVAL;
>   
> -	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
> -		ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
> +	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
> +		if (IS_VDEC_SUPPORT_EX(inst->ctx->dev->dec_capability))
> +			ret = vdec_h264_slice_single_decode_ex(h_vdec, bs, unused, res_chg);

I wonder if we can use function pointers here, as I feel like vcodec is becoming
a bit "full of branches here and there"...

The rough idea is:

/* there, or somewhere that's called only once in the driver lifetime anyway */
static int vdec_h264_slice_init(.....)
{
	........

	if (hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
		if (inst->ctx->dev->dec_capability & MTK_VDEC_IS_SUPPORT_EX)
			inst->decode = vdec_h264_slice_single_decode_ex;
		else
			inst->decode = vdec_h264_slice_single_decode;
	}  else {
		if (inst->ctx->dev->dec_capability & MTK_VDEC_IS_SUPPORT_EX)
			inst->decode = vdec_h264_slice_lat_decode_ex;
		else
			inst->decode = vdec_h264_slice_lat_decode;
	}

	......
}

static int vdec_h264_slice_decode(...)
{
	if (!inst)
		return -EINVAL;

	return inst->decode( .... )
}

...less branches during decoding *of each frame* :-)

Cheers,
Angelo

