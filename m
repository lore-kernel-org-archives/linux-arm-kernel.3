Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694EFC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRcdsk3TvN9DaRVrtf6cpw/TXDjhWY1fpqAdozY9Je8=; b=pAZ+LdmKiUmYe5ylUA93N2b/nU
	xr+7B2o3MrplqUfIWPO9IflPQWvKSI4XPl1TsRWdogWPhsee9tJ96GAAUmPrkHGD8CGTvTVQREMBj
	Gx6duUpY+3No988Jzez7IFqpz7dAXL8Apsqis6/WGhO8b99/HPuJ2aEyC0UEbrtA4GbUOAKAsqtlZ
	0lMxTWlPZw9Q+vkgP36TNsk1r/C3Hvoreh+tzhoHVh4JWxsj0LasW3rWcvwFxGQeKNBx02xKb2ADu
	n98AqDfa1cu/29tgbLU4Or7fXbJGLQpHA9BZj+eKtHEjGpQLhZGRpHjDoF6UA/2CdToJqq0PyrL0h
	bSyfw3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pGk-0000000ATLc-2mCb;
	Tue, 29 Apr 2025 18:01:22 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oCh-0000000AKL2-2fzV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 16:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BRcdsk3TvN9DaRVrtf6cpw/TXDjhWY1fpqAdozY9Je8=; b=CbMj1bGv+IDiuOe7R1UP+3WL+L
	Ydm6RfJ6+DMJ8mQuvD3ph9vGzJqtzdNisv9ILwwp0UPRwqY5Iow3eeD256Jt8SIrTHzGfTTOJ355x
	B65qbfTWCcMCK7XdV7tm6xkxgYJH19FqETb9tk8uyJGeGNhwbwg7LFTCbsmGH846xIROGXrQeYUSr
	XNiDFqKxjj2ZQmYEFaaEctxRGJMEJ7Hg7SomZUyc/0/23P/pEegMfVpF0pCJKpRC6z3W9VcuKkz4X
	SVnl3pPRFQS1wPd9W8H5FpdAvbU3KVYaHMJsVrNPKND8CoKBGI4rJ3H78bv5UTtNwOvjWdj+conKe
	onqFKxrg==;
Date: Tue, 29 Apr 2025 18:52:40 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jerome Neanne <jneanne@baylibre.com>, Shree Ramamoorthy
 <s-ramamoorthy@ti.com>, Mark Brown <broonie@kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: tps65219/am62p kernel oops
Message-ID: <20250429185240.6a7644bf@akair>
In-Reply-To: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_095307_683376_17C0E0A7 
X-CRM114-Status: GOOD (  10.56  )
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

Am Tue, 29 Apr 2025 15:21:19 +0200
schrieb Francesco Dolcini <francesco@dolcini.it>:

> Hello all,
> while working on adding support in mainline for a new board based on TI
> AM62P SoC I noticed the following Kernel Oops.
> 
> This oops was reproduced running current Linux
> master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> to reproduce the same with 6.14.4.
> 

[...]
> [  +0.000022] Call trace:
> [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80

wild guessing: maybe because irqdata->rdev is not initalized in
_probe()? At least I do not see where it would be initialized.

Regards,
Andreas


