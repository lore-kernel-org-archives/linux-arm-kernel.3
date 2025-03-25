Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B361C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqktsYbppSRlX7is342sEJneyeO0UnKXZfokmTQClpY=; b=2+Bue7jOvdfCYcCxNI2UnHUJNM
	ftDLDD+2k2zlS369f1zKl5iFW+AMKGJsQWISjJ9XHeoFrL2w3B8EeTv0KMCita4YkdcduqEP2mz+h
	hhpl0tge0OQxBB1sfMLR/OLuUy7gaHfttlxOmrAnh1ArkDo9YqQAw0YhHcCRhlhv7RbNG3Muu89Zy
	QaCtqiCKpW9SBrTR5zto4w4FfSX08+c93gePLau5vzVDFBQhdEMW/an736VnkZ4FyTb1nR/0gs5W/
	EaY+g74RyjD8r12h3PaE2BESkBwtKAlPjLAkvtGCRjCms6SlwZe/NMu3UJsOYJaqjIvtLd/J/NY8j
	fsFpvt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7Ft-00000006V5x-1jgD;
	Tue, 25 Mar 2025 16:35:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx77L-00000006U5K-18UC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eqktsYbppSRlX7is342sEJneyeO0UnKXZfokmTQClpY=; b=iQOgx42Stqou8AH10asLd5JD5h
	pBwtkgzljnuHRVCOo1pxbzJRUv0PG3DBg+7lctaqc+dvW8UAISYn0TpW5ong1uZ74tvBXT04p+P2V
	hJHC8G2zubmA1zY8Jrw8tSOzTVUgN+ZRK4WO9PkeS5x5M5WjPgADEg8ciuoyP0noXUc5RGgEOQFgf
	hsAnwwcWKEOEP6U1hhn2D32Z9BD9tPviKvBDK7c7KCBr1Avx9acFpZeHo16ZvwLGJHwVKd55w4bdu
	EyuFNwI0jt8XKz8FSSc+XQRkuoy2N4dBzcYtaJ3RWUcuPdMjbzSKMaVAlv7t4JnBZUubB4RgcR0P+
	Fl6usonQ==;
Received: from mgamail.intel.com ([198.175.65.21])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx77H-00000005eRr-3XwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742920024; x=1774456024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aUoNv4oYa8qCJxrDcUluP80WU2qGEeImHsJYH4SlPvY=;
  b=gaIptIJ0vGvRn9+T6iT8t6J+l4AcPCU94bLGOs5LKzbBBMRhrLqwlLJg
   7l9XXeKFW4eSo4yTSPFOPcTXSEurXGS0d6GqqCBYYa5YT/gx1y/Ogz8mg
   UozgHKGJhm+Gwcr2gkvXnoMFlbiXo0wX3Rj6+1faoP8F40jeItQjxQuqX
   hTeRNnGqrn0exdNGstCMAyIPAoVU93RYB6CgjJy0MZdo0lVxO1+Fcl0P9
   1ddHwTOuOFJ1JKCoXxx/p9facHr2jz6bVQJbYicKLp4CnCL/EhFddOpHY
   HQYYh6+dKETYq9HtERUG4qxTEDzDzRDY9jvd3VoxT/7rfWhAcnoi47Hia
   w==;
X-CSE-ConnectionGUID: JGDMVIxLQq+qP9K7m8A4WQ==
X-CSE-MsgGUID: jZQ5NhdORgaFVT2EqGq6GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44103821"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44103821"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:26:43 -0700
X-CSE-ConnectionGUID: JlxV2pRcQ2aEbRUQGA2njA==
X-CSE-MsgGUID: t1wgPdBMRwGB6RhGZYQreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124401977"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:26:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tx76o-00000005nl0-3rmp;
	Tue, 25 Mar 2025 18:26:34 +0200
Date: Tue, 25 Mar 2025 18:26:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: mailhol.vincent@wanadoo.fr
Cc: Yury Norov <yury.norov@gmail.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 6/6] test_bits: add tests for BIT_U*()
Message-ID: <Z-LZOoE0tYc51Xlx@smile.fi.intel.com>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
 <20250326-fixed-type-genmasks-v8-6-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fixed-type-genmasks-v8-6-24afed16ca00@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_162704_260847_AF7A6591 
X-CRM114-Status: GOOD (  10.34  )
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

On Wed, Mar 26, 2025 at 01:00:01AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> Add some additional tests in lib/tests/test_bits.c to cover the
> expected results of the fixed type BIT_U*() macros.
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

New tests always have a green light to go from my point of view,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



