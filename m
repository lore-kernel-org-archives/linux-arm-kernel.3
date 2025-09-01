Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75480CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3AMFBS4pdqTPHb1xaEyon/Z/yyDiXoC6h3IkXj+6VE=; b=zi03Co2Ptwv0lLIBKdmFvFxhKw
	saZm1nshnjwMQnaRo0xAfKfXdB96867ztddCR8JKqw7GmGSZKtp+eUBe7t2Wo/s/G6DjuUwzn3EaR
	dU+13289qcLMTEwkJou5+53PcivRQA00UyXA/H8Zrtx/x7Plj5k8iz0u4znckVqU7oZYvoF11bRva
	oJVHrm2qKmGbvyk0ug43Ob6xJrMJ5ZPQnzJZJbz7DhFiiPcOJN3X5xsc696D8gr2h45mvNVzXnYpt
	eqMAkBJ3wozUxiAR4O7vnsMakcqUafiggusbDF0JYWedOdKDplWpnxMm6/YJuh0FdtwQsRix6XB09
	3v9rEHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFg-0000000EXkI-01mn;
	Tue, 02 Sep 2025 00:52:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut70Z-0000000DDJV-1WEk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:03:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A704C8F1D8;
	Mon,  1 Sep 2025 16:03:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 718FF60699;
	Mon,  1 Sep 2025 16:03:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7519C1C22C4CE;
	Mon,  1 Sep 2025 18:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756742625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=h3AMFBS4pdqTPHb1xaEyon/Z/yyDiXoC6h3IkXj+6VE=;
	b=K8ROVbfek60Si5w/IjEyvjT+O0WeRGTQB7vScHeXPwkm4/BDz7rPAOwHbICA1SBIlmG1D3
	3h0PsmiuIgXJeOS5z6XATDL4jDtBuAeOs9qJVqYT29hhslKmUbDp4zU7f3YrU3AtnK4a4P
	gu8IRfN7S/lkQ68u9TmNJj1aRPtBOt1bY8kisXQGEuVNU7byY/T0uJLb9Cx4T+gJuIVj5E
	apiP6raO7AwA/0zrv1feGHukkxoIks//sweBk57dGtCrjau/YBdaSzEpJujuLYICPa3/3t
	4Gaki9w+bJK/Gpk+U0JfiPzBx2QdyajLvdAxj5TiXWLOF9YUI17BOqVxJA1KLA==
Date: Mon, 1 Sep 2025 18:03:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: nicolas.ferre@microchip.com
Cc: ARM Maintainers <arm@kernel.org>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: at91: enhance PM routines
Message-ID: <202509011603254b5f8ceb@mail.local>
References: <20250827145427.46819-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827145427.46819-1-nicolas.ferre@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_090351_575653_973FF7FC 
X-CRM114-Status: UNSURE (   9.54  )
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

On 27/08/2025 16:54:24+0200, Nicolas Ferre wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Low priority fixes to the PM code, in relation to recent addition of sam9x75 or
> sama7d65 SoCs.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> Nicolas Ferre (3):
>   ARM: at91: pm: fix .uhp_udp_mask specification for current SoCs
>   ARM: at91: pm: fix MCKx restore routine
>   ARM: at91: pm: save and restore ACR during PLL disable/enable
> 
>  arch/arm/mach-at91/pm.c         |  2 +-
>  arch/arm/mach-at91/pm_suspend.S | 12 +++++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

