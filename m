Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E4C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIjSaH2qDdkCSHieb+XZoNXpRS5zd50zbn6XMOO3lBM=; b=f8KjRV6d+P8CWqKRtnPZbs/YF7
	L/z4kj2tWcXOdRm0cZTRkBr7W/qZPUQ3Opu57/e4TTIAgxK2Wm0cVpBqycFuxq00gfNAZWk9cxYQT
	pKNcIKA/WNvfwnMRL+iGfRTd2eFu7Wn8rJJdnUg5Dc+qyu9KuHYjtfdSaPPu6SUNmlpyVO/oTBlIO
	qC8FXfm+6B+RXEk0cr8/Eqkh4chMawXp0sx7ots3hRumRmQU6CS0OwHNHBp11uB8k90Qu865bMpeH
	dSFPlfJ2EJP3MYtkCrXAX7PdIIHaqXndh94IWpbK486hZeLxeNAs0dciyq91hZsSfulUvIcAoetFt
	eGcU2Jjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqZh-00000006ha9-33yQ;
	Thu, 22 Jan 2026 09:01:57 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqZf-00000006hZo-384e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769072516; x=1800608516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0PLhBGRCcCQ6B4NkqwzugRep/KhDaHErzomQNLHyNBo=;
  b=ZOf/BcIt3t5dktyUhjbtJAG7gbIoJYMdhFhIE6gAAbGgSzL4Dlz32sNZ
   DzsW3UNrKyMuPIhamEFA9pfGmQxnLE32V7CZ6GekqJk1rCxJyF0qhQs+0
   lMPp1115F5ABIi+661lsVjp74+A39TpfB7nA7wEIq7BgEBI5jIff4Rjvc
   YAxcUfngLKCbiarH6YsfGsVXIDkiBOwbQb4+lp/nLVTutc+Xbz/lbgDoh
   /Ih54LpH6QH9/9ksOX+kYTauIRWgjBmoN2vvMCOl2a+kyjWfjWAzjuUnN
   Kvohlax8dsLNMzPlTRDOGH/UR8CmN96/MAlsKCfRclM5xxpB2swiRlsz1
   w==;
X-CSE-ConnectionGUID: cCCYxHwvR3+G2PPdjzBQAA==
X-CSE-MsgGUID: I54ySNWCRXKdiK0moX2eTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57873613"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="57873613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:01:55 -0800
X-CSE-ConnectionGUID: mYHlDwRGS3ymDiM1OUGzww==
X-CSE-MsgGUID: T+lTUCIST0iYTuO+Xq/YCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206732450"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:01:53 -0800
Date: Thu, 22 Jan 2026 11:01:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: xiic: make the clock optional
Message-ID: <aXHnfhUU6vSoFVok@smile.fi.intel.com>
References: <20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai>
 <20260122-i2c-xiic-v2-2-134f5d743e8b@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-i2c-xiic-v2-2-134f5d743e8b@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_010155_794156_D05B6E9E 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, Jan 22, 2026 at 08:32:32AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> The xiic driver is designed to operate without explicit clock configuration
> when clocks are not specified in the firmware. This functionality is
> already implemented in xiic_setclk(), which performs an early return when
> either i2c_clk or input_clk are zero:
> 
> This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
> returns zero, allowing the driver to rely on hardware-configured timing.

Hmm... Sounds to me like a fix to the early introduced feature.
Might worth to add Fixes tag and make this to be the first patch in the series.

Either way, LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



