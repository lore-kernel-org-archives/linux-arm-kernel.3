Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6684CCA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cLeJRvRQmYJSkInaE9VNGkhvbizbe3ku6Vn7Sk+naQ=; b=n0ley/8xAd/lB7zEV94sh+sLDi
	cKIzrdBFfqAqFtUPCoOcrgxLDTxwH3a5ChjSMPokRyWeegOG8YCJDTi4cEg74O8P1pyq8m5s0csyA
	onQr7SizbKFLhHZCrgw9GO+AZH0FwQ7HQDwoNwJa20HuYdMbZ1rh90hPhC2e+uTwukJogSTujjOfq
	gxfeLAz7XLb5DnVaqU/Vva54Iel6slC22Ti7hdP1viJFjfMQIjtwEnLCGXznMfhR2H28yotobYN8s
	E1duauOF0crTNnbuvf52iIKE9tnn6KcmXsvlxyqcdQsUYXcigGoGsd984SzfIo+BpspQ0Cs2d6cO/
	PzJRHpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEn-0000000FBam-3EXh;
	Wed, 13 Aug 2025 22:46:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGQI-0000000Ej2a-25fD;
	Wed, 13 Aug 2025 18:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 025B645570;
	Wed, 13 Aug 2025 18:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A69C4CEEB;
	Wed, 13 Aug 2025 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755110525;
	bh=g5/K/aqiu/I8p/j7YFGZz9MNQ7e88JO/25IsHBbTzvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJNytZyznr8ERJfZMMKZIczLLfi4d7ucuqH0OrDDssgneqIOIS++2WfC8oCIH4wK+
	 G/CKl8Tks4LzxJ6kWahekGrlq5jlo7OTejCzao1WIxgYUP/bjxWyHjJDf2/3tDRs2F
	 k/wFzBPAX/qcxBvzXtqd2LFhx1hp/3giTOabez4qqN52q1tXY+AAhcu8BzqMwA88OM
	 hDhq4H383ytCuRcPQTO//DEu2Y2jOgLA3mxK0loWPFIqkXzHXQxKumxpfke/zxcbEk
	 6CDZY0YTelUd1lyarfsetMz067qZnNnzGTWPOgm7NZLX6H9DgkCa8ZGD7UHeglq+62
	 ysIhYFXCJ4hDw==
Date: Wed, 13 Aug 2025 20:42:01 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on
 the rk3588 SoC
Message-ID: <aJzceQbjdilfJSyo@ryzen>
References: <20241107123732.1160063-2-cassel@kernel.org>
 <4400329.mogB4TqSGs@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4400329.mogB4TqSGs@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_114206_578971_429D4427 
X-CRM114-Status: GOOD (  33.48  )
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

Hello Heiko,

On Wed, Aug 06, 2025 at 09:36:10PM +0200, Heiko Stübner wrote:
> 
> I've run into a bit of a problem with this patch and v6.16 today :-( .

Is the problem there also on older kernels?
(There as been a bunch of patches to the arm-smmu-v3 driver lately.)


> 
> It seems the SMMU currently does not play well, if has no users. With
> this patch the pcie smmu is always probed, even if nothing is using it.
> (or in fact the PCIe controller driver defers probing for whatever reason).

Well, the good thing is that the PCIe driver will probe successfully even
when there is nothing attached to the PCIe slot:
https://github.com/torvalds/linux/blob/v6.17-rc1/drivers/pci/controller/dwc/pcie-designware-host.c#L560-L561

So the only case where the driver will still be deferred after a normal
boot is if e.g. the user forgot to select the Kconfig for the PHY driver.

It does of course sound very bad that the board takes 30 seconds to reboot
in this case, but at least it reboots eventually.


> 
> But in all cases the SMMU's shutdown callback will be called when needed.
> 
> So test-case:
> - probe pcie-smmu, but do not probe PCIe ... hit reboot
>   The smmu shutdown function will hang for a bit, and at least my two
>   test boards  did reboot after hanging about 30 seconds
>   (I did trace that down to the arm_smmu_shutdown function)
> - probe pcie-smmu and probe PCIe - creating a user for the smmu
>   Reboot happens without hang/delay
> 
> Likely the SMMU is missing either a clock or its power-domain.
> 
> Just adding the power-domain to the node, did keep the domain on, but
> did not solve the hang for me.

Which power-domain did you add?

When I look at the PCIe controllers, they seem to use:
power-domains = <&power RK3588_PD_PCIE>;

So I assume that this is the power domain that you tried?

If I look at the RK3588 TRM Part1, 7.3.1 Domain Description,
page 1096, it does seem like the MMU600_PCIE is in power domain
PD_PHP and not PD_PCIE.

Perhaps you could something like:
power-domains = <&power RK3588_PD_PCIE>, <&power RK3588_PD_PHP>;

just to see if that improves things? (Ideally I would assume that we
should just need RK3588_PD_PHP.)

I do notice that RK3588_PD_PHP is defined/used in:
drivers/pmdomain/rockchip/pm-domains.c and
include/dt-bindings/power/rk3588-power.h

However, the RK3588_PD_PHP power domain does not seem to be defined in
rk3588-base.dtsi, like e.g. the RK3588_PD_PCIE power domain is:
https://github.com/torvalds/linux/blob/v6.17-rc1/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi#L1115-L1121

I also cannot find the RK3588_PD_PHP power domain defined in the
downstream dtsi:
https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr5.1/arch/arm64/boot/dts/rockchip/rk3588s.dtsi#L3422-L3427



Side note: from the TRM is seems that
pcie2x1l0, pcie2x1l1, pcie2x1l2 is also in the RK3588_PD_PHP power domain.
(only pcie3x4 and pcie3x2 is in the RK3588_PD_PCIE power domain.)

Yet, looking at rk3588-base.dtsi and rk3588-extra.dtsi, all five
PCIe controllers has:
power-domains = <&power RK3588_PD_PCIE>;

Looking at downstream, pcie3x4 and pcie3x2 has:
power-domains = <&power RK3588_PD_PCIE>;
but pcie2x1l0, pcie2x1l1, pcie2x1l2 has no power-domains property at all.

Perhaps a bug when Sebastian added the PCIe device tree nodes to upstream?


> Strangely enough, additionally forcing all clocks to stay permanently on,
> also didn't help (or I messed up somewhere) .
> I'm not sure if the PCIe controller does cause the SMMU to do some more
> initialization, that would be missing otherwise.

That does sound like the most likely explanation.

arm_smmu_device_shutdown() calls arm_smmu_device_disable() which simply
does a arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);

The ARM_SMMU_POLL_TIMEOUT_US is however 1s, so if your board reboots after
30 seconds, that is probably because of a watchdog or similar.


Kind regards,
Niklas

