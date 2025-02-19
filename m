Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrkwZPxFwpN52AhhFjog824e87ZOPRRRzzkiEf+AUqY=; b=gO07/NLm+IhjEubTGNWALS850k
	Zw0Y4/spuEoB2hwvO2wCVrkedXt33pwjN6NPA7PHpIgOB/Fr1XpVbVWr9xb5WhOW1IK1TP+4+KVI4
	NmSzvZO4jXX0yuGF3TVlGfZaBJghZexg+KwmS7ucOWz8Nl5Mu1gPBKHiu/JOWtwsMb97CmFL4aLKj
	cs8ZTBcGDnl99rnc/v4lZXeXJE6v6+C3ZS3Hmat0O13ISGduBt5SfOD0Z5T6GeCvSW8GyqkbHLehO
	Bf++KPRZrTuhPu9bl/+Z2fG+FlmR/ZZFZ9IIIVGRQkY7u1ty9b0ZCh0K0ocgQc3tOMv5RxDBbb6gg
	ZcHdjOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkliZ-0000000DT43-0r4A;
	Wed, 19 Feb 2025 15:10:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklh3-0000000DSfZ-1DV3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:08:59 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 008C8169;
	Wed, 19 Feb 2025 16:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739977653;
	bh=4hH0ogfs3FxS01zx8vZqEEqA9ajbUWe7JPdrJDjl/cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCBXk/A361zRuHfO14ueJVpPe1SKovsqAJpph7O9XWBCj4scQ/ibc7GwSrNakXkvR
	 GFt+BfI+1exlxpJM2rSY/78i5jt8skVIJNKf2sASzuQ9uFDT3HDLReLnSEJMQkCYRy
	 B+Wh05X/wsGSzqzT1mqV2Oah+pQciYQPHoxZ/A3A=
Date: Wed, 19 Feb 2025 17:08:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <20250219150840.GA31825@pendragon.ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
 <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
 <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_070857_465897_C8018268 
X-CRM114-Status: GOOD (  21.87  )
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

On Wed, Feb 19, 2025 at 04:47:26PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 18/02/2025 05:26, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> >>> On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> >>>> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> >>>> container.
> >>>
> >>> Is there a more common name for this format? Otherwise googling for it
> >>> reveals only your series.
> >>
> >> In the cover letter I mention the gstreamer names where available (this
> >> particular format is not in gstreamer). AMD has these in their zynqmp
> >> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> >>
> >> XVUY2101010 is YUV444_10BPC in AMD docs.
> >>
> >> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> >>
> >> I'm not sure you'll have much more luck googling with those names, though
> >> =).
> > 
> > I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
> > waiver: GL, Vulkan or other open standards. Otherwise normal
> > requirements apply and it's required to have an open-source usespace
> > implementation, etc.
> 
> I can drop DRM_FORMAT_XVUY2101010 until we get it to gstreamer. I just 
> had it ready, so I thought it's better to include it than leave out.
> 
> Is the current gstreamer support enough for the other formats to fulfill 
> the userspace requirement?

We've received a green light in the past to add formats to drm_fourcc.h
that would be used by cameras only. There's no open formal standard there, but
we have libcamera as a de-facto standard. I would assume GStreamer to be
enough for a scanout format.

-- 
Regards,

Laurent Pinchart

