Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65ECC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouG4gU2sMxcP7NnkE/ZCp7siG/EcEqz4Sk7+xu/lKZg=; b=rw1zIghfH6GCk1v/exuqFdKz/x
	g/12KEbQ3QcKuBP2FP/XxDdMEbII91Id0rck+2HqFUixCfWYqMopOLNNSXHWO3yo6yG5rraQd61Yd
	Ippx0LBdHN+9pwvK4Z/Bh25x1fV3N/AatfwRoBz/rhhPIHUUoGI27vOQb1XzyAMy8x5XPZBg2Y8MU
	K7bHwGVZH0/l62k8kpiE1VUP59JKMtGdU/OqeFWSWPMpeCqovP/ZRyKmFTeTygpclWyxYkUJn3u2c
	ESj3OOzs0KdrfidP9ZR274hnJtk0p6GzkzAxok8ygXhVGXv8NDB/rt2sri5CV6q0+W4P7V26ZTZya
	ma/4sRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjivp-0000000D7re-1D72;
	Tue, 14 Jul 2026 19:36:41 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjivk-0000000D7qG-34nA;
	Tue, 14 Jul 2026 19:36:39 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id D7B871F8C1;
	Tue, 14 Jul 2026 21:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784057792;
	bh=ouG4gU2sMxcP7NnkE/ZCp7siG/EcEqz4Sk7+xu/lKZg=; h=From:To:Subject;
	b=KLkmofSRNvGp46eG5l7vx8V8L3VWhoxxkU0Qzios6IVZWT3JpLVXNXwOivqOqVmPd
	 sKtwfZ5GN719FY3GWAyiu7jqsgou3YE6aQYbNGOifKGrtsbBN3aXT4aq+XC/EPSmiX
	 cDUQTAuRXJJSjuOz6wiqeNQlRcbNzl4dWC68kqDFfJDPZGOIrR+2hnGuLWYv8JDp4S
	 rPiH7+i3nNht+tpnPz5rNIAUofST5jjdtDCwWaoBcj6JEzzNvp/w/FMMnBqLKeRFIi
	 KKT7/5yyufWUTZiT/+binA7KtPbKrRxfeKw5RqnO8tx9eJYfYmqQlvIzT05Sv+GpOL
	 bVakEGMeY31zw==
Date: Tue, 14 Jul 2026 21:36:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de,
	vkoul@kernel.org, kishon@kernel.org, Frank.Li@nxp.com,
	lumag@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com, francesco@dolcini.it,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <20260714193627.GA9616@francesco-nb>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_123637_664115_3BC6F22B 
X-CRM114-Status: GOOD (  13.98  )
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

Hello Liu,

On Mon, Apr 14, 2025 at 11:50:09AM +0800, Liu Ying wrote:
> Hi,
> 
> This patch series aims to add Freescale i.MX8qxp Display Controller support.
> 
> The controller is comprised of three main components that include a blit
> engine for 2D graphics accelerations, display controller for display output
> processing, as well as a command sequencer.

...

> 
> To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
> instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
> diagram and represents the whole display subsystem which includes the display
> controller and prefech engines, etc.
> 
> With an additional patch[1] for simple-pm-bus.c, this series facilitates
> testing a LVDS panel on i.MX8qxp MEK.
> 
> Please do NOT merge patch 14-19.  They are only used to facilitate testing
> the LVDS panel.

What's the plan to conclude this work? What's the latest status?
I am looking forward to have a way to use the i.MX8QXP display with
mainline, but to my understanding some required changes on the SOC dtsi
are not merged.

Can you help?

Thanks,
Francesco


