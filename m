Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7596CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikxEv8Gm2su2ZZEUWd9/OL6i4Bjm4NlNTOBJiXZjuKs=; b=ShHCwcuq3ggv3QIUOFjMt7t7OT
	7Po5VbYkWLp1JY8BgBI6zLGxPqsC8DwkzL91U0H1lo3EX0owxvyzDnvCfBfKZEiozyyYl2ZEUA7FK
	71tjF1VUMcoVcnJk/cLg5hTnfGGlMX2mFnbM6JwjhDSej5KDONhRW7XLfb/kYCmQF9OyRN0lTTQJA
	f+c06ECmMoAS+ZCc5z4vmUlM+WvMHmiLf4aYoLK3aaSyVLkYfe9QHAu7nZFdXYzSPO33qysfH7Lzq
	7eucmR9YJbxm5n+hhMcI79mHDF8h9S2HrHlRIWaSbOW9GAQAoKCslsmvF4+sl4sfZpTexHR8oBjXa
	gfa0Izsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5WVW-0000000Gfm2-20Jq;
	Sun, 05 Oct 2025 21:43:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5WVT-0000000Gflh-1oJO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 21:43:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 730BBC03590;
	Sun,  5 Oct 2025 21:42:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E86F6065F;
	Sun,  5 Oct 2025 21:42:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5495102F1CFA;
	Sun,  5 Oct 2025 23:42:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759700578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ikxEv8Gm2su2ZZEUWd9/OL6i4Bjm4NlNTOBJiXZjuKs=;
	b=PvZjfjqAbdQefUvmkSB9K7Y2494tOfSCjqAXKt1DMeY5Xtl8NrI/4bvMwtNvT81hWqfAgy
	7tjvcLVuSsvQsngJL/cuSH1qfegGQo1x6oFGN4CRYawRaR04v8R9cy6qMSbFMGQg0sUzCN
	iCE05d/25g9mU91lgHCmlCcIgYsB2jfKIo335J0dKHdIMhcQM1FF1MuvdIbaAlljEpzsU/
	xEhl7lu59CW8XVTxe5DyGl4B7Z34MtPft0UKKu9XarYPuL3y+Jp0SZfIB8izS7dfm9Xwc1
	wOdWCHgFeUcz7xW2+cncOlUmJxX1VaigvGbmv4bnNaHd79/hM+DjN80aWYkZ5A==
Date: Sun, 5 Oct 2025 23:42:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Subject: Re: [PATCH v3 0/3] On-chip RTC support for ExynosAutov9
Message-ID: <202510052142538d7fd672@mail.local>
References: <CGME20250905105708epcas5p159281b73f87fae88e824b97889908649@epcas5p1.samsung.com>
 <20250905110554.2212304-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_144303_651716_4B205CAB 
X-CRM114-Status: GOOD (  17.99  )
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

On 05/09/2025 16:35:51+0530, Devang Tailor wrote:
> Enable on-chip RTC support. The on-chip RTC of this SoC is similar
> to the previous version of Samsung SoCs except for TICNT tick time
> counter. So re-use the existing RTC driver with applicable call-backs
> for initialization and IRQ handling without accessing TICNT counter.
> 
> As suggested in review comment, instead of adding separate disable()
> call-back, re-used the existing s3c24xx_rtc_disable() by adding a new
> bool 'use_s3c2410_ticnt' in rtc_data to avoid accessing TICNT counter
> which is not valid for RTC of ExynosAutov9.
> 
> Setting and getting hardware clock has been tested using 'hwclock'
> and 'date' utilities.
> 
> Alarm interrupt has been checked with incrementing interrupt
> count via "cat /proc/interrupts | grep rtc" for 10sec
> wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"
> 
> changelog
> ---
> Changes in v3:
> - 1/3 : Added Tag 'Reviewed-by'
> - 2/3 : Fixed the review comment of v2 to re-use the existing disable()
> 	instead of adding new one.
>       : Not adding Tag 'Reviewed-by' from V2 since the patch has been
> 	changed
> - 3/3 : Added Tag 'Reviewed-by'
> link for v2 : https://lore.kernel.org/linux-rtc/20250710083434.1821671-1-dev.tailor@samsung.com/
> 
> 
> Changes in v2:
> - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
> - link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-dev.tailor@samsung.com/
> 
> 
> Devang Tailor (3):
>   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
>   rtc: s3c: support for exynosautov9 on-chip RTC
>   arm64: dts: exynosautov9: add RTC DT node
> 
>  .../devicetree/bindings/rtc/s3c-rtc.yaml      |  1 +
>  .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 10 +++++++++
>  drivers/rtc/rtc-s3c.c                         | 21 ++++++++++++++++---
>  4 files changed, 33 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010

You should rebase on top of rtc-next as s3c2410 support has been
removed.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

