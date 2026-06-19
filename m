Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0159CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2f6hjSGMoH572lM/Ykcj4QH+SisNj10wZbZJgrsaP8=; b=V9at7ac0IZhh5C0AaDqsTWd5sq
	0gRyvonZKc67fDhUVLK8FjhuKdXQTdMZjrVkvkUsas4HWazEm5QddDMvN3SBDNtoAcQaaUB1wp411
	fOvRTHSxVjeXXZhcXB2wpcD8U4kbP+7akZAdBahbLmzmIi0PX2dMwQDxmfy+jNw9aPvIR2YIx4kIN
	dK3Mm2efVnxXWYMplhpUhbT5sYQha6QnARL5jOVk/nfI0umGqGM67iOsGV1qLr9wW2GCkvozUPZQI
	ts+c+RPDvonZTh1cktaqYIabQUU4W+VFEoh8P0VVNOuqRjPwKku1YiHUQy6v+c4vXWUExVC4fDw+c
	X76l7qFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wagO7-0000000323X-2EHr;
	Fri, 19 Jun 2026 21:04:31 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wagO1-0000000321F-358r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 21:04:30 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260619210417euoutp029cc73eee19a70bdea484dd2a74eebbd0~6l2PeRuVS0955009550euoutp02K
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 21:04:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260619210417euoutp029cc73eee19a70bdea484dd2a74eebbd0~6l2PeRuVS0955009550euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781903057;
	bh=r2f6hjSGMoH572lM/Ykcj4QH+SisNj10wZbZJgrsaP8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=p0UJKPfXVK6bJAFirGdROBBCyRh8cFOmDclU1jj1NJMQhLXJlVREv7tNMnCzRmIR5
	 Y4IM1AzG2ho53qxtueDBs7dHbM/8TLMARshQRPnwJxfbEyk8IHqyR8BZBz8/kqculg
	 zvwHiHpDga1gayxLmMKU0OxHSvbMmFTgqxzqVM6k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260619210417eucas1p10453b07959c6efc6ef5ab9e0520a600a~6l2OwsEDK1265012650eucas1p1V;
	Fri, 19 Jun 2026 21:04:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260619210416eusmtip1c42ab3e53832f224de29ef4a70a27b6b~6l2OMSZ6b2659126591eusmtip1D;
	Fri, 19 Jun 2026 21:04:16 +0000 (GMT)
Message-ID: <f9fe4a59-c6f6-4388-a823-fc7bc6b9fd6d@samsung.com>
Date: Fri, 19 Jun 2026 23:04:14 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional
 EL2 virtual timer
To: Daniel Drake <dan@reactivated.net>, maz@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, andrea.porta@suse.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260619204832.586079-1-dan@reactivated.net>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260619210417eucas1p10453b07959c6efc6ef5ab9e0520a600a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260619204921eucas1p1c4a9fe8e8a41f552d4637dee2b26f4e4
X-EPHeader: CA
X-CMS-RootMailID: 20260619204921eucas1p1c4a9fe8e8a41f552d4637dee2b26f4e4
References: <CGME20260619204921eucas1p1c4a9fe8e8a41f552d4637dee2b26f4e4@eucas1p1.samsung.com>
	<20260619204832.586079-1-dan@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_140426_402916_24580EDB 
X-CRM114-Status: GOOD (  18.26  )
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

On 19.06.2026 22:48, Daniel Drake wrote:
> Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
> EL2 virtual timer when running VHE") causes boot to hang on
> Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
> any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
> confirmed set via readback.
>
> The reasons for this failure are unknown, however it is likely that
> this timer was never tested. Raspberry Pi's original devicetree did
> not include this timer interrupt; it was only introduced via a
> suggestion[1] made in code review as part of the upstreaming process.
> (Current RPi firmware versions do include this timer, but only because
> they rebased on top of the upstreamed devicetree starting with
> Linux 6.12)
>
> Until more is known about this non-firing timer interrupt, remove
> the devicetree entry to enable RPi5 devices to boot.
>
> [1] https://lore.kernel.org/all/12363be5b11c752b7155cc0c416fdfd2@kernel.org/
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 761c59d90ffc..09ff5e9959d3 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -678,8 +678,6 @@ IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
>  					  IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> -					  IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
>  					  IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


