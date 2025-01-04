Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA870E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKebJDhuxLBc+6tBl94uOkjKOFpskjJf8e6P9FOk/QQ=; b=yHidKRMkLAxHkTkpV1PViyKVIT
	KhRLSMwRN1oH/0QmWcuwzxb0hS7vnBoVOOq66ah1Sob0EukMP0Cf1b4igm7IFkg1M8xFlKOXIObnS
	vYGK2hjkWGXUQuv8Ag7Qd8bgg2WCX7yqJT1ut2vdJ+06g1KHFkTzZf2QjMHVjMlsxtple+dLuf+/C
	duwVUAZkLInfVDyn1WB31nmuMtGa+qeIiB1Dj/5+KZ6L+e/SN5/go7om85oseaA/LhZ6++MhfY6BD
	HnX+vVyre7zm54hfj8upQS0umcuinKQ/FlFDDkvh+A40nbY+Yyc5A5PLZyOwjTpFU6xmU1iiM8IFW
	um2gKz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTreI-0000000EEtZ-2rmD;
	Sat, 04 Jan 2025 00:04:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrd3-0000000EEmj-0bg5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 00:03:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 639475C05D9;
	Sat,  4 Jan 2025 00:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E193CC4CEDE;
	Sat,  4 Jan 2025 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948975;
	bh=TE63Ok9/k2mxRdrtTCnTzYnZSgktDJM8WGR5CCypWOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LclNP1Vk5tmWjrsKW4K7ZB1NqpCMwbZW3yGH8htuNDU6CFDHM5brGg9/Hiaes1CLN
	 +6bEWICChpndHl2pA50hXLIIsg2W6B/2mbuficfoBXHB8KkKe5KvzKZhB6GN7XUq69
	 67fiet5wD58jq50X83XwbFVwsLbGIa21rO17f5O7qTmexQP0Kr+xbIdiBcDieUJZHk
	 E4ez3/FzpjhX24jGU1apT8ZoFKzqX/9jQSkkzcO/EHbCQfgRI1OWxcm90pjUGlQ/Ql
	 wQ/2SxKk0KQ05tHwO6Ch2Itl49iHaDiTyMcNp3EUDhlNgwNrIHeR3d5OsW5o1TwgZG
	 JdAbOxiCUE6ng==
Date: Sat, 4 Jan 2025 01:02:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
Message-ID: <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
 <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_160257_234467_C4AAE51E 
X-CRM114-Status: GOOD (  20.25  )
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

Hi Bartosz,

On Thu, Jan 02, 2025 at 01:44:10PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 27, 2024 at 12:41 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> >
> > Hi Bartosz,
> >
> > ...
> >
> > >  struct davinci_i2c_dev {
> > >       struct device           *dev;
> > >       void __iomem            *base;
> > > @@ -132,13 +133,10 @@ struct davinci_i2c_dev {
> > >  #ifdef CONFIG_CPU_FREQ
> > >       struct notifier_block   freq_transition;
> > >  #endif
> > > -     struct davinci_i2c_platform_data *pdata;
> > > -};
> > > -
> > > -/* default platform data to use if not supplied in the platform_device */
> > > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_default = {
> > > -     .bus_freq       = 100,
> > > -     .bus_delay      = 0,
> >
> > what happened to bus_delay?
> >
> 
> bus_delay is not set by means other than platform data and it defaults
> to 0 so it's safe to just remove it.

yes, but how is it related to this patch? Can we put it on a
different patch?

Thanks,
Andi

> > ...
> >
> > > +     /* standard bus frequency (kHz) */
> > > +     unsigned int            bus_freq;
> > > +     /* Chip has a ICPFUNC register */
> > > +     bool                    has_pfunc;
> > >  };
> >
> > > -static struct i2c_bus_recovery_info davinci_i2c_gpio_recovery_info = {
> > > -     .recover_bus = i2c_generic_scl_recovery,
> > > -     .prepare_recovery = davinci_i2c_prepare_recovery,
> > > -     .unprepare_recovery = davinci_i2c_unprepare_recovery,
> > > -};
> > > -
> >
> > what happened to the gpio_recovery_info?
> >
> 
> Similar story: it's only ever used if there's a pdata-provided
> recovery GPIO line set but nobody does it anymore.
> 
> Bartosz

