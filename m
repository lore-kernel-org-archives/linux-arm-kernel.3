Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B854606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvMAISpZ;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WY4e46D7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qu1OlUuaRDFlDngoDiRhq4xzHcO7QBQYm5qjE67JrgY=; b=uvMAISpZFJhkfKppgCpzMTa9Pm
	/8V0S9NwZY7JSmDSFUViUkhhm7y/jXkXmWXE6jfvFjPdEXoXxx1b7ewsdUiHViSej6F/NX64uckye
	C7Q6dym8/btFT19E2x7sumCwac+Q3H/g86vrSnInDsrhcqVtkmVhO88LiZXfV174DS9LqzIX0z9Wt
	RUuo1prnHXOOoGCQiaTasQULMF9SAh3qktnDhk3qzmH7fcIXDY45otXDFIW2zwTqTXQA8OgPSGXMP
	LKnXHFWuAYi0+veD4RNX+dIRA1Hwon3Z1WR3tHpUqcKtUpuZTMwPzN1TQj94h68AwLy/YWnd/sZdi
	NXfMa5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjoY-00000005K1Y-3F9L;
	Tue, 27 Oct 2026 16:14:18 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjoV-00000005Jzy-1XjF;
	Tue, 27 Oct 2026 16:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793117655; x=1824653655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/EeG6Un8Ew9yYVEz+bcUHgerwRj3Ogob05Pvjxv/B0=;
  b=WY4e46D79qkOCa3TMpxItc6joXI7RdecUNmCdA4PDoUtijwRZL87erfD
   tqjny3CR2Srr4M2nQPs3yUiWtqJmvFpnvCqbIOJ1ZMcWlYKS1YFmsqb9m
   3FYWAdt5vaaoEB3lqzbd7n/Vb6V0vfePlAds2n5tEE6XjwZ4wxxnqa9Na
   5xphWlnFYA/CW9Y/f+eRmb41pXoqVoF7wloIBvxHUJYUtEKpyZF0cp1zY
   W+74rfqDtwl04p7H8Gfx8q/R6UZ55DECAadaKFiEMe5mmAmJn8Pw0THVP
   w2pf3IgnKO1HOsoERnpdDJqXmh1lNuHnSDlkBEr5ey6S2bZSyZ6C+Fym1
   A==;
X-CSE-ConnectionGUID: IjYsmu89TsCxiwObTmkz5g==
X-CSE-MsgGUID: 9WhBzOdCRvKaV+G8l0c0Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1707025"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1707025"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:14:14 -0700
X-CSE-ConnectionGUID: TS+4d6eWTfqTWtJrLJF+jg==
X-CSE-MsgGUID: o5OAIKV8QymUal4vL+gcqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4545393"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:14:08 -0700
Date: Tue, 27 Oct 2026 18:14:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
Message-ID: <auDNzWMPy0VQcazt@ashevche-desk.local>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-10-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027124954.110697-10-zoone.rupert@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_091415_446004_4BB44F32 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:
> All of drivers/iio now builds without context analysis warnings, so
> enable it in every Makefile that builds objects, replacing the entry
> for dps310 alone.

...

> +++ b/drivers/iio/Makefile

> +CONTEXT_ANALYSIS := y

Can we reduce the churn to only adding it here and do some magic to propagate
this recursively, please? I truly believe it's feasible to achieve.

-- 
With Best Regards,
Andy Shevchenko



