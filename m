Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E1EEF48D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0P3/8AmZhIee9lYLx9bmxzl6xhHUp56M6HvqyzjpOM=; b=qYghtlSiEgq1KVLF4xzXQU95cT
	lnCW472HCshewb2qKTvD2ptxX+JDQIqvfSP7rS9ChZ1PK3wcvUrjh77bnsMq1KXlRmJqvf4Jc3HlS
	Pd5nVRXJtFYTA/lP1cnkXWG2c0duIG0e0QSr38iMa2gAFuZ11KIESPBXIPdFawuWKP6Xw7Yc/paYM
	g9BNt3VBaonz9JpCd21RD3lYAXGuGzlr3udAIPfgb9cxmNA9pij20j1DDHNObJelP5BDFcq14R1Pc
	qeb5/6ZY65rXsrABYXPVdJkh/3z1aJVghngJWGWn7/2VyzaDliBc5yTzIawVySeL0LNqfLWXLVJll
	jk5tgcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruxK-00000006HCx-1vx6;
	Mon, 16 Feb 2026 09:31:50 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruxH-00000006HCc-1e1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 09:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771234307; x=1802770307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VqmQ8cU6ecdNri2hd0MgTCwaRZCbGcpQt8oiFnMymNw=;
  b=A0SObN7GmV88on03iEM6FR/u07468FOv0+i6yf34T6igxVQS6DJIi1kn
   GO6EhG9J7Kp95I4POd6KtBGLTGT4jskfeSLuBphT/zW6hnuiV/iiRM8SS
   VMwNFwOLcOql6HPislCJC7bgC/6wwGxdNVN//rMRdi/pl+4fc3SZ5obFM
   WHOq0TlVev7RGXYWwOU44Y0IB0vxNEQz/xPnb68s+fM9oReqiI4prt+Mw
   WXbR6sHNTFhehkTIBodWKUvGWxwJPiqejnRwazb8mPbS2pP6bJKToloG5
   4HaZ8wTWlFtvZQF4Yvb8pwfMbem+X0hj5mEArCwJ+2nccuZv+m6a8xqUQ
   A==;
X-CSE-ConnectionGUID: rYy/RkxYRyiwoItl/pZ1SQ==
X-CSE-MsgGUID: 3HUwvsn/RDWRumL0xNdeIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72355166"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72355166"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:31:46 -0800
X-CSE-ConnectionGUID: taENNqnyRY+eGYUhBVdZnw==
X-CSE-MsgGUID: XKK/X2j2Qx6WHX3pf0yeTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218104475"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:31:43 -0800
Date: Mon, 16 Feb 2026 11:31:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] i2c: core: add callback to change bus frequency
Message-ID: <aZLj_dGXOPzp4tMz@smile.fi.intel.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-1-fb2cbf9979b3@gmail.com>
 <aY8HfN3c3qcVbOJj@black.igk.intel.com>
 <aZLhuIfP7rh7o3MH@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZLhuIfP7rh7o3MH@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_013147_528958_15984509 
X-CRM114-Status: GOOD (  21.75  )
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

On Mon, Feb 16, 2026 at 10:22:00AM +0100, Marcus Folkesson wrote:
> On Fri, Feb 13, 2026 at 12:14:04PM +0100, Andy Shevchenko wrote:
> > On Fri, Feb 13, 2026 at 12:06:50PM +0100, Marcus Folkesson wrote:
> > > All devices on the same I2C bus share the same clock line and the bus
> > > frequency has therefor be chosen so that all attached devices are able
> > > to tolarate that clock rate. IOW, the bus speed must be set for the
> > > slowest attached device.
> > > 
> > > With I2C multiplexers/switches on the other hand, it would be possible
> > > to have different "domains" that runs with different speeds.
> > > 
> > > Prepare for such a feature by provide an optional callback function to
> > > change bus frequency.

...

> > > struct i2c_adapter {
> > 
> > > +	int clock_hz;
> > 
> > Why signed? Even inconsistent with the parameter of the below.
> > 
> > > +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
> > 
> > It's already a huge struct, can we make this compile-time chosen
> > (when I²C muxes are not required, for example)?
> 
> Hrm, many bus drivers (k1, jz4780, stm32 to mention a few) already have
> the clock value stored in their private data, so maybe it is better to
> have this value in a uniform place in the i2c_adapter struct and make
> those drivers use it instead?

Perhaps say it clearly in the commit message? It seems that commit message
currently focused on I²C mux.

-- 
With Best Regards,
Andy Shevchenko



