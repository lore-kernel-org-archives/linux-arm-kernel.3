Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5A1FEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8PKMz7yzndT/Ljfu+rFS7/VADawvZvgr1qmpc1Bfck=; b=dfQnwnU5DGmiy3a0+xmFJ8gigb
	s7lOZdThWSZsR3w72smy/XEpvpnc5uwa9touZllZRaMkRVHW6yoM6dPM2akwaCwqmznZPYm4ZlI6X
	4hBo9+O85mGuIqtAPQRyPLMMee8o78C/C6cfrdmrbw61ybc6nXsGp6wrP0cMiGRaPLYVvJvtKUSMP
	HhflOXw4U+WuzAQJi8K5YNlJAcDYF//uQIinCyLsmDQWGhG0AsNK3Fk3zATR9Ui79RNV8CxKcO7j8
	apx9PW7UzL07+IUlNhNcw1lTh5OwhwDqybtVG06K8XQnP7tVYu0uiGC/FrSHKrVZeyJbXsUFYERkx
	t/y5jpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M1Q-00000003D5i-02Li;
	Wed, 25 Mar 2026 11:03:36 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M1M-00000003D44-2oJD;
	Wed, 25 Mar 2026 11:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436612; x=1805972612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bterWpEmBgkkyTS7H4efC0u7uGIIi8w4Tnviz/GzV6Q=;
  b=dNo+QxtPrcGxAhSmeeo8ZWKdADYH7CSRe+26tKWoIgHa9LXkznwMpJQ6
   MCvdjHzEBRIJUYlKCJjaPacQtba5L+j2SG/HiEciq3bcDSZHxjSiSnABr
   0Ge9NOrU0+9Gq8nUbqgkXwiCusuA3/EzDFx6miw0pkLKpA2g89uvCWnm3
   635KJAFihzMzw0HoGo5DRpif1pogz78Xo3aPU2nJ/frnb68J1FZuSUffz
   xj56pdq9s2YPHLexTVzTHZlcSgi/jGtNDSMTappHPm6/5hn2RtzFbBJ8t
   ghvCFi00SZ8qld79aKOqD5sTfBIk8iTWQuBcmn5QsF5wMllZ0Hb4jQg+1
   A==;
X-CSE-ConnectionGUID: 2fcWGBmzQOmXdgvdOyjfIw==
X-CSE-MsgGUID: HdA65GZtTkeWqcixl5apDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79376290"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79376290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:03:20 -0700
X-CSE-ConnectionGUID: Ar6fcB3pSfyKZhdtJmvIeQ==
X-CSE-MsgGUID: SV+2zclvQrGIZTCj+qSR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="262569794"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:03:11 -0700
Date: Wed, 25 Mar 2026 13:03:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	Andri Yngvason <andri@yngvason.is>,
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <acPA60Ci3n_t__xF@intel.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <acLDPYuaVI2-12JX@intel.com>
 <23910073.EfDdHjke4D@workhorse>
 <acLrv5hLyNss-Px5@intel.com>
 <20260325-neat-elegant-raven-ebc9ab@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325-neat-elegant-raven-ebc9ab@houat>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040333_106054_51B71F7D 
X-CRM114-Status: GOOD (  37.35  )
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

On Wed, Mar 25, 2026 at 09:24:27AM +0100, Maxime Ripard wrote:
> On Tue, Mar 24, 2026 at 09:53:35PM +0200, Ville Syrjälä wrote:
> > On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrote:
> > > On Tuesday, 24 March 2026 18:00:45 Central European Standard Time Ville Syrjälä wrote:
> > > > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrote:
> > > > > +enum drm_connector_color_format {
> > > > > +	/**
> > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> > > > > +	 * helpers should pick a suitable color format. All implementations of a
> > > > > +	 * specific display protocol must behave the same way with "AUTO", but
> > > > > +	 * different display protocols do not necessarily have the same "AUTO"
> > > > > +	 * semantics.
> > > > > +	 *
> > > > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> > > > > +	 * bandwidth required for full-scale RGB is not available, or the mode
> > > > > +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> > > > > +	 * YCbCr 4:2:0.
> > > > > +	 *
> > > > > +	 * For display protocols other than HDMI, the recursive bridge chain
> > > > > +	 * format selection picks the first chain of bridge formats that works,
> > > > > +	 * as has already been the case before the introduction of the "color
> > > > > +	 * format" property. Non-HDMI bridges should therefore either sort their
> > > > > +	 * bus output formats by preference, or agree on a unified auto format
> > > > > +	 * selection logic that's implemented in a common state helper (like
> > > > > +	 * how HDMI does it).
> > > > > +	 */
> > > > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> > > > > +
> > > > > +	/**
> > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > > > +	 */
> > > > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > > > +
> > > > > +	/**
> > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> > > > > +	 * not subsampled)
> > > > > +	 */
> > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > > > +
> > > > > +	/**
> > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> > > > > +	 * with horizontal subsampling)
> > > > > +	 */
> > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > > > +
> > > > > +	/**
> > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> > > > > +	 * with horizontal and vertical subsampling)
> > > > > +	 */
> > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > > > 
> > > > Seems like this should document what the quantization range
> > > > should be for each format.
> > > > 
> > > 
> > > I don't think so? If you want per-component bit depth values,
> > > DRM_FORMAT_* defines would be the appropriate values to use. This
> > > enum is more abstract than that, and is there to communicate
> > > YUV vs. RGB and chroma subsampling, with bit depth being handled
> > > by other properties.
> > > 
> > > If you mean the factor used for subsampling, then that'd only be
> > > relevant if YCBCR410 was supported where one chroma plane isn't
> > > halved but quartered in resolution. I suspect 4:1:0 will never
> > > be added; no digital display protocol standard supports it to my
> > > knowledge, and hopefully none ever will.
> > 
> > No, I mean the quantization range (16-235 vs. 0-255 etc).
> > 
> > The i915 behaviour is that YCbCr is always limited range,
> > RGB can either be full or limited range depending on the 
> > "Broadcast RGB" property and other related factors.
> 
> So far the HDMI state has both the format and quantization range as
> different fields. I'm not sure we need to document the range in the
> format field, maybe only mention it's not part of the format but has a
> field of its own?

I think we only have it for RGB (on some drivers only?). For YCbCr
I think the assumption is limited range everywhere.

But I'm not really concerned about documenting struct members.
What I'm talking about is the *uapi* docs. Surely userspace
will want to know what the new property actually does so the
uapi needs to be documented properly. And down the line some
new driver might also implement the wrong behaviour if there
is no clear specification.

So I'm thinking (or perhaps hoping) the rule might be something like:
- YCbCr limited range 
- RGB full range if "Broadcast RGB" property is not present
- RGB full or limited range based on the "Broadcast RGB" property
  if it's present

I think the "Broadcast RGB" property itself might also be lacking
proper uapi docs, so that may need to be remedied as well.

-- 
Ville Syrjälä
Intel

