Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FEDCD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sdj05aVjubyRyarZQo/HaMsFhs/qxMG3Rw3z3n07hDA=; b=bvDVDMy0lY2msz8Gfrw4xtp8um
	w6IyNVitzqro2yla/bhLUNRvwICG0SK3ne3HgfaOa/P71+T0p33nGAa/NGpyVfsJ1P7+GKgprqY9y
	t9D3edj6DtG6znDLIYpiqaVtMpuIDCxRlwN1nm/sbVK62eIolz6SNL07AApDzJefXy93F2XlvTSQS
	HwWwq+uy/i1mIryvHEQqSCEmnzQQncRlXVwCKR8ftLE8UUPFvUw6bVZfD6a5qvgsw7gYZ7mn6A9Yx
	38EGWkLDVTQEIn3duKFBdIWJayL4Q3iTBPDi81KTjk6eVDK2tkwT4217Ln4fiU660BMzYhFUIOaqb
	zdOuLHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULMg-0000000CeTF-3IiB;
	Tue, 02 Jun 2026 09:24:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULMe-0000000CeSZ-43uN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Jun 2026 09:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sdj05aVjubyRyarZQo/HaMsFhs/qxMG3Rw3z3n07hDA=; b=bQLg+emC8n7GPb4cK+8OV6rt54
	nENwx5cOBft4NEqztAW5IbeuyW++ofdxk6kBvJ6FLlXTsbLclxA8oZMDaVu20Dxqw3w3jfZ2IhfQh
	ejN3zwflHU/xaIHBCZ6j/rWkazbVI/cnIvgYsBXdpP7SM8PY856cu7DwLnrZRqTnfRmDZ0tDxBZkj
	Ioa2gfl7NIbToGu/0jyABksAZ9wZFga1o/4xgFs8i3Boa4PlHrfTjK6rtqtyy42PwdzkJ526dJMVs
	liZtsHvMmvRt9B34kPIjRVFdQbjwUOy5DXMKg3xPEIKAYObuYrb9AM/QIYzBMRLEO7H747KOvx6Ik
	hBfSALNQ==;
Received: from mgamail.intel.com ([198.175.65.21])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULMa-00000008sLN-3WTX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780392285; x=1811928285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dmW9oDcU2mcbwI8dPNWwDJs8S3z5iYkuegCzVTuA9XQ=;
  b=Mdk3GxY1mRkD/I6khIakO5Z6Jmw3E3DQI4I8NAQ/aTsJopk6SMUOt0/Q
   vMUbjx0oj6cKTgiqIjaypw/fQSvvIaGn2KEHDaQ7JnmZZ7vTbBKHrp5rh
   nSXN6ii2fE1Q7GzG2jeItz6q09j20o77ffTY1LG+5nyjN7ibHE6x5IAFy
   yU/1sQPUfghbmnK5WUvVKhJWiPsZhCXZS2WY2+EoJHhCnf4KFWDJMCbXo
   jopmiP4Rw2zmGQBslEQ4HmlzZvsUq2CyzovW75B7pFONTiUlseIYzzOsG
   nol2QwEM9P1uByPgp7JWxDj50FT0WGdSwQehqmnwsgjXLi4QPgxMWHc4P
   w==;
X-CSE-ConnectionGUID: Usnj3doiTQWci/gpPgEvKw==
X-CSE-MsgGUID: JgUVhYV0TLqrIrmweYjyFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81072267"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81072267"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:24:42 -0700
X-CSE-ConnectionGUID: 77NfOhEcQD2SfDz3F9aTng==
X-CSE-MsgGUID: ngJI9wi+SQ6GlRwtWahacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="248940582"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:24:38 -0700
Date: Tue, 2 Jun 2026 12:24:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 04/11] m68k: defconfig: update stmark2 defconfig
Message-ID: <ah6hVLn_OES-ql9j@ashevche-desk.local>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
 <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
 <20260531165155.13e586cd@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531165155.13e586cd@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_102445_807867_F1A5D0A6 
X-CRM114-Status: GOOD (  11.66  )
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

On Sun, May 31, 2026 at 04:51:55PM +0100, Jonathan Cameron wrote:
> On Sun, 31 May 2026 17:25:57 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:

...

> > +CONFIG_MCF54415_DAC=y
> 
> Sashiko makes the reasonable point that this symbol doesn't exist yet.
> We don't care that much as they make different paths anyway but generally
> I'd make sure defconfig updates are after the symbols are added.
> 
> https://sashiko.dev/#/patchset/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd%40baylibre.com

There is even Bugzilla report for dangling entries and the ongoing patch review
for adding this check to the `make` menu and some to checkpatch.pl.

TL;DR: This change has to be fixed accordingly.

-- 
With Best Regards,
Andy Shevchenko



