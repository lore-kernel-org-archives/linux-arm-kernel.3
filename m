Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1778CF8E4AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aYtUWBj9oZbibfnPMYJRb3aoSsUAq3lyENyNU21Wb8=; b=ALYKTF2mzyidVvRDSv8fvApqks
	VzNhTDoukSNb1C/DWOjjEq2FBW5cqMvfD304DpYsgg0i34w3fqrI82s9Mdr7kMyKzSF5uvQQbVn/P
	xn/A+WDvdCzwyNNYsdvtMoeqWL8SZhn8pGRp4LPxgqe7091+bjtDwofLyvWZnoR1kX8h7t3NLQYtT
	wM57NVt/s95SAnKKPpj5DrT6uffSrM03CT4L58fcDV8G+hZUXJfp65qeJYEJ8pFci1qmW/P6sAXxr
	6YTrMPw4DpKCnlED+ZoEr179JidvHQiLdiNDDGiluyGus9Qniit+Wk4kyLhs2oSYkzW28r+XvApav
	5JyWs4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcnV-00000003Xd7-0qbd;
	Fri, 17 Apr 2026 06:35:25 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcnT-00000003Xcg-0Ns4;
	Fri, 17 Apr 2026 06:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776407723; x=1807943723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FZVuPVFR0V8fBBWIA2H5GECKnMRT1zPbHEZi5F4E0XA=;
  b=WuxuG6FRrPvSLICicL2ih2/tIXFrbxTsKgpd8UrXvj0EtdT14glSrWSi
   BrXsvSuRsxdzQYrPvnksyOtTEnkruokoxGlTFea0OQ3tO1/w0FZeFpXgh
   bCauJ7eS4BMgYU93oMB5jr3YOrPqrWSHzJwbzmf6bhLGILEfjXmxsxA2/
   XErDqlyibA/DBoQy76FcJS+r4uPf6gfAP1BH9uoplWz8yir2uLrgOzlol
   CongNyfaG9TpjIDqZgebT6nagOQI5rHoaGHyF8pxhDPX1vLFwrX63BOKC
   Ymcm2K/tmVIFFwx6ePJksCqwOkujsJi9nvWjdp6CC+toCmN01+NFuqPVI
   w==;
X-CSE-ConnectionGUID: ZjGCs6SGSw+CTWN/x6oBEg==
X-CSE-MsgGUID: MdJ8fENERDyIZjSavsDXkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81298688"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81298688"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:35:21 -0700
X-CSE-ConnectionGUID: FfaqMCLqRfWJdEIHn4mXwA==
X-CSE-MsgGUID: P8pC7coxRmCg/syrDlqKrA==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:35:17 -0700
Date: Fri, 17 Apr 2026 09:35:14 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Deep Pani <Deep.Pani@mediatek.com>
Cc: Fred-WY Chen =?utf-8?B?KOmZs+WogeWuhyk=?= <Fred-WY.Chen@mediatek.com>,
	Lei Xue =?utf-8?B?KOiWm+ejiik=?= <Lei.Xue@mediatek.com>,
	Mandeep S <Mandeep.S@mediatek.com>,
	Qingliang Li =?utf-8?B?KOm7juaZtOS6rik=?= <Qingliang.Li@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	Yaoy Wang =?utf-8?B?KOeOi+eRtueRtik=?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Cathy Xu =?utf-8?B?KOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>,
	Shunxi Zhang =?utf-8?B?KOeroOmhuuWWnCk=?= <ot_shunxi.zhang@mediatek.com>,
	Ye Wang =?utf-8?B?KOeOi+WPtik=?= <ot_ye.wang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Message-ID: <aeHUog7MXCdtEImh@ashevche-desk.local>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-2-lei.xue@mediatek.com>
 <aSdBt937C6Cjj_8s@black.igk.intel.com>
 <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
 <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_233523_144330_55714FD9 
X-CRM114-Status: GOOD (  34.33  )
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

On Fri, Mar 27, 2026 at 01:33:09PM +0000, Deep Pani wrote:
> Hi Andy,
> 
> You mean gpiochip_add_pin_range(), correct?
> 
> IIRC, that adds to gpiochip's range, not the range we are using for our
> pinctrl driver. 
> 
> The range we are utilizing inside our hardware is of the type struct
> pinctrl_gpio_range. There is no callback in gpiochip that handles this
> type of range

I see, thanks for elaboration.

> I also recall that gpiochip_add_data() doesn't initialize the hw but
> rather initializes the gpiochip from the hw data we will provide in
> mtk_build_gpiochip().

It does for IRQ if one specifies an IRQ chip.

> Thus  we need a function which will help
> initialize the pinctrl_gpio_range inside our pinctrl driver structure.
> This is why we make the mtk_pinctrl_gpio_range_init function here.

But this sounds like the solution from other end of a stick.
OTOH there are a few drivers that use this approach.

> For the second question, we are keeping it because before ACPI is
> invoked we still need some other pins to be configured, especially if
> different pins have different styles of pull configuration. The method
> we use is to define those configurations in the pinctrl-mt8901.c file
> which determines the gpio ranges and maps pinctrl device to acpi, one
> set of gpio ranges per configuration, for different type of pull
> configurations we have different gpio ranges, this callback helps add
> them into the pinctrl subsystem such that other device maintainers can
> easily leverage that subsystem to add their resources in their _CRS
> calls using the common interfaces. 
> 
> Thus we need to keep both the functions.

OK.

> On Thu, 2026-03-26 at 12:33 +0000, Fred-WY Chen (陳威宇) wrote:
> > On Wed, 2025-11-26 at 19:06 +0100, Andy Shevchenko wrote:
> > > 
> > > External email : Please do not click links or open attachments
> > > until
> > > you have verified the sender or the content.

Please, get rid of this header, it's not compatible with OSS development
process.

> > > On Tue, Nov 25, 2025 at 10:36:34AM +0800, Lei Xue wrote:
> > > > Kernel GPIO subsystem mapping hardware pin number to a different
> > > > range of gpio number. Add gpio-range structure to hold
> > > > the mapped gpio range in pinctrl driver. That enables the kernel
> > > > to search a range of mapped gpio range against a pinctrl device.
> > > 
> > > ...
> > > 
> > > >  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
> > > >  {
> > > >       struct gpio_chip *chip = &hw->chip;
> > > 
> > > >       if (ret < 0)
> > > >               return ret;
> > > > 
> > > > +     mtk_pinctrl_gpio_range_init(hw, chip);
> > > > +
> > > >       return 0;
> > > 
> > > We have a callback for that in struct gpio_chip. Any reason not to
> > > use it?
> > > 
> > > >  }
> > > 
> > > ...
> > > 
> > > > +     pinctrl_add_gpio_range(hw->pctrl, &hw->range);
> > > 
> > > Not sure if this is needed.
> > 
> > Could you please check this and feedback?

-- 
With Best Regards,
Andy Shevchenko



