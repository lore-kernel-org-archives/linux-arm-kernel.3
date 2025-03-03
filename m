Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8950C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXyS5AXNXbOnK/iAlZuPXPz+PkKKSv6DgRqzHwvMoeo=; b=nAx+2lErXxZC7cBIeQJJ1kSL1y
	drM5l1/vYPoqilxFxOqcfnKYy7bkgNBd4uTEjSzeXPHaHjGcJGnUD6DwJbUTL+Uvr1mG+SK3nwQs8
	EY1a3zIe+epRP0ubqHY/3to55PPgrScmx+zcKEHfdv10YSi6NtHGmir3iDcWU0PmwsGhiAieGFNf9
	MSkTNCqZ6NBXDCgNs6hrJD2FianZOfgNmUY1Hfflt8UTmOkB0ZtU3j4yhLnjS2ggnO9oGVytNqPBs
	LHX27PSdcQ1LlfP2ti/cWGSnJTBSRhuyB5IXqDrc0oGsBQVvbkRzrRdh+Ga+m9hs3W/zFPyWdakz8
	Jyn7oODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7NB-00000001DqF-2RNc;
	Mon, 03 Mar 2025 15:06:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7La-00000001DTO-2CPr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:04:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2133175A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 07:04:59 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7ED733F5A1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 07:04:45 -0800 (PST)
Date: Mon, 3 Mar 2025 15:04:42 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
 <2153305.bB369e8A3T@steina-w>
 <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_070446_657049_7511499F 
X-CRM114-Status: GOOD (  22.42  )
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

On Fri, Feb 28, 2025 at 06:43:53PM +0100, Marek Vasut wrote:
> On 2/28/25 11:36 AM, Alexander Stein wrote:
> > Hi Marek,
> 
> Hi,
> 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > index 3af13173de4bd..36bad211e5558 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -249,6 +249,37 @@ dummy: clock-dummy {
> > >   		clock-output-names = "dummy";
> > >   	};
> > > +	gpu_fixed_reg: fixed-gpu-reg {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-min-microvolt = <920000>;
> > > +		regulator-max-microvolt = <920000>;
> > > +		regulator-name = "vdd_gpu";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +	};
> > 
> > Is this an internal voltage?
> 
> I think so.
> 
> > > +
> > > +	gpu_opp_table: opp_table {
> > 
> > Node-Names use dash instead of underscore.
> 
> Fixed, thanks.
> 
> [...]
> 
> > > @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
> > >   			};
> > >   		};
> > > +		gpu_blk_ctrl: reset-controller@4d810000 {
> > > +			compatible = "fsl,imx95-gpu-blk-ctrl";
> > > +			reg = <0x0 0x4d810000 0x0 0xc>;
> > 
> > Mh, GPU_BLK_CTRL is /just a bit) more than the GPU reset. Does it make sense
> > to make this an gpu-reset-only node, located at 0x4d810008?
> 
> The block controller itself is larger, it spans 3 or 4 registers, so this
> should describe the entire block controller here.
> 
> > > +			#reset-cells = <1>;
> > > +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> > > +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> > > +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> > > +			assigned-clock-rates = <133333333>;
> > > +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		gpu: gpu@4d900000 {
> > > +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
> > > +			reg = <0 0x4d900000 0 0x480000>;
> > > +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> > 
> > There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?
> 
> I think I have to describe those clock here too, possibly as 'coregroup'
> clock ?

The 'coregroup' clock does indeed control the MMU and L2$ blocks as well as the AXI interface,
so if that is indeed a separate external clock source it should be defined. Could it be why
you're seeing issues with L2$ resume on the fast reset path?

Best regards,
Liviu

> 
> > > +			clock-names = "core";
> > > +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "gpu", "job", "mmu";
> > 
> > DT bindings say this order: job, mmu, gpu
> Yes, currently it is sorted by IRQ number, fixed.

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

