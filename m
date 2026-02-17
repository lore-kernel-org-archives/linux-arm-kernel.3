Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF25FE68150
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/F8hAd1HStlgO6NoQa4tWXM58oOwGdNUBAreG8PEGU=; b=h7641Z6CiB/qk/PuTqTgsWDhLK
	94HnFuimLKmp2A2fPipjidGGGAJN71UHfSRnpQb0MVCqf5ByYuWqqVh48eSnujfnt+v0BCsfKKmSo
	+GFJJPfqm72/BxlQtMzbM/t6mnIGlLqb7LbiY4CjiqqvOxItXEcrzeOg8MY0cbmV4sTVJppwLO06V
	/drYfFZzL2FFTpomH8AwzlowJDqzdueTW+QEk0gtUMwZUAS3YKF41aO1S/qMHryxop5ZSGfG4QZsz
	piMxiCS+LjxMc8kUTYy+7vGdaU0cXcdGM1g8SPxdUm7tQ/W6Z//aLkuW7BlCCc4mVAViVdbLz0sVy
	Kgr8xFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH37-00000007uUb-3m7I;
	Tue, 17 Feb 2026 09:07:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH35-00000007uU7-0S6l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771319235; x=1802855235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ln0VhtZ3sIvknHl0ZEC4xZsk+Rl4aVV2gCMAIOiv+ZE=;
  b=ewMTdIMUgx8Kk2ddq52Ns5098iknquoYyqJNMoxYHpU0AUduQT8QbSCi
   Byy4I15Jtnr7WYnhb4VG+WIJRHawyJiIiIopOazfzyYEobBwA+5eanv3L
   qmAR4vb+2ZJYPyMnzHAYVJeFLk0moXNXt9M9Yfl1yTeAVRRtYGZGedyIC
   BQemWi+Hiv9TXdvtZaU+NPJlBZ4rKv03yMk1GfEll+zj1JwmuQxKfpjaT
   wPjg5Ta7ebOZIEwUvTPRMn0XprTWDw/lF9ZFJsdHA/M/eBwGAMkPSVDPK
   Qd93B+/xI2ZYQV7DCuRYImaeUUZKbnhouGjeebFgtUy5vysTMvF0egtOh
   g==;
X-CSE-ConnectionGUID: KXb6yzPeTj2cWo1XBIPyvA==
X-CSE-MsgGUID: NYExGmxDTUqhkeXM/ljzYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="95013922"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="95013922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 01:07:11 -0800
X-CSE-ConnectionGUID: k6EUy4e1RKaXQQs9+1QYzA==
X-CSE-MsgGUID: EvXkSzkDRG2ikYJlg5DILw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213657526"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO localhost) ([10.124.220.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 01:07:09 -0800
Date: Tue, 17 Feb 2026 11:07:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <aZQvuh1KEAWFSdRU@smile.fi.intel.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
 <20260216-i2c-mux-v6-3-9be28ecfd7e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216-i2c-mux-v6-3-9be28ecfd7e3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_010715_184036_A3BA6C35 
X-CRM114-Status: GOOD (  14.77  )
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

On Mon, Feb 16, 2026 at 01:38:15PM +0100, Marcus Folkesson wrote:
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
> 
> Stick to Hz.

...

>  	/*
>  	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
>  	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
>  	 * to LOW ratio as 1 to 2 is more safe.
>  	 */
> -	if (dev->bus_freq > 100)
> +	if (dev->bus_freq_hz > 100000)

The 100000 has a definition in i2c.h....

>  		clkl = (clk << 1) / 3;
>  	else
>  		clkl = (clk >> 1);

...

>  	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);

(Why not using i2c timings? The I²C core has an API to parse firmware properties.)

>  	if (r)
> -		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
> +		prop = I2C_MAX_STANDARD_MODE_FREQ;

...like this one.

-- 
With Best Regards,
Andy Shevchenko



