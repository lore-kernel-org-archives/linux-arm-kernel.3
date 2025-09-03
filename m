Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF266CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YumEJQKSlit0DjdeGbyizHywaHYlUT5ic7rTLQ6f/ZI=; b=opTBVSaI23kwEpTBP4Yey039Wv
	HJgdPpVynipjHOsZ0A0pRaZ3/+KzpwUpLBdgPlaeTEov8yMl8VWPEU7GfKk+xQCWBHZEb4JsgfwEG
	atuQXPKg+T6+4sR4lIruc+QuuzGiTJSEN3ATOK6BxQqfdktiogDFn1CLfPSE8gM+bP8yCkGU6b69G
	Ypx1++jxg2XE/NEx2yvUWv3O1MYt1HMGf1v5WBwJWlncEIGX+DFyZy4cKiLi0LlziBdRu86OR3VAY
	+o5VvlPR7cqef/Dpycqgy2coVtobjwgrHe1nWQjtsn9HZEe7y2VWzuGLJ75VBed3ADv7+Ez+GTXs8
	85PkmAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnQu-00000006ZcN-0lEp;
	Wed, 03 Sep 2025 13:21:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmWs-00000006NSN-0hj1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:24:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F0BB1A0DB2;
	Wed,  3 Sep 2025 12:23:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CEA1606C3;
	Wed,  3 Sep 2025 12:23:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 353941C228A5D;
	Wed,  3 Sep 2025 14:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756902228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=YumEJQKSlit0DjdeGbyizHywaHYlUT5ic7rTLQ6f/ZI=;
	b=ME4IxtqY4zsA7nARb5WTtl/57ejoK707NoScjwGP8BjdNjLqBWTBbcsJnGgGTD2/QLqllY
	IpuLP+RCXQuA+980APJpCicHcygVXaOazGdR+v5ZcGezBekFDLkpIwHiQccijqFiRLztNb
	j+AjWQ3s7X7WWpaCKf2kX8BP2IJS/LknssX+FhDjckW1emX/HRQp9OYQkpAeT6Xh6fMWHX
	VOht6KPTL7XQMwWerrED25vhQVSewbM++XggxIxlodm9CCsalY7B9dpMn3+VcbltBy0K6x
	HhgsW0OTFAx0BkHuQSQoTaalcCKYJD4fzQc0N1ltyu21zUXnU0k0JgfsGWyZcw==
Date: Wed, 3 Sep 2025 14:23:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Message-ID: <20250903122342a2996825@mail.local>
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
 <20250710083434.1821671-1-dev.tailor@samsung.com>
 <000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_052358_691021_BBCCE716 
X-CRM114-Status: GOOD (  22.78  )
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

On 03/09/2025 17:09:32+0530, Devang Tailor wrote:
> 
> Hi,
> 
> 
> > -----Original Message-----
> > From: Devang Tailor <dev.tailor@samsung.com>
> > Sent: 10 July 2025 14:05
> > To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > rtc@vger.kernel.org; faraz.ata@samsung.com
> > Cc: Devang Tailor <dev.tailor@samsung.com>
> > Subject: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
> > 
> > Enable on-chip RTC support. The on-chip RTC of this SoC is similar to the
> > previous versions of Samsung SoC. So re-use the existing RTC driver with
> > applicable call-backs for initialization and IRQ handling.
> > Add a separate call-back for disabling RTC since existing '.disable'
> > call-backs updates additional bit not valid for RTC of ExynosAutov9.
> > 
> > Setting and getting hardware clock has been tested using 'hwclock'
> > and 'date' utilities.
> > 
> > Alarm interrupt has been checked with incrementing interrupt count via "cat
> > /proc/interrupts | grep rtc" for 10sec wakeup time via "echo +10 >
> > /sys/class/rtc/rtc0/wakealarm"
> > 
> > changelog
> > ---
> > Changes in v2:
> > - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
> > - link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-
> > dev.tailor@samsung.com/
> > 
> 
> Reminder!
> Can you please help to identify if anything is pending in this patch series ? I see all three patches are reviewed.
> 

You have actions after those reviews:

https://lore.kernel.org/all/20250711-shapeless-adorable-lobster-d2efbf@krzk-bin/

> > 
> > Devang Tailor (3):
> >   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
> >   rtc: s3c: support for exynosautov9 on-chip RTC
> >   arm64: dts: exynosautov9: add RTC DT node
> > 
> >  .../devicetree/bindings/rtc/s3c-rtc.yaml       |  1 +
> >  .../boot/dts/exynos/exynosautov9-sadk.dts      |  4 ++++
> >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 10 ++++++++++
> >  drivers/rtc/rtc-s3c.c                          | 18 ++++++++++++++++++
> >  4 files changed, 33 insertions(+)
> > 
> > 
> > base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> > --
> > 2.34.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

