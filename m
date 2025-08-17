Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD4dUzK4WPTiSpi8Q/562wHVfJdofL5HLBiakpSSupI=; b=I5R5KDOh5B0SyzF+FNRYgrXbn4
	mBNg3BseUOL7UfpJnB/3tnWpPt3mO0TZTj9+o6DBbINR56m6T8CF13voHNhpZbaf6gSAcmHOVJU+m
	mkm8aQGcSiIYHbZMjsIcfXsUsReuFBMVSG5fYsefPMaLp1ExA89RLSF0AgD+ITj4ukRvmgbB/a1hv
	qh3Fn/TQiNJN0mXwgC0od9N7kw0F2JizpYGGBtULE+JUs6P6R1t6HUn/L6mquiNeJNNBuaQJecVw9
	J4eM0Itu6kW/7CJHrfEWYnNR9HvZMpDONAZ+y8leOYs+iMBEHSvzJV72T2XT/JjM+mUqDIViHKlzU
	b0u3ih/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unejy-00000005lcH-43Br;
	Sun, 17 Aug 2025 14:52:10 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unehP-00000005lOf-0gUk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 14:49:32 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6E85F25C75;
	Sun, 17 Aug 2025 16:49:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ot2r675AP6tz; Sun, 17 Aug 2025 16:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755442168; bh=qIMnvl++/IsEcAL9q+zLlKFvHMY7N9QrxenQ6NuKwmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JgXW2Jcyn+RVd6NzXLZp7YOqyKs0eHBZEX5tLffK5+NBAsDCTeLmWpoReaia5w03G
	 ixK6J/mes9Y1sdRAqJrEPLzsRRsNB4AY3SjQXVAmQchbbQcocWlSKHo6+EcBCOhzfO
	 ctBn2VP8c3MwfP8uf8/D7lol3aWkD8YWz9Cxuhlryr6dsProyj3hLXNtmfrIklMEPw
	 LME7EOKW6rkP3nAj9bMl8hm+KDr1P6ZL+Phdw3AtHWiwiSWwQ5PmJuRRyTKn8SdqFr
	 BcKeXzcVGcZHuarrVHl0xqqX6VfgsKtzfCOazDhsEBVweOjz4UdoayUaZe1D449N/a
	 bMOCAlRnKLl9w==
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 14:49:28 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
In-Reply-To: <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
Message-ID: <45fc52d9988d1bf17eca392364c63193@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_074931_338085_8658E834 
X-CRM114-Status: GOOD (  11.41  )
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

On 2025-08-13 07:58, Krzysztof Kozlowski wrote:
> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>> This series implements changes in the SoC subsystem, which includes
>> devicetree additions. It depends on all sub-series listed below:
>> (Legend: [R]eviewed, [A]ccepted)
>> 
>> exynosdrm-decon            - 
>> https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
>> exynos7870-mipi-phy        A 
>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>> exynos7870-mipi-phy-fix    - 
>> https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
>> exynos7870-dsim            - 
>> https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
>> panel-samsung-s6e8aa5x01   - 
>> https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
>> panel-synaptics-tddi       - 
>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> 
> What is the status of the bindings from dependencies? I think they were
> not accepted.

Except panel-synaptics-tddi, all have been accepted. A lot of them
haven't hit next though. I'm waiting for that to send the next revision.
This rev is pretty old, so the links are old revs too.

There's also another related patch, on the IOMMU driver, which has also
been accepted. I will also add it to the list.

> 
> I also replied with few nits for one of DTS patches. Everything else
> looks fine.
> 
> BTW, really great job you did here, I am impressed!

Thank you! This was quite a ride to work on it and upstream these
patches. Thanks again to you and other kernel maintainers for all the
reviews.

> 
> Best regards,
> Krzysztof

