Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02FE606EEB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZ/fiVRg;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OPJUJHpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8KzZPmQWKpFfwedrWal3j0q/tss3h22tq9Xd8BFMIiM=; b=aZ/fiVRgZt6snam0qFTAHC/BOk
	PPWNP5V8GDvA/zyjNFOH5q4gC0j3nQRrAaRIUrlrcTkFGC4eEt18WOxlftTW/bo8/N5P7pEw4FoCb
	POLQobHlduvghr5po9h1ikW1sIUVFHP9ULF6uXXwGH+/S1mW0fIAgMl4R/xWwrK8Kkuy8xnIDwA9b
	JOhmYr/Du9bmToGl4xnk7/xAMcYuTMZY4nMd8oNaQ9pZriwGYG1phjPXgxAkyjFI/RjPyrv1OXMv3
	m6AdSbET/bQ+mB1j5rAXkZtexjST4sRJfG30FyyltyMD4KFyA3M+qZViyG56njWphLrnLMKbJvEdx
	Lemx0kgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBRl-00000001sv0-3yD7;
	Tue, 03 Nov 2026 10:08:53 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBRj-00000001suc-3JvJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793700532; x=1825236532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kWj2t1Xhllg559lUzgTByeT5Aew6Be5zNCiU7VYPYLI=;
  b=OPJUJHpcIOY1zVhZgKvBAOrUFmNK7H2iAcY0XoyTLNqRLecdHesWg2aQ
   sHhflJGcQ6QOFrMvNgIVkaQGWXA4gaiCZOBvspiO0ipFXCBxEjE2t2YD8
   +ICixfcyOZi6Z5g3xbnPKh9v7itxvi8tOfHYOgQKmWNjC7XUC52BNGS17
   ZkL/uJ1IMP7gTTcWb3jiwmLOHXv/0LGVbrWl7JkD5n9uvh+UFnrT77Le3
   j6tRKkPpE0AMfvgnW5v7f3bG9vvsvU4B0Jc0/ojPlnXVqVrtxyrzW9BSn
   3akIjEQztithiocy/63KhwRP0zYPTtzVxrvXfxxRU4w7ny5VonQRpI9EN
   A==;
X-CSE-ConnectionGUID: pbSqp6pJQkCCpLyh+NppXg==
X-CSE-MsgGUID: nFEJI6MCRo68+b9nZqb6yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2309020"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2309020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:08:51 -0800
X-CSE-ConnectionGUID: X8d6gXcVSNu49kSHU0duXQ==
X-CSE-MsgGUID: h1JahsWBQu6jcpYKNxKbtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6243167"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:08:48 -0800
Date: Tue, 3 Nov 2026 12:08:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH 2/6] iio: adc: versal-sysmon: validate temperature
 hysteresis
Message-ID: <aumyreagvU6zewKI@ashevche-desk.local>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
 <20261102122112.1723130-3-amit.kumar-mahapatra@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102122112.1723130-3-amit.kumar-mahapatra@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_020851_877301_1F69D8F2 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 05:51:08PM +0530, Amit Kumar Mahapatra wrote:
> The hysteresis written through sysfs is only checked for being negative.
> A large value makes upper_mc - hysteresis in sysmon_update_temp_lower()
> overflow before it is clamped. Reject values above the full Q8.7 span of
> 511992 millicelsius, and name the Q8.7 temperature limits so that the
> span and the existing range checks share one definition.
> 
> The cached hysteresis is seeded at probe from the threshold registers
> without checking that the lower threshold is not above the upper one.
> Treat that case as zero hysteresis, as negative values are rejected on
> the write path.

...

>  	sysmon_q8p7_to_millicelsius(upper_reg, &upper_mc);
>  	sysmon_q8p7_to_millicelsius(lower_reg, &lower_mc);
> -	*hysteresis = upper_mc - lower_mc;
> +	*hysteresis = max(upper_mc - lower_mc, 0);

But you can use abs_diff() and let it make the problem of the supplier.

-- 
With Best Regards,
Andy Shevchenko



