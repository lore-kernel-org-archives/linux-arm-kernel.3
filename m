Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DBFF3D31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chOFspLzOmGvjGy3O0Rh29kEccThX8TLl/uY+NRHF2E=; b=G7pBMTkZ/SqwGqBJ578nk+Cxi5
	OsUmBovMlMaFaIBMFXJKhcKaSmSIoNvhrqJb+43Qi8wWva5AbOskBckIgOiaPgw4d7IVA8wrW5NcZ
	rAxOdVKODpRnksg0pFMJ7iosNbJyoPzMYwna5Ry1jetr++M8mnrARwiA70PR5MpXMZxio/ac5SKfj
	vJJ/2jrji2UcxiV2YSrwo5waKdxfwGoP+OYlk0odMyIACwvF8kHpHFWl6A8AQaVgi/M9c69/5NeLf
	q6U48MYoU/t68UCbLiqgylhB13vJw6qwGaQu8MCmWkOWNSOdcl85VkS6Z828FDvLVkK9kcEZsngN7
	t4ufAeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBPF-00000002CLK-19Sp;
	Thu, 05 Mar 2026 16:18:33 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBPB-00000002CKV-3Ohb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1772727507;
 bh=chOFspLzOmGvjGy3O0Rh29kEccThX8TLl/uY+NRHF2E=;
 b=csMi1XdFY2S0uGiIvm40TjVvFRJM1TkzOf0PjW1zvFijEhUMHFrfRfuvzLD6l9JLDMPZC0bE0
 NPPDgWhEuaeRlXb87Ngmjp7hbZHX12cHO1dT6g12fnQSWTxyBiL9MGFcWdlEPnh91Xl1paJ5fgS
 3LPUFgcXjxeFVEw7EqHsewCzeg+rfACaWDWMJw34Uc/KLcFDn2S6l5Mlc/jjhQMaGgQGY/j/gyW
 Eo4yIXAFuBeWwR/+LYWAo9MmrPBOG8XeZ2fhLyv/nNtzE+IA2LRLMrwRrAS8V1aYWOdUU7A8e5p
 Hr2BFZ/ttFP0WTvLPn7Pl79YmD2vkCgvDe78AYynqbvg==
X-Forward-Email-ID: 69a9acccd9a7f34afb072f9d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1d666c43-688b-4cc1-aeed-5296d2608327@kwiboo.se>
Date: Thu, 5 Mar 2026 17:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Raspberry Pi HEVC decoder driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_081830_534610_96BF634D 
X-CRM114-Status: GOOD (  37.96  )
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

Hi Dave,

On 3/4/2026 3:05 PM, Dave Stevenson wrote:
> Hi All
> 
> This has been in the pipeline for a while, but I've finally cleaned
> up our HEVC decoder driver to be in a shape to upstream.
> John Cox has done almost all of the work under contract to Raspberry
> Pi, and I'm largely just doing the process of patch curation and
> sending.
> 
> Thanks
>   Dave
> 
> v4l2-compliance 1.33.0-5448, 64 bits, 64-bit time_t
> v4l2-compliance SHA: bd0aabb96710 2026-02-09 17:38:28
> 
> Compliance test for rpi-hevc-dec device /dev/video0:
> 
> Driver Info:
> 	Driver name      : rpi-hevc-dec
> 	Card type        : rpi-hevc-dec
> 	Bus info         : platform:rpi-hevc-dec
> 	Driver version   : 6.19.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateless Decoder
> Media Driver Info:
> 	Driver name      : rpi-hevc-dec
> 	Model            : rpi-hevc-dec
> 	Serial           : 
> 	Bus info         : platform:rpi-hevc-dec
> 	Media version    : 6.19.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.19.0
> Interface Info:
> 	ID               : 0x0300000c
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : rpi-hevc-dec-source
> 	Function         : V4L2 I/O
> 	Pad 0x01000002   : 0: Source
> 	  Link 0x02000008: to remote pad 0x1000004 of entity 'rpi-hevc-dec-proc' (Video Decoder): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 		fail: v4l2-test-controls.cpp(942): try_ext_ctrls returned an error (22)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 3 Private Controls: 0
> 	Standard Compound Controls: 5 Private Compound Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK
> 	test blocking wait: OK
> 
> Total for rpi-hevc-dec device /dev/video0: 49, Succeeded: 48, Failed: 1, Warnings: 0
> 
> Testing is with a downstream patchset to FFmpeg. I'm told FFmpeg
> currently has no stateless decode support, but we will be reviewing
> works that have been in progress and our downstream patches to see
> whether that can be pushed onwards.

Please see FFmpeg PR20847 "Add V4L2 Request API hwaccels for MPEG2,
H.264, HEVC, VP8, VP9 and AV1" [1] for pending upstream FFmpeg work.

My 4l2request-v3-pixfmts branch [2] also contains extra commit to make
it work with downstream rpi kernel version, using non-MT pixfmts.

I will give this a spin together with the FFmpeg PR, adding support for
the MT based pixfmts should hopefully be easy.

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/20847
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3-pixfmts

Regards,
Jonas

> Downstream tree is at
> https://github.com/jc-kynesim/rpi-ffmpeg/tree/test/7.1.2/main
> 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9247
> adds support for the new formats to GStreamer, and runs Fluster.
> Using the JCT-VC-HEVC_V1 test suite we get 142 passes out of 147 tests.
> PICSIZE_[ABCD]_Bossen_1 all fail due to the image sizes being greater than
> the 4096x4096 limit of this driver.
> TSUNEQBD_A_MAIN10_Technicolor_2 fails as the hardware doesn't support
> having a different bit depth for luma and chroma.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Changes in v6:
> - Fixed up assigned by unused variable (ctrl) in hevc_d_init_ctrls
>   (reported by CI).
> - Fixed up documentation links (reported by CI)
> - Link to v5: https://lore.kernel.org/r/20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com
> 
> Changes in v5:
> - Updated driver based on Nicolas' review comments of V4.
> - Added NV12MT_COL128 to ./drivers/media/v4l2-core/v4l2-common.c. The
>   10 bit format can't be represented with v4l2_format_info at present
>   as it assumes a power of 2 block size.
> - Switched to kzalloc_obj/kzalloc_objs as checkpatch now checks that.
> - Link to v4: https://lore.kernel.org/r/20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com
> 
> Changes in v4:
> - dt-bindings: Drop to just SoC compatibles and updated description (Krzysztof).
> - dts: Corrected address in node name.
> - NV12MT_COL128 format description added vertical alignment to a
>   multiple of 8 (Nicolas)
> - driver: Merged in driver updates based on Nicolas' review.
> - driver: Added debug module parameter to avoid log spam due to some bitstreams.
> - cover-letter: Added Fluster results.
> - rebased and based on the updated version of 
>   https://lore.kernel.org/linux-media/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com/
> - update v4l2-compliance output
> - Link to v3: https://lore.kernel.org/r/20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com
> 
> Changes in v3:
> - Updated the dtbinding with SoC specific compatible strings (Rob).
> - Reordered hevc_dec and v3d in bcm2711.dtsi to keep them in ascending
>   register order (Stefan).
> - Reordered hevc_dec in bcm2711-rpi.dtsi to keep them in alphabetical
>   order (Stefan).
> - Tested on top of Nicolas' revised version of Hans' patch set for
>   manual request completion.
>   https://lore.kernel.org/all/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com/
> - Link to v2: https://lore.kernel.org/r/20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com
> 
> Changes in v2:
> - Rebased to use Hans' manual request completion scheme.
>   https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
> - Require all slices for a frame to be submitted in one request.
> - Added the missing header file.
> - Used the full macro name for pix format docs (Sakari)
> - Dropped unneeded |- from dtbinding (Rob)
> - Made reg and reg-names match in order (Rob)
> - Removed clock-names from dtbinding (Rob)
> - Driver changed to not request the clock by name
> - Dropped clock-names from DTS file
> - Minor fixes for compliance failures
>   fail: v4l2-test-formats.cpp(958): fmt_cap.g_colorspace() != col
>   fail: v4l2-test-buffers.cpp(901): q.create_bufs(node, 1, &fmt) != EINVAL
> - v4l2-compliance output added to cover letter (Nicholas)
>   I believe the "fail: v4l2-test-controls.cpp(939): try_ext_ctrls
>   returned an error (22)" is expected as it is validating the SPS.
>   Hantro and Cedrus certainly both appear to return errors in the same place
> - Link to v1: https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com
> 
> ---
> Dave Stevenson (4):
>       docs: uapi: media: Document Raspberry Pi NV12 column format
>       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
>       dt-bindings: media: Add the Raspberry Pi HEVC decoder
>       arm: dts: bcm2711-rpi: Add HEVC decoder node
> 
> John Cox (2):
>       docs: uapi: media: Clarify HEVC slice_param bit_size, data_byte_offset
>       media: platform: Add Raspberry Pi HEVC decoder driver
> 
>  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst        |    6 +-
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   46 +
>  MAINTAINERS                                        |   10 +
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    4 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  325 +++
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  195 ++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2436 ++++++++++++++++++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.h    |   22 +
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  429 ++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  317 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  634 +++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>  drivers/media/v4l2-core/v4l2-common.c              |    2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  include/uapi/linux/videodev2.h                     |    4 +
>  21 files changed, 4573 insertions(+), 2 deletions(-)
> ---
> base-commit: 1512bd6430c7be7723724f31a74c3b8aaacf8a20
> change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> 
> Best regards,


