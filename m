Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648E4D72345
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYMEo0lJGl7REAfQXhFdlsVI+yLc8z/mEs/ZbTq5VM8=; b=KhWEuo4B0trfClX61RH7GIwGcQ
	Xrg+9l8727cxB/hk5EN5L80v7MIZVjhgJOTtv3u1f9sx7nFxsZyueMBieDxaBnY3x9kI/Ygie3HzR
	BxeNMpRjdXf7RFpi4OMlqL64LXbDemfpyidzd4xL1Ss1V7yzc9zzR6f296mJU+ka5dSU0UNSlqFnW
	WsAxlorBP2SabDWz8c58/62+3+aFihjW/5ejEuxrkHDsHqT1CmNQ/HHnmnsrOqflppeDI+fHQeZMm
	2pOGpty0ch2r7oxL5JW5O7Dd0fsl+FXM8ydJQs41BQvJkNt0WpLnnszy+ejmzhL7hGATH1+q6wMrv
	uEAnAqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCfz-00000008UjY-3ee9;
	Fri, 23 Jan 2026 08:37:55 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCfx-00000008UjB-1jAg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769157474; x=1800693474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cm6DUjGv65AjQpL0tAuNheTXPfR6F+soqcbey/Xrz3g=;
  b=h+6rj/gz8MjS2GAjNKwJRtDuqL7f8sn3RdoeSHCTjob93YFCKZQ48txd
   ZUXfJo2J6thXIjvBMphid9adZ6qBgB0th3gCuHzucTmv/39FD3QKz/iDL
   /8Ovz9FI4S+nLGWNXcmIoogMnRYIRSugCO4pHi7fXCLekn6LC6RTaNlo5
   fi2UVhhG6FR54bECha7li41ez0aqBU2BxmkXihDCcl9pqtI6rF0US9/qg
   tK0ddRV0ENnueSMJQc2JzqQtMgeqIIEEaFx4avOAACOtw0igBt4UR0Hif
   fZ/7sXegLQqCHEvWU+J1fthjqcMf7XjYut8Ss+g3DTf3cmS35bg/sUIJ7
   w==;
X-CSE-ConnectionGUID: fGw2xX3qQcyoF4nQlgRH7g==
X-CSE-MsgGUID: PRxX3kTHRpapyL0IMoAs6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95879981"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="95879981"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:37:53 -0800
X-CSE-ConnectionGUID: I1E9nIyOQsGIDQEZJihH4g==
X-CSE-MsgGUID: wZjDcOigS6q5PBDrcxnuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244586979"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:37:51 -0800
Date: Fri, 23 Jan 2026 10:37:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] i2c: xiic: minor cosmetic cleanup
Message-ID: <aXMzXH4vvh3HK8wN@smile.fi.intel.com>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-5-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-5-eb7cd4254dfb@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_003753_462955_991657E9 
X-CRM114-Status: UNSURE (   7.88  )
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

On Fri, Jan 23, 2026 at 08:02:48AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Add a temporary dev variable and reuse it instead of referencing pdev->dev
> everywhere.

...

> -	pm_runtime_enable(i2c->dev);

> +	pm_runtime_enable(dev);

Ah, please also move this to devm_pm_...* in a separate patch or combine it
with mutex and explain that this fixes the cleanup ordering and simplifies
error handling.

-- 
With Best Regards,
Andy Shevchenko



