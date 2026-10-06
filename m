Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C0CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVvGpJ6ulp1owYNI32OyuXl21ymeks60rItkOGgWYFM=; b=WD3wQ2G3iyO3rOMAaprjYc4Yub
	ebROPo1h5gQUIikARPJdWWN9a9Ixj4HD1pxZ7cT6OkJJ9aUp4jwBOkywvhHkb2B1CecVtYUSbCrB/
	uYkuvxsn8Ey8ikGjqnwnplno9VxH9qyoouyqI6r8Q9yxL7rc6xJH9DVfn5fJo+bFPpU7Tgl+6MWZC
	VD/PtCO01xeoruTCA32B/S64WUbebaWXZRo12Ob+aX+fFpXffb8nDTjC3nFCoyImPD7ElKysvzs5z
	Oaz5X9bH7ktNVNry6i7RsQhtzCWXLmafw2aB/rv0+SIYX7cn3Q3uzw11aF6VU3b+g1og3+EzWP+/b
	TWXC4bjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0gR-00000000IoB-3jWW;
	Tue, 06 Oct 2026 08:37:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE0gQ-00000000Inx-1KaA;
	Tue, 06 Oct 2026 08:37:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98C0240F04;
	Tue,  6 Oct 2026 08:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6EC1F000FF;
	Tue,  6 Oct 2026 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791275877;
	bh=XVvGpJ6ulp1owYNI32OyuXl21ymeks60rItkOGgWYFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HZh0E8Gq5Ba0eZjJ1GdHmDWjZhe5MLIsOd+8jCx9X7+lEp6PNYtmjM2pJ7BZ/62l7
	 fEgyFBzJHDmUEVJF8cycD77ONcWd+oHM83ma/agHg/D2vI7redKr1cJ2l8DyBhc3zl
	 fj+9vy3Hjf4zUF1wvU1OyMcaL7dv//aGaf7sG9ifOR8ueSILhsStmaqllxZdeWz6Fi
	 wXRRxQDvMOMgDi0BtNuoPEPBYg9fq8qZdePlntGSCBEH3pZS9I4MOoTDz/PcCm4niU
	 CroWRoWfRwyX+4RSAOe4XczYKBsNajVeuwtnHveVIms7XuB+8UpccGlfc5vBHzU334
	 /uvGYNrvXbnMg==
Date: Tue, 6 Oct 2026 10:37:53 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Message-ID: <asSzYUA5W51Ngn4X@parshuram>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com>
 <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
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

On 06-10-26, 09:37, Joey Lu wrote:
> 
> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> > >    */
> > >   #include <linux/bitfield.h>
> > >   #include <linux/clk.h>
> > >   #include <linux/delay.h>
> > > -#include <linux/io.h>
> > why is this dropped?
> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
> __iomem), even before this series - all register access goes through
> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
> unused include already, and it's dropped here as part of the broader
> rewrite touching this include block. Happy to keep it if you'd prefer
> not to bundle unrelated include cleanup into this series.

Then it should be a different patch explaining this

-- 
~Vinod

