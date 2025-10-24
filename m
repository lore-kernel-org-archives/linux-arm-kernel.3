Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1692CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImgndyMemW7z4qnZAYNG/o6s6s7inZPikVFmzDuCDM8=; b=pnYT1XzCGHYlm7ixtgHIpn0dbK
	BdCr9Ch+tf6K/8guo+AoBtBPhsJcJ1z/aryR2rqC8yiy5/edrT7EPfU2hFGnvldRGUJu2QrN3kFvO
	4z/JMfWqrtWMpeXgKBllXYHO860fTHl/1Iq2br361zj2Zk822Nyvqcpe08ieWibTcRgnbX6yb7ZtP
	hPYBu0zTmB+1vlTYd3t89pqicZqRYYmcJDuduT3lN2vIbu/I4TFFj7+Mwp2Y/0cAbHACwcwupqjVm
	mlnvImSYAeiKdB0TQc3wNFnVXpIRTARggYWTM4nJfiW94Av6PhK4lU53RBpcsrCp25UiIvmSAExTR
	NBcgqqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCeM-00000008aUE-1aic;
	Fri, 24 Oct 2025 07:55:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCeJ-00000008aTl-46Jh;
	Fri, 24 Oct 2025 07:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFB144B3DD;
	Fri, 24 Oct 2025 07:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8EC4CEF1;
	Fri, 24 Oct 2025 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761292546;
	bh=Hdklt2chKnjkuOe9ZHbv7X1qKK4yJxGkjdwOW0cEIxM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Z+fPR5BM3ecrRdmcNC4u3g2wWA3rQ2498FmYSaN+DnRr/1TBt2QP9oCmzH7Ka7Azc
	 rrzOXHrwLKuldNvS+rXeTwtCZwxMhCM0nwt7XbV7G+B39Kv+JMwBlJ86gtGhJ08Lz6
	 lK/4vugKy5qSV2DlcmV4Wx0TCJYGRAbFzQQLLAWMga+mmJLbkOqJdKdcGMCyjem3jX
	 4A9j0j9O3CsipOr0ukooKE7Ho8iX/iexg5YDNPYWfWB+697Pgfjo/gAP+S0ZkqAMLn
	 JtMG2ClqNqNoiNX6GGlawCl4S+TIMSlFXDXQayT5k8tSyenwUkKzbFzsagIp2XWEQr
	 Cx6Pk7QdGEz8A==
Message-ID: <d8ef0f88-e81d-4159-8945-52197cbc95ba@kernel.org>
Date: Fri, 24 Oct 2025 09:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
 <20251023214247.459931-2-detlev.casanova@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20251023214247.459931-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_005548_049401_96E73960 
X-CRM114-Status: GOOD (  26.81  )
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

On 23/10/2025 23:42, Detlev Casanova wrote:
> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the
> long and short term reference information for HEVC decoding.
> 
> Add controls to provide it as the raw data form the stream.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 ++++++++++++++++++
>  .../media/v4l/videodev2.h.rst.exceptions      |   2 +
>  .../media/v4l/vidioc-queryctrl.rst            |  12 ++
>  3 files changed, 128 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index 497ae74379f6..7b18e12fafbb 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2959,6 +2959,120 @@ This structure contains all loop filter related parameters. See sections
>        - 0x00000004
>        -
>  
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
> +    Specifies the list of Long-Term reference sets parameters from the SPS.
> +    These parameters are defined according to :ref:`hevc`.
> +    They are described in section 7.4.3.2.1 "General sequence parameter set
> +    RBSP semantics" of the specification.
> +    This control is a dynamically sized 1-dimensional array,
> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.

I'd drop this last sentence. It suggests that the application has to set it,
but is it set by the kernel.

Same for the next control below.

I noticed that this is probably a copy-and-paste from the V4L2_CID_STATELESS_HEVC_SLICE_PARAMS
documentation: can you post a separate patch removing that same line from the description of
that control? I think it is a confusing line, and we missed it during the original review
of V4L2_CID_STATELESS_HEVC_SLICE_PARAMS.

I have another question about these two controls: currently dynamic controls have always at
least one element. I have been working on supporting zero-sized dynamic controls. Would
that make sense here? Or will these two controls - if present - always have one element or
more?

If zero-length dynamic array controls are useful here, then I can clean up my patches and
post them so you can use it.

Regards,

	Hans

> +
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u16
> +      - ``lt_ref_pic_poc_lsb_sps``
> +      - Long term reference picture order count as described in section 7.4.3.2.1
> +        "General sequence parameter set RBSP semantics" of the specification.
> +    * - __u8
> +      - ``flags``
> +      - See :ref:`Extended Long-Term RPS Flags <hevc_ext_sps_lt_rps_flags>`
> +
> +.. _hevc_ext_sps_lt_rps_flags:
> +
> +``Extended SPS Long-Term RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
> +      - 0x00000001
> +      - Specifies if the long-term reference picture is used 7.4.3.2.1 "General sequence parameter
> +        set RBSP semantics" of the specification.
> +
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
> +    Specifies the list of Short-Term reference sets parameters from the SPS.
> +    These parameters are defined according to :ref:`hevc`.
> +    They are described in section 7.4.8 "Short-term reference picture set
> +    semantics" of the specification.
> +    This control is a dynamically sized 1-dimensional array,
> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> +
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``delta_idx_minus1``
> +      - Specifies the delta compare to the index. See details in section 7.4.8 "Short-term
> +        reference picture set semantics" of the specification.
> +    * - __u8
> +      - ``delta_rps_sign``
> +      - Sign of the delta as specified in section 7.4.8 "Short-term reference picture set
> +        semantics" of the specification.
> +    * - __u16
> +      - ``abs_delta_rps_minus1``
> +      - Absolute delta RPS as specified in section 7.4.8 "Short-term reference picture set
> +        semantics" of the specification.
> +    * - __u8
> +      - ``num_negative_pics``
> +      - Number of short-term RPS entries that have picture order count values less than the
> +        picture order count value of the current picture.
> +    * - __u8
> +      - ``num_positive_pics``
> +      - Number of short-term RPS entries that have picture order count values greater than the
> +        picture order count value of the current picture.
> +    * - __u32
> +      - ``used_by_curr_pic``
> +      - Bit i specifies if short-term RPS i is used by the current picture.
> +    * - __u32
> +      - ``use_delta_flag``
> +      - Bit i specifies if short-term RPS i is included in the short-term RPS entries.
> +    * - __u16
> +      - ``delta_poc_s0_minus1[16]``
> +      - Specifies the negative picture order count delta for the i-th entry in the short-term RPS.
> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
> +        specification.
> +    * - __u16
> +      - ``delta_poc_s1_minus1[16]``
> +      - Specifies the positive picture order count delta for the i-th entry in the short-term RPS.
> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
> +        specification.
> +    * - __u8
> +      - ``flags``
> +      - See :ref:`Extended Short-Term RPS Flags <hevc_ext_sps_st_rps_flags>`
> +
> +.. _hevc_ext_sps_st_rps_flags:
> +
> +``Extended SPS Short-Term RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED``
> +      - 0x00000001
> +      - Specifies if the short-term RPS is predicted from another short term RPS. See details in
> +        section 7.4.8 "Short-term reference picture set semantics" of the specification.
> +
>  .. _v4l2-codec-stateless-av1:
>  
>  ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> index c41693115db6..6182b4e2d2ee 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index c8baa9430c14..82c8b52e771c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
>  	decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_lt_rps`, containing HEVC
> +	extended Long-Term RPS for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_st_rps`, containing HEVC
> +	extended Short-Term RPS for stateless video decoders.
>      * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
>        - n/a
>        - n/a


