Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEE7CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Vrvpklyb+mmmzPeCfQdN621hB9ClYnYbSHC/Jcw3UQ=; b=2JxpFY4h4hx7WZzDW1ftp7E/pa
	Dno1H9qEu40t/LW3t+YEcY6eclWVndPNXvE/Ah8bPsqfY1AJduZZnKQ9YQaGs5m6pfeM6NYAoi6ib
	e7fo4oL99jhwRhNm8H4s9h8GtTOeb4uEUzvz3xDmzYWnwwC3GbizGAyGyzA3rs8GJO3rjOS292NMv
	wQaKjpWoFGe0040BaPLKKlsYKmDGrmSuwJRG13PnzrH/61+hyFmFyifVkH8XpYvKaNwzWU1OfnjKf
	u3FSosdhzvm3LgI95vkCxmFr6rjjKFlM6YdNh01RkvYV72eVuuJ8Dc+h5/NV91W+oeuj5Q407qoww
	BExJHCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSrr-0000000A7Hm-1QdK;
	Thu, 13 Nov 2025 08:39:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSrp-0000000A7HC-0V3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:39:46 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0275446;
	Thu, 13 Nov 2025 09:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763023061;
	bh=M2gflnII7hGs+7TzU/+hUk/rqQywT7+PStfAeWwe30g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzNNwXUqqVIuM6S9Twx21l9BTEGzToaWXPHG1hwiGfdlYsXykVv9t/ooSQVfwPXK/
	 PTyzj93C4WEJ/3YjFAJxXrtU+lGXV9MGRCFdxqXZACc/QrXIO9FoOAIc3Sk+e65YPk
	 PU/Wxoyk4qtfJvTXKjwg6JN+KNOKdaFif54AVo6w=
Date: Thu, 13 Nov 2025 09:39:37 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_003945_325562_4884E397 
X-CRM114-Status: GOOD (  29.61  )
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

Hi Dan

On Tue, Nov 11, 2025 at 04:15:59PM +0000, Daniel Scally wrote:
> Document the mali-c55 parameter setting by expanding the relevant
> pages in both admin-guide/ and userspace-api/.
>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
> 	- None
>
> Changes in v11:
>
> 	- Updated the documentation to account for the use of the
> 	  V4L2 extensible params
>
> Changes in v10:
>
> 	- None
>
> Changes in v9:
>
> 	- None
>
> Changes in v8:
>
> 	- None
>
> Changes in v7:
>
> 	- None
>
> Changes in v7:
>
> 	- None
>
> Changes in v6:
>
> 	- Minor rewording
>
> Changes in v5:
>
> 	- New patch
> ---
>  Documentation/admin-guide/media/mali-c55.rst       | 19 ++++++-
>  .../media/v4l/metafmt-arm-mali-c55.rst             | 66 +++++++++++++++++++++-
>  2 files changed, 80 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
> index 03723e0e8e43f17a04ede0032b2ddbfdb859d1e3..315f982000c48e46a2be0e7210b657d5af611e14 100644
> --- a/Documentation/admin-guide/media/mali-c55.rst
> +++ b/Documentation/admin-guide/media/mali-c55.rst
> @@ -387,9 +387,24 @@ the processing flow the statistics can be drawn from::
>                         +-------------+   |    +-------------+
>                                           +-->  AWB-1
>
> -At present all statistics are drawn from the 0th tap point for each algorithm;
> +By default all statistics are drawn from the 0th tap point for each algorithm;
>  I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
> -statistics from AF-0. In the future this will be configurable.
> +statistics from AF-0. This is configurable for AEXP and AWB statsistics through
> +programming the ISP's parameters.
> +
> +.. _mali-c55-3a-params:
> +
> +Programming ISP Parameters
> +==========================
> +
> +The ISP can be programmed with various parameters from userspace to apply to the
> +hardware before and during video stream. This allows userspace to dynamically
> +change values such as black level, white balance and lens shading gains and so
> +on.
> +
> +The buffer format and how to populate it are described by the
> +:ref:`V4L2_META_FMT_MALI_C55_PARAMS <v4l2-meta-fmt-mali-c55-params>` format,
> +which should be set as the data format for the `mali-c55 3a params` video node.
>
>  References
>  ==========
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> index 0bda9740a6be20df541ac7cf78e45e510f79ad19..49d6b8080ecec1013a93f5283a00a3fa0d7ebb17 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> @@ -1,10 +1,11 @@
>  .. SPDX-License-Identifier: GPL-2.0
>
> +.. _v4l2-meta-fmt-mali-c55-params:
>  .. _v4l2-meta-fmt-mali-c55-stats:
>
> -*************************************
> -V4L2_META_FMT_MALI_C55_STATS ('C55S')
> -*************************************
> +*****************************************************************************
> +V4L2_META_FMT_MALI_C55_STATS ('C55S'), V4L2_META_FMT_MALI_C55_PARAMS ('C55P')
> +*****************************************************************************
>
>  3A Statistics
>  =============
> @@ -23,6 +24,65 @@ of the C structure :c:type:`mali_c55_stats_buffer` defined in
>
>  For details of the statistics see :c:type:`mali_c55_stats_buffer`.
>
> +Configuration Parameters
> +========================
> +
> +The configuration parameters are passed to the
> +:ref:`mali-c55 3a params <mali-c55-3a-params>` metadata output video node, using
> +the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
> +sub-structs for each configurable area of the ISP, parameters for the Mali-C55
> +use the V4L2 extensible parameters system, through which groups of parameters
> +are defined as distinct structs or "blocks" which may be added to the data
> +member of :c:type:`v4l2_params_buffer`. Userspace is responsible for populating

This should be updated to the latest v4l2-isp. I'll do so before
sending the PR. I've also shortened it to avoid repeating parts of the
v4l2-isp documentation to:

+Configuration Parameters
+========================
+
+The configuration parameters are passed to the :ref:`mali-c55 3a params
+<mali-c55-3a-params>` metadata output video node, using the
+:c:type:`v4l2_meta_format` interface. Rather than a single struct containing
+sub-structs for each configurable area of the ISP, parameters for the Mali-C55
+use the v4l2-isp parameters system, through which groups of parameters are
+defined as distinct structs or "blocks" which may be added to the data member of
+:c:type:`v4l2_isp_params_buffer`. Userspace is responsible for populating the
+data member with the blocks that need to be configured by the driver.  Each
+block-specific struct embeds :c:type:`v4l2_isp_params_block_header` as its first
+member and userspace must populate the type member with a value from
+:c:type:`mali_c55_param_block_type`.


> +the data member with the blocks that need to be configured by the driver, but
> +need not populate it with **all** the blocks, or indeed with any at all if there
> +are no configuration changes to make. Populated blocks **must** be consecutive
> +in the buffer. To assist both userspace and the driver in identifying the
> +blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
> +its first member and userspace must populate the type member with a value from
> +:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
> +into the data buffer, the combined size of all populated blocks shall be set in
> +the data_size member of :c:type:`v4l2_params_buffer`. For example:
> +
> +.. code-block:: c
> +
> +	struct v4l2_params_buffer *params =
> +		(struct v4l2_params_buffer *)buffer;
> +
> +	params->version = MALI_C55_PARAM_BUFFER_V1;
> +	params->data_size = 0;
> +
> +	void *data = (void *)params->data;
> +
> +	struct mali_c55_params_awb_gains *gains =
> +		(struct mali_c55_params_awb_gains *)data;
> +
> +	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> +	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> +	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> +
> +	gains->gain00 = 256;
> +	gains->gain00 = 256;
> +	gains->gain00 = 256;
> +	gains->gain00 = 256;
> +
> +	data += sizeof(struct mali_c55_params_awb_gains);
> +	params->data_size += sizeof(struct mali_c55_params_awb_gains);
> +
> +	struct mali_c55_params_sensor_off_preshading *blc =
> +		(struct mali_c55_params_sensor_off_preshading *)data;
> +
> +	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> +	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> +	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> +
> +	blc->chan00 = 51200;
> +	blc->chan01 = 51200;
> +	blc->chan10 = 51200;
> +	blc->chan11 = 51200;
> +
> +	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);

s/total_size/data_size

And I've also updated it to use the v4l2-isp types

+.. code-block:: c
+
+       struct v4l2_isp_params_buffer *params =
+               (struct v4l2_isp_params_buffer *)buffer;
+
+       params->version = MALI_C55_PARAM_BUFFER_V1;
+       params->data_size = 0;
+
+       void *data = (void *)params->data;
+
+       struct mali_c55_params_awb_gains *gains =
+               (struct mali_c55_params_awb_gains *)data;
+
+       gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
+       gains->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+       gains->header.size = sizeof(struct mali_c55_params_awb_gains);
+
+       gains->gain00 = 256;
+       gains->gain00 = 256;
+       gains->gain00 = 256;
+       gains->gain00 = 256;
+
+       data += sizeof(struct mali_c55_params_awb_gains);
+       params->data_size += sizeof(struct mali_c55_params_awb_gains);
+
+       struct mali_c55_params_sensor_off_preshading *blc =
+               (struct mali_c55_params_sensor_off_preshading *)data;
+
+       blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
+       blc->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+       blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
+
+       blc->chan00 = 51200;
+       blc->chan01 = 51200;
+       blc->chan10 = 51200;
+       blc->chan11 = 51200;
+
+       params->data_size += sizeof(struct mali_c55_params_sensor_off_preshading);

With your ack, I'll apply the following changes before sending the PR.

Thanks
  j

> +
>  Arm Mali-C55 uAPI data types
>  ============================
>
>
> --
> 2.43.0
>
>

