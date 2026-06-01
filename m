Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BE0CD6E5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 05:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wExcRSxFkuXG92zBlQPobM0gnRmiENzxEEfbMcajwwA=; b=j5w8a+U7prf+myelDv/Dsl6cHG
	AsTkPgK5RUvB4xiKXAPUxhO00ECBKULDlfFIpc3khYD6mUx9DbM12Kb3QJNsWZn2ZN0ThoKUVA1lH
	KaXHE9zCndvxnJ2gCBayDvYe+OAsJMQ4e22DBVgLAGmrFDQcBisSWIwlrr22UGw8YadxqU0ZReSvw
	JFny1IMzAZA2LaIrMUEAn/o2EXN/ruBGgxzdFCvczawzcQmQrycoy9KL3l44P0YFzZ9CIHfdWm+N5
	KrFg0OIuWxNf0zSQ4ZQ/8YiqF1LB19aPkF38R6/WG6pjZWQYJ/cKdFgMDRvyHs87fF86DqM20ni6D
	EIkwxU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvby-0000000AAUy-01hy;
	Mon, 01 Jun 2026 05:54:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvbw-0000000AAUr-2hgI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 05:54:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F0B760018;
	Mon,  1 Jun 2026 05:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944AB1F00893;
	Mon,  1 Jun 2026 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780293291;
	bh=wExcRSxFkuXG92zBlQPobM0gnRmiENzxEEfbMcajwwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jFdRYIcyAAGbjJXIMXUw03Kp5cBuVOIKu7vaBiMxcS/AzD0pRnkKa5mCqMUYndnAC
	 T+S19C6pFLldq6JH2I0wKKbnObYwxawC/VrKhVuvuKndzHELA7fxUvK7ui+0n0dXXN
	 rqkjMvGOYeAL90+BgtMA2abrAvnT3UFf42Sv2MXw=
Date: Mon, 1 Jun 2026 07:53:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Grewstad <dogestad24@gmail.com>
Cc: jic23@kernel.org, jacobsfeder@gmail.com, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hjk@hansjkoch.de, davem@davemloft.net, netdev@vger.kernel.org
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem
 direction
Message-ID: <2026060113-clothing-chummy-1732@gregkh>
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <2026053145-bungee-flyover-840a@gregkh>
 <CAD03fjaxcS0rfZbNPNQjg7HxAhhTvOBxH=p-Rj_ngaGBPmpXMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD03fjaxcS0rfZbNPNQjg7HxAhhTvOBxH=p-Rj_ngaGBPmpXMA@mail.gmail.com>
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

On Mon, Jun 01, 2026 at 11:09:36AM +0530, Grewstad wrote:
> I don't have the hardware, but I plan on testing it using QEMU.

I wouldn't recommend this for cleaning up and getting the driver out of
staging, as QEMU might not be working like the real hardware does.

good luck!

greg k-h

