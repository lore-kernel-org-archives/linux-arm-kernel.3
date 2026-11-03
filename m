Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7C5606A82C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qQ6XIPSV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nK64mHTD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KKjRcMgA2od1JAUQ3NDEJd+3pJ6utv9HJwQINe7Cudo=; b=qQ6XIPSVKNhFzHSIcuXyExeZFN
	NYG49YOxwBgqaAK10BvAY0ofXq/jWKMmeqtKFeHeMo/ZW8EUP5aHoKGCIiHyiiz3NwCDlaGk+a7Iq
	Q77MEoTY6Yh0DrwJbY54vxUNkywSZy1UTSF7n5G7MD+1mkSzfMNMu7WRvtWRFtBPzkboE1CBkQPwi
	k+Q1YpVgkVh5jKemfAG42/xfqbBp7ZGvXgALw4GMl9lTv2kVngfjdX9CkX8DKRxRLD7LmTVaMei2m
	+hsOaxsG0W7D7chRDI2LRw8s94QFD8F267j7Bo65SFzVnKKsvLCg2LWkprl+gEaNeK5j2adgGENZ1
	7CxJcgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBTe-00000001tD0-2Cmo;
	Tue, 03 Nov 2026 10:10:50 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBTb-00000001tCM-1SR0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793700648; x=1825236648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qLeNMV9ESxS4vfP26Q6ujH3mVp4IAYKlMBiwJ2rztyc=;
  b=nK64mHTDuRqNfCDxuCrjiRkMWyv0Hy70+2pKQeXqd8MDkYJHPH713aB2
   Kg+WT9rxP5X6QkzQDfsxwM040eByk7GlkG9a+t+OGZHPu5FeAh/Tr2pHX
   ELNB2G8TMSeG57r9EoZEpaSJNpl50aVnt52MyKJjgUe/zSIUtr/YOhl9l
   ltdaLyt/IXjN8CX+3GzYLkfUy05MjB9sTxJXWjwtaLFO7ollfK/imFcdP
   eBGB2hHM8djbEQcR0nYEu9nrc1bGDVURSS641WGy6FvyU4pYUQAgfOzqM
   t91VQpRI866ZRnQU81SMa7o8CIrMi4f6B3f+Pu9ccXqp23M0NmYQbW0FN
   Q==;
X-CSE-ConnectionGUID: UG/LIZeERr21AdY3XLCdVg==
X-CSE-MsgGUID: Qt89rhGhR7K32KgZ6Ct4ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2415071"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2415071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:10:47 -0800
X-CSE-ConnectionGUID: cVqWb3x6TMefkE/gQOoIFQ==
X-CSE-MsgGUID: kl2DLb2fTzeQYxqtxFEZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6400206"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:10:43 -0800
Date: Tue, 3 Nov 2026 12:10:41 +0200
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
Subject: Re: [PATCH 3/6] iio: adc: versal-sysmon: disable interrupts on
 shutdown
Message-ID: <aumzIdkwp_jVcTTs@ashevche-desk.local>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
 <20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021047_395930_7571DB8F 
X-CRM114-Status: GOOD (  16.32  )
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

On Mon, Nov 02, 2026 at 05:51:09PM +0530, Amit Kumar Mahapatra wrote:
> Interrupt teardown is registered with devm_add_action_or_reset(), so
> sysmon_disable_interrupts() runs when the driver is unbound but not when
> the system shuts down: device_shutdown() invokes only the driver's
> .shutdown callback, which this driver does not implement.
> 
> The device is therefore left with its alarm interrupts enabled in
> hardware once Linux has stopped servicing them.
> 
> Add a .shutdown callback performing the same teardown, so the device is
> quiesced before control is handed on. The helper lives in the core
> module, so it is exported for the platform front-end. It skips a
> device described without an interrupt, which never set up interrupt
> handling.
> 
> Disabling the interrupts at shutdown is safe to have and not a must have
> requirement for shutdown.

...

> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct sysmon *sysmon = iio_priv(indio_dev);

Side Q to Jonathan: How do you see having a helper that unites these two?
Something like void *iio_priv_from_drvdata(struct device *dev)

-- 
With Best Regards,
Andy Shevchenko



