Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A721D232C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT0Ih1iRdPe88eGH5FTor+nQYoAZY072HF0uN9CUCkw=; b=EzogGUSJminM2A9uRcw6oKQsxG
	hlEJ7mByTQ9KEschiMqIKS2cAtE6ISs2QiHvh5X813F1iopPi+FUgBv8gZFEin3jzUTYPxN+urpPZ
	90mtZUj/tzctxC45C0G2p137xA4s5huc+Zmv8g+OMOdQhaA86RLhqzFHOdu9xby4dktTcXhJhJmcg
	iV3A+ApNEVYcyDQJvV+0VB8TbfMDP6j0O/MkvfCDT/bSiOp561jkPXvkcZGUXxMrPZWcRggmTQ6KL
	mmuHHQPe5UajsjYbVHP7ek4dmmwFOp1kOrdhOuoJlepvQguPzmtD9ZUILEEQhVrfteAUkFfIPSkeo
	unJu52Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve24H-000000017VI-3IHq;
	Fri, 09 Jan 2026 02:17:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve24F-000000017Ui-0Yr1;
	Fri, 09 Jan 2026 02:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1987442E06;
	Fri,  9 Jan 2026 02:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394DAC116C6;
	Fri,  9 Jan 2026 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767925054;
	bh=+WVMphEXtphNalcDcHuuxSsvfBb3Fz9XJLJDOnptedI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNQMs7AsdrqZO5aScqtEhVrA6DXVXt79IPmJTlY5CBiAea5dwFH1etXcdB89lhIf8
	 Eq+A6AJaPMYImNjY6r7IhDoSgnyR3nLSOCb1WJdW8tZvt6u3emhRgbhlJkFqDbbTNj
	 XuabPY2D1zRwVBRAsoJKsBAxuG9WCy0TCiK9F1Vcudu4vpKeAdS/uaEIVc7G7WKTcj
	 +xpYwq/1MPPE5zMs81ktTOkBbu4uvROKe2BR49Eus2FHMysxuswB9m5aHTXzfTsYSN
	 d0oRvHT68PPp47dXqEm16ZwZpjRIR0n3Vir78HQ12ccAIo1IZUiSsOYby2VJ8w/a1x
	 7mjGU43Z33yfQ==
Date: Fri, 9 Jan 2026 07:47:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/13] dmaengine: introduce sg_nents_for_dma() and
 convert users
Message-ID: <aWBlOjXio8w492lC@vaman>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
 <aUFakHZL8viMN3WR@vaman>
 <aV9S2oAsIIIZoYnR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV9S2oAsIIIZoYnR@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181735_192703_FF4FE280 
X-CRM114-Status: GOOD (  15.88  )
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

On 08-01-26, 08:46, Andy Shevchenko wrote:
> On Tue, Dec 16, 2025 at 06:41:44PM +0530, Vinod Koul wrote:
> > On 24-11-25, 13:09, Andy Shevchenko wrote:
> > > A handful of the DMAengine drivers use same routine to calculate the number of
> > > SG entries needed for the given DMA transfer. Provide a common helper for them
> > > and convert.
> > > 
> > > I left the new helper on SG level of API because brief grepping shows potential
> > > candidates outside of DMA engine, e.g.:
> > > 
> > >   drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
> > >   drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */
> > > 
> > > Changelog v4:
> > > - fixed compilation errors (Vinod)
> > 
> > :-(
> > 
> > drivers/dma/altera-msgdma.c: In function ‘msgdma_prep_slave_sg’:
> > drivers/dma/altera-msgdma.c:399:29: error: unused variable ‘sg’ [-Werror=unused-variable]
> > 
> > Clearly your script is not working. I am surprised that you are not able
> > to compile these changes. Bit disappointed tbh!
> 
> This is W=1 build with WERROR=y, yet I agree that I must have tested this as
> well. Sorry, I will do v5 with carefully tested all modules to be compiled
> with `make W=1`.

I turned on in by builds after it was enabled mainline... so yes now it
is part of my tests

-- 
~Vinod

