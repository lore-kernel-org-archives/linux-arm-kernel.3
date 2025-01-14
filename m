Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2384E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK4b5hmfFQg90bKf5c35DlRbGDFITMqw3G3MDy4quhw=; b=Ld+dSPXDQrTCg/2QoKnPR8ivbQ
	UwC9eQkPVgmTu2aW46ldkmOBYprGFIvx52jLhhn/P8n+elcn9w8qYfJ2UnfUwdwCEyHVCIYQACmi1
	CZLoNvHu/W9dOsxZFMUFk9JDPOQpMpdz2KclhyvDVumrAYMRO3JMACGrqG5X9FAGyhykXvVwQdSOT
	ukbYFqWCrk5Ksv0TXSQgEJEEPxr9OtVTOLqQMXjtfaNf6JtzUo7LzTj+h5RrkD0slgUlWtbLVn7GY
	5deMD5JfKCNoAkOdF/3Z3TzNHClnZ/UuKzqKUM0ZM/LY2i+FA0a2n7ZgSN2I2oLtju9+r9q8W9Dil
	bgyAxUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkmD-00000009DDI-0XkL;
	Tue, 14 Jan 2025 17:32:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkku-00000009CwV-2tH0;
	Tue, 14 Jan 2025 17:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vK4b5hmfFQg90bKf5c35DlRbGDFITMqw3G3MDy4quhw=; b=L+Mn8MLeKAqlc3Yy3KOe4L8g73
	WZimn4WgzcyM0muig8nFU9U7oZoRkZXYu9gfUshX0xsVcSpeM4ltf2FunIveIcvBkcL4sE330nOwn
	hvOAQ/fa++zhoCC/Ba8nng+m8vgBLpcuD0b0h4jKnwM5+Xw7bOcS3Fenvvak5uFcZWKHHEnYicAPJ
	dxqxsWtuX9MGUxNhvXFC75M5LBKbQgyJnOhE9CTzWI29oezpyCTks6eVjB7SeyeMG9nOId+vK7d3f
	hodL28z6NCAwZsOcVs1TT+N+1yXW9B5ibz6l6Gx5a5Gcdn0Q39dgbEL8wy2ysiy1L/GxhvyXvGjT+
	X7liPiYA==;
Received: from i53875b2c.versanet.de ([83.135.91.44] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tXkkJ-0005Ki-N1; Tue, 14 Jan 2025 18:30:31 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Hofstaedtler <zeha@debian.org>, andy.yan@rock-chips.com,
 Guochun Huang <hero.huang@rock-chips.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Daniel Semkowicz <dse@thaumatec.com>, Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v4 1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
Date: Tue, 14 Jan 2025 18:30:30 +0100
Message-ID: <3556284.QJadu78ljV@diego>
In-Reply-To: <Z3IDh0TOAKqaovz2@per.namespace.at>
References: <20241209231021.2180582-1-heiko@sntech.de>
 <20241209231021.2180582-2-heiko@sntech.de>
 <Z3IDh0TOAKqaovz2@per.namespace.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_093108_756720_EBCC020F 
X-CRM114-Status: GOOD (  23.20  )
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

Hi Chris,

Am Montag, 30. Dezember 2024, 03:20:55 CET schrieb Chris Hofstaedtler:
> On Tue, Dec 10, 2024 at 12:10:19AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> > DSI2 host controller, based on the Rockchip version from the driver
> > rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
> > 
> > While the driver is heavily modelled after the previous IP, the register
> > set of this DSI2 controller is completely different and there are also
> > additional properties like the variable-width phy interface.
> > 
> > Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> > Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> [..]
> > +static void dw_mipi_dsi2_set_vid_mode(struct dw_mipi_dsi2 *dsi2)
> > +{
> > +	u32 val = 0, mode;
> > +	int ret;
> > +
> > +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> > +		val |= BLK_HFP_HS_EN;
> > +
> > +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> > +		val |= BLK_HBP_HS_EN;
> > +
> > +	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> > +		val |= BLK_HSA_HS_EN;
> 
> For all three of these: is setting an ENable bit the right thing to
> turn features *off*?

first of all, thanks a lot for noticing this discrepancy :-) .

Looking at the documentation, all 3 of those hw-bits are described as
  "Enables filling the H.. period with blanking packets. ..."

where the MIPI_DSI_VIDEO_MODE_NO_* flags are described as
  "disable hfront-porch/... area"


So yes, I _think_ "disable front-porch" would _should_ result in
"don't fill the period with blanking packets", but am not fully sure.

I've run the two boards I have with inverting the checks as sounds
sensible right now, aka doing:
	if (!(dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
etc and both displays I have ran just fine.

As the driver was originally part of a vendor-kernel based on 5.10, which
I think was before the _NO addition from [0] it could be caused by a
misread of the flags that were named differently back then.


So yes, switching things around does sound like the right thing to do.


Heiko

[0] https://lore.kernel.org/all/20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid/




