Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2391ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XXHX9ulRrInrv2cZN+5ZOGw2UyhQQkLHAaUeyYPVW4=; b=GFyWKEqEkhcvjH8GkOI6fRGjVZ
	+TAfwAwQ8860wbuXbptbCSFFzZsp9tsUSFNyI0CLjcYakWIWUB+ha9/Tb54NbmyKEg/1iEOPuXmSr
	naH6r4ixHJrjzgfVRW9Ly8jFJLgXgmIdOK6iK+MX4AYCDcDYsi9wVCuj7gldS2EFSfdLj2S8qBcM8
	HeQmMmW6vdE0O393cjTsIYo23uquhvRPTBcCowh1/F6YNQArxNHWRFUWzMLE1dBQvuExbP1eYLseF
	+DuLWHUuHbSBzWK5Ch9lPJrxkDiWsf6G+13u80HxLZqBAFN1JjUfqHLHZaQ7GRaekeDsZz2X8cQ3n
	XrDe3rhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2m9-00000006Vcp-2mE3;
	Tue, 23 Jun 2026 15:10:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2m8-00000006VcS-0C9z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3299B60120;
	Tue, 23 Jun 2026 15:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DCD1F00A3A;
	Tue, 23 Jun 2026 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227454;
	bh=+XXHX9ulRrInrv2cZN+5ZOGw2UyhQQkLHAaUeyYPVW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkbylmSsHIq6b0B50aHb0ytiNy6rOyM0dCXKoVqQDhSL5zzyuSrMQ0R1Os10ta34D
	 p+tRR0vOOaId9GfWDojuRZO4hubwWFI6ncEeBA84IK87vHmShMnSOYgfesDyDTIT+i
	 wAJHTP+MtNhnEO6MzoyIzdxmn04bnU+A6LSiapQNwTOoPyZq/XWnEXY7Cmc5VePRLd
	 DJA5xcRL8HT/kUKpyxSmqwBYWU1GgBHiMxWP8g04vw1mTw2Bnm8SnV+EUNQkQFRCtQ
	 +irNFZfk2Eieu5mAQQ0G7OmsNkok196jgFEIO3Ir7qfjItRt+/5a36BxVTci6jAUCs
	 uibbYvD/MjJ7g==
Date: Tue, 23 Jun 2026 17:10:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: nomadik: Use generic definitions for bus
 frequencies
Message-ID: <ajqh47hJVAvXIrZa@zenone.zhora.eu>
References: <20260618141730.3243303-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618141730.3243303-1-andriy.shevchenko@linux.intel.com>
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

Hi Andy,

On Thu, Jun 18, 2026 at 04:17:30PM +0200, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I merged all this seriesin i2c/i2c.

Thanks,
Andi

