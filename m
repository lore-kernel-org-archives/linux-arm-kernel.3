Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B94F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT/WbXNBnHVHbWJuWSQf2lev8lSg9jb6w/iWuODCBY8=; b=w61SF6VScLFwm2mVDeFxL8eJkt
	WaeVVE2G/NatwEdhtZisJ8sejwqztCzBMGkEZS++sQCnR1gP90crDjQ9I6bOIkc7mU5i8GxcK7ZXM
	bkdDiCuuHB1zePf4qP58c2i+m+AQG2IR7RnnjajUIGBg380pV1npAzc1jOkpRAWRZH6TGlysAZvZY
	CbXmvHbRem9e3Brkw7eX1VOqob7x6uGQxtitqTTUhosRcTpBxJeUmIwsvSn4GLE5+9UV3XgMcAhs+
	9h28fujk7/PdGuxyUQTB4I6IfHjGpxxCNt7bGMgjGsO+RlHHo46kWX52czbY5MyzTlk+oVM8stZuB
	wffvOzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVRs-00000003ogx-0ryn;
	Fri, 06 Mar 2026 13:42:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVRp-00000003ogQ-1PVU;
	Fri, 06 Mar 2026 13:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D807543841;
	Fri,  6 Mar 2026 13:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC650C4CEF7;
	Fri,  6 Mar 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804551;
	bh=23e2vXZ+LPwii7CBOaBMLFQqrS73W1YmdWJ9Cli7Hoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4PtfgivqSO5bHN27uUYAlkze4+GpA/mYQUgJt6cysLhk4fsgavBVcy+Xq/leZGJI
	 5o7/W0LUJlHfqv6NSPHW1eRcG+V9hfNCHqGQ505gLC69LYx2ADuhnWZ0Z3xk2d7HCs
	 /Vlo+yScz7BRLVL+7Ss185bjTw3t9BFolWKrezoVn0yQkg7TTZL7sKOMrtirFi1sd9
	 8UqAIzLo6ETemq294i3zODWwk6StVn0Akv7H8hHNV2L3C0Kh/19qdfn/XuZGBOhpBm
	 97pdm1PhFlfFUpsg4wVEyUvZCl9b4gOXeYLiIUb7gjwkbjjnDdcct9rGV9OJ4oKL3e
	 xd0hIyxGBEwUg==
Date: Fri, 6 Mar 2026 13:42:26 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix GDM2 loopback configuration
 for USB serdes
Message-ID: <20260306134226.GD461701@kernel.org>
References: <20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org>
 <20260303141624.GD71509@kernel.org>
 <aaftUXaSD0u5ZhO7@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaftUXaSD0u5ZhO7@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_054233_394668_02C0D706 
X-CRM114-Status: GOOD (  22.64  )
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

On Wed, Mar 04, 2026 at 09:29:05AM +0100, Lorenzo Bianconi wrote:
> > On Sat, Feb 28, 2026 at 01:20:33PM +0100, Lorenzo Bianconi wrote:
> > > Flow Control source port mapping for USB serdes needs to be configured
> > > according to the GDM port nbd parameter. This is a preliminary patch
> > > since nbd parameter is specific for the given port serdes and needs to
> > > be read from the DTS (in the current codebase is assigned statically).
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > 
> > Hi Lorenzo,
> > 
> > Is this a fix? If so, should it have a fixes tag? And be targeted at net?
> > Otherwise, perhaps drop the "Fix" from the subject.
> 
> Hi Simon,
> 
> This is a preliminary patch in order to completely fix the loopback
> configuration for USB serdes but the point is we are not supporting
> USB serdes upstream yet (there is only OpenWrt support available at
> the moment). Do you think we should target net-next or net in this
> case?

If there is no bug in net - given the way net can be used with in-tree code
- then I would not tag this as a fix.

> 
> > 
> > Also, I think it would be worth explaining the situation
> > before and after this patch.

...


