Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD4E9D408
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szPG/5QCazSZlScnVSfuJAyvGtymAIDrmzENZQeyRI0=; b=c1pr5211zkBFQXbYc/0X6CkWLj
	XYScR8qjVwFiMg1oEI3s0qFzAarD5guoWwOuFzaQwhdM+so2vNzMtYTuQ9zOIV7wXf2dmxPn8y57A
	ihq0hO+6czpLtPNh6QpBWJohVsEgtZkhQbKtMBPlTQJWkhvFX+dQV7T7bpEqSJEpsfcah5x31CgCF
	4tc3EaUQpOZRYVHHd2S4sSypInU7etR7kXj/jqGAvWoJasl0NJJ55vQ1gmYVlMEhghrGr5/dhjVVw
	DSu2uMUUztly/H3NRG7mI6j5Pxp5xk4s84UgLJLl8rhXZPJBtEixBehqzWhwuLo7piwh7rBPV69Nm
	H9FcIH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfZ5-00000008kGm-2bcK;
	Wed, 04 Feb 2026 16:17:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfZ4-00000008kGH-0XGL;
	Wed, 04 Feb 2026 16:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=szPG/5QCazSZlScnVSfuJAyvGtymAIDrmzENZQeyRI0=; b=jEMTP0jf3u9oRIDZbfa43RFU9p
	WSQTvNiQ32NWziExHGuLZIadzox6owAWHObo4ka4AKMlyVlcGyqXaD1/OZmJ6/os+P+/ObsjR+E8Y
	pcvxiGoxtKBra1+R8nNaS17l+bnrO9uZoQq73AlFp7eV4SGhRp/7JpuTS2B6XHsd5Yia0PtMoQh4V
	t3h/rnSEfZg4Vfky/TpAmd31Up0g9a8gFFwLED+qigqsFPbhusIx9MvE0VOsj6V5J9NndUlJaEX+R
	s6rIrh0OWoZs5gtwNUqc1pyiTw9iHJazvIFaWjFBonktxJCbhDcz2EILTPKhIoSGFJIwauI7Ubzzi
	mrASKGzg==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfZ0-00000000qx3-06QP;
	Wed, 04 Feb 2026 16:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770221830; x=1801757830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IcghZ54w5jFehAy4KhdaevfCZ6WEwvI3d61AEC2l8NY=;
  b=j5FtVdMGwpmQBjkk9COTP4OM8r+nnurAuN8UUruD1pqm7Uj+AK63hMsI
   FSozel+xw58zzg8iVe5a2JSiQDhM7gfcTRqBywyHFcXQ26YWaOTU/7eAW
   Ec4AVdXaAhHayrYp267+PRZOpaRlqjXJKDeAW2Dz3di/SbK4SreD4fI3n
   uTY6if6jRcgC8HkKJBvhPn8lFfQuvBFVisS10YUTNXk5PwoBCsXS0TDBG
   ykTrf84e8g4aE4oACC7oTeDWXibaZ/S1GFndeEugP197hZKGn4czcOPIU
   o2rPvrZc7NdzhWE9Bvu0pS4yhJ6GTDsWVEVRx+jbFg06NG3TPJ1GpYdrV
   g==;
X-CSE-ConnectionGUID: VqN4ALzpRyi9xihXpzsdDw==
X-CSE-MsgGUID: iLN6Khm5SkCDMVb/62rtxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74016666"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="74016666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 08:17:04 -0800
X-CSE-ConnectionGUID: h0qBT9R/Sm65Ew0DhBZEFA==
X-CSE-MsgGUID: TfCa+Iy7QemO+kJ8lNsh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210227633"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 08:17:01 -0800
Date: Wed, 4 Feb 2026 18:16:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
 <20260204-credit-precinct-5424c122a79f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204-credit-precinct-5424c122a79f@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_161710_547939_3CFC06FB 
X-CRM114-Status: GOOD (  24.17  )
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

On Wed, Feb 04, 2026 at 03:50:02PM +0000, Conor Dooley wrote:
> On Wed, Feb 04, 2026 at 04:26:29PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 04, 2026 at 04:22:47PM +0200, Andy Shevchenko wrote:
> > > On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> > > > On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > > > > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > > > > On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

...

> > > > > Note, please, remove extra '.' (dot) in the Subject.o
> > > > 
> > > > fwiw, the .. was intentional cos I was truncating the pinconf_generic
> > > > from the function since the subject was really long, not referring to
> > > > a member of an ops struct.
> > > 
> > > Yes, and that's how we refer to the callbacks — with a single dot and parentheses:
> > > 
> > > 	.my_cool_cb()
> > > 
> > > Alternatively
> > > 
> > > 	->my_cool_cb()
> > > 
> > > but it one character longer and TBH it slightly less readable (I personally
> > > used the latter and then switched to the former in the recent years).
> > 
> > Hmm... My memory tricked me, it seems I switched to ->cb() notation, at least
> > there are patches with that from October last year. Whatever, choose one and
> > use it :-)
> 
> I think you missed my point, I was /not/ trying to refer to an ops struct
> member. For those I follow the first of the two notations you listed.

Indeed, for that cases I usually use and underscore (however it might
in some cases be ambiguous):

  pinctrl: pinconf-generic: move _dt_node_to_map_pinmux() to amlogic-am4 driver

I think it's possible to drop the 'pinctrl:' prefix, the pinconf-generic is
unique enough and had been used in the past a couple of times (yes, I know that
the convention is to use subsystem prefix).

Also word 'driver' can be dropped.

TL;DR: My point that double dots is confusing and non-standard way to refer to
something which is cut. If not full, ideally it can use triple dots followed by
underscore

  pinconf-generic: move ..._dt_node_to_map_pinmux() to amlogic-am4 driver


-- 
With Best Regards,
Andy Shevchenko



