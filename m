Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71713606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+8gL/Tg;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GgvQBS5F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eGH1sgh8fHcD1YzHQAXXHU+ICjz/GR3arUB8DIO7xaI=; b=N+8gL/Tg8iV0wVkohUSQo3MP1j
	4cTh9DNmQ7Kw1ED+BUJ3Qu2HcRpWzgDgQHbL30EfzmNypzZeR3tIZaCSoTAXnCyMtzHBJTY+pxrQ+
	K8uWOWvqvzD+CzfAapckmdQMD2EczsgOuULwaEuv9vlLGca9mgheiFaIQcAjLBwvsXfoFygGIZjGk
	q4eFmOw2UyYEou8piOHdjLUJamEdiKrnm6SE8Px9w3LjHMYYnWeLsByVxttEFkaAfmjRoA5BQCULj
	GL5Nsvll3WzdBj+y7r6qGCujrIxeSsfSFk4R7OPznVOP2KEUGTOt+/At6KgOlrwhs5DQWRKt4QGFD
	w0X+gjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiQm-0000000BBIE-1qHT;
	Fri, 30 Oct 2026 08:57:48 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiQk-0000000BBHM-0Z0V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350666; x=1824886666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XC9L0N0lGS0WxoaPGxJtRF+Dcu7w/yLaO4BtytOzzuQ=;
  b=GgvQBS5FMaxyGA7yUbOdJ5fiFg97eKNAFS2qeI+/vINYzU1mTvrB12Fc
   vCM5fiLijQ79GxP6be3+seiMORITvGNctWj98rpT3Vk6fK5KbeOAnnhNU
   v8Q2dVs9PmGaFN1ZdgGsqFqY21XfYmDidvkxGJpg2U8yacBi8Gw7GiIIW
   V7dab1CwQZlvG2gKYQH7q6xa2gkkH3XQStuIu1iw8rgeOjJsgTg8KLjnu
   VEs9t4TKVAHErlSNYUD6u/2JEKZJVydYGhDfy8TGGFmQpW7Ys6seqh7iw
   0pPKB1C4WEi8UKx/Zwz4jq7I5NafFo0/J8CJc1QONQz9XYl1tMa3gsVi8
   g==;
X-CSE-ConnectionGUID: 0wYLUF9GTmaIpvpdWLdKPw==
X-CSE-MsgGUID: 6OrKV+ygQsmZ32PBa8HPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1987146"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1987146"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:57:43 -0700
X-CSE-ConnectionGUID: 2ZQs9CufQJ2aI+tvMlBntg==
X-CSE-MsgGUID: YTk54IPeRM2APeu2Ec1IKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5265993"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:57:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2CDB9121B77;
	Fri, 30 Oct 2026 10:57:36 +0200 (EET)
Date: Fri, 30 Oct 2026 10:57:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_015746_238023_86FEF54C 
X-CRM114-Status: GOOD (  14.02  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Thanks for the patch.

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> When CONFIG_PM is not enabled, all devices runtime PM state should be
> treated as active.
> 
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.

Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
otherwise the same, except that it requires also the use count to be
non-zero.

-- 
Regards,

Sakari Ailus

