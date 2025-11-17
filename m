Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF62CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwAPPDquHtcNm47PaRnhELwXgDi0cjA+vnOu+Fa7qBE=; b=hdvCo0zNFrNfLXBRcuw3PFMrHQ
	CJYqVVEeioyiwq8AvohHipO9uQkzCDZCcFZ5ahNt/h5LGoXAM+jvxZWZwswiwOPpt2fPKbfv3T+qD
	WRkjjx5GHQgFmdEagUoiWjQCPsAQksjXLji1zsCCb2/qb/QsJ8iDxnO72Llz3I22vQ1znmjjdT1wF
	4NGMM6eNU6udncUoJJh4VW3sHFUm+h1xyeZ8psfCnitPwpxQQDYxyYmmHpLigyYsuV7EsMcB3u2Oy
	HSGqJ5AjSec11RBHteXBZfG8CXgQOTwDuoner83fg9A+/6fhEifnUhBMeh/c5G5OfutPAXNTAKn8i
	fEVw35Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1nu-0000000GNYp-1Usk;
	Mon, 17 Nov 2025 16:10:10 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1nr-0000000GNXm-031q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:10:08 +0000
Message-ID: <7248b96f-be82-4b89-87e4-f86b3898bc55@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763395802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SwAPPDquHtcNm47PaRnhELwXgDi0cjA+vnOu+Fa7qBE=;
	b=lBS4GNQ/vb9F6Vn/H9S43xfWCRoEeB5UrFnWt3WBDy+U0RbpDu5SAii+DYIYorWbkpkzWV
	K/TDPrFQV4wt4IYlP33rqlxWYcWmvwZpNedARWTDnTXWvpK87WtJpg8DYGE9+ksAUpMOU2
	ROGZ/mbtzBV9DQc6Lib9c62Ai2zK4iE=
Date: Mon, 17 Nov 2025 11:09:57 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm: zynqmp: Make the video plane primary
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-3-sean.anderson@linux.dev>
 <MW4PR12MB71651E0E82AD8E4898DBD017E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
 <680bee12-6bac-4634-8a02-4b1717a90aa2@linux.dev>
 <MW4PR12MB7165F8413848B53CB8C7C031E6CBA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB7165F8413848B53CB8C7C031E6CBA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_081007_289142_20A0FC0A 
X-CRM114-Status: GOOD (  37.59  )
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

On 11/14/25 19:57, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Sean
>> Anderson
>> Sent: Thursday, November 13, 2025 2:52 PM
>> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>
>> Subject: Re: [PATCH 2/3] drm: zynqmp: Make the video plane primary
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> On 11/13/25 17:45, Klymenko, Anatoliy wrote:
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >
>> > Hi Sean,
>> >
>> > Thanks a lot for the patch (and tackling the alpha issue in general)
>> >
>> >> -----Original Message-----
>> >> From: Sean Anderson <sean.anderson@linux.dev>
>> >> Sent: Thursday, November 13, 2025 12:37 PM
>> >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> >> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> >> Cc: linux-kernel@vger.kernel.org; Mike Looijmans
>> <mike.looijmans@topic.nl>;
>> >> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> >> <tzimmermann@suse.de>; Maarten Lankhorst
>> >> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> >> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-
>> >> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> >> Michal <michal.simek@amd.com>; Sean Anderson
>> >> <sean.anderson@linux.dev>
>> >> Subject: [PATCH 2/3] drm: zynqmp: Make the video plane primary
>> >>
>> >> Caution: This message originated from an External Source. Use proper
>> caution
>> >> when opening attachments, clicking links, or responding.
>> >>
>> >>
>> >> The zynqmp has two planes: "video" and "graphics". The video plane
>> >>
>> >> - Is on the bottom (zpos=0) (except when chroma keying as the master
>> plane)
>> >> - Supports "live" input (e.g. from an external source)
>> >> - Supports RGB, YUV, and YCbCr formats, including XRGB8888
>> >> - Does not support transparency, except via chroma keying (colorkey)
>> >> - Must cover the entire screen (translation/resizing not supported)
>> >>
>> >> The graphics plane
>> >>
>> >> - Is on the top (zpos=1)
>> >> - Supports "live" input (e.g. from an external source)
>> >> - Supports RGB and YUV444 formats, but not XRGB8888
>> >> - Supports transparency either via
>> >>   - Global alpha channel, which disables per-pixel alpha when enabled
>> >>   - Per-pixel alpha, which cannot be used with global alpha
>> >>   - Chroma keying (colorkey)
>> >> - Must cover the entire screen (translation/resizing not supported)
>> >>
>> >> Currently the graphics plane is the primary plane. Make the video plane
>> >> the primary plane:
>> >>
>> >> - The video plane supports XRGB8888, which is the default 24-bit
>> >>   colorspace for X. This results in improved performance when compared
>> >>   to RGB565.
>> >> - The graphics plane can be used as an overlay because it has a higher
>> >>   z-pos and supports a per-pixel alpha channel. Unfortunately, clients
>> >>   like weston cannot currently take advantage of this because they
>> >>   expect overlay planes to support translation/resizing.
>> >>
>> >> One downside to this approach could be that the graphics plane has worse
>> >> support for YUV and YCBCr, so it may be more difficult to compose video
>> >
>> > Not just more difficult but practically impossible:
>> > 1. GFX (in Xilinx terminology) plane doesn't support pixel upscaling, so
>> > no support for NV12, YUY2 and other common video pixel formats.
>> > 2. Both planes are unscalable, this means we can only output native
>> > display resolution video on the top plane, or display thick black frame
>> > around the picture. We are losing GFX masking capabilities.
>>
>> The graphics masking capabilities are the same as they always were.
>>
>> > 3. We won't be able to render subtitles on top of the video.
>> > Probably the only practical video player option remains here is to render
>> > video to a texture and embed it into graphics composition.
>>
>> OK, but none of this is currently possible either because of the global
>> alpha setting. So do you have a specific program in mind that plays
>> video and will do it with an "underlay" plane?
>>
> 
> webOS, Roku OS, just to name a few. But most importantly, AMD has quite
> a few customers using "underlay" plane because of its YUV 420 capability.

Can you link to a specific example where the plane is selected based on
its primary/overlay status and not based on its format support?  I'm not
too familiar with these distros, but e.g. [1] selects the plane based on
the format, and doesn't care which one is primary.

--Sean

[1] https://github.com/webosose/omx-components/blob/27b33e17c25023f2c7ffbbfda10169fb500dacdc/src/omxdrm/videorenderer.cpp#L469

>> >> streams into the window of a media player. However, no existing software
>> >> could rely on this because there is no way to enable the per-pixel alpha
>> >> channel when the graphics plane is enabled. This makes it impossible to
>> >
>> > This situation is a driver bug not a fatum.
>>
>> And yet the driver bug provides ample evidence that no one is doing this,
>> so we don't need to worry about it.
>>
>> --Sean
>>
>> > Per pixel alpha blending works
>> > just fine if we disable global alpha. We just need to avoid enabling it when
>> > we have alpha capable GFX plane format.
>> >
>> >> "carve out" an area in the graphics plane where the video plane shows
>> >> through. This limitation is addressed in the next patch, but it means we
>> >> do not need to worry about compatibility in this area.
>> >>
>> >> An alternate approach could be to pretend that the graphics plane
>> >> supports XRGB8888 by using the supported ARGB8888 mode instead and
>> >> enabling the global alpha channel. However, this would rule out ever
>> >> using the per-pixel alpha channel.
>> >>
>> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> ---
>> >>
>> >>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 6 +++---
>> >>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> index c80a2d4034f3..456ada9ac003 100644
>> >> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> @@ -161,8 +161,8 @@ static int zynqmp_dpsub_create_planes(struct
>> >> zynqmp_dpsub *dpsub)
>> >>                 if (!formats)
>> >>                         return -ENOMEM;
>> >>
>> >> -               /* Graphics layer is primary, and video layer is overlay. */
>> >> -               type = i == ZYNQMP_DPSUB_LAYER_VID
>> >> +               /* Graphics layer is overlay, and video layer is primary. */
>> >> +               type = i == ZYNQMP_DPSUB_LAYER_GFX
>> >>                      ? DRM_PLANE_TYPE_OVERLAY :
>> >> DRM_PLANE_TYPE_PRIMARY;
>> >>                 ret = drm_universal_plane_init(&dpsub->drm->dev, plane, 0,
>> >>                                                &zynqmp_dpsub_plane_funcs,
>> >> @@ -322,7 +322,7 @@ static const struct drm_crtc_funcs
>> >> zynqmp_dpsub_crtc_funcs = {
>> >>
>> >>  static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
>> >>  {
>> >> -       struct drm_plane *plane = &dpsub->drm-
>> >> >planes[ZYNQMP_DPSUB_LAYER_GFX];
>> >> +       struct drm_plane *plane = &dpsub->drm-
>> >> >planes[ZYNQMP_DPSUB_LAYER_VID];
>> >>         struct drm_crtc *crtc = &dpsub->drm->crtc;
>> >>         int ret;
>> >>
>> >> --
>> >> 2.35.1.1320.gc452695387.dirty
>> >
>> > Thank you,
>> > Anatoliy
> 
> Thank you,
> Anatoliy

