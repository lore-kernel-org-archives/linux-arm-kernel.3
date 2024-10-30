Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F3BD7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhy5fzAVX8uW/HwAXrDK7wlGAaBjRgEdv83x8HjWjIc=; b=UvBjQL0ZAmrYSFcfThLFhoUDLq
	Cx4B/9kccyDuMDmSm7hPuXDvA9NuuXV8A7r4cEQe+g9CxbXgG4PfNLkaG6bj4OeucRdd1B4WfAT/j
	euK+f5lQVWuBsgmsbSAF5J+ulqyTLfO0cweqZ3/4dTXNTPPD1Gr5GVflamB+loLaPBc2xfHG4Fzgd
	QvrSBsf8pZNRRybaM/ZGTJzAFR1ZreZ9WtrSg7YiIIDkWMJtib17Aq5cN6EXxMEjpJ4jBK8CjcozU
	1OkY9/UUF5V81GDNMApHLpuSOLqQnYJprlnp9NNK3sVx5JRgFloQ/Wvc48zfD0npgLDUls3twXeoe
	KUkaTMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63Jc-0000000HAfK-3DJ5;
	Wed, 30 Oct 2024 07:40:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63CJ-0000000H9T3-2aUf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F707A410E1;
	Wed, 30 Oct 2024 07:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A5FC4CEE6;
	Wed, 30 Oct 2024 07:32:50 +0000 (UTC)
Message-ID: <6b38f07f-f992-4b25-af09-4e106e875994@xs4all.nl>
Date: Wed, 30 Oct 2024 08:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
To: ming.qian@oss.nxp.com, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
 <20241030022134.1098589-5-ming.qian@oss.nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241030022134.1098589-5-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_003255_831930_6F754ED6 
X-CRM114-Status: GOOD (  41.41  )
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

Hi Ming Qian,

Thank you for this, these descriptions are much better!

I still have a few comments, though. See below.

On 30/10/2024 03:21, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@nxp.com>
> 
> Add some ctrls to support the video encoder region-of-interest(ROI)
> feature. The ROI QP Map and rectangular configuration are supported.
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 131 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 ++++++
>  include/uapi/linux/v4l2-controls.h            |  16 +++
>  3 files changed, 193 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 4a379bd9e3fb..7b4327c4a14e 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1667,6 +1667,137 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Codecs need to always use the specified range, rather then a HW custom range.
>      Applicable to encoders
>  
> +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    (enum)
> +
> +enum v4l2_mpeg_video_roi_mode -
> +    Indicates Video Encoding region-of-interest (ROI) Mode, enable different
> +    encoding strategies based on selected areas within a frame. Choosing a
> +    specific mode activates corresponding control or combinations of controls
> +    to configure the ROI, e.g. for rectangle delta QP mode, you need to provide
> +    V4L2_CID_MPEG_VIDEO_ROI_RECT and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP.
> +    Applicable to encoders.
> +
> +    Possible values are:
> +
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
> +      - No ROI in the MPEG stream. Default mode.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``
> +      - Rectangle ROI mode and specifies ROI delta QP.
> +        When enabled, define one or more rectangular ROI areas
> +        where QP delta is applied. The control
> +        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
> +        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP is used to
> +        set QP delta value.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``
> +      - Rectangle ROI mode and specifies ROI priority.
> +        When enabled, define one or more rectangular ROI areas
> +        where priority is applied. The control
> +        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
> +        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY is used to
> +        set priority.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP``
> +      - Map ROI mode and specifies ROI delta QP.
> +        When enabled, the whole frame is configured into a grid map
> +        according to the ROI block region size in raster scan order,
> +        and each region can have a QP delta applied.
> +        The control V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP
> +        is used to configure the ROI Map with QP delta values.
> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP``
> +      - Map ROI mode and specifies ROI absolute QP value.
> +        When enabled, configure a grid ROI map where each region
> +        has an absolute QP value assigned. The control
> +        V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP is used to
> +        configure the ROI Map with absolute QP values.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE (struct)``
> +    This read-only control returns the ROI block size in pixels. The struct
> +    :c:type:`v4l2_area` provides the width and height in separate
> +    fields. The resolution of the frame will be rounded up to be
> +    aligned to this value when it's partitioned in blocks for QP
> +    maps and the number of QP values in those maps will be the
> +    number of blocks of these indicated pixel size that comprise
> +    a full frame. This control depends on the encoding format,
> +    and the detailed encoder hardware.
> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
> +    A struct :c:type:`v4l2_rect` provides the rectangular region
> +    described by the position of its top-left corner, the width
> +    and the height. The unit is in pixels. And it should be aligned
> +    to the ROI block size, which can be queried from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. If it is not aligned to
> +    the ROI block size, then X,Y gets rounded down, and width/height up.
> +    The maximum number of rectangular regions depends on the hardware.

What happens with rectangles that are completely outside the frame?
I assume those will be ignored?

> +    This control is a dynamically sized array.
> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP`` or
> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``. For overlapping
> +    regions, the value that is first in the ROI array will have priority.
> +    Applicable to encoders.
> +
> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP (integer)``
> +    Specifies the ROI delta QP of a rectangular region. The delta QP
> +    is the value that will be added on top of the frame level QP.
> +    It can be positive (more distortion) or negative (less distortion)
> +    values. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``, and must be used
> +    in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
> +    This control is a dynamically sized array, and the array size
> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
> +    the number of configured regions is the minimum value.

I'd rephrase this:

"If the array sizes do not match, then use the smallest size for
both controls and ignore the remaining elements in the larger array."

> +    Applicable to encoders.
> +
> +``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY (integer)``
> +    Specifies the ROI priority of a rectangular region. it can
> +    be positive (more important) or negative (less important)
> +    values and is compared with non-ROI region (taken as value 0).
> +    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``, and must
> +    be used in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
> +    This control is a dynamically sized array, and the array size
> +    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
> +    the number of configured regions is the minimum value.

Same here.

> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP (integer)``
> +    Configure a frame-wide grid map that divides the entire
> +    frame into blocks of the ROI block size, where each
> +    region will have a QP delta applied. The ROI map is
> +    arranged in raster scan order, and it's configured
> +    as an integer array. The block size can be got from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
> +    dynamically sized array, the array size can be calculated
> +    from video resolution and the ROI block size, and the
> +    width and height should be rounded up to be aligned to
> +    the block size. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP``.
> +    If the array size is too small, the control should
> +    return error. Applicable to encoders.

"If the array size is too small, the control should return error."

That doesn't really work. You can set the control, then change the
video format causing the control array size to be too small, but
that won't return an error.

I think you should either ignore the control completely in case
of a mismatch, or assume that the remainder of the grid map will
use a delta QP of 0. The latter would be my preference.

> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP (integer)``
> +    Configure a frame-wide grid map that divides the entire
> +    frame into blocks of the ROI block size, where each
> +    region will have an absolute QP applied. The ROI map is
> +    arranged in raster scan order, and it's configured
> +    as an integer array. The block size can be got from
> +    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
> +    dynamically sized array, the array size can be calculated
> +    from video resolution and the ROI block size, and the
> +    width and height should be rounded up to be aligned to
> +    the block size. This control is applicable when
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
> +    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP``.
> +    If the array size is too small, the control should
> +    return error. Applicable to encoders.

You have the same problem here. Except that you can't use a QP
value of 0 if the array is too short, but you can probably substitute
the value from one of the existing codec-specific QP controls.

If that doesn't work, then ignoring arrays that are too short
is probably the better approach.

Regards,

	Hans

> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 1ea52011247a..4d89309bf8d0 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -612,6 +612,15 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		NULL,
>  	};
>  
> +	static const char * const mpeg_video_roi_mode[] = {
> +		"None",
> +		"Rectangle Delta QP",
> +		"Rectangle Priority",
> +		"Map Delta QP",
> +		"Map Absolute QP",
> +		NULL,
> +	};
> +
>  	switch (id) {
>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>  		return mpeg_audio_sampling_freq;
> @@ -750,6 +759,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return camera_orientation;
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>  		return intra_refresh_period_type;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> +		return mpeg_video_roi_mode;
>  	default:
>  		return NULL;
>  	}
> @@ -971,6 +982,13 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>  	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:		return "Video ROI Mode";
> +	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:	return "Video ROI Block Size";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:		return "Video ROI Rectangle Region";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:	return "Video ROI Rectangle Delta QP";
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:	return "Video ROI Rectangle Priority";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:	return "Video ROI Delta QP Map";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:	return "Video ROI Absolute QP Map";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>  
> @@ -1512,6 +1530,34 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
> +		*type = V4L2_CTRL_TYPE_MENU;
> +		*flags |= V4L2_CTRL_FLAG_UPDATE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:
> +		*type = V4L2_CTRL_TYPE_AREA;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
> +		*type = V4L2_CTRL_TYPE_RECT;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type = V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..bf67d53af737 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -900,6 +900,22 @@ enum v4l2_mpeg_video_av1_level {
>  
>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>  
> +enum v4l2_mpeg_video_roi_mode {
> +	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP,
> +	V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY,
> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP,
> +	V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP
> +};
> +
> +#define V4L2_CID_MPEG_VIDEO_ROI_MODE			(V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE		(V4L2_CID_CODEC_BASE + 659)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT			(V4L2_CID_CODEC_BASE + 660)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP		(V4L2_CID_CODEC_BASE + 661)
> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY		(V4L2_CID_CODEC_BASE + 662)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP		(V4L2_CID_CODEC_BASE + 663)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP		(V4L2_CID_CODEC_BASE + 664)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)


