Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55001CF3185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLvksRjx7rch9aSiFvsLBK+s1Bnhbg+4rudTA2C3iHQ=; b=2TYDEszBaSBGiATapLpgjFQBQk
	al68e1DC5Gstwes2W4YHUForZWMsCD9P3zuDW8iDad3GqsNXKi7kCx429V6yEt26n4s0axDNNSlg8
	gxQiT3zHxzpjcH2NjEWELs5AXltYzmnHbTx78ZSADuziZs35jZUnzSeUemgOlhK97IGxZe2TA3tPe
	HzQZGDtB47ynpd3ukxlf+IB+a9VFl+X2RqHgD17bktALuNFXLdhFT9EvyvtoO6KEgBWDsC0+xlz2y
	GuwxfxiiosHkg9qh2NzWJVy6agf0ZZihmg1hEVpI2Ew5jBw1MaiP6tBRY4JSpn13mzVy1pH7AOVXU
	ozIED0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf6y-00000002w1F-1mo7;
	Wed, 19 Nov 2025 10:08:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf6v-00000002w0j-1voZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:08:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vLf6Y-0005Lv-2P; Wed, 19 Nov 2025 11:08:02 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vLf6W-001EIQ-1G;
	Wed, 19 Nov 2025 11:08:00 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vLf6W-00C2jC-0s;
	Wed, 19 Nov 2025 11:08:00 +0100
Date: Wed, 19 Nov 2025 11:08:00 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Martin Kepplinger <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [RFC 0/4] how to link a panel to a touchscreen controller driver
Message-ID: <20251119100800.hsaody7emvx4aq67@pengutronix.de>
References: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119065109.910251-1-martink@posteo.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_020825_501540_AD1347FA 
X-CRM114-Status: GOOD (  25.85  )
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

Hi Martin,

On 25-11-19, Martin Kepplinger wrote:
> hi,
> 
> When there's a panel/touchscreen combination that is sold as a combinded
> module (with the reset line shared even), how would I connect the 2
> drivers and make sure the touchscreen driver probes after the panel is ready?
> 
> I have the feeling there is https://docs.kernel.org/driver-api/device_link.html
> for such cases. Can you show me examples of 2 "random" drivers connected
> in this case?

are you aware of the "struct drm_panel_follower" API? This doesn't
ensure that the touchscreen driver is probed after the panel driver, but
it ensures that the touchscreen power-state follows the panel
power-state.

> In the past I also played with CONFIG_RESET_GPIO using the reset-controller
> logic, but I *think* this is more for 2+ of the *same* devices connected.

Unfortunately sharing the same reset line for different devices is not
uncommon. We saw this on NXP IW61x WiFi/BT chips as well. In that
particular case, the API was changed to the reset API which you linked
above, to gain refcount support. This works very well.

> Might there be yet a different way in devicetree I'm not aware of?

You an check for the 'panel' property within the
Documentation/devicetree/bindings/input/.

Regards,
  Marco

> 
> The below patches - for completeness - are only the workaround for what I'd
> like to do, exposing the state of the panel so that the touchscreen can query
> it.
> 
> thank you very much for any hints,
> 
>                                martin
> 
> 
> 
> Guido Günther (2):
>   hack: drm: panel: mantix: Allow to query enabled state
>   hack: Input: edt-ft5x06: hackery to probe after panel
> 
> Martin Kepplinger (2):
>   hack: edt-ft5x06 / panel-mantix-mlaf057we51: declare
>     mantix_panel_prepared() in drm_panel.h
>   hack: arm64: dts: imx8mq-librem5: add purism,panel-librem5-workaround
> 
>  .../boot/dts/freescale/imx8mq-librem5.dtsi    |  1 +
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 12 ++++++++++
>  drivers/input/touchscreen/edt-ft5x06.c        | 22 +++++++++++++++++++
>  include/drm/drm_panel.h                       |  2 ++
>  4 files changed, 37 insertions(+)
> 
> -- 
> 2.47.3
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

