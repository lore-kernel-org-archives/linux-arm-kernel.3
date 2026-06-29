Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD75EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/cQZtNVmZAXOHG03ROLnDmaqSKnwebUtW14oX2KZQc=; b=YogIrXsPJ4zx8WuVLEW2m1Oz43
	ZeyXWKJb5Vl3ya6+U/la2HG0PvL4lioHzXkkfKI4OKwlHtZVcc4QYdzoV2eHNmEcSQ7ZDRNcjP9rr
	lE6WG/v4+wkEjZzIczqjVHFMMFnso1QuMTP1L8b8qTeNKBxum1OePdEeklumVZWFYm2tR7+IWDI0j
	sMQdikQJq6nmEbtfHf+u4+n605m9x2jYvlHqxzyzhc2ons3ajS9qoiIdaDy9TOnzZx0gi5W6tMP3+
	7uH3vahBOG+55b0obRcf+iIg+1MfBig6U52nYbvRLk9IjIItSwaEsShYBK5K/Ody+C6wRkEmaKToT
	LJMqR/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9wU-0000000EP0s-0bqe;
	Mon, 29 Jun 2026 11:14:22 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9wR-0000000EOzK-1TfM;
	Mon, 29 Jun 2026 11:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782731659; x=1814267659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gLqMN8vpA2AzELZ43hBji5CPMGlrPDZKkBk5U11/0oM=;
  b=WVe7oLg/3L0D38VeplokGcMGoEZOHGTnSHd4AINqNF9Lkl5XoITG7fcx
   4RwUUQZ8+rB7zsLkyNax46tQ7Ufdtp/01sDGZYbPm+VsGaPyJWK2J08D0
   pZ/tIVPUvjK8ZqKdQIkt1R3Fi03ZCAA1AKG5q52oOcGiJSjxxZyyGZh+G
   dXGJS8uIpn+Qe6yFaH47JtWgyCCI7K/prkwH13vRzGlsOPbd4GBqiEUwr
   Vsx+mJC4rxaYdBbVR7FqF077fmgy4Jha5KgaHaUGqJ1JA1sBSfxgopjFa
   uRITmic7nRuqIk900fFmoNJPH7LxZAZldh5skovZo9+QG/y/95nk3mcOq
   A==;
X-CSE-ConnectionGUID: 3EiY5LaTQSW5xCxrt7h2bg==
X-CSE-MsgGUID: UW7K/l8nQwujOqXGK12ypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83290142"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83290142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:14:18 -0700
X-CSE-ConnectionGUID: NVYSf8rjSpKNO2Qk94jDzw==
X-CSE-MsgGUID: wKmi9k3IRtWOyVUpONdWzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="248569133"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:14:12 -0700
Date: Mon, 29 Jun 2026 14:14:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key
 connectors
Message-ID: <akJTgn0aZDtH04ij@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
 <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
 <CAGXv+5Gbf8+=hMZcK0pYraC1t4qmDx_WVPkr2RhWdm3bq_LZEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Gbf8+=hMZcK0pYraC1t4qmDx_WVPkr2RhWdm3bq_LZEQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041419_412592_2BCAAEEB 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Jun 29, 2026 at 02:46:42PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jun 12, 2026 at 4:55 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Thu, Jun 11, 2026 at 6:11 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> said:

...

> > Yeah, instead we need
> >
> >     config USB
> >         depends on POWER_SEQUENCING && !POWER_SEQUENCING
> 
> FTR:
> 
> Somehow I remembered this incorrectly. It should be the following instead:
> 
>     depends on POWER_SEQUENCING || !POWER_SEQUENCING

We have depends on ... if ... expression nowadays for that kind of case.

> and the dependency issue mentioned below then goes away.
> 
> > But I ran into a dozen or so drivers that have "select USB", mostly
> > input devices:
> >
> >     config TOUCHSCREEN_USB_COMPOSITE
> >         tristate "USB Touchscreen Driver"
> >         depends on USB_ARCH_HAS_HCD
> >         select USB
> >
> > Kconfig complains about unmet dependencies.
> >
> > > I see Andy has some suggestions but in general I like this approach much better
> > > than adding the pwrseq_get_index() function. Thanks!

-- 
With Best Regards,
Andy Shevchenko



