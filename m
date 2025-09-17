Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D318ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/YUiKdTCNoLY1GEz8aALnf4XAGh1lYAmaGmZs7m/9A=; b=pDI/1biZCOY8RWsF/AuNHtLOmc
	ooWiE1W8VoPCrw4EsKLxzez7sptPYczXBuCbWoQZOPyNpTVWPG2aN7QAUW7LPUSAZESKwexAHNA0c
	ltMePT6wQZXL6+JRe8MCZTxnoiKZRG9Rj4UHa5tTBvPLTVw48Zbvd1oCb/unKatMsnaCwcwXUdXfF
	a8Tfco1+o/ZYk+WaGHqh4OFPmA9MIgH6pGRYyEXTSabQMetGDMRdGVUH4d86wtvbb+OGFvWGj1dKG
	MOA6z+UDVL+ouRKo1Ps4Z+UirSN1KrkC2SEcOdIYiprsEvQY0bw4x5yNay7a16Ju9LZ3a6rXcEqDu
	lK6m8Ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrBb-0000000BIQw-3Kz9;
	Wed, 17 Sep 2025 12:22:59 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrBa-0000000BIPZ-0E7U;
	Wed, 17 Sep 2025 12:22:59 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1758111775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/YUiKdTCNoLY1GEz8aALnf4XAGh1lYAmaGmZs7m/9A=;
	b=FzTfMB18+cpLicwCu+AVJNnZiJZfNKz2M2wHjk0wSNA8lAcT/2dnutF/5zvQ4J+OZFYGRb
	liWN2/69B5++gcN5E9nuSeW2MgHullwTxyCBNwv21OnLtPPriPbYI046Sww50yAMXyU+Wh
	dya8dQ0wjzznMvsEmsEA7Q1Qhu/IlBfaxsd0u4T7dK4hkZC2/gw08RZHC3CXITXyEscwta
	Wjwx+fFUs02paN+jsv+hCZ6hg81gifSw+p5S0da3Vakg4vY3yrpmS7jhbqZTDHwPWuWfGg
	iGIybL4VqvCD1O2Uwt+wNtVcRXoJTubiQY49/rW33IbacCna5IiY4CQQScHn2g==
Date: Wed, 17 Sep 2025 14:22:52 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Ed Wildgoose <lists@wildgooses.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rockchip: dts: Enable UART DMA by adding default
 dma-names property
In-Reply-To: <20250917114932.25994-3-lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250917114932.25994-3-lists@wildgooses.com>
Message-ID: <7c8576e3d9fc73ba45830833f5281706@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_052258_326536_9C038344 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Hello Ed,

On 2025-09-17 13:49, Ed Wildgoose wrote:
> Kernel appears to need a dma-names set for DMA to actually enable. Set 
> a
> default dma-names property for all UARTs defined in the base 
> rk356x-base
> dtsi
> 
> This is tested on a Radxa Zero 3W (which has 5x UARTs) and removes the
> warnings and enables DMA on this platform

Thanks for the patches.

We should (still) stay away from defining the "dma-names" property
at the SoC level, because doing that causes serious issues in certain
cases.  Thus, I'd suggest that this patch is dropped, and that the
"dma-names" property is defined instead at the board level, where
it's needed and tested to work as expected.

Please see commit bf6f26deb0e8 (arm64: dts: rockchip: Add dma-names
to uart1 on quartz64-b, 2024-06-28) for further explanation.

If/when the underlying issues are debugged and resolved, we can get
back to defining the "dma-names" property at the SoC level.

