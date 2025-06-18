Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AAEC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuDKVNVc3HzP7MqHWQ43emUhjoEdX6Nj4kG1GAtLes4=; b=uD1e5Rzb5XJeYFis7zmRMiMNan
	nwd989ehrDRpY63QC50XOACKTEPj5WD0V3MYx/eenlUBR7BDaxptMhnfWUl1f/kS8nU1f3rVpJCpy
	0TXr99PxwyT2wPLAtMJ0bLvmlPSWN3kUZVc/eKICNnnAqhYK3QeUOwmxgrPRzcs+/zscTKcBozIvi
	Hqe2Kv9ufTn/JlT/2ku9VuHeciwKT6NGpFWHOqaKUaoOMMsEPqPo+9xDuG6/LrCeTvcE4b7hLoBsE
	VKoriZm6IfcI/oYwXdp7x/+mPmtuDZFJK5GZ6LsgwYu0DvQpUY+1PDTpVbbjABjROYLZuGBqIZhwh
	H6tB2EUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfJ-0000000BEcy-3rrG;
	Wed, 18 Jun 2025 19:41:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxox-0000000B6cw-2rf3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FE604A6C9;
	Wed, 18 Jun 2025 18:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B1DC4CEEF;
	Wed, 18 Jun 2025 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272458;
	bh=7Y/Qpf9w3u1PPkHzxFMHo66MfQIzJh+2piey4VO4H40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKg2Hr0W+vO+14dIaOGmVWEiVs2c0SFbR0Tf9aa98ftrntYR2gmk1YXMCqRad5NfP
	 boC4URS8inbk/+ScGxGKJZS+MfBNGKs4TM+V6gMkJF8iWY4vq3l5CNDLKihwArVyBo
	 GoHACeif8FCIMHZ6jLwCjtV9nGukBr86XqYieBFFNX+sgqiKNkGqSRS1C8QH9OntlO
	 uxUUroY8a+FAbpyMwea1AYsbJUT4Ul9d9uErLtAluifmgSJEJ3a6ewnmP/sPRvPhzS
	 wlmIIyxLwThV4ZZ9bcAZfFV6aC22Td6nXyk/6fo0r0R1wJqAH6BtKiElp0RNcmImQo
	 6x7kt1i5RZBPA==
Date: Wed, 18 Jun 2025 20:47:33 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
Message-ID: <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv>
References: <20250618124319.19220-1-kabel@kernel.org>
 <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_114739_740763_BD5706C1 
X-CRM114-Status: GOOD (  12.57  )
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

On Wed, Jun 18, 2025 at 03:20:15PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 18, 2025 at 2:43 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> 
> What's going on with this patch? I sent it a few days ago, now you
> just resent it without changes. Who should pick it up?

I didn't see any patch for this driver, only for gpio-moxtet (for which
I sent R-b). Did I overlook it?

Marek

