Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E09CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h41l0voBK2LlIf3VO4XuCYA5EhJ2T6DmBWfUIajjH5A=; b=uArUf15Vy/6T/jyuW1PJtezUtu
	LRUIW77Ix7qAqfB+FKP7vTqP8zn2OplS4sw8R7YqZ5kXC3GX64I86r8uYmyI8vC2C3+JWBuRgN8Bk
	Qa1RnWiUzyGI1qXPfpzmcmzHRyuzD9QGqTKc5pJ04kksfFMhSNlb4rVJdN6j7ugugTPd1BDkeX3yv
	ByLKB0dHhrB+68f89eu0+akHpD3f48yBhRysz5mskEOd3/RpavTav/8F5yHt12CsiVbxHEF4wvlG2
	qkUB2NVDXHw7NGmk7DY9+3YKjU8OWCWjSZfsKS1zUbIdNSfQIySjByYu1qOxUKqNVgGainXahgHxk
	T33pFvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7yR-00000001lbo-2Rf2;
	Wed, 29 Oct 2025 15:20:31 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7yQ-00000001lbH-07P3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751230; x=1793287230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7OWp2ScUfhqZU9A50Wt+cYv1ErJkgPklB83W1yD4iF8=;
  b=juJXgbCriOtK/ST0MNjcITR6Cp7gpQ0WPmifVaEIZ2FL/r9We8HVDbL1
   8DW4xtfvemFW7CLcwjwHvb7zy8pnbkAt/Tf+MSdDl7TS0KN4iRB6TgpKP
   kN6AuIH1zj3lyrqzAN2RGDu2bW8+wG4/1Gpow5PvgPlYzUc9n4MCtABzc
   wC2nzLKtqvnL1SacDbBCKYXIF2wH9iKIiUK25phkf1GA17m4AfWZBR3k3
   EHw/qVYHAGxvvh7ZEaJwjDOn2kLfH/8KT48KOC6fhRycA4kuBO0a8yeuR
   ZPhWjRYePtllDpBuVmKImxUpfv5MCfrTHSH64Bh6BeY2LLTePMu3jylvq
   Q==;
X-CSE-ConnectionGUID: cgbdd1JVQnWw/xmSU0l1mw==
X-CSE-MsgGUID: KZimeuUvRMa6mpem6VoO+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81505290"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="81505290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:20:29 -0700
X-CSE-ConnectionGUID: lpbA3I83RZCijO/yTOTvwA==
X-CSE-MsgGUID: eIGWGTVoQSOrBFIKrbjnuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="189759224"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:20:22 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE7yF-00000003eP3-38Lg;
	Wed, 29 Oct 2025 17:20:19 +0200
Date: Wed, 29 Oct 2025 17:20:19 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/10] string: provide strends()
Message-ID: <aQIws1zwi96r4bUQ@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org>
 <aQH9gE_fB119CW3l@smile.fi.intel.com>
 <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_082030_081931_18F57F70 
X-CRM114-Status: GOOD (  17.87  )
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

On Wed, Oct 29, 2025 at 01:36:55PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:42 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:

...

> > Can you rather re-use strcmp_suffix() from drivers/of/property.c?
> 
> I think that strends() and its boolean return value are a bit more
> intuitive to use than strcmp_suffix() and its integer return value,
> the meaning of which you typically have to look-up to figure out. If
> there are no objections, I'd like to keep it and - when it's upstream
> - convert property.c to using it instead. Also: the name
> strcmp_suffix() could use some improvement, seeing how I wasn't able
> to find it, even though I looked hard across the kernel source, while
> I easily stumbled upon a similar implementation of strends() already
> existing in dtc sources.

I fine as long as the replacement (deduplication) change is provided.

-- 
With Best Regards,
Andy Shevchenko



