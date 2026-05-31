Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF6CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di1SkVeensE68rhHjiGO1dahyj2mqu6/cETPjqdLbcc=; b=Kh+k6TuLDU2tyfzTUeOZQHkWQE
	ASlp5iTOhrM1xhd1Fj7C7C3ucp60IOSuSi22lfoj6o07Ln4cgL6Vm1v9OR1pNZ8krxA8YrTuuSf+e
	ogSjKfrEbNeD2b1UffEnG7wh3hCSrph904vnCAvu1gyG2QHKPicu33DLsAWEty3QKUKYR0q1YnFIg
	dlN60u1NnPE4Y39sDFKinqgma6KL468a45uE2q7aVZRyijyAmu1QZYkAOdqwrVs6HlKmS92hBL5ig
	2FAe39APTxQVPOwkY4y9orRRiVVZzo4pNFwRJqsKAujaXFqDxLZ49ygdiyzpz+WQM1QHgSmWBBJY/
	JfNyHh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009gfF-2Fno;
	Sun, 31 May 2026 15:26:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3C-00000009gck-3oqC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B88E16020F;
	Sun, 31 May 2026 15:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C017D1F0089B;
	Sun, 31 May 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780241165;
	bh=Di1SkVeensE68rhHjiGO1dahyj2mqu6/cETPjqdLbcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0RhIDHWxuR/gBz86SE/3nyKYg0MJEFuMA3eMpwnathr+EzeUBYKT5rmr7fYa/WnCL
	 1wkwiGHEojoC6HSDJweVD5LefC40OrhWyFm9a8MQ+X1ctNi0NFnpHwC4Z8SFtly1F0
	 fgxdGtABIe6yY79DUP/keHC7cPsGHOaBXW903sZo=
Date: Sun, 31 May 2026 17:25:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Grewstad <dogestad24@gmail.com>
Cc: jic23@kernel.org, jacobsfeder@gmail.com, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hjk@hansjkoch.de, davem@davemloft.net, netdev@vger.kernel.org
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem
 direction
Message-ID: <2026053145-bungee-flyover-840a@gregkh>
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
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

On Sun, May 31, 2026 at 08:20:35PM +0530, Grewstad wrote:
> Dear Maintainers,
> 
> I am interested in contributing to the Xilinx AXI-Stream FIFO driver
> located in drivers/staging/axis-fifo.
> 
> While reviewing the driver, I noticed that it does not currently
> contain a TODO file describing the work required for graduation from
> staging. I would like to create such a file, but before doing so I
> would appreciate guidance on the expected long-term direction for the
> driver.
> 
> The driver currently exposes a custom userspace ABI through a
> miscdevice. While this provides a generic interface to the FIFO, it
> does not integrate with existing kernel subsystem tooling. One possible
> incremental improvement in this area could be a transition from
> miscdevice to a proper character device (cdev) interface, to allow for
> a more clearly defined and maintainable userspace ABI.

There really is no difference between a miscdevice and a character
device, the interaction from user/kernel is the same.

> Some possible directions that came to mind are:
> 
> - UIO, if the intent is to provide userspace control over a generic
>   AXI-stream FIFO with minimal kernel policy.

UIO provides a mmap of a device to userspace where it is controlled
directly.  Probably not what you want to do here right?

> - IIO, for data acquisition or SDR-oriented applications that could
>   benefit from existing buffer infrastructure and userspace tooling.

Is that what this device is?

> - Networking, for packet-oriented AXI-stream use cases.

WHat really is this device for?  What is the goal of this hardware and
how is it used today?  Do you have the hardware to test with it?  Who
uses it?

thanks,

greg k-h

