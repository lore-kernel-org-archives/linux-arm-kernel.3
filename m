Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C7606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4dUY4lfx;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BaBI4sAY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CoDiCaTJN+LFxlwyURPQlkHoXPhaz72iTcURzvPQHU=; b=4dUY4lfxVwnBTqqIQChlcp1uXO
	LDYGpMojQvIwrVz994YZuMhmQc/cyjAkNv3YM+KQn54exIK70J7hYYtEjBTcPhVqkeGx0eFF1qvto
	42ZK/PAtDPV9svr0tsID4678RSx1Wpp3xONarOIjyrcbX4nQT/t6FWQAtJuCFznfc+3FgH5+QG14t
	CizIYpifqpw8JhsHswjZchWcBOuc9K7/qgyBik50EsAZY5/eA0NR5PP/zBe/vg1BysqTpZh3XqriH
	mJNRpEGIvsf0WDYVjvh1Nyq4e7sBPhEOPM7MQeoQGiZC5htqq1psqNWkbcLKR5br4zj8/Nq8Vs/VC
	ZRFeKM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQHf-0000000BDaz-162O;
	Wed, 21 Oct 2026 06:58:47 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQHd-0000000BDaS-0EPW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792565925; x=1824101925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i07QuMRn/2JfcFy0JuCMmwxFwETBHdVXa2IAMSqe/48=;
  b=BaBI4sAY1b8+0VHfS1AaKcRupD4Vy421NmSSLRkYT6KbhzPqh/wq5fBT
   fw+r1oBnBlJ7y33Z/K6GN6AOcFL0zT0YTZ8TFok20cqvwM5MmRid50TR8
   659pUy/GQUBVggZ+R5a9ZvuQdofiQ0LfYh3zkgf5qBmlug8mdWueRcBtO
   pRRz9tgKZdQ+eqTcuz05urdPdYjoaXXnOwqaQr40DTOZjisd51rUArUF0
   u4fOILLNrvyDoFcVDLw94TZa4kkwZg4jvEuMqL/NXSxjWtkhXaoLjUHeR
   EtS5S8k4DGKJj4Y7VKV84m2tbE+1k6IS1wwWvRfRj0d08lMxWzf3nk75j
   A==;
X-CSE-ConnectionGUID: egGSOjY7QQyXS0Yk2CcwFQ==
X-CSE-MsgGUID: 3b2p7L80Qf6KZpdDKqDaPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1184187"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1184187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 23:58:43 -0700
X-CSE-ConnectionGUID: S6AFesmrT1+KJSlx5aB2uw==
X-CSE-MsgGUID: +peAPlOLSZe1ssAQhB/ynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2933131"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 23:58:35 -0700
Date: Wed, 21 Oct 2026 09:58:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <athimRqtDvQu1ZzA@ashevche-desk.local>
References: <arZDwutoadki7tiZ@ashevche-desk.local>
 <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local>
 <arqSqcoWAkhy-8do@red-moon>
 <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
 <asieTvinZ7c2QpQm@red-moon>
 <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon>
 <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
 <ateI-JcExDyfXKrs@red-moon>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ateI-JcExDyfXKrs@red-moon>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_235845_109897_00726D6B 
X-CRM114-Status: GOOD (  41.99  )
X-Spam-Score: -4.5 (----)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 05:30:00PM +0200, Lorenzo Pieralisi wrote:
> On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (Intel) wrote:
> > On Mon, Oct 19, 2026 at 12:34 PM Lorenzo Pieralisi
> > <lpieralisi@kernel.org> wrote:

[...]

> > Basically, yes, the idea is to defer the creation of the platform
> > device until the dependency is met.
> > 
> > > till the dependencies are cleared but then, without a _CRS, where will
> > > the consumer driver find the platform device resources ?
> > 
> > Well, good question.
> > 
> > > There are multiple facets in this issue and possibly some of them have
> > > been already solved but I need to pull them together.
> > >
> > > > Note that the dependencies can be added to acpi_dep_list after
> > > > creating a struct acpi_device with acpi_add_single_object() and
> > > > acpi_scan_add_dep() is not really suitable for that, but it should be
> > > > doable if the dependencies can be found.
> > > >
> > > > > I need to have a deeper look into this next week but I wanted to ask first
> > > > > whether there was something I missed - most likely.
> > > >
> > > > Well, it is not really straightforward.
> > >
> > > Yes it is getting messy. This RFC, with all its flaws, does not transparently
> > > prevents enumeration but rather relies on -EPROBE_DEFER to sort out
> > > dependencies - though it does so by adding more stuff into ACPI static fwnode
> > > that to be honest I'd rather see gone.
> > 
> > I think what you need is a notification mechanism that will trigger
> > when a specific device (enumerated via the ACPI Namespace) becomes
> > operational.  It doesn't look like any of the existing ones (platform
> > device probe deferral or ACPI device dependencies tracking) is really
> > suitable for your use case.
> 
> Yes. It might just be a notification from ACPI core to say "the driver for
> this ACPI device probed, go create platform devices that depends on it".
> 
> We can check and track the dependency in code that does create those
> devices today.
> 
> I will think about this to see how bad this might look like.

Don't we do something similar in drivers/acpi/x86/lpss.c?

> > > > I'm still not sure why you can't represent all devices in the ACPI
> > > > namespace in addition to describing some of them in static tables.  I
> > > > guess that would work for everybody, wouldn't it?
> > >
> > > That's a fair point - though then code will have to work with firmware
> > > that does NOT explicitly require those devices in the namespace (ie: firmware
> > > as it is specified _now_); it can turn out to be a mess even less
> > > manageable than this discussion ;-)
> > 
> > If it has to work under these conditions anyway, then adding stuff to
> > the namespace is rather pointless.
> 
> Yes that's the problem, reworking the code to make it work with namespace
> devices is doable the issue is existing firmware and that we can't change it
> (and we can't create it in the kernel either).

-- 
With Best Regards,
Andy Shevchenko



