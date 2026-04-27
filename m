Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F0FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ser3eieeOnNkgLnvZeJ1R6ajCFLeZD4XVZuYnkwDiBY=; b=RJjijbVJFnyo7FuKGgQ4jabeXG
	CBAlVnE/WE3zXj/W2EFjAP0ooA96QQXJUMp35dLuP0Uqwt5MbKypLSEdNY8l9YdjQb4bwvqrKqY8w
	qKymuwmDwY9VTgOsPa7WjrHWsiOHm+4ZGAHnzYlAu2dnOC9rklMtJnxGEXQCXOWCOiovCM+87gRdm
	ut5HdFoidRnclkvI5UUiXSHsGdb08w8mj2fGNBNUEGMzZF+Z6WuvPxDdRWsz7pM3AOthFP3bs6qnH
	9MTY091DsIdLV2TI4l6XOBn+zBB1ksmIgUBn/uWk463R2cRCAaxFsKGg6mkAqUB18jy7sDG9G3q/I
	sM+edJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIqg-0000000GeiI-2Y1d;
	Mon, 27 Apr 2026 10:05:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIqe-0000000Gehs-21nR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 359AC43731;
	Mon, 27 Apr 2026 10:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E57C2BCB4;
	Mon, 27 Apr 2026 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284352;
	bh=iN3RRfDRMGCCfBob1PEuXCevWsmAld3vlfxzFx505ZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pJHgM31xuoP6R8KfaT8wg7EUB42bfO1I6+x8uTP9GyF6tnua1kODX5VH0s42RUMhC
	 sVDD7A5M2Y4Pxc6BMrXeC0j3gpac3nGtbSmTk3Ny1Ui1nMCUzLYJs02hF2CJ6OJCl8
	 HzT+mFm3QZSOVNEZY9Awu3qng4hlZ6/Ahzq5Prq2Ej7R0/VgLOXVDi61VLzJJ1HSX3
	 dSnVumV16H/+oslJTsDU4lujHKmbhLcWJ/KD0W0aiOWTiAupFMXbuThgJy8++X1sxZ
	 lV45EEy4Jjhc9MyMTzwczk0shyuERypSahKWq9aAYtRmitp+1OvuxyyXSzTDmSFEQK
	 8BdT2lPLLPjJQ==
Date: Mon, 27 Apr 2026 11:05:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Caio Morais <caiomorais@usp.br>, andy@kernel.org, dlechner@baylibre.com,
 michal.simek@amd.com, nuno.sa@analog.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH 1/3] iio: adc: xilinx-xadc: remove unnecessary includes
 and add missing ones
Message-ID: <20260427110542.1dd0b855@jic23-huawei>
In-Reply-To: <CALoEA-zz-2cG7SJr1iKNQ0H81TVMXLQh3omkxJc9YRW673Kqqw@mail.gmail.com>
References: <20260426211834.3318306-1-caiomorais@usp.br>
	<20260426211834.3318306-2-caiomorais@usp.br>
	<CALoEA-zz-2cG7SJr1iKNQ0H81TVMXLQh3omkxJc9YRW673Kqqw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_030552_590488_5215F9B1 
X-CRM114-Status: GOOD (  14.43  )
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

On Mon, 27 Apr 2026 08:42:55 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Sun, 26 Apr 2026 at 23:20, Caio Morais <caiomorais@usp.br> wrote:
> >
> > From: Caio Morais <caiomorais@usp.br>
> >
> > Signed-off-by: Caio Morais <caiomorais@usp.br>
> > ---  
> 
> You're missing the commit message body. While it's understandable
> what changes you've done in this patch, it's good to expand the idea
> further (what you did, how you did it, why you did it). This goes for all
> of the patches in your series.

Also, why only this file of the several that make up that driver?
Looks like kernel.h is included in xilinx-xadc-core.c as well.

I'd talk about kernel.h specifically in the patch description and
why stopping including that is seen as a nice to have.

> 
> > +#include <linux/bitmap.h>
> > +#include <linux/errno.h>
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +
> >  #include <linux/iio/events.h>
> >  #include <linux/iio/iio.h>
> > -#include <linux/kernel.h>
> >
> >  #include "xilinx-xadc.h"
> >
> > --
> > 2.54.0
> >
> >  


