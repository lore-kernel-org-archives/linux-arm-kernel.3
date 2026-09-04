Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3C5C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ip/FWfklx45FlIPNsjZ5FeG+r+BEA7rxfLkX+/C4cs=; b=cMsvPnvkKxxKjX9CBBgsmhaJe5
	LAJ99FZJTiJAFP09WMQwD4WRSFqPK8lgTFoPyK2D9CEIt5A8JYhW70JDubly4B3l+It1lh8R0CdC7
	ZQiIrhboygsoh81+Vey5Ow8kIHzL1vh8brM/oidFJW8l89gy1O+C/pQ7awKekQoEK44bpdvfcMVUg
	Of3kSLCFEAEiMZaacrGrDY7NtPheYG37wDzHPlHsAWcmAOM/KkMFlsHyRgiSHCRQzbJI0t1QvGaXd
	F75QfYpOyV6Nz0QZ3sWyZ2M5UfKAoKNApoXB/tIkzrYzVQli3M9heH99tKf5c+70O1XtSvfGNlCJ0
	SbKDo51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLk-00000002yyE-2Bk7;
	Fri, 04 Sep 2026 18:09:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLi-00000002ysy-0DBe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8EE634E41523;
	Fri,  4 Sep 2026 18:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D2E66057F;
	Fri,  4 Sep 2026 18:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E0ED11C78705;
	Fri,  4 Sep 2026 20:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Ip/FWfklx45FlIPNsjZ5FeG+r+BEA7rxfLkX+/C4cs=;
	b=kRClukK1cqbeXhVXfwwMMW4/ygx3D7UO0UuCPshBYCUvA5mo9TCD+ccqmaqUJsovf929G3
	fHkY5oE3BAa4Hzn0Ji/4/gNd8hHS35JMjzaXBwV7gWWmOzs8/SkXPJaPGlQRwoDM+SktvI
	JcGqRYfhnaRXKmZ1G9QEX40tDMXM2RIdL9Os2mrW5dA1bKe6RsfmVTO7sUK20nPvhzi/wm
	3HFNjeFtXeOMTFWqW0Q1c49h9r9OUBiwHWGimCmQqrPRVft5JqyZTzOLK2MxynSpxfdNg9
	OtyOi6n6Q/ZNtsnfu/sNF2U8pHWGsuesXAp4EDs8dsGHcrbDmkEmyyPhwNKnpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org>
References: <20260903112425.1904748-1-vz@kernel.org>
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data
 support from drivers
Message-Id: <178854535106.1533016.16535478360917142774.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110914_236833_D63B8954 
X-CRM114-Status: UNSURE (   8.39  )
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

On Thu, 03 Sep 2026 14:24:22 +0300, Vladimir Zapolskiy wrote:
> Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
> device tree support, the unused platform data support can be removed
> from the LPC32xx NAND MLC and SLC drivers.
> 
> Vladimir Zapolskiy (2):
>   mtd: rawnand: lpc32xx_slc: Remove platform data support
>   mtd: rawnand: lpc32xx_mlc: Remove platform data support
> 
> [...]

Applied to nand/next, thanks!

[1/2] mtd: rawnand: lpc32xx_slc: Remove platform data support
      commit: e18c514e9c1ff330bec87fd62341251d041e7443
[2/2] mtd: rawnand: lpc32xx_mlc: Remove platform data support
      commit: def559a215699aa2f2d8ef98f30156b9d562a154

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


