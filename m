Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDSwgrk1/ZPx9cYes4oJgjv7gGk3XW0jjSji465yWVw=; b=JZ3MTnE9BlbH79nuZTIT8jWGxx
	dMXTHlk/Udh/4ubmmA7c0YTsAFo91h94AUA+x05goP8cOHjT9lfxFBafwBZOKdIiR5ChM6lIDpF9M
	O9FujgjFQfSpapFTS/eKR2Oq24yswCQT591+3jgyI/QG3JYqfAyJCpKTUVt0nINe7RE0jTnDZjcA5
	yidMd2giFtmVQv3DW2oWHsMGb+8tejjXJ8izbHV576fguF39SRwG4lWJ6lJ4mQ8Ls27XZ58M862c2
	gN1PmrMN4nLZFW7LrdS6B0Yyc0U0ht93xYJBQTkN4gRJtfCsau/UaZsK/RDWol9IaELsV0gqX5uOb
	mxNMNB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfe19-000000076mA-2OdW;
	Fri, 03 Jul 2026 13:33:19 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfe16-000000076lL-2New;
	Fri, 03 Jul 2026 13:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783085596; x=1814621596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5lQMIgp/+YLQE+iCJ6k4UQOQ5oRotS7kaMpyjTjYKPI=;
  b=by+WkIHf7ByQF5TvHdc9CE6Y7/BJjN7a/IWzopPruRMe1TyyjdIaKDwr
   UmXrR8zCskFi3mFHvaEn27sySyAGFmQfrn96f8fJZapCPheDu8ws/2zcc
   1kMKy9rJbd2Y+q6NErCWi/7l4f4KTrh9nC0mjITBXNlLWsJSpVndAKPJh
   D3WoV7r3RssigNkN5tUW//65I0R+a8f/RbrQxWpK0p+zgfO8XrHSAXqgm
   HE75PE1iIc9PqoaXaGeJZGKHbmUACN+lDKYBhiLhmyc+zQio5E7Vi7cQM
   lyGRGknZFS+kQx7DcdpDybPgbRhU8lw3CS7mLBuMaQ3vNDJmxJ9okcH5x
   g==;
X-CSE-ConnectionGUID: x62fWYc3TM6QjpfnZqEKmw==
X-CSE-MsgGUID: QnS0VGg/RKy/MyTyJTzM9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86388928"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86388928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:33:16 -0700
X-CSE-ConnectionGUID: U3qX0QxHQa6ijso6F6Apgg==
X-CSE-MsgGUID: 1Fo2kkbCS/OM0FqlPZExfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248667297"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:33:10 -0700
Date: Fri, 3 Jul 2026 16:33:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <ake6FNy83LLtCs3b@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
 <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063316_618660_868CFF6E 
X-CRM114-Status: GOOD (  22.49  )
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

On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jul 3, 2026 at 9:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > > usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> > > it to tell if the hub/port is SuperSpeed or not.
> > >
> > > In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> > > state tracking field in |struct usb_port|. Either structure can be used
> > > to identify whether a port/hub is SuperSpeed or not, as the field in
> > > |struct usb_port| is inherited from the hub:
> > >
> > >     port->is_superspeed = hub_is_superspeed(hub)
> > >
> > > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > > |struct usb_port*| so a subsequent change can use it.
> >
> > At a brief look this will be the only function that takes usb_port
> > instead of usb_hub in the entire hub.h (I don't count container_of()
> > as a function). With that being said I would rather see it to be moved
> > to port.c altogether (yes, it's more invasive change, but looks more
> > consistent).  I would even dare to move struct usb_port (and container_of()
> > accompanied with that) and this function to port.h. This might require
> > a separate patch, though.
> 
> I agree with the reasoning, especially given the function name. However
> I wonder if it would cause problems given the linking order. I'll give
> it a try nevertheless and report back.

Thanks!

In case it won't fly (but I still think it's better to split), can you at least
group usb_port APIs and struct? Means moving the proto closer to that struct
usb_port followed by container_of().

> > Perhaps something like: 1) "move struct usb_port and associated APIs to port.h";
> > 2) "...this patch...".

-- 
With Best Regards,
Andy Shevchenko



