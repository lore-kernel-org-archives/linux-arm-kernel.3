Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EB1D72349
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMCfp4FUnFMuhn7efLCyt0/IeCGGzEzE57l4hc/NBfU=; b=Q6W9TWgEWDgUgacOdJyq2pF6O8
	yvr91mKqcK1peOg1NLVjDfg5eeNVv3NBsjqClERJQT6s4cbnwP9kHUdr3Ftp9BoXNQmVDzbfjGv2z
	nDmpzgmcDllwYBIa94Ii94Q8xFSi/VOFccqwZpQ3poyeTmkWq2+rSW3iFjlcyvgqcuAlo46ivGb8/
	O/WUJ1u1BZl2trpSkg5F5kb39XprF+zXUUUxBsBJ6ra+LefXuSBKppvvCctRMRRfdAnf9SmYPtvpa
	vCwsW3WgvQ+UpTs5BMnfIgaIdoipBf8Tsdi6nZP74C6y7tM477UFr/PR5orEJZe83OFJHZcPQWHt/
	s9a+Dzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCXb-00000008TLn-3njf;
	Fri, 23 Jan 2026 08:29:15 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCXZ-00000008TLO-0HJo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769156954; x=1800692954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+FO1sOyryoVaL+5sM+Kc3yiCES2ozS3s2AkTaIZ9ALU=;
  b=B5mJiQaic9HGXGRXORM99q67wpdD5PumtlaPRiOGekjTayzKwUXXJFCv
   HYKF9Rr2MW+XJxeCUl1lXVeNQZ5Mz6AFASOdQ5U6iQvqRoUc4OyeybWVe
   KnSkp2Cq1ornoBbIirfixDHqaNFFR7sKansb9FS/Dj4n0hxlCuSvpMgnB
   3E8hwUHLznEjlc5bt3DDqcw6T3Z+Y/PiEIL+qT5WDQ9aQlwtVaawHbMyL
   i4yplXYxX54MDP9OquEbwLxjV0CpfasVOyS4ZYlw90NfkdG/fqRYdcy1o
   POh6cmWHG8gKnpfIZU7RuY+LxesoKfJCcjbbCTuNDcKVJcUFRYmaldQ90
   Q==;
X-CSE-ConnectionGUID: Pdb9nGWuQiSbXxQg7HDc2w==
X-CSE-MsgGUID: a/nhNpN4TOSsC/ESCdyNkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="80714490"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="80714490"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:29:13 -0800
X-CSE-ConnectionGUID: bUbY8p2ISkaKRR8vT0t7sw==
X-CSE-MsgGUID: DK67XXI0SJW3+VLCKZZNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="229930151"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:29:10 -0800
Date: Fri, 23 Jan 2026 10:29:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] i2c: xiic: make the clock optional
Message-ID: <aXMxVK5nGjeO1wGX@smile.fi.intel.com>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-1-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-1-eb7cd4254dfb@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_002913_139690_8EB39B9A 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri, Jan 23, 2026 at 08:02:44AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> The xiic driver is designed to operate without explicit clock configuration
> when clocks are not specified in the firmware. This functionality is
> already implemented in xiic_setclk(), which performs an early return when
> either i2c_clk or input_clk are zero:
> 
> This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
> returns zero, allowing the driver to rely on hardware-configured timing.

...

>  	mutex_init(&i2c->lock);
>  	spin_lock_init(&i2c->atomic_lock);
>  
> -	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);

You also need to have

	struct device *dev = &pdev->dev;

in *this* patch.

>  	if (IS_ERR(i2c->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
>  				     "failed to enable input clock.\n");

-- 
With Best Regards,
Andy Shevchenko



