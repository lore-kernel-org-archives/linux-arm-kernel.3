Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629451091929
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3PuahFDdao2xGU336HNEvZY92hGzC2xqMPIT4lAtcQ=; b=pPJev70hKdPXcnJkghsbY6bg22
	qAS8WrkehTiffBa5SPl7643rOmpEPrNbG9zBo7w3ym7NLlSxzJn033K1FcPoWjmrUp6n9Zt4+iVSc
	pbapEoX5mDPwXzgFFlZebrLBrW5hMVhhSezhyRWLhaYeQ7ljrx3FfS5WKuFBljgbbvpqwKdLyJzMn
	h3HVCazc0KNOLOyYGVp8i2YN1W6X6vmhYByW8SdBlid8hTRvbjZfa/xMiYn1ghI42pTfhPPnuGSSs
	7NpfiXz6C+enqKbjUnocC6miyBkzzl9YZ0Iibz2nKNTFU6HMBEb4RYDm6UuB7129MvyrTPqArvhsq
	RBqv0tmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3M8d-0000000BlBZ-0iaA;
	Thu, 19 Mar 2026 22:46:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3M8b-0000000BlB4-0JTs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 22:46:46 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D38B19A6;
	Thu, 19 Mar 2026 23:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773960329;
	bh=Xfywi3fgWbqBrWKuajaqSico7PqZr8JIWrVp/6bVJ0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wz5bGk2GWRbax6c0hubk86YRNQdfNZDVXHiKo6mYp5oV/DitSke9wvbFR5FJXO630
	 0tzJooGE5nYnuTMML4pbD5pUGMO0rl0qQppuaqq5tvgts7cQv/guQTKjPPpjxh1rkQ
	 kMTlQD453raIN0bPv/yNRvy7q3nYgw4R/MJIaIm0=
Date: Fri, 20 Mar 2026 00:46:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v2] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <20260319224641.GA962817@killaraus.ideasonboard.com>
References: <20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_154645_278531_673E7450 
X-CRM114-Status: GOOD (  37.21  )
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

Hi Guoniu,

Thank you for the patch.

On Tue, Mar 10, 2026 at 02:53:10PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Add virtual channel support for ISI driver.

You can drop this line, it duplicates the subject line.

> The ISI supports different numbers of virtual channels depending on the
> platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
> virtual channels. They are used in multiple camera use cases, such as
> surround view. Other platforms (such as i.MX8MN/8MP/8ULP/93/91) don't
> support virtual channels, and the VC_ID bits are marked as read-only.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Add Rb tag from Frank Li
> - Fix typo in comment(s/support/supports/)
> - Update commit log to include more details about ISI virtual channel support
>   on different platform
> - Include bitfield.h file to fix following build error
>   drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h:23:65: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
> - Link to v1: https://lore.kernel.org/r/20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com
> 
> Changes in v1:
> - Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 ++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  4 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 43 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  6 +--
>  4 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..11a5e395792f11752c44d73818c825f2f175aa1d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -256,6 +256,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	/* Virtual channel ID for the ISI channel */
> +	u8				vc;
>  };
>  
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 0187d4ab97e8e28fca9013f6864a094e08f2c570..2babb8573227de9e1aa36d9a39be41b286cf0c57 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -338,7 +338,9 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	} else {
>  		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
>  		val |= CHNL_CTRL_SRC_INPUT(input);
> -		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
> +		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc);

You're not addressing the FIXME comment, so it should be kept (or
ideally addressed :-)).

> +		/* Platform like i.MX95, ISI supports 8 virtual channels */
> +		val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);

This should be done for i.MX95 only. You also need to clear the bit
above in the function just after reading CHNL_CTRL (for i.MX95 only as
well), otherwise switching between different virtual channels won't
work.

>  	}
>  
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..cc4348ea6006ee19243aae3abceb235d00beea4d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -232,6 +232,45 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_pipe, sd);
>  }
>  
> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> +	struct device *dev = pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       xbar->num_sinks + pipe->id, &source_fd);

I don't see the xbar implementing get_frame_desc(). Am I missing a
dependency ?

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			xbar->num_sinks + pipe->id);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < source_fd.num_entries; i++) {
> +		if (source_fd.entry[i].stream == 0) {
> +			entry = &source_fd.entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!entry) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EPIPE;
> +	}
> +
> +	if (entry->bus.csi2.vc >= pipe->isi->pdata->num_channels) {
> +		dev_err(dev, "Virtual channel(%d) out of range\n",
> +			entry->bus.csi2.vc);
> +		return -EINVAL;
> +	}
> +
> +	pipe->vc = entry->bus.csi2.vc;
> +	return 0;
> +}
> +
>  int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> @@ -280,6 +319,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  
>  	v4l2_subdev_unlock_state(state);
>  
> +	ret = mxc_isi_get_vc(pipe);
> +	if (ret)
> +		return ret;
> +
>  	/* Configure the ISI channel. */
>  	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
>  			       sink_info->encoding, src_info->encoding);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 1b65eccdf0da4bbc3a77c91e06fccc35d6c7e022..a4036da72f0057265e991087f21bc079bd6c6573 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -6,6 +6,7 @@
>  #ifndef __IMX8_ISI_REGS_H__
>  #define __IMX8_ISI_REGS_H__
>  
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  
>  /* ISI Registers Define  */
> @@ -19,9 +20,8 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)

I'm tempted to keep this, in case we'll need to set it later. We can add
a comment to indicate the field is only valid on i.MX8QM and i.MX8QXP:

#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)	/* i.MX8{QM,QXP} */

or

#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))	/* i.MX8{QM,QXP} */

> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))

Please also add a comment to indicate the field is valid on i.MX95 only.

#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))	/* i.MX95 */

> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
>  #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
>  #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
>  #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260309-isi_vc-285fd815140e
> prerequisite-patch-id: 6f139a1d54fa3e0632db9b8a736ae27037c5f45a

-- 
Regards,

Laurent Pinchart

