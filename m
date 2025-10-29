Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D41CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozpVcGbkgzmvLF9mR2ZhgMv+MEgMd5c6ZiX/mBWGg4A=; b=aqltfe8AS+6AtMfiKjQa6kiOf7
	TOP7j2lGxA+6q2ga3ocqKWXEolNk2BAhI5rBjm1Ck/szV4YV1z7R/airg5WhRUd642dfSNYM5gaKv
	tqeZedxSZvFjo4ElaMxu0z+9xC4RjM4ofXl0vaGMiwu3PLsU4tkYZfmsNo/+kaa2fknQidDfXeBhd
	6SW3S/ByxHxgNiT7M00R9y+S7f1Y7T6Xu4O3qV524d3UT/VnHqWIylcN52KM4JrEBPqrSXrtNqwMa
	Po61K+nCWsbW3rpcVtvN/VLJ7gqVCgXg/G2nDvrdZZI4M57zPFd+SbGnQEF4Zla4cE3j88VGniWRT
	EmAHvpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7zY-00000001lvO-0HJw;
	Wed, 29 Oct 2025 15:21:40 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7zV-00000001luN-1BUn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751297; x=1793287297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i8zZ/Az2AU7gAws4QhPWy+UIC3UsU5SjQYR63Fz7QG4=;
  b=IW+X0DpFZBYVBDDuMggBGs+UQJY8+49YM7BPmzlgf3R4Du80+CnZHA1V
   /MknELQZeXcg0A7pJjrYWsf33zg96IzmzA5tTnj6B5BQXkzIEXTI0OHLz
   9ctjy5F74DYukZl9+Y/5B3OiaUM/D8Sw2NNKKQWPXQXb2pRFKxuxGU5/w
   MBxL6Vq0FNCDiHX0KzUzri20e5qvy5eqSmeD6Q5ADTsuMb/q1mNifC0c/
   9cCBNkN/QayLXabx53NiVJZleUBwpOPab5jtoTqGSax8bFy5r5nkuUA0j
   1OilmOPameQstHHA6+dXmZvwg3kyy3VBl2tXLSKGXT5uGqXqv872PHmLL
   g==;
X-CSE-ConnectionGUID: 4ACb2WsPSJKfGnhVL/mX9Q==
X-CSE-MsgGUID: HrtG1yKURLW97prBUTX1YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63910728"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63910728"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:21:36 -0700
X-CSE-ConnectionGUID: VsQXzBaVQf6rqhBeifR3xg==
X-CSE-MsgGUID: tGWyFCvWRma3haaaGIshVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="216557885"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:21:30 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE7zL-00000003ePq-2SlB;
	Wed, 29 Oct 2025 17:21:27 +0200
Date: Wed, 29 Oct 2025 17:21:27 +0200
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
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared
 GPIOs
Message-ID: <aQIw97qdO43NXHWi@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
 <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
 <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_082137_330524_DE73D06C 
X-CRM114-Status: GOOD (  19.72  )
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

On Wed, Oct 29, 2025 at 01:41:10PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:54 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> > >
> > > GPIOLIB is now aware of shared GPIOs and - for platforms where access to
> > > such pins is managed internally - we don't need to keep track of the
> > > enable count.
> > >
> > > Once all users in the kernel switch to using the new mechanism, we'll be
> > > able to drop the internal counting of users from the regulator code.
> >
> > I am wondering if you took into account the layering violation (or others
> > put it as "transferring of ownership") in the regulator core for the platform
> > based GPIO regulators? This popped up during the discussion of
> > https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwenbo@gnome.org/
> 
> I am aware of this weird ownership transfer in regulator but these
> changes don't affect it. The layering is still being violated though.
> 
> This should be fixed and I've looked into it but it's not trivial so
> it's another big rework for the future.

OK, thanks for clarifications!

-- 
With Best Regards,
Andy Shevchenko



