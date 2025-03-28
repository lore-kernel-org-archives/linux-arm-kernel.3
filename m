Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE22C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmKs5OSCjwxn+BEAg9J6m4zzinMCVB2P/5oIyjO+7Zc=; b=KgJYKscxlpd11yiPp8/j7s61N6
	KbTuiI0692dEY3PasdXu6uSZWwMZFO1/6V8Eo0WNLrNuhqxEIDUyMIdILVjzENp94hu9sk49f0xYJ
	M9BhlM/3iq4SBgSwYto5MuxEx4d9mdewkdvngBMoh7XSIcU1PV9Zv5WNLS0k7hkvO9iqAHbB77HpC
	XMCtYsY9NOXSGimVPt12G5gpLX34rsTSBF+lLEgSRL2g+W39KE94JzaQNjZw5xFpIFNdUhYKpDVEc
	e0Rzo8BsaRrjh0T6lzS3ymW8WHId4cYTQIyZds8wt8FwvlEs0LPrV0MvBdGee+63WFbTgcbjQvdwj
	KaZI19CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4qn-0000000CtBn-0BBK;
	Fri, 28 Mar 2025 08:14:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4oH-0000000CstW-2L1Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 08:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85BEAA41387;
	Fri, 28 Mar 2025 08:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7847FC4CEE4;
	Fri, 28 Mar 2025 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743149477;
	bh=ZNaYWFv07hnLmJ9t204CNI9QvNiZyS05eYgMuawmNeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbJhLYTVmN2DzSXg+9Z1Zap5RcmMrU/7n3IWA4E2scR1NMRk7ZW/g4uLcU21mqg/T
	 5uNDMh1P4nFMyKPtZwd5jCSBIlaaioCsDWkJ777fb+EeA4LTKjxljxkK0XkmMXKFya
	 xHUg/PtG+nzvRwWYfsyH4ZbU5JiQQN7PP0Y2AftAxAqUhE+i/A/gITOhsN7NmHXFvY
	 U5+thN5A0+8XBxHhKEKxn4ToYmz9mc0aiXBJ+hqgZUMAcX2CZSgU9adBik2KpuPQWZ
	 6M5gtVw2FoW4ujodcMx25nHUHf0T9XQV4msE2ySyJKE3jbevu0eoPChvE/CigTGJ7s
	 YyQwnTPbJX4Ww==
Date: Fri, 28 Mar 2025 08:11:10 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 00/34] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250328081110.GA585744@google.com>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_011125_663434_D8312D57 
X-CRM114-Status: GOOD (  12.96  )
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

On Sun, 23 Mar 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> *** dependency note ***
> 
> This depends on the Samsung ACPM driver in Linux next, and runtime
> depends on some fixes for it:
> https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/

FTR, I have no intention of reviewing this until Krzysztof's review
comments have been satisfied.

-- 
Lee Jones [李琼斯]

