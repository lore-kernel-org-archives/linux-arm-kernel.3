Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE326CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmSkuL91S5JTeOMwcODWsgNYZazITVhdV6wqP+5D8Es=; b=p11Vh09K3fA0VH7LJZ2NRmLMMn
	KI42slfJaMLNgvj5vVjXsEHK+049EL1ZupVXcDlkq5pgqXgr71hJjpAXmtqFxrqdY/cWGFkK+Q3F+
	igKvP1pUwSECki702p776sjr8Oi+qmDOqAq95aNFJ2+ONXew04bbzzcFSCtc3nTJpLn+s4ZQ1HcSr
	SNby64Wjm7X04yfqElk5xbh0xaibNITi+3850mujvjrqYVhFIbnK3wuEPD3URNqYl0JhUlKvd7qTv
	0vEf6y4UXJ8+G0qLkerDuJQYw2juXsQf7Jsg9mJwuOUyti6ksi21XHfqgP2nHdRxibTFXPf1/4lJr
	1EPZolpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsNO-0000000EaNA-2B6i;
	Mon, 18 May 2026 07:26:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsNN-0000000EaMZ-1rPo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BmSkuL91S5JTeOMwcODWsgNYZazITVhdV6wqP+5D8Es=; b=oS5YY9TlmhdB96HFeZ+rNtPbdS
	6b0Lzkig749yReP+bwGIySLI56PVr0NVGNEMCfBk+Ni8otRsORXExHSZXTQPx9xFN1MYpIOKt+8Pa
	W6QK86UudYvqnRvurHe5sOUylKgpi/mIzK22Lem0flM9258PgNir+NVGwioMTIoqrFyRrj2CcaIwt
	VOcSv8jK6dobikiAbicJ56VtbXJx5Y4BsKuoH5oP27MHzEKR7dSyB997y9yIl3yTsbQlnsLDCKTQ9
	fjUWHVk+SRVcTC2AlrjgEH83uN2WnnGnWj+rdGGPjGfUcTL8kEbkEYrlMfAy3u1FsWXx167nYXh0n
	kf7NeYBw==;
Received: from mgamail.intel.com ([198.175.65.17])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsNJ-0000000AAGL-2foN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779089214; x=1810625214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t53bHA1/nxgmKznFl2xB1CX1LnkvFJuRl85dZH2IABE=;
  b=C1hwfQ9bwprd7IshQkJa/XY8jjWFC3wYiCXlQY/IzYTd1hagfbpfl8vr
   oo/PcpmEko30ffCeyndiQ27W5t02HeS88mBQr2UEVsPS5H+HoAnXwX495
   0zI07A9Y2XoYBLL9JuufEjMS8m/EVuHlILc6YxLZ9PFbaTJdbeFC9WY9E
   t/NrtXr4+5PgoEwrfMZCDc3GcTNffqeKiPuyvh05n8OvIpjj6hohDqQkk
   hnOOQUVDM+Gc8iqXl3fkBMSanNIQvqxKmr+IPPa4ba6/VdlIUnv3ECdAV
   T5iw64iBOvfjzjejE1B0zcYIleheMdMHfKOLVijhRLTgpBY7PikMogACG
   A==;
X-CSE-ConnectionGUID: k2Ry0M0vTayJiVP4TqNKIg==
X-CSE-MsgGUID: 79EiewdPT72cV2egRyNa7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79914925"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79914925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:26:51 -0700
X-CSE-ConnectionGUID: 1zI6GwacTxqeoB8ZnGOasg==
X-CSE-MsgGUID: +v/e/I8qTTGyxw8wKlu63A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="235113416"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:26:47 -0700
Date: Mon, 18 May 2026 10:26:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
Message-ID: <agq_NJfR7aLA-gJu@ashevche-desk.local>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_082654_702169_A9F7E1D9 
X-CRM114-Status: GOOD (  15.77  )
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

On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
> While looking around the code, I noticed that there are a lot of places
> were we are manually filling all of the fields of an IIO timestamp.
> 
> This is error-prone (as seen in the first patch) and more verbose than
> it needs to be.
> 
> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> macro for doing a struct assignment. This does require a cast, which
> makes it a bit more verbose, but we were already doing that in to
> drivers, so I went with it anyway.
> 
> If we want to consider alternatives, we could make a iio helper function
> or macro like the first and second patches did.

I like the series, just incorporate my patch, test and issue a v2, I will give
my tag.

-- 
With Best Regards,
Andy Shevchenko



