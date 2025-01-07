Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F17E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoKSxqUC8GePesyAxofMqo93+LgiW4ZEciiqjU8vPC8=; b=gueKdJVm4sL8yAaOvfV67FEQRH
	9O80bexqF41IhbgZExl1tNrs2D0EgBOudxdJ0QIEL1O9t688JCxuw5/nUFvrL/qTyA4vkWTVgPSgO
	m6ag631L6gQ7jSqS2kDhWP6MvHwsYsRG22UpHLFDzdkgxMH7J77BByRhNlwITbRs5w0ZoiAbK+vuV
	dkWIE8Q9/6YR85gZqqSoawFl3OYvlMd1gRRV5IviVBJwbXUYxamxTuuWExxuK+dMGDJrh/jYPcPP4
	mB0/jnlCrWJuatfcF9/+nntoe10bVf3uXC8CqpSQUq3Rpcz3EusiWPmSZrVs5YngDl8AMe2eWs3gf
	xm2n7hjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIZo-00000006TFO-0WDP;
	Tue, 07 Jan 2025 23:01:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIYb-00000006SzV-1PEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96B6E5C0443;
	Tue,  7 Jan 2025 22:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6887C4CED6;
	Tue,  7 Jan 2025 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736290816;
	bh=UnKUUBq2SmugIKnovltJwIBCdCDqgI5xyyhzrT51Mgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gF85C++3bN9UpvT2RJ/5CcEeXC7FbIHXE446W6YChguOboVhbzHOsitcnL4XGRaou
	 559UqdEzhzR2AMljbBLE+6OVcN+tgYb8Pn1nwzwnL6ATu5zmG2rbxB9CyaGTyMwPUh
	 m9RRMiiy/SRxlWB9S7XgxzNWAz6VRBmBDCBP5K+jUWah26yoQc7Qdayh/sg5I8sfA0
	 XCU0AbNph2tHQ8PM2b8kbVePbfEV7diIuaNv/hzAfx+ppvuW9N6oyVnWUthCJFPD+8
	 WOnLxayCk0t7RfbmMn7c/4qp/LwZBjLgpfwBMLM9xQGKL7zfGshMOxGyfY3/RphnGV
	 awwqbn2V6eS1w==
Date: Wed, 8 Jan 2025 00:00:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
Message-ID: <cpf327z4gotr3keocxe2pwhwpyao5abg6izt332r5w3ulfz45y@wdzmqwujsg2t>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
 <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
 <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
 <CAMRc=MfRq9xU7a64qCOrDCYgSbeWVKF=PnzS8Cabm5a3zzFekQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfRq9xU7a64qCOrDCYgSbeWVKF=PnzS8Cabm5a3zzFekQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_150017_428373_D7CB9958 
X-CRM114-Status: GOOD (  20.29  )
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

On Mon, Jan 06, 2025 at 11:31:23AM +0100, Bartosz Golaszewski wrote:
> On Sat, Jan 4, 2025 at 1:02 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > > > -/* default platform data to use if not supplied in the platform_device */
> > > > > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_default = {
> > > > > -     .bus_freq       = 100,
> > > > > -     .bus_delay      = 0,
> > > >
> > > > what happened to bus_delay?
> > > >
> > >
> > > bus_delay is not set by means other than platform data and it defaults
> > > to 0 so it's safe to just remove it.
> >
> > yes, but how is it related to this patch? Can we put it on a
> > different patch?
> >
> 
> No, why? This patch removes platform data and all bits and pieces
> associated with it. Splitting it into two just to first remove
> bus_delay and then the rest doesn't make much sense IMO. The argument
> that it's already not used would be incorrect as it IS used by
> platform data (even though it itself is no longer defined anywhere).
> I'd keep it as is.

yeah... merged to i2c/i2c-host.

Thanks,
Andi

