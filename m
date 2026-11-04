Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u4+3fMva;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JaKjSX6X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9yFi/GX6XbGdgj7giI9u2oIGi5Y7HHdeGnRwPsAUHHs=; b=u4+3fMvaNNXK/45w+KSTzV1X5P
	/qcE9xZTIB8OTKxLG6YOXGBsLOcTqGxNWtMrp7fk50hcyni99Ne3o0oFPvoqNM+pTubxmdx+b22Nq
	/Uku4QSiZt503CrCl/R/wU+ojQgUSOMCnh4Z8Lpz8WARxnOLZq6wjLA87ZybDN28grWJ8V4OTWhiZ
	umXi+5yxCa1XbP+IGxeAvWTPC8mgfxofb0HyTnVi6bbKuhqZCZxAam6eYbCHQx+G+EzgKTcxF1rKP
	31ppIPuKrTURlZcCiBGap8Wsb7Ix0EL5ezj6FpIiXjQRdSDb481ZEmJLGC57HIC8eALzdAspsGji4
	+uNVNnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZjC-00000005Frn-35QM;
	Wed, 04 Nov 2026 12:04:30 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZj9-00000005Fqd-0Pjb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793867; x=1825329867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ODBzuH6RtEnF965vDKPdCAhbR7l9hy9L+HJc3UQCPr0=;
  b=JaKjSX6Xttd612h6p6t7IJ27T1rfMKntrJ6+51vkZ7MKL6OEVR0gQoPY
   rbNS3PQMAiPvPzWlzqTVw9/nX+pVKjlmplaNVIqThyE4on3Qs2zYlEu82
   A62EjNvJ7d/VxCJNeslrKtuWeqB/dHi5G9ZFS736SM0m2BOyA9jyQdZZv
   YFYCMPLbP7fGV8UYkqJcwr2q76HZI3MEcgkR0SPgU22QWm+JYU/y1Ex5x
   tEJA0ZEf+3M/RhEk6XcqWuteOcRvVn+4SA7MwJkr247HgQYcFajPdlMS9
   qEUjp+jyjqiBjnwtrFoCQMUmtQgdAYepSbaNJslDUVQoteiYgfRRMAQ0M
   Q==;
X-CSE-ConnectionGUID: iqzBHxnKSgiXvjXGqlsiyA==
X-CSE-MsgGUID: F4LukOkiTL2R48nq4Lk57Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2562533"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2562533"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:04:26 -0800
X-CSE-ConnectionGUID: e5RXcvV8RR2NRUD8xQaZDw==
X-CSE-MsgGUID: aHPluvORSJu7gIQFVL1ESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7250227"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:04:24 -0800
Date: Wed, 4 Nov 2026 14:04:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] spi: Convert to subsys_platform_driver()
Message-ID: <ausfRVIeQxghbMGE@ashevche-desk.local>
References: <20261104113405.1634275-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113405.1634275-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_040428_275494_571F6AD7 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 07:34:05PM +0800, Peng Fan (OSS) wrote:

> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> The pxa2xx platform driver is renamed from "driver" to
> "pxa2xx_spi_driver" because subsys_platform_driver() generates
> "<name>_init", which would otherwise conflict with the core
> driver_init() declaration.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # pxa2xx

-- 
With Best Regards,
Andy Shevchenko



