Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC299CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgmvmEdWfzzcOkLMzfBiq3xdGFivKKdqLGVk5bkPRJ0=; b=YolVEmWMfzN/QXHMSK6pB0h+lF
	XMk1QoqTNwAfoTqHADecd2OscxKPg8pzcelBJ1VNudPQQWIFtmW+AHG4sl/uaE6NLu2WLpaSAvwBW
	3N/ZligwE1h7D04D+PuUFe9XUSjyixbuDqUL+ug/Fv77J+uNwpeFzx9mCt00nJGBpHRecsZg5JnEs
	d6NENa1y9o5y0iwQDFNed+gyAzA3+5TRszl2W4qmHEXhIi8NQO81uEMN9/fquCuF0V6LWtdIuiqMp
	e2unO+SElZhMIXIQj/yF1QiukYM9MICtWbZzwi7mDERR9W985CGSTuOP784LmNVlYVOgKZYKnRZLb
	5jSAPOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8czT-0000000G3cL-0fp2;
	Tue, 14 Oct 2025 11:14:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8czQ-0000000G3b8-1t27;
	Tue, 14 Oct 2025 11:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760440485;
	bh=uN0y/sRuh1lI9GfXgbDpfnEWQa1UQxUePsZKVvigA1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EL8Yic0PcUVrhjL8ZETYDpAEt4ZzhWsjXWdwIz5L6420R99+HYtLnbM6OVPWqj/az
	 g6lgcCQVburgEDFaY7n+rrqmOlCzHISllVhM4NcxNulJNfrLHXi9F9Zk0FNKy1ciep
	 R9NOdSew7g1CVWBphNVgu/bq6NyWBp3PtbJpGmklYNVSedRzApHp9P7omwSmCig8xr
	 Y7saxVf8cx3mRWn7vY4ip6Snq+lrkZYd1Z3k2Azrr5UQ2+xn1c5Qkt9kfU5Gfu2+yC
	 dDYRYMEN1BhKCqU58prXLOcWYs9XKYi9jRTRev7wMGsfzndClWYYfdMzDEwdXrd2Kd
	 utwJJYv5Xrl6w==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF10D17E013C;
	Tue, 14 Oct 2025 13:14:44 +0200 (CEST)
Message-ID: <ef9de8e4-06bc-4805-81f5-be145f70c495@collabora.com>
Date: Tue, 14 Oct 2025 13:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: uapi: Convert RkISP1 to V4L2 extensible
 params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-2-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-2-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_041448_698904_53AEB74F 
X-CRM114-Status: GOOD (  43.03  )
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

Hi Jacopo,

On 10/14/25 10:00, Jacopo Mondi wrote:
> With the introduction of common types for extensible parameters
> format, convert the rkisp1-config.h header to use the new types.
> 
> Factor-out the documentation that is now part of the common header

s/Factor-out/Factor out

> and only keep the driver-specific on in place.
> 
> The conversion to use common types doesn't impact userspace as the
> new types are either identical to the ones already existing in the
> RkISP1 uAPI or are 1-to-1 type convertible.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  include/uapi/linux/rkisp1-config.h | 107 +++++++++----------------------------
>  1 file changed, 24 insertions(+), 83 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 3b060ea6eed71b87d79abc8401eae4e9c9f5323a..b2d2a71f7baff3833b20519264b58db7f168af90 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -7,8 +7,13 @@
>  #ifndef _UAPI_RKISP1_CONFIG_H
>  #define _UAPI_RKISP1_CONFIG_H
>  
> +#ifdef __KERNEL__
> +#include <linux/build_bug.h>
> +#endif /* __KERNEL__ */
>  #include <linux/types.h>
>  
> +#include <linux/media/v4l2-isp.h>
> +
>  /* Defect Pixel Cluster Detection */
>  #define RKISP1_CIF_ISP_MODULE_DPCC		(1U << 0)
>  /* Black Level Subtraction */
> @@ -1158,79 +1163,26 @@ enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
>  };
>  
> -#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> -#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> +/* For backward compatibility */
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	V4L2_ISP_PARAMS_FL_BLOCK_DISABLE
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
>  
>  /* A bitmask of parameters blocks supported on the current hardware. */
>  #define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
>  
>  /**
> - * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> - *					   header
> + * rkisp1_ext_params_block_header - RkISP1 extensible parameters block header
>   *
>   * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data. The
> - * driver inspects this common header to discern the block type and its size and
> - * properly handle the block content by casting it to the correct block-specific
> - * type.
> + * blocks and is identical to :c:type:`v4l2_isp_params_block_header`.
>   *
> - * The @type field is one of the values enumerated by
> + * The type field is one of the values enumerated by
>   * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> - * interpreted by the driver. The @size field specifies the size of the
> - * parameters block and is used by the driver for validation purposes.
> - *
> - * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
> - *
> - * When userspace wants to configure and enable an ISP block it shall fully
> - * populate the block configuration and set the
> - * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE bit in the @flags field.
> - *
> - * When userspace simply wants to disable an ISP block the
> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
> - * driver ignores the rest of the block configuration structure in this case.
> - *
> - * If a new configuration of an ISP block has to be applied userspace shall
> - * fully populate the ISP block configuration and omit setting the
> - * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
> - * in the @flags field.
> - *
> - * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
> - * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
> - * and not accepted by the driver.
> - *
> - * Userspace is responsible for correctly populating the parameters block header
> - * fields (@type, @flags and @size) and the block-specific parameters.
> - *
> - * For example:
> + * interpreted by the driver.
>   *
> - * .. code-block:: c
> - *
> - *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> - *		struct rkisp1_ext_params_bls_config *bls =
> - *			(struct rkisp1_ext_params_bls_config *)block;
> - *
> - *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> - *		bls->header.flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;
> - *		bls->header.size = sizeof(*bls);
> - *
> - *		bls->config.enable_auto = 0;
> - *		bls->config.fixed_val.r = blackLevelRed_;
> - *		bls->config.fixed_val.gr = blackLevelGreenR_;
> - *		bls->config.fixed_val.gb = blackLevelGreenB_;
> - *		bls->config.fixed_val.b = blackLevelBlue_;
> - *	}
> - *
> - * @type: The parameters block type, see
> - *	  :c:type:`rkisp1_ext_params_block_type`
> - * @flags: A bitmask of block flags
> - * @size: Size (in bytes) of the parameters block, including this header
> + * The flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
>   */
> -struct rkisp1_ext_params_block_header {
> -	__u16 type;
> -	__u16 flags;
> -	__u32 size;
> -};
> +#define rkisp1_ext_params_block_header v4l2_isp_params_block_header
>  
>  /**
>   * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> @@ -1588,27 +1540,14 @@ struct rkisp1_ext_params_wdr_config {
>   * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
>   */
>  enum rksip1_ext_param_buffer_version {
> -	RKISP1_EXT_PARAM_BUFFER_V1 = 1,
> +	RKISP1_EXT_PARAM_BUFFER_V1 = V4L2_ISP_PARAMS_VERSION_V1,
>  };
>  
>  /**
>   * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
>   *
> - * This struct contains the configuration parameters of the RkISP1 ISP
> - * algorithms, serialized by userspace into a data buffer. Each configuration
> - * parameter block is represented by a block-specific structure which contains a
> - * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
> - * populates the @data buffer with configuration parameters for the blocks that
> - * it intends to configure. As a consequence, the data buffer effective size
> - * changes according to the number of ISP blocks that userspace intends to
> - * configure and is set by userspace in the @data_size field.
> - *
> - * The parameters buffer is versioned by the @version field to allow modifying
> - * and extending its definition. Userspace shall populate the @version field to
> - * inform the driver about the version it intends to use. The driver will parse
> - * and handle the @data buffer according to the data layout specific to the
> - * indicated version and return an error if the desired version is not
> - * supported.
> + * This is the driver-specific implementation of
> + * :c:type:`v4l2_isp_params_buffer`.
>   *
>   * Currently the single RKISP1_EXT_PARAM_BUFFER_V1 version is supported.
>   * When a new format version will be added, a mechanism for userspace to query
> @@ -1624,11 +1563,6 @@ enum rksip1_ext_param_buffer_version {
>   * the maximum value represents the blocks supported by the kernel driver,
>   * independently of the device instance.
>   *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between nor overlaps. Userspace shall populate the @data_size field with
> - * the effective size, in bytes, of the @data buffer.
> - *
>   * The expected memory layout of the parameters buffer is::
>   *
>   *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> @@ -1678,4 +1612,11 @@ struct rkisp1_ext_params_cfg {
>  	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
>  };
>  
> +#ifdef __KERNEL__
> +/* Make sure the header is type-convertible to the generic v4l2 params one */
> +static_assert((sizeof(struct rkisp1_ext_params_cfg) -
> +	      RKISP1_EXT_PARAMS_MAX_SIZE) ==
> +	      sizeof(struct v4l2_isp_params_buffer));
> +#endif /* __KERNEL__ */
> +
>  #endif /* _UAPI_RKISP1_CONFIG_H */
> 


