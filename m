Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D6C606A824
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzLNuwnA;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GXotiLLt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eJXDxjtpxlaRlyectS+NiI2BE6CyW1HF3ivWw5VpKUk=; b=IzLNuwnAyhmWdSboZrN4fQ5Ah/
	HniA/yQGrOKXGm0Uor3KqFV96R/L53BWQsQqyVaLt7kYdHiw1hTZqcRlx+nylBpGZtjTkTRqVV8Zx
	ncRYUgb28bgAhkKwRxtRqYge/C4/LR0FaeIe2ehvF1htkpalt6Z0T4mlLOor7lK+4D35iuPGi46i4
	SqEZVmg+u6hoVL/wxmpIhbGXkzSAnxEStSA6X2ngNmUYk/QGDHwy+llYJA0N+Xrgq96KVf85EftLt
	fwmIwE8mePGa0eXZ4dstqd9v3bt1cupHkEJFwIVYwWKzIzDIL8WOyfl5Dnv/WYiN5CSCAZM8z9nyK
	lqG1C2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB4m-00000001nOa-1ugE;
	Tue, 03 Nov 2026 09:45:09 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB4j-00000001nMj-0RFY;
	Tue, 03 Nov 2026 09:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793699105; x=1825235105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qP/t4N3PI5wThGHkMAYxTPrH5iaWsuCbk6aKxmmZ9b4=;
  b=GXotiLLtuX0xPrBVUtJnfZoqu9woKO8HEpDp9HYWfqcZgN18Nu5bYRm/
   V2y0DhanRFZFpclJNgm6zbSAG6rQRmGfvjks/TSQ6IfoUwi6t6xeyS/jo
   i9q3zjtxiPgs6czOekQ3eJN35V8orLhhrwZAXcv0Ckni1GT8je01mxxx+
   PLgrLpbuxVWmBSUmRWI/vKsn3ehuIFwSisW3oqNRpjcKOJtyDmr0n5mb8
   ocsAzSjBCDXax8FBi0E4guewV4+ja9qQCJJWSOVw+K/gQzvJ3rm+U7000
   s0PvTkj6nJaKhQhOlR6L9N+sT5KiXTIXJ+s9CqJ4yYaN+xiEuUBlBQ8pH
   g==;
X-CSE-ConnectionGUID: J4r9i0sMRqeUU6oKNWBUxg==
X-CSE-MsgGUID: OMA8iGHvSF2lzbE0Yulbyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2443831"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2443831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:45:02 -0800
X-CSE-ConnectionGUID: zHbXd8tfQoSfJzSB11ByKQ==
X-CSE-MsgGUID: eAFN0YoqR82Ahh0sG4Z4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6237758"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:44:57 -0800
Date: Tue, 3 Nov 2026 11:44:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
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
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Message-ID: <aumtFi5Jdzs8NIWE@ashevche-desk.local>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261101033018.05897c08@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101033018.05897c08@jic23-hlaptop>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_014505_191668_0049583A 
X-CRM114-Status: UNSURE (   8.81  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 03:30:18AM +0000, Jonathan Cameron wrote:
> On Tue, 27 Oct 2026 14:49:45 +0200
> Rupesh Majhi <zoone.rupert@gmail.com> wrote:

...


>  #
>  # Makefile for the industrial I/O core.
>  #
> +subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)

Personally I would move this to the end of Makefile.

>  obj-$(CONFIG_IIO) += industrialio.o
>  industrialio-y := industrialio-core.o industrialio-event.o inkern.o

But if it's already in, it's not a big deal.

-- 
With Best Regards,
Andy Shevchenko



