Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/RGlQIx;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MBinKNbI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p+3Crhy2vTaTH2VP8Hqb2z/w7m3gLKgpAXgDIf/pTwE=; b=q/RGlQIxUFFmuQXFXAFBejKf67
	EozrNoOmKLe3zAnHYLkEVWg8Xzsqf7QQIXJRKDCpvv6VvIhOxYKd4dJgcYMfEJZu9VCCjFL2pnUKB
	JRP1z6cPmkCjh3wwUpnaMqddMu05thfEAxTJv+bEYfMuBac2K/ZBaOHGHRbI/gnrQj4BV621PaMnS
	8Lxy0HeaoWjJkHpnDzIUNb+DRH0QkAK2kK6L05CdHK0DTnzWUg5rlDMMjI5D7o+UgF5y2o1lcA6SA
	PzMh5bV2Q5yhAZ25Q9qJBkxwhbK4T5u2DvqVCk3CHOK+upPDhqVs1jW9kyzwPPdpyl4g/jicwWw4I
	d8+v149w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQ6I-00000009KsR-0AS7;
	Thu, 29 Oct 2026 13:23:26 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQ6E-00000009Krc-3iUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793280203; x=1824816203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9Cz3qGxvThs0rl/GR84Oy3PnSJHjpp3B9x+qw2O+AJs=;
  b=MBinKNbInWo1azOpxCckzEmKPOm1qJhWDP0SKyHrQktYkzYTDDOnvgy+
   Mp5XirOOcE0iqD0MI2yhoMUOt9eY0V9b1ASxPjrG72u76eaEpalhH7XUZ
   fusx/thYdJ/v6Zw/PS48jRttvL7mMk9e87pFXCCAwzaOoFDS0Ot2ZYgN4
   LSbbMDAK+X6K+v2OhSgj8owP7KMBB+WMl1tJX9rYqXaM/WkymuQqD4nPC
   0qDuChHGA4No3BYe9PhN5w3ih7l08YUWLE5zU6ikD2D0Oh+D2FUX98twb
   nej4RnUiyULLFN24BYdAV4lAeAjE7Xujxx+oqI3J+HFJSZ2kS02oA87fg
   g==;
X-CSE-ConnectionGUID: rIMDEwZyR0Kh3xBe73880w==
X-CSE-MsgGUID: xjVzInwwSHCiQiQTSX/znw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1905310"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1905310"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:23:22 -0700
X-CSE-ConnectionGUID: sK2vSRAjTAqdx5FXxpCvqg==
X-CSE-MsgGUID: o1lYrOQHRt+E7suodbHRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5156292"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:23:14 -0700
Date: Thu, 29 Oct 2026 15:23:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
Message-ID: <auNIv830Zu_1zWE5@ashevche-desk.local>
References: <cover.1793027261.git.d@ilvokhin.com>
 <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
 <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
 <CANiq72mMm75svCqevd8fHtVoczDpvpo4NwL0SC8=bWy030vQuQ@mail.gmail.com>
 <auNGJhSe3tVi7rDy@shell.ilvokhin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auNGJhSe3tVi7rDy@shell.ilvokhin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_062322_970240_D3E15731 
X-CRM114-Status: GOOD (  18.49  )
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

On Thu, Oct 29, 2026 at 01:12:06PM +0000, Dmitry Ilvokhin wrote:
> On Thu, Oct 29, 2026 at 02:00:28PM +0100, Miguel Ojeda wrote:
> > On Thu, Oct 29, 2026 at 8:32 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Should gem.h now include <linux/compiler_attributes.h> ?
> > 
> > No, it should be included for you (unless you are doing something
> > custom with the compiler flags etc.).
> 
> Just to add a bit more colour to Miguel's reply.
> 
> I believe idea behind include/linux/compiler_attributes.h is to make
> attribute wrappers as simple and transparent to use as native compiler
> attributes. In particular, this means they should be available in every
> kernel compilation unit without any additional effort.
> 
> For this reason, all the nessesary plumbing is handled at the build
> machinery level (see scripts/Makefile.lib:171), where '-include'
> compiler flag is used to pull in include/linux/compiler_types.h, which
> in turn pulls include/linux/compiler_attributes.h.

Ah, TIL! Please, discard my comment then. Perhaps we need to clean up all
headers that pull compiler_types/compile_attributes directly (the same way
we do for kconfig.h).

-- 
With Best Regards,
Andy Shevchenko



