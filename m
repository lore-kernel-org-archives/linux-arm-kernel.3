Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D1DCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHXyTgYlsVDOCondbOXFmhOPZeYBMwy1Jb4bmEJyWmw=; b=o1jMnrxVebLPnmXyLcwT2h4bmp
	nDJ30XnSZdcnJ4VkQLoqhoTB2p9WZqM9mg5XJb8nta9ZqBcc1S7l5o0W7h9VJysGVrv9PyRuZM/TF
	0dZRcKOISP8Yv7+h+dv2Ey2tLpNn0ghMnSXP66dF1RyvT0BjrGahKEoNcp4R1xSc13EjvqeXUminH
	nfBeLtVb1THwMbvtZRLzPLxGPY0/gNIf43EK8Kzrw9GnQd8dr67zJoQrg08Gf1tyKLCaoc2TVYIJj
	1lODJIOk1jDcqdAkfYEG8BiXC2e68f7RU65yxLeEfw1aKNHsZE2ZhRSQpRC23uUgd/btwqPOu1DuQ
	Mq1sYrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQV-00000001dQz-2O4A;
	Tue, 02 Sep 2025 19:12:19 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRs4-00000000JuZ-0DG1;
	Tue, 02 Sep 2025 14:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756822828; x=1788358828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iAXUSwwbvwiZC9bhMY6s6lbOEzUht7j1jWcYwHXsu+I=;
  b=MIGDtOcYMJ/J2HaWDNElWdKWf1WbKa4/EvFv1NKQK6T+XRVe+VlnR5KJ
   nFGNEmhvUvroow5pWFPgkWkQe/As0BaR8smTxWZgMMcWmYOIBEEqJtaiB
   DHSeyHlS+oQpQ5awNRUUWXmoEYiUiG6WpzWx1VhY03JTbvmpzWWbg0Hlk
   2P/KiAY32cSas/A15BEaHzqUwII79vbARYflVUgrZ7kW7LwJnRNA+RIgX
   apeYw9ZdCSZZjb8wka73G9neMSdq1v1+2o/OX6JGNj5Ug8rMm1kqweqzn
   S4PO/8G1vVRoRmq38rU1eS2vB1ltmFeHOkxh0s0ww7/wFY3sr0GPGRYrB
   A==;
X-CSE-ConnectionGUID: GzhUbaZ2RQaMgEbRWzcWfA==
X-CSE-MsgGUID: 62tMVg1+ToCopbTIqN8uww==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58305913"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58305913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:20:24 -0700
X-CSE-ConnectionGUID: MsrrCbkESHiLoR6gD4wQng==
X-CSE-MsgGUID: WARwoctoTZupLE1EBSrbfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202237611"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:20:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utRrk-0000000AiLA-3gUk;
	Tue, 02 Sep 2025 17:20:08 +0300
Date: Tue, 2 Sep 2025 17:20:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of
 pinmux_ops::get_function_name()
Message-ID: <aLb9GKnQkAiayqpD@smile.fi.intel.com>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org>
 <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
 <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
 <aLb2HH5zgxdbDiPo@smile.fi.intel.com>
 <CAMRc=Mdp2djgGbgu_uwLSkrtRPomAU=6-SRdzCdSbrHWzS2c2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdp2djgGbgu_uwLSkrtRPomAU=6-SRdzCdSbrHWzS2c2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_072028_106557_F2CDC4F8 
X-CRM114-Status: GOOD (  21.51  )
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

On Tue, Sep 02, 2025 at 04:02:27PM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 2, 2025 at 3:50 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 02, 2025 at 03:29:31PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 2, 2025 at 3:06 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:

...

> > > > Fixes?
> > >
> > > This has always been like that.
> > >
> > > > Reported?
> > >
> > > I mean, technically Mark Brown reported my previous patch failing but
> > > I don't think we do this if we're still within the same series just
> > > another iteration?
> > >
> > > > Closes?
> > >
> > > Ditto.
> >
> > I meant that this fixes a potential issue disregard to your series, right?
> 
> No, as long as the imx driver keeps putting stuff into the pin
> function radix tree directly, this cannot happen. The issue was
> triggered by the discrepancy between the number of added selectors and
> the hardcoded number of functions (we started at 0 which was not in
> the radix tree and crashed before we got to 1).

Ah, thanks for the explanation. The problem is that current commit message
implies a (potential) but lurking somewhere (regardless IMX case). Can you
amend it to make more explicit that there is no bug right now.

-- 
With Best Regards,
Andy Shevchenko



