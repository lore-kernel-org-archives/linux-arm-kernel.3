Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1095ECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAauRomgDQ+omvLoLFBwPtz7dNNACFDbcFmMKHYNCI0=; b=lrU7Op5nETgr2zbHTyIaFatvFe
	FJHUdtbVWxhPzqURezp4j5ccGtt6S+hG+Dk5jQKCbJ346SOecQNH6t7pfQpWIwJm3pGJ/V3A+F6lg
	yWpO53izt5yeA1Kp+gyK8Ru4XWi4bRgbokTW61R8ik+W8RGPjcG3g6uM8727OwQYTP+mqwlJbEFVE
	cU10pygmKm5RP3jLuPShortGo7d+FvfkuLzYRV5eF97EiYr5GVIcLt0UTAwDLkQKa7ZGIgT6+k2qJ
	qUZgDXOpSqsEBOPw/muewd/K27aChEBF3qBOlnBpbA18uXerC2Tp5Ws7UAz8FxLY5qupgQ/i+QqbE
	R7nv2AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGI9O-0000000BzIs-43gT;
	Tue, 04 Nov 2025 14:36:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGI9M-0000000BzIP-0laB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:36:45 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CBD982B3;
	Tue,  4 Nov 2025 15:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762266886;
	bh=YbNQZmQDRHZuJEslGSplhQKbIwrxt/EXEnw5WMnSajg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bc4uA7j1fURx+NgskT53wh2ZAmze2XORP0DL6w/60BjHQTInlUYGg+aBc/Juord0Y
	 Am4zn3UAhJ1g/+uVpaWceLyhuEVDMrnUmnrqKjIFHBbZI+9V0bYfDVrv5vTAQjYFRC
	 wDY2AstzUCvKWZAjsxgHeHJDFezq5rd6QkSm1guA=
Date: Tue, 4 Nov 2025 16:36:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johan Hovold <johan@kernel.org>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx8-isi: Drop unused module alias
Message-ID: <20251104143636.GD27255@pendragon.ideasonboard.com>
References: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
 <aQnRsVPq1ndQrLr_@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQnRsVPq1ndQrLr_@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_063644_390324_3E921ED4 
X-CRM114-Status: GOOD (  20.86  )
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

On Tue, Nov 04, 2025 at 11:13:05AM +0100, Johan Hovold wrote:
> On Mon, Nov 03, 2025 at 01:44:38AM +0200, Laurent Pinchart wrote:
> > The driver has never supported anything but OF probing so drop the
> > unused platform module alias.
> 
> The commit message needs some more work since this isn't a platform
> module alias (i.e. has a "platform:" prefix),

Oops indeed.

> and judging from a quick
> look it seems like the driver did support platform probing before commit
> 605b57c4e888 ("media: nxp: imx8-isi: Drop partial support for i.MX8QM
> and i.MX8QXP"), at least in theory.

That has never been used upstream. It was code from the BSP that should
never have been imported in the first place, I missed removing it when I
rewrote the driver for upstreaming.

> It's probably fine to remove the "ISI" alias, but it should not affect
> module autoloading.

How about the following commit message ?


media: imx8-isi: Drop unneeded module alias

The imx8-isi driver has a module alias named "ISI". This is not
required, as there is no reason to load this module through an alias:
the device is probed through OF, and the module has never been named
"ISI". Drop the alias.

> > Suggested-by: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Johan, I've got the idea from similar patches you submitted for other
> > NXP media drivers, hence the Suggested-by tag. Please let me know if I
> > can keep it.
> 
> Sure, please do.
> 
> > -MODULE_ALIAS("ISI");

-- 
Regards,

Laurent Pinchart

