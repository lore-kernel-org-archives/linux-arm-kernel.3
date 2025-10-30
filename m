Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402B7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CEDXVoec8wgc5r2G05gXNhADvg0k7pAjCJbkzmWMlA=; b=LEZbTbYFDz98gZ7/AaZ8+nU1eu
	BqknH4kKNuDttFQgaBOyAysQz3W9jM7n4M/9Uqat+Uux7VKnoTq5mNNorRRfeAFtVTsLYwxLSGk1c
	8IJmCVynJoXWqN3SBW407QFSK7EZLy99Dw9/ySVJ+K2CkTktUBueeWnIhFwGVGJXsoEf6tUUobi2l
	jopPW4SqdGgmGFZvN587mZsNIJRyWkVttc96kq0X3y2t8WIF+qlkXJB4IvJpk7m9fshybdhN6zT2W
	+nulJ9phB75g+hN+/kSpP1ETk03ViNJhU1FRM3NldN0SoGviriSy6+WkPcf7s4J9LJwJ4+53BMAo1
	1HmI9OMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUeq-00000004OPD-2h0z;
	Thu, 30 Oct 2025 15:33:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUeo-00000004OOY-1h2G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3CEDXVoec8wgc5r2G05gXNhADvg0k7pAjCJbkzmWMlA=; b=ovu6xwBmi6bbWyq6A8FW+QrVkd
	Eb+1PnSyeh713Skmfl6rcJR1qspA/xanxl31WsekKebS1S8V8v16pYytvmELyn6IXIma8cARUviHU
	xAa1j73OqMptSya4dNwgvfgzLPS26sqAJCQhWpNzQq3AbdWudOvwwZinVKTylZkWaB7M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vEUei-00CWVh-V7; Thu, 30 Oct 2025 16:33:40 +0100
Date: Thu, 30 Oct 2025 16:33:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10,
 pcie_x11 & pcie_x4
Message-ID: <05d450d8-8df9-490f-ac53-3f45544f1c29@lunn.ch>
References: <20251030-cn913x-pci-clk-v1-0-e034d5903df1@solid-run.com>
 <20251030-cn913x-pci-clk-v1-2-e034d5903df1@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-cn913x-pci-clk-v1-2-e034d5903df1@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_083346_458129_4F268885 
X-CRM114-Status: GOOD (  15.32  )
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

On Thu, Oct 30, 2025 at 04:16:26PM +0100, Josua Mayer wrote:
> CP110 based platforms rely on the bootloader for pci port
> initialization.
> TF-A actively prevents non-uboot re-configuration of pci lanes, and many
> boards do not have software control over the pci card reset.
> 
> If a pci port had link at boot-time and the clock is stopped at a later
> point, the link fails and can not be recovered.
> 
> PCI controller driver probe - and by extension ownership of a driver for
> the pci clocks - may be delayed especially on large modular kernels,
> causing the clock core to start disabling unused clocks.
> 
> Add the CLK_IGNORE_UNUSED flag to the three pci port's clocks to ensure
> they are not stopped before the pci controller driver has taken
> ownership and tested for an existing link.
> 
> This fixes failed pci link detection when controller driver probes late,
> e.g. with arm64 defconfig and CONFIG_PHY_MVEBU_CP110_COMPHY=m.

Seems like a reasonable compromise, given that TF-A could be classed
as broken. This must also prevent suspend/resume powering off PCI
devices, and then reconnecting them on resume.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

