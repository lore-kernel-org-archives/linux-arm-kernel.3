Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73085C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdM2RpE3V9V2kznmedhDPOzgcd7DK9vLob5f5fBGzd0=; b=RWkO+QHZdgOaUAud6VUGW3uvbC
	lzlQEGrxXRSSIToPhbcCZKhYRoMOyF9owMwOpyE/WWsNUokBWHmt5uy/MS9TP3BVwzeiVakj/gmNp
	X9wxBLd4Dz9ltXtpDPYDGFooUkLPgCu1YB0p6aFwQ8jkAWePIh6QVXhPuIm/5oG6swf6hCPkdMCkn
	6wue4LSCGAz3woVw75W3SKmuDW2fxtvTYO6oCqOjF3Z/7JJNKO+rdpDej20SGjgijLoAqXHy2Hu0R
	DEufu455+xtnSQl8JSxZHMrA6gR6EtuWKAcnnBSX7+B9cZGRIN9ftHnd27eWQuIgoqQ0TPDpG641C
	RB69KN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GCx-00000005Pfs-1LEv;
	Tue, 08 Apr 2025 21:10:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GBA-00000005PR1-1DWL;
	Tue, 08 Apr 2025 21:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744146498;
	bh=btv7qpy1infRfUdBialPoFlIqUVev+DgGGoAYqlmeoA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IlTUpTVuDoSHh8D2w8BBHEwqNEthjw8u8veSmEE5tDglQdaxC8deyyDC84l6LTV5K
	 MIyLlFJn8iMsLrDc4SbEPwO0wdetGq10/OCMXH2RdISAEZL0TnNihDvTHFpK9o92Nk
	 5U9OYg6mE5ROd6aSczX1fx0NePLlG0Ui5jSmTv2r1W7PnL0YzExT2ACE0SnCmwaZ8X
	 wG57b4tguLmc0piw0nAqPUMlMMG4yrCpWLnRdygjnMCdjfvAeRL6tjJr//aE25X/Sg
	 0y4lqvrzteQGXlxXgNZqJoe6fbmZ116euundZtaq50/KHorTFNLl+ZCiu4+Q9afkJS
	 GQDq7NOGwGH8Q==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A01F517E0EB8;
	Tue,  8 Apr 2025 23:08:14 +0200 (CEST)
Message-ID: <fd471fe44a57e1b0c74505f2a7122b62241809d5.camel@collabora.com>
Subject: Re: [PATCH v4 1/6] media: v4l2: Add NV15 and NV20 pixel formats
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Jonas Karlman	 <jonas@kwiboo.se>, Sebastian
 Reichel <sebastian.reichel@collabora.com>,  Niklas Cassel
 <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>, Dragan Simic
 <dsimic@manjaro.org>,  Jianfeng Liu <liujianfeng1994@gmail.com>, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>, Naushir Patuck	 <naush@raspberrypi.com>,
 Jean-Michel Hautbois	 <jeanmichel.hautbois@ideasonboard.com>, Dmitry
 Perchanov	 <dmitry.perchanov@intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-staging@lists.linux.dev,
 kernel@collabora.com, 	linux-kernel@vger.kernel.org
Date: Tue, 08 Apr 2025 17:08:13 -0400
In-Reply-To: <D8SA0W2ZEAQ3.3BO4NMONFJCRC@cknow.org>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
	 <20250325213303.826925-2-detlev.casanova@collabora.com>
	 <D8SA0W2ZEAQ3.3BO4NMONFJCRC@cknow.org>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_140820_474292_D2AD19A2 
X-CRM114-Status: GOOD (  23.89  )
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

Le samedi 29 mars 2025 à 00:09 +0100, Diederik de Haas a écrit :
> Hi Detlev,
> 
> On Tue Mar 25, 2025 at 10:22 PM CET, Detlev Casanova wrote:
> > From: Jonas Karlman <jonas@kwiboo.se>
> > 
> > Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
> > 10-bit buffers.
> > 
> > NV15 and NV20 is 10-bit 4:2:0/4:2:2 semi-planar YUV formats similar to
> > NV12 and NV16, using 10-bit components with no padding between each
> > component. Instead, a group of 4 luminance/chrominance samples are
> > stored over 5 bytes in little endian order:
> > 
> > YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> > 
> > The '15' and '20' suffix refers to the optimum effective bits per pixel
> > which is achieved when the total number of luminance samples is a
> > multiple of 8 for NV15 and 4 for NV20.
> > 
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> > ---
> >  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c         |   2 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
> >  include/uapi/linux/videodev2.h                |   2 +
> >  4 files changed, 134 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > index b788f69338554..22cad8c9726bf 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > @@ -79,6 +79,13 @@ All components are stored with the same number of bits per component.
> >        - Cr, Cb
> >        - Yes
> >        - Linear
> > +    * - V4L2_PIX_FMT_NV15
> > +      - 'NV15'
> > +      - 10
> > +      - 4:2:0
> > +      - Cb, Cr
> > +      - Yes
> > +      - Linear
> 
> In your cover letter you mentioned:
> Imported improvements from [1]
> [1]: https://lore.kernel.org/linux-media/20250225-rkvdec_h264_high10_and_422_support-v7-2-7992a68a4910@collabora.com/
> 
> The changelog of "media: rkvdec: Add H.264 High 10 and 4:2:2 profile
> support" v7 had this:
> - Move V4L2_PIX_FMT_NV15/V4L2_PIX_FMT_NV20 documentation as suggested
> 
> Following a comment on v6 of that series.
> 
> But it seems these blocks are now placed at the location as it was in
> the v6 series, thus NOT importing its improvements?

The other series have been partially accepted into media-commiters next
branch, including this patch. Meaning you can simply remove that patch
in your next submission.

regards,
Nicolas

> 
> >      * - V4L2_PIX_FMT_NV12M
> >        - 'NM12'
> >        - 8
> > @@ -172,6 +179,13 @@ All components are stored with the same number of bits per component.
> >        - Cr, Cb
> >        - Yes
> >        - Linear
> > +    * - V4L2_PIX_FMT_NV20
> > +      - 'NV20'
> > +      - 10
> > +      - 4:2:2
> > +      - Cb, Cr
> > +      - Yes
> > +      - Linear
> >      * - V4L2_PIX_FMT_NV16M
> >        - 'NM16'
> >        - 8
> 
> The same thing seemed to have happened here?
> 
> Cheers,
>   Diederik
> 
> > @@ -302,6 +316,57 @@ of the luma plane.
> >        - Cr\ :sub:`11`
> >  
> >  
> > +.. _V4L2-PIX-FMT-NV15:
> > +
> > +NV15
> > +----
> > +
> > +Semi-planar 10-bit YUV 4:2:0 format similar to NV12, using 10-bit components
> > +with no padding between each component. A group of 4 components are stored over
> > +5 bytes in little endian order.
> > +
> > +.. flat-table:: Sample 4x4 NV15 Image (1 byte per cell)
> > +    :header-rows:  0
> > +    :stub-columns: 0

-- 
Nicolas Dufresne
Principal Engineer at Collabora

