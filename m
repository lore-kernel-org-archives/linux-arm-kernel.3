Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A706CE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xt5aILFSt7PSgQoMowi/IMdwH4D1+v22HJrwz8wAtmo=; b=SLm+KnOSdm3yGQgTXxwvLwwLo1
	pL1qMHluWyFhVK00fBUPCJ7CD3jLjYxGob8jWxTx0CzIvKKnlDh9sHz8eKfKiHJY9YrrqQwrZCHWi
	4oSb+IWfIDHDHpjBrLxz4oJXNPAWn0RlSJcLloWG+qZiskzkC58xiOBPc5Y0qfyXTwPm+m57JMQx4
	awElUwhy4NODiKp9s7K6T4Jvx2Ih5hkZ6zYXag4tMv+V2kaDtTsF2wNlCvQ+ByMxuV+vh+OWW1Cjd
	+2R1f/PcIituAjdZSi43Sx33onj7JRO3k00k3PL6+wDrMGuqTgqQDmL2kL2r63qkvuN3fMqLxH9C7
	TCM77vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvq5-0000000CaAv-0vHM;
	Fri, 14 Nov 2025 15:35:53 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvq1-0000000Ca9p-3Abi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:35:51 +0000
Message-ID: <759a8a24-2ed2-4628-b64c-b02428ee07cb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763134545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xt5aILFSt7PSgQoMowi/IMdwH4D1+v22HJrwz8wAtmo=;
	b=Q1unag8/XOadACYHzamxxfIbf0YSgEXiyDvzZPMuD88j0cK1oVK1JpWo/0EuPSl2ycmXl9
	C39QRf8IT6j/xGcU3fSPQjJMRjFTWIzvwc/OXAbIxmMhucEbNtKwVYQGzOLsTMgvdlw1XQ
	Jn+DZKcAi5SyK3hnVyPnrkYG33/Zob4=
Date: Fri, 14 Nov 2025 10:35:32 -0500
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
 <MW4PR12MB71653FD94A2109A45BF4EDA1E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB71653FD94A2109A45BF4EDA1E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_073549_941006_42F49831 
X-CRM114-Status: GOOD (  28.03  )
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

On 11/13/25 18:59, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Klymenko, Anatoliy
>> Sent: Thursday, November 13, 2025 3:04 PM
>> To: 'Sean Anderson' <sean.anderson@linux.dev>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>
>> Subject: RE: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> plane
>>
>> Hi Sean,
>>
>> Thank you for the patch.
>>
>> > -----Original Message-----
>> > From: Sean Anderson <sean.anderson@linux.dev>
>> > Sent: Thursday, November 13, 2025 12:37 PM
>> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> > <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> > Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> > David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> > <tzimmermann@suse.de>; Maarten Lankhorst
>> > <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> > <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-
>> > arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> > Michal <michal.simek@amd.com>; Sean Anderson
>> > <sean.anderson@linux.dev>
>> > Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> plane
>> >
>> > Caution: This message originated from an External Source. Use proper
>> caution
>> > when opening attachments, clicking links, or responding.
>> >
>> >
>> > When global alpha is enabled, per-pixel alpha is ignored. Allow
>> > userspace to explicitly specify whether to use per-pixel alpha by
>> > exposing it through the blend mode property. I'm not sure whether the
>> > per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
>> > pre-multiplied so I guess we have to advertise it.
>> >
>> > [1] All we get is "The alpha value available with the graphics stream
>> >     will define the transparency of the graphics."
>> >
>> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> > ---
>> >
>> >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
>> >  1 file changed, 22 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > index 456ada9ac003..fa1cfc16db36 100644
>> > --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > @@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct
>> > drm_plane *plane,
>> >         if (!new_plane_state->crtc)
>> >                 return 0;
>> >
>> > +       if (new_plane_state->pixel_blend_mode !=
>> > DRM_MODE_BLEND_PIXEL_NONE &&
>> > +           new_plane_state->alpha >> 8 != 0xff) {
>> > +               drm_dbg_kms(plane->dev,
>> > +                           "Plane alpha must be 1.0 when using pixel alpha\n");
>> > +               return -EINVAL;
>> > +       }
>> > +
>> >         crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
>> >         if (IS_ERR(crtc_state))
>> >                 return PTR_ERR(crtc_state);
>> > @@ -117,9 +124,13 @@ static void
>> > zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>> >
>> >         zynqmp_disp_layer_update(layer, new_state);
>> >
>> > -       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
>> > -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
>> > +       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
>> > +               bool blend = plane->state->pixel_blend_mode ==
>> > +                            DRM_MODE_BLEND_PIXEL_NONE;
> 
> I would suggest adding
> || !plane->state->fb->format->has_alpha;
> pixel_blend_mode doesn't make a lot of sense for non-alpha formats but may
> have a negative effect on Mike's fix
> https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/
> if user isn't careful enough around this property.

I don't believe that patch should be applied.

--Sean

>> > +
>> > +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
>> >                                                    plane->state->alpha >> 8);
>> > +       }
>> >
>> >         /*
>> >          * Unconditionally enable the layer, as it may have been disabled
>> > @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
>> > zynqmp_dpsub *dpsub)
>> >                         return ret;
>> >
>> >                 if (i == ZYNQMP_DPSUB_LAYER_GFX) {
>> > +                       unsigned int blend_modes =
>> > +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> > +                               BIT(DRM_MODE_BLEND_PREMULTI);
>>
>> | BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the
>> hardware.
>>
>> > +
>> >                         ret = drm_plane_create_alpha_property(plane);
>> >                         if (ret)
>> >                                 return ret;
>> > +
>> > +                       ret = drm_plane_create_blend_mode_property(plane,
>> > +                                                                  blend_modes);
>> > +                       if (ret)
>> > +                               return ret;
>> >                 }
>> >         }
>> >
>> > --
>> > 2.35.1.1320.gc452695387.dirty
>>
>> Thank you,
>> Anatoliy
> 
> Thank you,
> Anatoliy
> 


