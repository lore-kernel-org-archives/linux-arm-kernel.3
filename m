Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D7CCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQCxumn3XpiebVDH8mWC56o1kMdP1z38mjE4HUn/wVk=; b=EQ2fknsHfc0ziJbwJUyLG3wxXd
	+/JuPna2s8yYoklYgf1pSrY0hTeLLRHIP7mjpKO+iVGehEuzbbHk6UdN/zIET5+R2IOOCgagCqdBQ
	ZTSXo/rGKOC20K7sxS+lqBXT8qLmLJLI0Xz1MLH1OKWCkZ+GUHSHMpuPH/CWlBDqZWKD8Gjms9msr
	g1rG7x7VXb4y+D7d70IIr9hdDtUAydB/sgqQzD/7dBqfwguo9lrokaUJQrOQBdrfGgFsnlYhqgnO+
	SAXEVRVUOevAM+xrGe9ReyjcoRMb7WVIYnpC+vQkGiF2hE3IoaWp71B/OyjKV34UqrSkZyLwTNXXo
	RR3Y9GwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcWh-0000000Cwn4-2Rz4;
	Tue, 13 Oct 2026 13:26:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcWd-0000000CwmL-2Ndd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:26:42 +0000
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14B34230;
	Tue, 13 Oct 2026 15:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791897875;
	bh=D8X9/HU1ytSHn2aUiGxbzXM2r3PCSS7f5TTvhXGJReE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOJAdN4oo3bZ4UV4ry2O66vUFwnVItB9gsiljzn8x4WEU+bobir9DPk/muyzzsC0d
	 JhoZphnyEt1WwdKyFGzvWU8TvGPzGguBDj/HuVLpgGp+qLU/iGV4pu0kHWTzwjhTqC
	 oQmLZ9T9Bh6tTlESdiElCOynkkb82ehyl66fRGYs=
Date: Tue, 13 Oct 2026 15:26:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Message-ID: <20261013132625.GA159927@killaraus.ideasonboard.com>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_062639_749055_88D52674 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Michal,

On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
> On 9/16/26 22:44, Marek Vasut wrote:
> > Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
> > The board is populated with four ethernet ports, QSPI NOR,
> > eMMC, UART and USB host interfaces.
> > 
> > Signed-off-by: Marek Vasut <marex@nabladev.com>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Michal Simek <michal.simek@amd.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
> >        undocumented, but the TI DP83822I is generic C45 PHY that
> >        is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > ---
> > V2: - Rename lm75 node to sensor@
> >      - Use GPIO_ACTIVE_LOW macro
> > V3: - Drop bogus clk_ignore_unused bootargs
> >      - Drop gpio line names
> > ---
> >   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
> >   .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
> >   2 files changed, 301 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> 
> I am not able to review or take this board support further without publicly 
> available hardware documentation for the platform (board-level and relevant 
> interface details). Please share public documentation links once available, and 
> I’ll be happy to revisit the patches.

There are plenty of boards that have no public documentation. Pretty
much all phones and laptops are like that. We even have a whole
architecture that only runs on a few machines in a single person's
basement [*] :-) The kernel has never required public schematics for
boards, SoCs or IP cores.

[*] A slight exageration possibly, but that's how I heard arch/alpha/
    being described at the maintainers summit.

-- 
Regards,

Laurent Pinchart

