Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9032BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HXub2A/v9RqkMGdUZjtbYvqdoMeY8h65+2Qb929duA=; b=ioo9Z+DzQtwfgcW/p3RoW5Fo29
	BDhsGN8KqT6ZvNYnAzGjCR8hr3JFFiiH8IO75Mz3YrxVXfyzMD1cODWi1uiFR+63+beC+0xBgtq4U
	8YyEZDblkiNEMifH6FR+kybTBikTIES7MlnrRQG2vjMY1/8Clv/tZxyTNjZB15yrSmdvjMqHJXZgL
	z/Tt/SAzq+BHRk7NyUtiZiNal30GkSKUpUZku067ksMdrO3h5y28fwNvE0DRYx7nTcZXFi9u7li5A
	fUt0yvcix/mkrlw59h/0Wo0UK2J0G8HyXa9CA1LpMjLCDqYuqF0pZ7WdwGew7NA0MH/fC5e2IvCQ9
	rbxqK/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFY8-0000000GXOk-2NBL;
	Thu, 16 Jul 2026 06:26:24 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFY5-0000000GXO2-2yzo;
	Thu, 16 Jul 2026 06:26:23 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 2FFDD22924;
	Thu, 16 Jul 2026 08:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784183175;
	bh=9HXub2A/v9RqkMGdUZjtbYvqdoMeY8h65+2Qb929duA=; h=From:To:Subject;
	b=bZOBe5XorgczVLTaof+93M63kt1XlmU6uiFSMKAQUgg621TOnz+SJG/NQw5T45d33
	 GI6nEOo8+pDX386o30SG2efdoiTBf4lm7hBti/iYxN76A10we1SmKNKX4YjT4xsH0y
	 cl/41EFgXjuXG9MG5P0vziDFjuuK+HQzYKQuc3k6x9Njd5jiNNpgsFh5af2cgjslGP
	 /q7G6Go4nQAWhdzcrTmdEnAz3KJrVIqJFGyf48JfeXI+4VfCFcYzv5OXWQHc9M3mj1
	 8G8gMzSIMaYQoya/zjQjnvlXpav11aQO6GfZd4oVJkC1PPOqb1xyVnIwYpnAlg5s6N
	 zyZN/MwGRLyWQ==
Date: Thu, 16 Jul 2026 08:26:12 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de,
	vkoul@kernel.org, kishon@kernel.org, Frank.Li@nxp.com,
	lumag@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <20260716062612.GC9973@francesco-nb>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
 <20260714193627.GA9616@francesco-nb>
 <alh4a66fEro05ShA@raspi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alh4a66fEro05ShA@raspi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_232621_912671_5107E540 
X-CRM114-Status: GOOD (  23.86  )
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

On Thu, Jul 16, 2026 at 02:21:31PM +0800, Liu Ying wrote:
> On Tue, Jul 14, 2026 at 09:36:27PM +0200, Francesco Dolcini wrote:
> > On Mon, Apr 14, 2025 at 11:50:09AM +0800, Liu Ying wrote:
> > > Hi,
> > > 
> > > This patch series aims to add Freescale i.MX8qxp Display Controller support.
> > > 
> > > The controller is comprised of three main components that include a blit
> > > engine for 2D graphics accelerations, display controller for display output
> > > processing, as well as a command sequencer.
> > 
> > ...
> > 
> > > 
> > > To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
> > > instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
> > > diagram and represents the whole display subsystem which includes the display
> > > controller and prefech engines, etc.
> > > 
> > > With an additional patch[1] for simple-pm-bus.c, this series facilitates
> > > testing a LVDS panel on i.MX8qxp MEK.
> > > 
> > > Please do NOT merge patch 14-19.  They are only used to facilitate testing
> > > the LVDS panel.
> > 
> > What's the plan to conclude this work? What's the latest status?
> > I am looking forward to have a way to use the i.MX8QXP display with
> > mainline, but to my understanding some required changes on the SOC dtsi
> > are not merged.
> > 
> > Can you help?
> 
> I planned to add display controller DT node after prefetch engine support [1]
> is picked up so that the prefetch engine could be enabled together with the
> display controller.  Just want to avoid a DT that only enables the display
> controller or bypasses the prefetch engine.  It makes the display controller
> driver simpler.
> 
> [1] https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com/

That series is from October 2025, is there anything blocking to move it
forward?

Francesco


