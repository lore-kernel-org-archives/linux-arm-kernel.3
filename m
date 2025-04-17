Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F3AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QijNO2ZfnOjSWZjNpJ3nyzPtxrLlEgywLxU2b89Sce0=; b=zg/4vDgmXecvP5ex4awck6PyGn
	mZMsb9olxnPyPnMi5zdU++IUjv4ZltZ6cn1ALuLv5tDoF/HNQhaRqC3qsf+lzsx+6N0QEJKpCpmrF
	UIsKCb9m1yy32lzJ5GgEA7ND19i8rMUK6WnpAWwjC5GitW+2rvAUydb0EuI25bPdzczkn2+0elbDN
	N0drx9ONJVYGshbQN83t34ohG8Fd8EbFUYXkayvXHFsCbvNcYa5y5PeKmeJqc5ide1HbCHwwgMIlF
	BpiJN3Gqs3GJ6o9Io6a45iBnFvkvqkzCMcmZHq2Ksu3gSuLTgG8rtlhuPk+ioE8d4zcXsyoG4LNpf
	BVqNy79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sps-0000000DnrO-0dCb;
	Thu, 17 Apr 2025 17:15:36 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SeA-0000000DleI-2dLZ;
	Thu, 17 Apr 2025 17:03:31 +0000
X-CSE-ConnectionGUID: Rz4zmINwQCq+ytj8KAH4zA==
X-CSE-MsgGUID: 35ogmEeZS+66BMzRZ7iFZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45752722"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="45752722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:01:20 -0700
X-CSE-ConnectionGUID: qOifIojCTIq+nHVmW37Phw==
X-CSE-MsgGUID: OZhLABtgTd29swPzawq8jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131754336"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:01:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u5Sbx-0000000DGCi-27qC;
	Thu, 17 Apr 2025 20:01:13 +0300
Date: Thu, 17 Apr 2025 20:01:13 +0300
From: Andy Shevchenko <andy@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
Message-ID: <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100330_671618_B73C3804 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:
> Wile reviewing [1], I noticed a few more cases where we can use
> aligned_s64 or need __aligned(8) on data structures used with
> iio_push_to_buffers_with_timestamp().
> 
> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/


Link: URL [1] :-)

This will help to maintainer with b4 as it manages tags.

> Signed-off-by: David Lechner <dlechner@baylibre.com>

Reviewed-by: Andy Shevchenko <andy@kernel.org>
for non-commented patches.

-- 
With Best Regards,
Andy Shevchenko



