Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0CBD6E2AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6SJYnp842vCkHQu4i1e9JURGgkIZOc40Ucg7D58Umw=; b=uOXqMq/tTUNN2OrFYBRXxILTlX
	SvciC2/1LJGedmTIB5OcfcsGin9vLYk7oAt+LU+BE2P/Fk+L/E+UKfAE3strpVcgM5lRU360wtsF/
	0uePFb/yArdSXJhIevIw1h6PdYlLOvyQIz91n7MsFEPxjWnKsh82qrg/h9QHuw9IA7s1qcs+tFabT
	vv4f8i3HARHD1Ap+TeLCclMcJIAOXpBeeRbXZL+CThtOkB4vND1rx/UDWxpuzH7ayWPhnqj2E0I/7
	xcxyq8EaLfvU8sEa7l0MFJRo6Gbshguxvb4CZy9vmvbBAU8merUETdNceJFi5aKruDDz5pA0Krh+l
	6bl3FjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGFW-00000008jJe-49OX;
	Thu, 18 Dec 2025 15:49:06 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGFU-00000008jIc-2hd9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=p6SJYnp842vCkHQu4i1e9JURGgkIZOc40Ucg7D58Umw=; b=mboMVR0clmVwmOkik7DJ/d1LVk
	GKJTXr137XbyxnXLQy/exMN+xbuxmyL0eErPsCBvcU1/yNaZm8yuJXMN2TnBUjXU692kIrag3X5HN
	dOoxnwA2JdeDW3ZYbUD7ln7d0b764ixHN+w11j8NrtY+sfOEZsVS8DOgcLuu6iyF81By+Nwk3oSMW
	jXOHvbHZHtu66FqVsDPCKCQbQ4g5dEI0K+1rASggpmwLd4u+qWD7BYWQrPsYiS52kUkv1TFv6FgAC
	QRhkKNcK1sUAAb7oO7PoXDCDU+KJiCVRGvIHO3foOFZmvUQZ/aIS2nTvPbmJ29hqkVyquVhreRqSI
	xlLsk5mw==;
Date: Thu, 18 Dec 2025 16:46:20 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Bajjuri Praneeth" <praneeth@ti.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
Message-ID: <20251218164620.40c0599d@kemnade.info>
In-Reply-To: <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
	<DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_074904_686451_54560AF6 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On Wed, 17 Dec 2025 15:20:09 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

[...]
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>  
> 
> Code looks good. Based on your testing, which covered both boards currently
> setting simulate_vesa_sync and boards not setting it:
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Still it would be good to have this series, and especially this patch,
> tested by someone having access to other TI boards.
> 
Just that I do not mix up anything:

grep tilcdc only gives:

am335x-base0033.dts:		compatible = "ti,tilcdc,slave";
am335x-guardian.dts:		compatible = "ti,tilcdc,panel";
am335x-pdu001.dts:		compatible = "ti,tilcdc,panel";
am335x-pepper.dts:		compatible = "ti,tilcdc,panel";
am335x-sbc-t335.dts:		compatible = "ti,tilcdc,panel";
am335x-sl50.dts:		compatible = "ti,tilcdc,panel";
am33xx-l4.dtsi:				compatible = "ti,am33xx-tilcdc";

so only am33xx affected? And no omap3/4/5. So apparently nothing
I can test.
@Roger: I suspect you have more of these boards than me.

Regards,
Andreas

