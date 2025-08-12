Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF90CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 00:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LksAwlMK4Zcalf/VkDre46LCCYPoR3RkYJEdyB3ZKtw=; b=lU2mxACe3KGh4AIlVkD7GJtzpF
	i4sv8Qo2jH7I5SL9P9tsq90qytw+hrUx1WR40X6b8frBp7UpJitYppKgf1DECl4bLR7AZEK2bBcag
	I5S34MrLFrG82+6+pLpVD4OzN4wUjMvmWKIwBv9AqjCRJtf54w3l146aq4YmipdzqUrQCCTAtKXlT
	TU1Qvdb3jMnSFNaGLeDz1HMfIZpOhZd/OGdLPfoNg4ZVdRT0pLYYVbtTPKeF4myyx703XRxecc0ED
	mNJJwct6Gs8iycF3dAk09Ut1+sMaoOcruy+e/M40y19XP0ZB2W1BYSD1NjOINWrVwEymSWwEod7vD
	AnGavfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulcVa-00000009Qd0-1FQg;
	Tue, 12 Aug 2025 00:04:54 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulcSs-00000009QPs-28W1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 00:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1754956926;
 bh=LksAwlMK4Zcalf/VkDre46LCCYPoR3RkYJEdyB3ZKtw=;
 b=GzZiSgmqFVP3O3AQN2pe4vO5zq1Fs2BfMTLHxknzWwlpSN1SBT6h8svt+9xoytZwZpBmFAokk
 E4Rf4RN+XzFyhO3TEmaobqxJI1Rns8ogCdfqQ2kez0iCh3KqG2INkrEUuZdHp+4v+BWVT8lMIcq
 9LUEsc/4NF232KXhupezBLFROxIc87v/4qZoMmT4h7PFPSDrQ5qK5qE7gXo2A6LIYnBWLQs1Y5D
 /AJQAzRgvyyci5hqktpYWI8hrqo1gRpGsro22cX51SIk8vBWZf6B9aUXzhnMdFp6ermR0beYYO2
 7eKjJ9JhdHkwvmgTxmen5T6doK2NtYquQGtsBjCwx1kg==
X-Forward-Email-ID: 689a841810bdea4a6d7c54b0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
Date: Tue, 12 Aug 2025 02:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_170206_610742_2DD859B1 
X-CRM114-Status: GOOD (  30.06  )
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

Hi Nicolas,

On 8/11/2025 11:52 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> This series add a HEVC backend to the Rockchip Video Decoder driver.
>>
>> With the dependent H.264 High 10 and 4:2:2 profile support series
>> finally merged there is finally time to send a v2 with minor changes and
>> a suggested code style fix of this series. v1 of this series has been
>> fully functional up until recent unstaging of the rkvdec driver.
>>
>> A version of this HEVC backend has been in use by the LibreELEC distro
>> for the past 5+ years [1]. It was initially created based on a copy of
>> the H264 backend, unstable HEVC uAPI controls and a cabac table + scaling
>> matrix functions shamelessly copied 1:1 from the Rockchip mpp library.
>>
>> It has since then been extended to use the stable HEVC uAPI controls and
>> improved opon e.g. to include support for rk3288 and fix decoding issues
>> by Alex Bee and Nicolas Dufresne.
>>
>> The version submitted in this series is based on the code currently used
>> by the LibreELEC distro, excluding hard/soft reset, and with cabac table
>> and scaling matrix functions picked from Sebastian Fricke prior series
>> to add a HEVC backend [2].
>>
>> Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for making
>> this series possible!
>>
>> Patch 1 add the new HEVC backend.
>> Patch 2-3 add variants support to the driver.
>> Patch 4 add support for a rk3288 variant.
>> Patch 5 add a rk3328 variant to work around hw quirks.
>> Patch 6-7 add device tree node for rk3288.
>>
>> This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
>>
>>   v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>   ...
>>   Total for rkvdec device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings:
>> 0
>>
>>   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 137/147 tests successfully
> 
> I've also tested RK3399 using Renegade Elite from Libre Computer, though with
> GStreamer. My results for this suite is 134/147, with failing tests being:
> 
> - DBLK_D_VIXS_2
> - DSLICE_A_HHI_5
> - DELTAQP_A_BRCM_4
> - EXT_A_ericsson_4
> - PICSIZE_A_Bossen_1 (expected)
> - PICSIZE_B_Bossen_1 (expected)
> - PICSIZE_C_Bossen_1 (expected)
> - PICSIZE_D_Bossen_1 (expected)
> - SAODBLK_A_MainConcept_4
> - SAODBLK_B_MainConcept_4
> - TSUNEQBD_A_MAIN10_Technicolor_2 (expected)
> - WPP_D_ericsson_MAIN10_2
> - WPP_D_ericsson_MAIN_2
> 
> Please share your list, this seems big enough difference to be worth making sure
> we did not diverge somewhere between both interpretation of the V4L2 spec.
> GStreamer has been mostly tested with MTK driver so far. Can you also share a
> link to the latest ffmpeg tree you are using (since its not upstream FFMPEG) ?

As mentioned in this cover letter the full fluster report can be found
at [3], and has links to the trees used to produce the raw report data,
have now also added some more details of versions used.

The tests from the report was running on a RK3399 Rock Pi 4B v1.5.

- Linux: 6.17-rc1 + patches
- fluster: 0.4.1 + patch
- FFmpeg: 7.1.1 + patches
- GStreamer: 1.27.1

JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:

- DBLK_D_VIXS_2 (fail)
- DSLICE_A_HHI_5 (fail)
- EXT_A_ericsson_4 (fail)
- PICSIZE_A_Bossen_1 (error)
- PICSIZE_B_Bossen_1 (error)
- PICSIZE_C_Bossen_1 (error)
- PICSIZE_D_Bossen_1 (error)
- SAODBLK_A_MainConcept_4 (fail)
- SAODBLK_B_MainConcept_4 (fail)
- TSUNEQBD_A_MAIN10_Technicolor_2 (error)

JCT-VC-HEVC_V1 on FFmpeg-H.265-v4l2request:

- CONFWIN_A_Sony_1 (fail)
- EXT_A_ericsson_4 (fail)
- PICSIZE_A_Bossen_1 (error)
- PICSIZE_B_Bossen_1 (error)
- PICSIZE_C_Bossen_1 (error)
- PICSIZE_D_Bossen_1 (error)
- SAODBLK_A_MainConcept_4 (fail)
- SAODBLK_B_MainConcept_4 (fail)
- TSUNEQBD_A_MAIN10_Technicolor_2 (error)
- VPSSPSPPS_A_MainConcept_1 (error)

The WPP_*_ericsson_MAIN* samples get a mixed Fail/Success when running
the full test suite for FFmpeg-H.265-v4l2request, however retrying them
individually they will eventually report Success. Not sure this is an
issue with FFmpeg or the driver, since they pass with GStreamer.

Interesting that DBLK_D_VIXS_2, DSLICE_A_HHI_5 and CONFWIN_A_Sony_1
consistently differs between GStreamer and FFmpeg.

[3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d

> 
> Detlev reports 146/147 on newer hardware using GStreamer, failing
> TSUNEQBD_A_MAIN10_Technicolor_2 (9bit chroma) only. On Detlev side, it will we
> important to check why 8K videos (PICSIZE*) passes with a single core, perhaps
> we accidently use both cores ?
> 
> Note, also expected, we failt JCT-VC-SCC, JCT-VC-MV-HEVC, and JCT-VC-RExt passes
> 2/49. This last suite is pretty new in fluster.

Following is the FFmpeg-H.265-v4l2request result with this:

- JCT-VC-MV-HEVC 9/9
- JCT-VC-RExt 2/49
- JCT-VC-SCC 0/15
- JCT-VC-3D-HEVC 27/27
- JCT-VC-SHVC 1/69

Regards,
Jonas

> 
> regards,
> Nicolas
> 
>>
>>   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 9/9 tests successfully
>>
>> And on a TinkerBoard (RK3288):
>>
>>   v4l2-compliance 1.30.1, 32 bits, 32-bit time_t
>>   ...
>>   Total for rkvdec device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings:
>> 0
>>
>>   Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 137/147 tests successfully
>>
>>   Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
>>   ...
>>   Ran 9/9 tests successfully
>>
>> The WPP_x_ericsson tests from test suite JCT-VC-HEVC_V1 has been showing
>> a mix of both Success and/or Fail result for FFmpeg-H.265-v4l2request.
>>
>> Full summary of fluster run can be found at [3].
>>
>> Please note that there is a known issue with concurrent decoding,
>> decoding errors in one decode session may affect a separate session.
>> The only known mitigation to this is to pause decoding for some time
>> and/or do a full HW reset, something to handle in future series.
>>
>> Changes in v2:
>> - Rabase after h264 high10/422 merge and unstaging of rkvdec driver
>> - Use new_value in transpose_and_flatten_matrices()
>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>> - Adjust code style in rkvdec_enum_coded_fmt_desc()
>> - Collect a-b tag
>> - Drop merged vdec node reg size patches
>> Link to v1:
>> https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwiboo.se
>>
>> [1]
>> https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch
>> [2]
>> https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com/
>> [3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d
>>
>> Alex Bee (4):
>>   media: rkvdec: Add variants support
>>   media: rkvdec: Add RK3288 variant
>>   media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
>>   ARM: dts: rockchip: Add vdec node for RK3288
>>
>> Jonas Karlman (3):
>>   media: rkvdec: Add HEVC backend
>>   media: rkvdec: Implement capability filtering
>>   media: dt-bindings: rockchip,vdec: Add RK3288 compatible
>>
>>  .../bindings/media/rockchip,vdec.yaml         |    1 +
>>  arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  826 ++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    4 +
>>  .../platform/rockchip/rkvdec/rkvdec-vp9.c     |   10 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |  184 +-
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   15 +
>>  9 files changed, 2886 insertions(+), 21 deletions(-)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c


