Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEAECD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNlP3ns8VDppIWf6JUhMHR8RskYRryaARqBgPGOIgB4=; b=3gIWJLm5jKF8Z71/kh9c7446Ch
	dkveQGq4yq/15yV8tmru5wV+ltsZoxah+tDDuQOMfEpF4Z87Ch4HjcF1PCS+vM8uvRaYztUUXeTKD
	Ru0qBWDxPFJtioZVD8AXZ+pmW4cMr0U3X7qC3pn5YXCA4G7rew1wCv6jNRVGfSx4BfPGPPGUQJn2Z
	gv2DfDTnkQfnS4M5mxtKWFaK8FyEQ/B6o+19GMu/uctMWoGYIXSibV8ZZExbHSEAjJuVbaOqR7KeE
	OdrVPEaCr+wM7oAyI2iHVsYxVbxqOfh2z2fkx3PVaYJwf8eq6pxe70lzpgNAOIEKacr0y55biJ1+/
	hDl4TDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgPT-0000000BFKF-2wzW;
	Thu, 13 Nov 2025 23:07:23 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgPQ-0000000BFJC-2ceQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:07:22 +0000
Message-ID: <b97065ce-2dc0-453b-ab8e-b2d134fc3467@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763075236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNlP3ns8VDppIWf6JUhMHR8RskYRryaARqBgPGOIgB4=;
	b=SBxGfgBc8I66z9OwND+wQTpzsICUh8sCuHclbXpRYW/l6+BFt0ca+M5i9JTso3vrBRiZ4+
	nJmSkYk63SftM6KGE2HTJg9emx330lYXxOcYJOOMjnDZB9Kh5zujiN0qq7riQGteHc7RfL
	uitjVW2UXVUOxDMITwgVFw4FgmqxCkU=
Date: Thu, 13 Nov 2025 18:07:07 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
 plane
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
 <20251113203715.2768107-4-sean.anderson@linux.dev>
 <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150720_960746_593286D7 
X-CRM114-Status: GOOD (  20.10  )
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

On 11/13/25 18:03, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Sean,
> 
> Thank you for the patch.
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Thursday, November 13, 2025 12:37 PM
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>; linux-
>> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>; Sean Anderson
>> <sean.anderson@linux.dev>
>> Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics plane
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> When global alpha is enabled, per-pixel alpha is ignored. Allow
>> userspace to explicitly specify whether to use per-pixel alpha by
>> exposing it through the blend mode property. I'm not sure whether the
>> per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
>> pre-multiplied so I guess we have to advertise it.
>>
>> [1] All we get is "The alpha value available with the graphics stream
>>     will define the transparency of the graphics."
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> index 456ada9ac003..fa1cfc16db36 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> @@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct
>> drm_plane *plane,
>>         if (!new_plane_state->crtc)
>>                 return 0;
>>
>> +       if (new_plane_state->pixel_blend_mode !=
>> DRM_MODE_BLEND_PIXEL_NONE &&
>> +           new_plane_state->alpha >> 8 != 0xff) {
>> +               drm_dbg_kms(plane->dev,
>> +                           "Plane alpha must be 1.0 when using pixel alpha\n");
>> +               return -EINVAL;
>> +       }
>> +
>>         crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
>>         if (IS_ERR(crtc_state))
>>                 return PTR_ERR(crtc_state);
>> @@ -117,9 +124,13 @@ static void
>> zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>>
>>         zynqmp_disp_layer_update(layer, new_state);
>>
>> -       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
>> -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
>> +       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
>> +               bool blend = plane->state->pixel_blend_mode ==
>> +                            DRM_MODE_BLEND_PIXEL_NONE;
>> +
>> +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
>>                                                    plane->state->alpha >> 8);
>> +       }
>>
>>         /*
>>          * Unconditionally enable the layer, as it may have been disabled
>> @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
>> zynqmp_dpsub *dpsub)
>>                         return ret;
>>
>>                 if (i == ZYNQMP_DPSUB_LAYER_GFX) {
>> +                       unsigned int blend_modes =
>> +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +                               BIT(DRM_MODE_BLEND_PREMULTI);
> 
> | BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the hardware.

Do you have a datasheet (or other) reference?

But in any case, DRM_MODE_BLEND_PREMULTI is mandatory even if we don't support
it. See drm_plane_create_blend_mode_property for details.

--Sean


