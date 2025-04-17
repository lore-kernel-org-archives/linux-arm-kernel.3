Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3B5C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKwH9BCEUQQC9ap3fQ+jGRNao9+Qm1VoxkvEg/LrTU4=; b=yetRjdurPENKqbFjv3b/0yhIHj
	ESFOK7HIofpazCICk/douJv25+fEV8/QaG2IcJp8hTYtNHW0FB1qaP/PD5trgghzAnxcqY/z3KaRc
	xXlLP73SheVFag1FGLXiRQanM68R82PjILyG9/XM/JJRS3wpocy01cuMSH5JAlrWMsJQL+9zfKBFH
	hL9MYtZIybBdEegx9QB+KSLyWAbbMzWdTTC7AwtyUddnAC8wzCxJnLK9b4IKeKxSZ2m00bB153WIM
	xaRjrr9ClbL2ij8i5GL+5QvXa5SEz94ZcaT7DMgUYMdBlJaMUOVUBTRR3umm6HJR3uVQojhxxfkxw
	C7pCgwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ttr-0000000E0h5-2wjT;
	Thu, 17 Apr 2025 18:23:47 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TcS-0000000DxwN-28B3;
	Thu, 17 Apr 2025 18:05:49 +0000
X-CSE-ConnectionGUID: nyF5fpmqReqk/jcL5/Tq4A==
X-CSE-MsgGUID: 3015vVe1S6CZmp22k8LufA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46532038"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46532038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:05:47 -0700
X-CSE-ConnectionGUID: jvbAVVcRTyWpNKwlXETWVg==
X-CSE-MsgGUID: tE0oBpFAQhGv3V7jEkqq3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130658952"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:05:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u5TcK-0000000DH8g-0xU8;
	Thu, 17 Apr 2025 21:05:40 +0300
Date: Thu, 17 Apr 2025 21:05:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
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
Message-ID: <aAFC9FsTRNya6eDU@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
 <20250417184716.000044bb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417184716.000044bb@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_110548_578619_169AD28E 
X-CRM114-Status: UNSURE (   9.46  )
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

On Thu, Apr 17, 2025 at 06:47:16PM +0100, Jonathan Cameron wrote:
> On Thu, 17 Apr 2025 20:01:13 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:

...

> > > Signed-off-by: David Lechner <dlechner@baylibre.com>  
> Also no need to sign off on cover letters as they don't end up in git.

It depends if you use `b4 shazam` or not. I like that feature.

-- 
With Best Regards,
Andy Shevchenko



