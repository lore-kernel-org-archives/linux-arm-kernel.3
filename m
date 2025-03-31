Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDBDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyY8iPZHK5kM0mV0FZeApAnMpuJhK4d19ocpTYEhpi4=; b=qYOTUG9rjcfbsqD1+laxRS2hR2
	6u1tPUGjmwYcyBecF5cs3spJije33y/DEbxBbIrPJwl7MFFMaCuG8xdjG6cIJSaGu9SKrBkqbixHQ
	rzejiURKqzYT3QARAWMWG/2U0jBry1w7VsyxLaUur1W3RC5jUfs0y4WkCEfc0LiPfVLUiigiK9QJV
	wS0yK6wrWsqaxzc6j9HaOGapxGEoJVyAEv0trcFNEt9MxGrej54KR6qtmdX1sS9moj+Md4UMGCute
	Xl6ek4pUQBa1GcKkz0kJW0Pb6VqBIQN/V6oZW/UyiwCojsavH3imimM/cA+eTNzdhB+MD0LS3vnoL
	kgiTtS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzH2Z-00000000mgP-1Uhh;
	Mon, 31 Mar 2025 15:27:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGXs-00000000eTM-2fdC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:55:26 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82399725;
	Mon, 31 Mar 2025 16:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743432808;
	bh=Q9O8UjLPceVEDCDVbzGN5rZyqSeVA1cCqDcPa6gtF7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wej7R7w+Pso2p0b4aeIXBL2u8ndNKcj+OZ6IYfyKD53IJoflnrCT7g29kYHpSG04c
	 KrEhXY1ajSpi8jPbE551RKqC/EWPdscU05czKxVEHwz+bNTiAElp9/96FHOnJxKTwT
	 o5LQszvm6ZJTqSKouOeFuzvpUdWcAZXddc24GGzk=
Date: Mon, 31 Mar 2025 17:54:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250331145456.GB27882@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
 <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
 <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell>
 <20250331082135.GB13690@pendragon.ideasonboard.com>
 <20250331135337.61934003@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250331135337.61934003@eldfell>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_075525_000432_7A3D8ED7 
X-CRM114-Status: GOOD (  48.97  )
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

On Mon, Mar 31, 2025 at 01:53:37PM +0300, Pekka Paalanen wrote:
> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote:
> > On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
> > > On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wrote:
> > > > On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote:
> > > > > On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrote:
> > > > > > On 27/03/2025 11:20, Pekka Paalanen wrote:    
> > > > > > > On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wrote:
> > > > > > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > > > > > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote:
> > > > > > >>>> Add greyscale Y8 format.
> > > > > > >>>>
> > > > > > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>    
> > > > > > >>>
> > > > > > >>> Thanks for your patch!
> > > > > > >>>    
> > > > > > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > > >>>>
> > > > > > >>>> +/* Greyscale formats */
> > > > > > >>>> +
> > > > > > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */    
> > > > > > >>>
> > > > > > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > > > >>> the number of bits in the FOURCC format. What do you envision
> > > > > > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?    
> > > > > > >>
> > > > > > >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > > > > > >> not required, but different fourccs for the same formats do confuse.
> > > > > > >>
> > > > > > >> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > > > > > >> possible, and if not, invent a new one.    
> > > > > > >
> > > > > > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > > > > > >
> > > > > > > Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > > > > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > > > > > defined by MatrixCoefficients (H.273 terminology)?
> > > > > > >
> > > > > > > That would be my intuitive assumption following how YCbCr is handled.
> > > > > > > Is it obvious enough, or should there be a comment to that effect?    
> > > > > >
> > > > > > You raise an interesting point. Is it defined how a display driver, that
> > > > > > supports R8 as a format, shows R8 on screen? I came into this in the
> > > > > > context of grayscale formats, so I thought R8 would be handled as (R, R,
> > > > > > R) in RGB. But you say (R, 0, 0), which... also makes sense.    
> > > > >
> > > > > That is a good question too. I based my assumption on OpenGL behavior
> > > > > of R8.
> > > > >
> > > > > Single channel displays do exist I believe, but being single-channel,
> > > > > expansion on the other channels is likely meaningless. Hm, but for the
> > > > > KMS color pipeline, it would be meaningful, like with a CTM.
> > > > > Interesting.
> > > > >
> > > > > I don't know. Maybe Geert does?    
> > > > 
> > > > I did some digging, and was a bit surprised that it was you who told
> > > > me to use R8 instead of Y8?
> > > > https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell  
> > > 
> > > Hi Geert,
> > > 
> > > indeed I did. I never thought of the question of expansion to R,G,B
> > > before. Maybe that expansion is what spells R8 and Y8 apart?
> > > 
> > > I do think that expansion needs to be specified, so that the KMS color
> > > pipeline computations are defined. There is a big difference between
> > > multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > > 
> > > - (R, 0, 0)
> > > - (R, R, R)
> > > - (c1 * Y, c2 * Y, c3 * Y)  
> > 
> > I'd be very surprised by an YUV to RGB conversion matrix where the first
> > column would contain different values. What we need to take into account
> > though is quantization (full vs. limited range).
> 
> A good point, are the Y coefficients always 1.0 after quantization
> range has been accounted for?

As far as I understand, they should be. RGB is full range, so the Y
range should map to [0.0, 1.0] in RGB space. I'm also not aware of any
colorspace where a grey colour would have different R, G and B values.

There's a related but separate question: if Y is a luma (in Y'CbCr
terms), it will not be linear, compared to the Y luminance (YCbCr). We
have a DEGAMMA_LUT to linearize data, but that's in the CRTC output
path, not in the plane path, and I don't see any API element to specify
the transfer function of data input to a CRTC.

> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
> (R, 0, 0), so we have both variants. Or do we need Y-formats at all?
> 
> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
> in the KMS color processing?
> 
> > > I forgot to consider that in the discussion of single-channel displays,
> > > because the displays obviously do not consider any other channel than
> > > the one.
> > > 
> > > Using DRM_FORMAT_Y8 FB with a single-channel display might even be
> > > surprising, because the proposed Y8 definition would result in c1 * Y,
> > > and not Y. The default c1 comes from the BT.601 matrix IIRC?
> > > 
> > > Therefore I think the difference between R8 and Y8 has been found. Now
> > > we just need to determine whether R8 means (R, 0, 0) or (R, R, R) to
> > > nail down the color operations as well. There are questions like what
> > > is the outcome at the video signal level when we have one KMS plane
> > > with an R8 FB and another KMS plane with an RGBA8888 FB on the same
> > > CRTC? What about Y8 or NV12 in the mix? What if the video signal is
> > > single-channel, RGB, or YCbCr?  

-- 
Regards,

Laurent Pinchart

