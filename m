Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F736CCF2D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlDdIqlTMeMi8VpPk/jEYeBKb0RuEGvOD8PcqKkHaPY=; b=E+E4/dlpNDwFJNx5KUOl1pmW0C
	yvdmgb7DE1f2KI2kdSeKbiVnj7IoX+CRESjTx+Hp/HwgcghmcOyddcMCxKmtw3uX95Qco7I/KzoB2
	qciZrKlJlBflktpQeR48bW0h85oda22jOJJN/EYjzC/WeNu6YkX6vm4Gh6x5Lv6hpuDhq48gndXOf
	fW1VTUCmFRMa6jextAXUccyERICcjmDz6BYMRjXuU53c6G/SbbL23wZH02YGBsdRay7vkd4mfm/Ac
	1WxVbLSaA43dc9yRhiLZ9XtW8zBVkBiEp+2+U/8kYi60hVDkPD/bafRmud/khOpkTEZK7M5KssV1n
	NuYXf3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm08-00000001gXZ-2owD;
	Mon, 19 Jan 2026 09:56:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm01-00000001gVU-308N;
	Mon, 19 Jan 2026 09:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HlDdIqlTMeMi8VpPk/jEYeBKb0RuEGvOD8PcqKkHaPY=; b=WLDPZ6WpnLJuK9i5CSgXx/U4Ca
	w1tTjS8GgDwkdkPUOJQPUA16npwq3rkMwWJMT1IbtzojfGjCV1Y5ZcAXkzOTOAvgDikJfR4Maj0/J
	vuDbta08tWodVELfMwRSyjy7VQ0+F2htp1JUU6vf53J3o+hRtx0MksmS4JAiBW15NsFpzRIx8lUZ7
	Onkca869RSiNyANKv0JP1AxN3QwLBrnGy+l99zpS0Xym2p56+y4khyejEupiVIJ+2GLmxJ+BitXRi
	dwXDks+AqeVjp1svBZSKRsTM+t0gV2STBEOfoXms18AUmzUXa1Ed4k16eKgIcqfP16NoXUd4ib6+u
	3ctK/xzQ==;
Received: from mgamail.intel.com ([192.198.163.8])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlzy-0000000Bmf0-33zp;
	Mon, 19 Jan 2026 09:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768816599; x=1800352599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FgBYa0U3JLtsWj50KdlzMNY1o0Jj1BIn7SsCMNQadsk=;
  b=UuaKCPeAgxVJ9T1CA8hQovz61mvHGcAFlsG2XoZN5NNUUDcCFSrralQV
   hWSqnuY+m6KPKGP0BxmnW+hq/Mp4F04oaUjEl0dpmbgq1r70HuY+iHSU+
   L3otdPUWJad3JwUYcusKzvqLo2JRRTyob4/uBc8O/EbwmufBbMLsblsmG
   ahqO2kHbae2A7eBrFMvS6zcyxZNZAFRn8hyhrYENHinIcnCce+zCqnGdc
   agMZ03vyqcoSTTLX6qvrq9P+fNtNOPIPgkm7h/0IKeux1WXzs+fPGRmu7
   Scyd+tDxE9O9BD/QL2GSmeOLQP+9f6jg2Gxb4P/ObrHtultssZ7+SaFxy
   w==;
X-CSE-ConnectionGUID: rcIeeSnLT5yCcmAZIsSYKQ==
X-CSE-MsgGUID: BSoTvC2fRB6Shqd0MaKXEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87604295"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="87604295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:56:25 -0800
X-CSE-ConnectionGUID: /f0Xv8jgSkqq8tYz6QKBIA==
X-CSE-MsgGUID: GrWDzjQXSIOcEheq7QVB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210842283"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:56:20 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0B53D120280;
	Mon, 19 Jan 2026 11:56:22 +0200 (EET)
Date: Mon, 19 Jan 2026 11:56:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Frank Li <Frank.li@nxp.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
Message-ID: <aW3_xSm2N42XTtzu@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
 <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
 <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_095639_138918_7C10FB1E 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Michael,

On Mon, Jan 19, 2026 at 10:49:20AM +0100, Michael Riesch wrote:
> Hi Frank,
> 
> Thanks for your review.
> 
> On 1/16/26 17:08, Frank Li wrote:
> > On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
> >> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> >> one input port and one output port. It receives the data with the
> >> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> >> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
> >>
> >> Add a V4L2 subdevice driver for this unit.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> > ...
> >> +
> >> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
> >> +{
> >> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
> >> +}
> >> +
> >> +static inline __maybe_unused void
> > 
> > why need '__maybe_unused', needn't inline. compiler can auto decide and
> > report unused function if no 'inline'.
> 
> The __maybe_unused was helpful during development and is not really
> required now. It doesn't hurt either, so I left it in. I can remove it
> if you wish.

Please. :-)

> >> +static int dw_mipi_csi2_register_notifier(struct dw_mipi_csi2_device *csi2)
> >> +{
> >> +	struct v4l2_async_connection *asd;
> >> +	struct v4l2_async_notifier *ntf = &csi2->notifier;
> >> +	struct v4l2_fwnode_endpoint vep;
> >> +	struct v4l2_subdev *sd = &csi2->sd;
> >> +	struct device *dev = csi2->dev;
> >> +	struct fwnode_handle *ep;
> >> +	int ret;
> >> +
> >> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > 
> > use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
> > handler.
> 
> Sorry, I don't see the benefit of that.

I'd prefer this, too, when you unconditionally need to release or put
something. It'll make error handling simpler, too.

-- 
Kind regards,

Sakari Ailus

