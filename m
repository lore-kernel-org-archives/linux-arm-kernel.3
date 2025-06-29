Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF5DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iR00cto2xCXbL6NwuUjbVx/1PaVU8Z6BLhyL40XOfIw=; b=QiGnHG6bh6giCuElaZaAvu6Jh5
	uegG9xEH53TtpsY4/tqSUJ+Jwu7IPAxM27qNJbjouaXWxPr8/MygmGODzgg1bPlHP3hYwrd09FXz+
	c+M2PJ+Tnal+p7uSH4rCU5n4LH/BgSj5HeEQ0MtDJo+Gi/MUJV5tP80qst0RipkmeF8Lt0PCQ1On/
	J+LoPz0lL3bbX2CJRrc4L9mRJKx1+/8YX3QSeGp57ucyJoCg0pa1n7rp2WKke/VcjbwOq6oc4ICU0
	x9aqUzfs5kk/0fyZMr/qNKlSli04YY3nah31X9vpwGF4fHIiYFtNVCr352v89EWq+HiHz9R9oj70U
	Uo4WRc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwvP-00000000adj-10EU;
	Sun, 29 Jun 2025 18:38:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwt1-00000000aT6-1yhn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 18:36:23 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AB512C67;
	Sun, 29 Jun 2025 20:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751222150;
	bh=32FpsSVva6Ct7+vcUYGDjM+Rgiv3IafWs2+hUtbwmcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2MEmpHN8YxUWCxQbDTGSt+w3rnYrXGfBXRKCzo9xRL7SipYrY2Eg3ewM/deWR4C8
	 BK7zW4E3qE0NIaUWYpT6VBrPisVcSFWT7BUSNv/UHViEAcc20D1zCf0NF+fHwnWrKf
	 oG2cJYDX5fiW2Rk2+yAxw+OHv/qMCiFQzTLkLXrY=
Date: Sun, 29 Jun 2025 21:35:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v10 07/17] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <20250629183547.GF6260@pendragon.ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
 <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_113619_645702_DC2737E9 
X-CRM114-Status: GOOD (  27.33  )
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

On Sat, Jun 28, 2025 at 11:06:54PM +0300, Sakari Ailus wrote:
> On 6/24/25 13:21, Daniel Scally wrote:

[snip]

> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..20d4d16c75fbf0d5519ecadb5ed1d080bdae05de
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > @@ -0,0 +1,656 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * ARM Mali-C55 ISP Driver - Image signal processor
> > + *
> > + * Copyright (C) 2024 Ideas on Board Oy
> 
> It's 2025 already.
> 
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/property.h>
> > +#include <linux/string.h>
> > +
> > +#include <linux/media/arm/mali-c55-config.h>
> 
> If this is a UAPI header, please include uapi in the path, too.
> 
> Earlier such headers have been under include/uapi/linux, I don't object 
> putting new ones elsewhere in principle though. Just check with Hans and 
> Laurent, too... I don't have an opinion yet really.

With each new media header we add to include/uapi/linux/, I wish
stronger and stronger that we had created include/uapi/linux/media/. We
don't have to do it now, my regret will just grow stronger :-)

> > +/* NOT const because the default needs to be filled in at runtime */
> > +static struct v4l2_ctrl_config mali_c55_isp_v4l2_custom_ctrls[] = {
> > +	{
> > +		.ops = &mali_c55_isp_ctrl_ops,
> > +		.id = V4L2_CID_MALI_C55_CAPABILITIES,
> > +		.name = "Mali-C55 ISP Capabilities",
> > +		.type = V4L2_CTRL_TYPE_BITMASK,
> > +		.min = 0,
> > +		.max = MALI_C55_GPS_PONG_FITTED |
> > +		       MALI_C55_GPS_WDR_FITTED |
> > +		       MALI_C55_GPS_COMPRESSION_FITTED |
> > +		       MALI_C55_GPS_TEMPER_FITTED |
> > +		       MALI_C55_GPS_SINTER_LITE_FITTED |
> > +		       MALI_C55_GPS_SINTER_FITTED |
> > +		       MALI_C55_GPS_IRIDIX_LTM_FITTED |
> > +		       MALI_C55_GPS_IRIDIX_GTM_FITTED |
> > +		       MALI_C55_GPS_CNR_FITTED |
> > +		       MALI_C55_GPS_FRSCALER_FITTED |
> > +		       MALI_C55_GPS_DS_PIPE_FITTED,
> > +		.def = 0,
> > +	},
> > +};
> > +
> > +static int mali_c55_isp_init_controls(struct mali_c55 *mali_c55)
> > +{
> > +	struct v4l2_ctrl_handler *handler = &mali_c55->isp.handler;
> > +	struct v4l2_ctrl *capabilities;
> > +	int ret;
> > +
> > +	ret = v4l2_ctrl_handler_init(handler, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mali_c55_isp_v4l2_custom_ctrls[0].def = mali_c55->capabilities;
> 
> The capabilities here are still specific to a device, not global, in 
> principle at least. Can you move it here, as a local variable?
> 
> > +
> > +	capabilities = v4l2_ctrl_new_custom(handler,
> > +					    &mali_c55_isp_v4l2_custom_ctrls[0],
> > +					    NULL);
> > +	if (capabilities)
> > +		capabilities->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	if (handler->error) {
> > +		dev_err(mali_c55->dev, "failed to register capabilities control\n");
> > +		v4l2_ctrl_handler_free(handler);
> > +		return handler->error;
> 
> v4l2_ctrl_handler_free() will return the error soon, presumably sooner 
> than the above code makes it to upstream. Before that, this pattern 
> won't work as v4l2_ctrl_handler_free() also resets the handler's error 
> field. :-)
> 
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..36a81be0191a15da91809dd2da5d279716f6d725
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > @@ -0,0 +1,318 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * ARM Mali-C55 ISP Driver - Register definitions
> > + *
> > + * Copyright (C) 2024 Ideas on Board Oy
> > + */
> > +
> > +#ifndef _MALI_C55_REGISTERS_H
> > +#define _MALI_C55_REGISTERS_H
> > +
> > +#include <linux/bits.h>
> > +
> > +/* ISP Common 0x00000 - 0x000ff */
> > +
> > +#define MALI_C55_REG_API				0x00000
> > +#define MALI_C55_REG_PRODUCT				0x00004
> > +#define MALI_C55_REG_VERSION				0x00008
> > +#define MALI_C55_REG_REVISION				0x0000c
> > +#define MALI_C55_REG_PULSE_MODE				0x0003c
> > +#define MALI_C55_REG_INPUT_MODE_REQUEST			0x0009c
> > +#define MALI_C55_INPUT_SAFE_STOP			0x00
> > +#define MALI_C55_INPUT_SAFE_START			0x01
> > +#define MALI_C55_REG_MODE_STATUS			0x000a0
> > +#define MALI_C55_REG_INTERRUPT_MASK_VECTOR		0x00030
> > +#define MALI_C55_INTERRUPT_MASK_ALL			GENMASK(31, 0)
> > +
> > +#define MALI_C55_REG_GLOBAL_MONITOR			0x00050
> > +
> > +#define MALI_C55_REG_GEN_VIDEO				0x00080
> > +#define MALI_C55_REG_GEN_VIDEO_ON_MASK			BIT(0)
> > +#define MALI_C55_REG_GEN_VIDEO_MULTI_MASK		BIT(1)
> > +#define MALI_C55_REG_GEN_PREFETCH_MASK			GENMASK(31, 16)
> > +
> > +#define MALI_C55_REG_MCU_CONFIG				0x00020
> > +#define MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK		BIT(0)
> > +#define MALI_C55_REG_MCU_CONFIG_WRITE_MASK		BIT(1)
> > +#define MALI_C55_MCU_CONFIG_WRITE(x)			((x) << 1)
> 
> Is x unsigned?

Does it matter ? The reason why the BIT() macro uses (UL(1) << (nr))
instead of (1 << (nr)) is (if I'm not mistaken) to avoid incorrect
handling of bit 31. As long as x doesn't take negative values and
doesn't extend to bit 31, it should be fine.

> > +#define MALI_C55_REG_MCU_CONFIG_WRITE_PING		BIT(1)
> > +#define MALI_C55_REG_MCU_CONFIG_WRITE_PONG		0x00
> > +#define MALI_C55_REG_MULTI_CONTEXT_MODE_MASK		BIT(8)
> > +#define MALI_C55_REG_PING_PONG_READ			0x00024
> > +#define MALI_C55_REG_PING_PONG_READ_MASK		BIT(2)
> > +#define MALI_C55_INTERRUPT_BIT(x)			BIT(x)
> > +
> > +#define MALI_C55_REG_GLOBAL_PARAMETER_STATUS		0x00068
> > +#define MALI_C55_GPS_PONG_FITTED			BIT(0)
> > +#define MALI_C55_GPS_WDR_FITTED				BIT(1)
> > +#define MALI_C55_GPS_COMPRESSION_FITTED			BIT(2)
> > +#define MALI_C55_GPS_TEMPER_FITTED			BIT(3)
> > +#define MALI_C55_GPS_SINTER_LITE_FITTED			BIT(4)
> > +#define MALI_C55_GPS_SINTER_FITTED			BIT(5)
> > +#define MALI_C55_GPS_IRIDIX_LTM_FITTED			BIT(6)
> > +#define MALI_C55_GPS_IRIDIX_GTM_FITTED			BIT(7)
> > +#define MALI_C55_GPS_CNR_FITTED				BIT(8)
> > +#define MALI_C55_GPS_FRSCALER_FITTED			BIT(9)
> > +#define MALI_C55_GPS_DS_PIPE_FITTED			BIT(10)
> > +
> > +#define MALI_C55_REG_BLANKING				0x00084
> > +#define MALI_C55_REG_HBLANK_MASK			GENMASK(15, 0)
> > +#define MALI_C55_REG_VBLANK_MASK			GENMASK(31, 16)
> > +#define MALI_C55_VBLANK(x)				((x) << 16)
> 
> Same question for the bit shifts left elsewhere in the header.
> 
> > +
> > +#define MALI_C55_REG_HC_START				0x00088
> > +#define MALI_C55_HC_START(h)				(((h) & 0xffff) << 16)
> > +#define MALI_C55_REG_HC_SIZE				0x0008c
> > +#define MALI_C55_HC_SIZE(h)				((h) & 0xffff)
> > +#define MALI_C55_REG_VC_START_SIZE			0x00094
> > +#define MALI_C55_VC_START(v)				((v) & 0xffff)
> > +#define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
> > +
> > +/* Ping/Pong Configuration Space */
> > +#define MALI_C55_REG_BASE_ADDR				0x18e88
> > +#define MALI_C55_REG_BYPASS_0				0x18eac
> > +#define MALI_C55_REG_BYPASS_0_VIDEO_TEST		BIT(0)
> > +#define MALI_C55_REG_BYPASS_0_INPUT_FMT			BIT(1)
> > +#define MALI_C55_REG_BYPASS_0_DECOMPANDER		BIT(2)
> > +#define MALI_C55_REG_BYPASS_0_SENSOR_OFFSET_WDR		BIT(3)
> > +#define MALI_C55_REG_BYPASS_0_GAIN_WDR			BIT(4)
> > +#define MALI_C55_REG_BYPASS_0_FRAME_STITCH		BIT(5)
> > +#define MALI_C55_REG_BYPASS_1				0x18eb0
> > +#define MALI_C55_REG_BYPASS_1_DIGI_GAIN			BIT(0)
> > +#define MALI_C55_REG_BYPASS_1_FE_SENSOR_OFFS		BIT(1)
> > +#define MALI_C55_REG_BYPASS_1_FE_SQRT			BIT(2)
> > +#define MALI_C55_REG_BYPASS_1_RAW_FE			BIT(3)
> > +#define MALI_C55_REG_BYPASS_2				0x18eb8
> > +#define MALI_C55_REG_BYPASS_2_SINTER			BIT(0)
> > +#define MALI_C55_REG_BYPASS_2_TEMPER			BIT(1)
> > +#define MALI_C55_REG_BYPASS_3				0x18ebc
> > +#define MALI_C55_REG_BYPASS_3_SQUARE_BE			BIT(0)
> > +#define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
> > +#define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
> > +#define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
> > +#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
> > +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
> > +#define MALI_C55_REG_BYPASS_4				0x18ec0
> > +#define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
> > +#define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
> > +#define MALI_C55_REG_BYPASS_4_CCM			BIT(4)
> > +#define MALI_C55_REG_BYPASS_4_CNR			BIT(5)
> > +#define MALI_C55_REG_FR_BYPASS				0x18ec4
> > +#define MALI_C55_REG_DS_BYPASS				0x18ec8
> > +#define MALI_C55_BYPASS_CROP				BIT(0)
> > +#define MALI_C55_BYPASS_SCALER				BIT(1)
> > +#define MALI_C55_BYPASS_GAMMA_RGB			BIT(2)
> > +#define MALI_C55_BYPASS_SHARPEN				BIT(3)
> > +#define MALI_C55_BYPASS_CS_CONV				BIT(4)
> > +#define MALI_C55_REG_ISP_RAW_BYPASS			0x18ecc
> > +#define MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK		BIT(0)
> > +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
> > +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		(2 << 8)
> > +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		(1 << 8)
> 
> BIT() or make these unsigned.

It's a 2 bits field, BIT() isn't appropriate.

[snip]

-- 
Regards,

Laurent Pinchart

