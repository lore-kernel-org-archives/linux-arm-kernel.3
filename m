Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602CAC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2YTvvtUAT2AgcdYYSojWmWFscG/TMLAegHPjK4gw6s=; b=JSC4ManHd3apB+eVI8JiaT6i5J
	eWOhkHbmJyKsoTS60oLHjpl7ku595W+Kjq/cs9VC2FNEFjBxzHQIJNz6NmsIRHBso7IybAAgMJVgJ
	op3sjFPuyml7AO7BWM6QSi7XXg9Vz30O0/OzV98zVw6naeFTdeanGixqqX5DMj9N8lqNcoQI02daz
	XT7D+pDm/2j1f68C1Myj7r0M1eAYQIzNsyatohvVcnho7vjbyJyK2L2YINaIJMtKOjURZyOCFg0Yh
	LFqotc5k/dsnR8cOdgP21zf9FZUkBPn3XH09QFpCM0djm5gczAPjNSEnhL5FvydoxV6gu2XDv/QNC
	Kq/fi50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q9e-00000005sWP-0CXw;
	Tue, 15 Sep 2026 10:12:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q9c-00000005sWB-2lsu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:12:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6970D40436;
	Tue, 15 Sep 2026 10:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501551F000FF;
	Tue, 15 Sep 2026 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467164;
	bh=A2YTvvtUAT2AgcdYYSojWmWFscG/TMLAegHPjK4gw6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpPhct2hKfAhOiCgXC8tXMwSDPZFjkzeLAMrhAFby401Tk3MYQhbXTFLU0qmFIzNH
	 n+KNK2IqxAsi2iJrP9SI4y5J4LEEJve9IYZ2822yD4rfFHMHXCDdQeNAIZFSn5Zv2H
	 oPR5yd7otns3Pcozpy/7Cwy1A8iBDkI1r6/RwQmeR0GED7K9AsEWxtFir3zLDMuk8w
	 +l8AHsX6L1ZwbSfDouqKgRW9yq52CV1fN1FvH7FH6LkrK7GkJKRYxecLM/ejYb80rj
	 FKi8sLfoK5Te6+a2CP3DbJdW9ccSJGO/RmSmEeeObVrwsBNN0pQNjMqUjBmRmpmHGv
	 gXM+HfE6JlpoA==
Date: Tue, 15 Sep 2026 12:12:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas_turner@talktalk.net, alexey.klimov@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy A21s (SM-A217F)
Message-ID: <20260915-squirrel-of-major-opportunity-ef2cff@quoll>
References: <20260913123740.203698-1-tturner@lineageos.org>
 <20260913123740.203698-3-tturner@lineageos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913123740.203698-3-tturner@lineageos.org>
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

On Sun, Sep 13, 2026 at 01:37:40PM +0100, Thomas Turner wrote:
> Add initial support for the Samsung Galaxy A21s (a21s) phone. It was
> launched in 2020, and it's based on the Exynos 850 SoC. It has multiple
> RAM configurations: 3GB, 4GB and 6GB.
> 
> Since our bootloader does not set up memory nodes beforehand, default to
> the 3GB variant. Custom bootloaders can be used to initialise other
> nodes per RAM configuration.
> 
> The Exynos DPU clocks required by simple-framebuffer are not kept
> enabled during boot. Add the DECON, DMA, DPP, PPMU and SSMU DPU clocks
> to the simple-framebuffer node so simpledrm maintains references to
> them. Without these clocks, the framebuffer fails to remain operational
> further into boot.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 3GB RAM
> - Buttons
> - Ramoops
> - MMC
> - USB
> - Watchdog
> 
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---
> Changes in v2:
>  - Re-order properties/nodes to pass dt-check-style --mode strict

This is based on some old fork... You need to develop on current
maintainer's tree and test the same. linux-next usually works fine.

Best regards,
Krzysztof


