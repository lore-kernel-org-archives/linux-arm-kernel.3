Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B7CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9YHXExGUZGI5Tmw7RHZeACIGs+op9SFfTPuLvCCako=; b=yBajuldGaZSEEB1oC+5Z4n6xs4
	rMyumcyf14LF21vRY+pkgLSuawIFnanDg6HOrelgyVf1xMLS4paklssusQ0dLueMBmn6EvrWrKNwZ
	NsqJOT2d3DhHNO2H66LR4RdJnsEsye5itO4/0wPsXTOi9nnh9vtNWr5MX1C9irrxD5H1+luvGR+s+
	h8oQJWTrd/oIwlLptXICAwLvdz1msUB5pID6trWnaYGJ2x4pjQgQPx0mwQQZ3GS3im0kil4ELdI+E
	WMaOQJKeE3xwcBsx3khHrCcyRno/Rg7ImNPg2z743MD+Tyxb0PTj06gMrZ4diRT73qDL4hTCuspG7
	ruPlgKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq6k-00000005VFz-36HU;
	Wed, 30 Sep 2026 08:56:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq6j-00000005VFk-2KLv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 08:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g9YHXExGUZGI5Tmw7RHZeACIGs+op9SFfTPuLvCCako=; b=lNu8OEtUkjMjpXePKDiwrcsrxV
	6+irsaniuwqRE11yCXOjex+zJVhslwWTkqbN2b3Wbyx4uxveIunkDoEuSsQpFSXNyrXLrB+m41yYw
	Favb9mrCTpx5FbEXkwWTq/iqLzaItbV8Ya+KcZHqv+a++MXNIKZfbHekjT1Q7t18nS66528NtgKn0
	HHkQjkk+mWT3yYZTEeR+1dbmFcLnjFmh/1Rv9LNeQEw7GKFLbKml23zSjU2h41QOhx9VeQtwpadkn
	WxC34BZpBtH0mf3rlpyCA2BzBk7zB2aGnc6W7fQGOvZjR4OUnQIral1zijHQ9VsVPFG0WJ6p9+w5w
	8V5JFjlg==;
Received: from mgamail.intel.com ([198.175.65.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBq6d-00000003YHN-14pC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790758563; x=1822294563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N8NsL8xAHAPT4V/vU/YLBwC3KZGQnQwHOH/YRxi5FD0=;
  b=bEPDYSkLFf4zZKWpuF9LSF+BIzdEL8vDpzGsCtuzpWleJCXRj1KXUuqf
   ZUUCHg0oA+i+RPNbyinVCQ33QqDWZRG4mGbRMFNu79WRjHXWTBegk9X4E
   dJE6dYXE8yL6lYC2uyJhQC6c9kKbodLQKHeLTdQ+296xSA9FS0edjKjVI
   778RRc63ArHBAT3DHeWrim6nwzopPt6pqMRNDsine+7gScQZeMI825bOz
   5LyRBMZpPwpo+8VCKSwuG9BMYtpavGUSfzwB3ZN1GN8j8U0T1Qhah4wMF
   JbR7CbIsVOR6+8xBzHIvxavtmTVa0sbPjHLS8Z+JseEmSWbZuJJLWlpTI
   g==;
X-CSE-ConnectionGUID: 2aJw3hMBSIG5mAV7ix1yAQ==
X-CSE-MsgGUID: X0OzuVM8QLmTyClHnBd0bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100821302"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="100821302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:55:58 -0700
X-CSE-ConnectionGUID: XJq7Q+H9Q+W2I+MxFuJnMw==
X-CSE-MsgGUID: J068ASCjQj6XHEzHq4hWEQ==
X-ExtLoop1: 1
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:55:54 -0700
Date: Wed, 30 Sep 2026 11:55:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Cheick Traore <cheick.traore-ext@st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 07/14] iio: adc: stm32-adc: add support for stm32mp25
Message-ID: <arzOmLhyaqSdcKqW@ashevche-desk.local>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
 <20260923-adc-stm32mp25-v1-v2-7-46bc019537c6@foss.st.com>
 <arWPjx-JKt1IZCZl@ashevche-desk.local>
 <8fd19ab1-6ec4-49d7-aadc-accec6e71410@foss.st.com>
 <arzJYg3cg73vYCOE@ashevche-desk.local>
 <d83e2c8e-452a-4dfd-823a-624fe211837f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d83e2c8e-452a-4dfd-823a-624fe211837f@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_095605_249437_C5DBE53F 
X-CRM114-Status: GOOD (  15.56  )
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

On Wed, Sep 30, 2026 at 10:44:12AM +0200, Fabrice Gasnier wrote:
> On 9/30/26 10:33, Andy Shevchenko wrote:

...

> Sorry if I'm a bit confused :-), just to be sure, the preferred style should be as below ?

Yes, in case if you want to update the whole ID table.

> static const struct of_device_id stm32_adc_of_match[] = {
> 	{ .compatible = "st,stm32f4-adc-core", .data = (void *)&stm32f4_adc_priv_cfg },
> 	{ .compatible = "st,stm32h7-adc-core", .data = (void *)&stm32h7_adc_priv_cfg },
> 	{ .compatible = "st,stm32mp1-adc-core",	.data = (void *)&stm32mp1_adc_priv_cfg },
> 	{ .compatible = "st,stm32mp13-adc-core", .data = (void *)&stm32mp13_adc_priv_cfg },
> 	{ }
> };

The rationale for the trailing comma is:
1) no need (doesn't make sense) to have it on a terminator entry;
2) do add it for non-terminator entry to avoid a churn in the future;
3) do not add it for any case when the whole array is located on a single line.

-- 
With Best Regards,
Andy Shevchenko



