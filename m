Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3ADC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6u166TzDVegbkqBlY7FitcnzT6N4R4b+x8wd8T0p00=; b=Yui22MyQSiRVjZlf0Rn4I95V2d
	49EWUxZbr30we3TSnDMmlpBVrmB7Hg6ljoQzZSFsqTpopwo1Z5RwRH8KrOvVMn+pEg9LPlqKbwPgV
	2+T2oXASoDdXmUTRtLiOAFKWI4r8SYSXj3QALrBRlfbhVP9R6uz88M0h32H3RcX0pzRRh6WQ4r3e6
	vxWzPPCcljMZ5RW6sPmcH8xNfpHV7OTyoZDtjM69ftFQqUnnhNmVsKFqgxAVesYp7lb81jBTVgINO
	3Qsed7wUj+H64BHgwWS6MxLc43J4AdE6W/YIL5Jd7vaE/86SAEfXdJSacYY8t1BU7BKh7G0EpX8ZO
	d8EsVw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm38-00000000JQK-1htT;
	Fri, 17 Jan 2025 13:06:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm1r-00000000JI5-23sI;
	Fri, 17 Jan 2025 13:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E8FC5C5DAE;
	Fri, 17 Jan 2025 13:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E16C4CEDD;
	Fri, 17 Jan 2025 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737119090;
	bh=pgczHYRbU/w/CTezmt/JjsV7Sd3SXBt7YeWw3V9QlJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKW1A+Nx8NJgaicqTbgcFmzmHcu1nrVCgcsQXKDasEIT7dIsrIbnv/EjBWlPkcBZv
	 KlmtCKxQRaGGPKfVQc30qbzhHR06bugGFhzBnaYPUZP1krPNo88ZAC9MkAyYJdiDhj
	 EmgcLQio2czz4XirycF5IK0YPaOHs2HBXkkAtl40PDXFu6iBqpO6O2p0yHA977WiTF
	 GUD5S0L+mohEfNLArkNntp34lJToZv83TrjmdV2/bzivtWHU+73iDLG9SasogHGs6a
	 drI67jUwoxFkplv+pHr+/atF5qGHBgN7+kXDIEL8rEB0BBV46OI3UckIirHJNpHTVE
	 ITDKd5uz7KxeA==
Date: Fri, 17 Jan 2025 14:04:45 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@edgeble.ai>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
Message-ID: <Z4pVbVQKnVkZdysM@ryzen>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
 <Z4o2_0yX-hq-DfCs@ryzen>
 <4985c21b-56b8-45b3-a96d-1427ca905c6c@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4985c21b-56b8-45b3-a96d-1427ca905c6c@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_050451_624548_2087C70C 
X-CRM114-Status: GOOD (  36.52  )
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

Hello Quentin,

On Fri, Jan 17, 2025 at 12:50:52PM +0100, Quentin Schulz wrote:
> Hi Niklas,
> 
> On 1/17/25 11:54 AM, Niklas Cassel wrote:
> > On Thu, Jan 16, 2025 at 03:47:11PM +0100, Quentin Schulz wrote:
> > > From: Quentin Schulz <quentin.schulz@cherry.de>
> > > 
> > > According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
> > > overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
> > > mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
> > > be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
> > > another Rock 5B, the latter needs to apply the
> > > rk3588-rock-5b-pcie-srns.dtbo overlay.
> > > 
> > > In order to make sure the overlays are still valid in the future, let's
> > > add a validation test by applying the overlays on top of the main base
> > > at build time.
> > > 
> > > Fixes: 40658534756f ("arm64: dts: rockchip: Add rock5b overlays for PCIe endpoint mode")
> > 
> > Not sure if I agree with the Fixes-tag.
> > I don't think there is anything broken with that commit, but I definitely
> > think that it is a good idea make sure that they don't break in the future.
> > 
> 
> That's fair. I actually think it'd be a good idea to backport this to stable
> releases. It could be possible for stable right now to somehow only backport
> changes to the base DT without modifying the DTO (or vice-versa) and then
> break the overlay unknowingly.
> 
> I added the Fixes to make it a bit simpler to know up to when to backport
> it, though I still haven't decided if I should have added Cc: stable there.

I know what Greg would have said:
https://lore.kernel.org/linux-pci/2025011651-stubborn-certified-b22f@gregkh/


> 
> So 1) what's your opinion on backporting this to stable
> 2) if backporting, shouldn't I still remove the Fixes?

My personal opinion is that a lot of companies are way too greedy, just
taking the work of upstream, but never giving anything back by actually
employing people working on upstream, all while sometimes having hundreds
of employees working on downstream.

I wish I could stop marking patches with CC: stable just to not make their
lives easier. If they want the good stuff, at least they should spend time
upgrading from their 4.14 kernel... Note that I do still (reluctantly) mark
my fixes with CC: stable.


> 
> > 
> > > @@ -145,8 +145,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
> > > -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
> > > -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
> > > @@ -165,5 +163,9 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
> > >   # Overlays
> > >   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> > > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
> > > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
> > 
> > You moved these lines further down, but you changed the suffix from
> > .dtbo to .dtb, why? It seems a little confusing, is that really needed?
> > 
> 
> That was also confusing to me, but that's actually how it works.
> 
> rk3588-rock-5b-pcie-ep.dtb somehow points at rk3588-rock-5b-pcie-ep-dtbs
> which is the overlay application test of rk3588-rock-5b-pcie-ep.dtbo onto
> rk3588-rock-5b.dtb. For that to work, the .dtbo needs to be compiled. The
> target must be auto-generated somewhere because that still works. You can
> remove all *.dtb* from the tree, apply this patch and compile with make dtbs
> and you'll see that the DTBO is generated and the build time test of overlay
> application done as well (the log line starts with OVL).
> 
> Not sure exactly how to make this a bit less confusing in the commit log, as
> I myself do not really know why that is necessary or how it is working. But
> "it works" (tm).
> 
> This matches what was done for ti/ as well.

As long as the files still get generated with the .dtbo offset, I'm happy.


Kind regards,
Niklas

