Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB146C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAYSetqh9eSNkwVhXRc1QeqVbL4i4v1DvR8ou7zVszs=; b=KjSrO1tYqzif3LOVyNs7eTq+0B
	6u9+U6I+DQthUCoYGpjUBMay2KwpQfI5qY5wppZ7HqS+lIVQiUc7dFKk+2juBwOyskz034nna0uUN
	DKxxFGsu1OJjfDkW7lMUERHbZORr2APOadY9iKczLC75oUS9jRLNBOrk8cm+OYnKB6v8bnP2ZshtA
	FohIoOu4thOD9xSWyEKo0ErWFAkn92EOuEybXjcjlnUHc/25tC9WN7/N3N+EZIp4mDPPTLXMu+tsm
	ESMg5Jd+mrUoS5uGJM3ds1BKV3AKSK9SWvDAHNpn3F1YY+JnbusG2VAxE9yQmCHj3NvxvWAeaUXYN
	+Equm1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexpA-00000007qIn-24wA;
	Thu, 24 Jul 2025 15:25:36 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuVE-00000007Myb-3sVM;
	Thu, 24 Jul 2025 11:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753357969; x=1784893969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=skduPBA0XOiRRFwQNtjlPasZ0GUfqz6drj8febfSOhY=;
  b=eARZHpmL96dD7ERSZtIFH0sQreI8UQ3n3gZ4+pwPPw3GKa4F3wnbUVdN
   yQ1MJWrBTzS1Y8Y/ugkb/oAypHjL7ZfGvSE3Mbu+FyOuxEFiT1YXqfBDq
   zex+Ebseehw1kmDECTTDvOoumikfnws0G6gf9Wi0L2FSLoItrvdU6y+G3
   6BAg7EZhj9QExs5dVIdgkCAU0c8ngrv6FrEJaIEYATSJdUbQBazQ8/EjN
   EG+38Ry2t49Fbg+4efxXyU19ltppw16CDFfRfJGrn5LCaxRNgU1SZzZPa
   0sT6DpcTKQSS20DvSm0E3cPoaXnnePxiYaoDiBdvTuCOaidnukpXsNOtP
   Q==;
X-CSE-ConnectionGUID: OZdNWVHKRne2nn7eC9CIPw==
X-CSE-MsgGUID: j8O0r9BdR0aoj1w9mzuJog==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59473459"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="59473459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 04:52:46 -0700
X-CSE-ConnectionGUID: gH3texk5RoaLOe2vbIi/aw==
X-CSE-MsgGUID: lF7KjgBaRhmOljQc+wknEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164253907"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 04:52:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ueuUx-00000000Yl0-3pfo;
	Thu, 24 Jul 2025 14:52:31 +0300
Date: Thu, 24 Jul 2025 14:52:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
Message-ID: <aIIef0MDcZiElgN1@smile.fi.intel.com>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
 <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
 <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
 <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_045249_030680_767A6BA0 
X-CRM114-Status: GOOD (  16.12  )
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

On Thu, Jul 24, 2025 at 12:15:11PM +0100, Lorenzo Stoakes wrote:
> On Thu, Jul 24, 2025 at 01:12:49PM +0200, Andy Shevchenko wrote:
> > On Thu, Jul 24, 2025 at 1:10 PM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > > On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:
> > > > +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
> > >
> > > Please drop extern, it's unnecessary.
> >
> > It's all over the header. This should be done as a precursor patch and
> > I know that usually people push back on doing that. I gave up on this.
> > Kernel is going to rot sooner or later... :-(
> 
> In mm we just update as we go, this is probably the best approach to avoid
> unnecessary churn.

I agree on the idea of eliminating it, but also I agree on the consistency over
redundancy. That's why I prefer to see this done at once for all (in the same
header) than doing one-by-one. And this approach got a lot of pushes back, while
the former even more pushed back on the (in)consistency matters.

-- 
With Best Regards,
Andy Shevchenko



