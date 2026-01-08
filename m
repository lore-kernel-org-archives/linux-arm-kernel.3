Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4746D148AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rqCsmRtIYHW2VSwwYMVZbqgl3uFyWqrNV4dlfzK4mY=; b=bDGpTEeJvrsINyft98efxOwvZV
	/7ppvAPffhLJQXV/LAiGXtJs+xZ4Z//bFjTLX9SRJiRCW0gSzdqoso270Cy8hY7DyEhd6NysaWLa4
	hXexBiXZyZ9QpWiqQGD9taS5ch3xk7vrkHBuiLJN0v2S14MFy7g8Q2d5FBjKgAjF/+IMKzLAePjWw
	XbN8TzfDlU9mSTGuzO4LOxEfG5OMF6puBbG0qZVOptt0sHSz7EALXDso5ajycnrRRRWd3+xZ2OcQD
	ayLf+ZiFG1vLW8e+dnguOiULPiJ7PDp8YDONsRs2lfEH70VAcjQfnXh6XU7K03lBSZE+HMAHLMKJ6
	hYViZlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjnW-0000000G1I4-24dW;
	Thu, 08 Jan 2026 06:47:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjnT-0000000G1HJ-3Om3;
	Thu, 08 Jan 2026 06:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767854823; x=1799390823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tilklIxwMEG7LlBNKkCVNunz2O6wIypo2AidPBlAcXA=;
  b=mZmKTZmeZXze6DJveAvQDYAmg27ds2Pa2A9i13C/xI3w56qAx8TGE3oC
   7HQwK9VhZOxpAsd7hgi5o5t/XFrdjoB64FDJHKBMRi1V/0/VvlF7UGwkl
   FifqCC3SY0VD1waif4gAkIfZcMKS1NhqDQr6LmXz+h7zZEN85hXMFohS0
   SqKXLSjw3HRWTGKknN2fphqrCXbh3Ht1YUVvjN4lQyzjfaQzM22MhxlyH
   SoF2Xj3DDb0aVyEAjDF/OuUoMo/oJOws7Djn2+6BWpIThL/hRRSHgdd9Y
   utCDXuwttnU0XNks7BPBk9/zA9qoTeJr4g84BHms7yrxDY4zsx3w+pCEk
   Q==;
X-CSE-ConnectionGUID: VaUQv7QKTT+wbnFjCTIi+Q==
X-CSE-MsgGUID: B0jlSUZaR7CvMO3S7IqhXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71805424"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="71805424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 22:46:58 -0800
X-CSE-ConnectionGUID: /s35aiAwRTa/0aYKBclYQA==
X-CSE-MsgGUID: OsRC/1eHSSCTlgJZipdTHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233826495"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 22:46:52 -0800
Date: Thu, 8 Jan 2026 08:46:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
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
Message-ID: <aV9S2oAsIIIZoYnR@smile.fi.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
 <aUFakHZL8viMN3WR@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUFakHZL8viMN3WR@vaman>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_224703_901507_2206F0B9 
X-CRM114-Status: GOOD (  12.92  )
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

On Tue, Dec 16, 2025 at 06:41:44PM +0530, Vinod Koul wrote:
> On 24-11-25, 13:09, Andy Shevchenko wrote:
> > A handful of the DMAengine drivers use same routine to calculate the number of
> > SG entries needed for the given DMA transfer. Provide a common helper for them
> > and convert.
> > 
> > I left the new helper on SG level of API because brief grepping shows potential
> > candidates outside of DMA engine, e.g.:
> > 
> >   drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
> >   drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */
> > 
> > Changelog v4:
> > - fixed compilation errors (Vinod)
> 
> :-(
> 
> drivers/dma/altera-msgdma.c: In function ‘msgdma_prep_slave_sg’:
> drivers/dma/altera-msgdma.c:399:29: error: unused variable ‘sg’ [-Werror=unused-variable]
> 
> Clearly your script is not working. I am surprised that you are not able
> to compile these changes. Bit disappointed tbh!

This is W=1 build with WERROR=y, yet I agree that I must have tested this as
well. Sorry, I will do v5 with carefully tested all modules to be compiled
with `make W=1`.

-- 
With Best Regards,
Andy Shevchenko



