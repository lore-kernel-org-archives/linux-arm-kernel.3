Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgP6QzojXuhorGTTVI3oGYKXbGMz65IyNf+nLyAv+Xk=; b=jVR5va344AyimzeoXThK+GNVPJ
	LCiIfaAs98x3ZmHbAf57PgYO/d/Tx/GN5nOE+yV5AmvzmQZs39aYc0RcD2XKaV7olzLaEuV0PYHQs
	Y59u+VdsIKW580fdCiPUkidXtW24EQryNDvlLfPGwruJ91MCTdJPMmUtGfD9kmLYxO40lystYBZt3
	1798o1qRsRmgwBW6PuTXi6m9MhMjutZHAQW4887YlB3/WGownF+Ds6TrCQHTZqKqX5v8q9Kf2Uo0J
	fkeO7folFOLCvILrPvR4gmvJLQW1YGpVX3Vzydv4Jx+BM8gBJMPlhsiJ52Hq1ub7Z0qeIkdokaWYi
	dU+oPdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1kB-0000000EZNr-20Ib;
	Tue, 07 Jul 2026 09:05:31 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1k6-0000000EZLq-12Qn;
	Tue, 07 Jul 2026 09:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783415127; x=1814951127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gKXaUE1a/lj7ODJJG8Iu0vM/NcsyBp3SmPPenh/MKEY=;
  b=ag5tTmzlVUNjQoBbX/5rmyhyvQUx0hO3eYu6czOtIHt/he9OUpegrTxq
   nK39gE24rG3fr5CMfZD4pb1pFRKVTUtiY4+WIMz5Xa9UQ10psSuNLuSp2
   zazyl/UXioo0Jkeno6psEfHWSjcVSzKhe1nYrzqEOSGl9j72WpYqMvX7Y
   9ZUvppCcIc6i9LDuLT+6ZIWja98RjwysEj8dZUa3AgkN6iKWXRrFAhlsw
   2juHliqMaZ/aYJUP3JNJjup7IFiM7dW/guQZGIyLvqTfkt4PBYmqS501I
   Hcxa2Yaa5hW9rnBLoKDgEtq0GHA55ElJs/MZnPthdqT2wveNr4SQoIR5a
   Q==;
X-CSE-ConnectionGUID: g+Cr16sYTly1faBmiQI0/A==
X-CSE-MsgGUID: QCOsN1ATRA2JtwzfNLQ6nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95211612"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95211612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:05:26 -0700
X-CSE-ConnectionGUID: IE34WxJFSwa0yBGRxtVjhw==
X-CSE-MsgGUID: 5Hee06dDRh+ykBUiAm1gtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251274968"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:05:20 -0700
Date: Tue, 7 Jul 2026 12:05:18 +0300
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
Message-ID: <akzBTumMCGFU-zAJ@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
 <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
 <ake6FNy83LLtCs3b@ashevche-desk.local>
 <CAGXv+5EgpizA3Pc8ScNuChPhvFKWd5F6dxB-wT4-7EwabE-9dQ@mail.gmail.com>
 <akvRMcGnUPxE3sxR@ashevche-desk.local>
 <CAGXv+5EqsDbzTg9eDMGK3Ph6Pe3_uDoSrjVL4q23cy6jZCk2tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EqsDbzTg9eDMGK3Ph6Pe3_uDoSrjVL4q23cy6jZCk2tw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020527_008377_53A8371B 
X-CRM114-Status: GOOD (  38.42  )
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

On Tue, Jul 07, 2026 at 12:29:05PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jul 7, 2026 at 12:01 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Jul 06, 2026 at 07:08:07PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Jul 3, 2026 at 9:33 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> > > > > On Fri, Jul 3, 2026 at 9:11 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:

...

> > > > > > At a brief look this will be the only function that takes usb_port
> > > > > > instead of usb_hub in the entire hub.h (I don't count container_of()
> > > > > > as a function). With that being said I would rather see it to be moved
> > > > > > to port.c altogether (yes, it's more invasive change, but looks more
> > > > > > consistent).  I would even dare to move struct usb_port (and container_of()
> > > > > > accompanied with that) and this function to port.h. This might require
> > > > > > a separate patch, though.
> > > > >
> > > > > I agree with the reasoning, especially given the function name. However
> > > > > I wonder if it would cause problems given the linking order. I'll give
> > > > > it a try nevertheless and report back.
> > > >
> > > > Thanks!
> > > >
> > > > In case it won't fly (but I still think it's better to split), can you at least
> > > > group usb_port APIs and struct? Means moving the proto closer to that struct
> > > > usb_port followed by container_of().
> > >
> > > Looks like it works out fine. port.o is linked in after hub.o, so moving
> > > the function from the latter to the former doesn't cause issues. One might
> > > even say that it is the correct thing to do.
> >
> > That's what I say! :-)
> >
> > > > > > Perhaps something like: 1) "move struct usb_port and associated APIs to port.h";
> > > > > > 2) "...this patch...".
> > >
> > > There are still some left in hub.c:
> > >
> > > static void usb_lock_port(struct usb_port *port_dev)
> > > static void usb_unlock_port(struct usb_port *port_dev)
> 
> These are only used internally in hub.c as a wrapper for the port mutex.
> 
> > > static void port_over_current_notify(struct usb_port *port_dev)
> 
> This is only used by the hub's overcurrent event handler.
> 
> > > static void hub_usb3_port_prepare_disable(struct usb_hub *hub,
> > >                                           struct usb_port *port_dev)
> >
> > This one takes hub as well.
> >
> > > These are used only in hub.c and moving them probably makes things
> > > messier?
> >
> > Perhaps better naming to each (kinda moving to usb hub namespace)?
> >
> > > OOTH, the following bits are in port.c but declared in hub.h:
> > >
> > > int usb_hub_create_port_device(struct usb_hub *hub,
> > >          int port1);
> > > void usb_hub_remove_port_device(struct usb_hub *hub,
> > >          int port1);
> > >
> > > Any preferences for these while we're reorganizing the code?
> >
> > These ones would be good to be in hub.c if there is no circular dependencies or
> > alike.
> 
> Those two, along with all the static functions they call, ends up being
> half of port.c. That doesn't help the size of hub.c, which is already
> over 6000 lines. I think I'll leave this one as is.

For now, perhaps at some point in the future we can reconsider and refactor
it more.

> Both this part and the remaining bits in hub.c I mentioned above are
> outside the scope of this series. We can discuss whether they really
> need to be moved or renamed.

Sure.

-- 
With Best Regards,
Andy Shevchenko



