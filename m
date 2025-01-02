Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9DDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 13:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bUn+sbUfVJk3T1RyR03D0xkFx9MmqmSNk5mERdhBOw=; b=da8tfGJKh4d+PDlcaFX72Cv7jQ
	AYxvefnwkXNtnnxsI1f4eXldT7XaY/3bqNbdjKSm5N/gSctuPrW6WcFRkYs2DhsgfvTiU4alaEKao
	lL0WXUUbr7nPnEHkTiCmjF2s/tyVAhSN41d7PvF36B9BUbwJ2xDrzUbOt3sF9zx2EuiIHhLMQGzYA
	Gd6bpf57PQQ2FO4+oweFWRmxkAowN6ub15QCkXA2oasvM2klRtSogUbDwOGP2UHKalc4MaizTmS2Y
	AzdSzmo6svwMOswtnMpKb/ORxfkNjLLgpUjIS1DM8zJjIQaLi/airS24nxrUIvI+3Lv3QJ05wMrSr
	UYh3N2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKzs-0000000AS28-1J10;
	Thu, 02 Jan 2025 13:12:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKxy-0000000ARbx-0r8a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 13:10:23 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EE2022F;
	Thu,  2 Jan 2025 14:09:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735823372;
	bh=/FIt1NbZBTAME3ryH8QiDZaLShzMnq6sDLI30re8kdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fC6KNRqjuxULBxkKbxWyDhFK+DU5FUTO+mt1pqEgSpWCDL3miaT/8seSVj3okp/1I
	 P7sBwbVYgKvgIMc6PCZExstfD4/pvssy7Qurk/5JLUDThEDeVLNi+t5tLO6GoOwIQT
	 YHf8kP8zXiwgW1Zk/tEHY+fA3/Z3rbcypoJUChQU=
Date: Thu, 2 Jan 2025 15:10:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Message-ID: <20250102131021.GG554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_051022_408897_63B0430C 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Ishikawa-san,

Thank you for the patch.


On Mon, Nov 25, 2024 at 06:21:41PM +0900, Yuji Ishikawa wrote:
> Adds the Toshiba Visconti VIIF specific metadata format

s/Adds/Add/
s/format/formats./

> 
> - V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
> - V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>

Assuming the documentation of the formats in subsequent patches is fine,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog v10:
> - add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
> - add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS
> 
> Changelog v11:
> - no change
> 
> Changelog v12:
> - add description for meta formats at v4l2-ioctl.c
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..f7facb63b8ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1470,6 +1470,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
>  	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
>  	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
> +	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
> +	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
>  	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index a5418759e2ba..9e1f66fdf038 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -863,6 +863,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
>  #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
>  
> +/* Vendor specific - used for Visconti VIIF sub-system */
> +#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
> +#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

