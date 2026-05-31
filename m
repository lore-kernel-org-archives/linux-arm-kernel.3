Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF71DCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usD25Mn+KtR/YRU4TNAHsdvTdHQnYeqEpZh1u/Q0X98=; b=DVuXiX/FUnF5qZS9qVMjzRGKuE
	wenenQi35K+A4A1V+Jg/p5l1RA1GI1qzyDiiqYo9MF7t44q9QbLmlQlBk301s6pkNNuDucKWxH0XH
	7oIvXb/aQpukEVI491KzHxdm3LicGlpipaXPIQM8fmPUGRccSUwMJyYXPSHCzYWvALEZaShm5unt3
	cgUdvyDGZpRcH4cOWWkY8LHsKCa/ZgS7Kko6wi5iUrFYXj3df3ybvAU0frNJeH20mgP73A5egDHM2
	m1XlPeaS9OabPjcFLh5PI+i+hNnXRwyjUdQ/WInDoAFQvybP6dfhZVRf+d5i9UBxcJxxbScr6MfVF
	JkmPsHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmDJ-00000009s7E-3Xdz;
	Sun, 31 May 2026 19:52:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmDG-00000009s64-3Jg2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 19:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=usD25Mn+KtR/YRU4TNAHsdvTdHQnYeqEpZh1u/Q0X98=; b=nW
	z3USfiBx3GvO1i1+RWdPGGt/FWdjUQZ23dST/1Y7m+DlxgFl5AMdbxsJrgcRjL0ZrP1S6qrF1XGBo
	vddpOIjRFe9O8SZe0zd2iog2EIBzKS9WTfOIbtYX5eCQpDh45loIq6XVU3E3+2sbeThP/oILK/puc
	nJDcjX0+MsbMNSY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wTmD6-005OXP-Cl; Sun, 31 May 2026 21:52:36 +0200
Date: Sun, 31 May 2026 21:52:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Grewstad <dogestad24@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, jacobsfeder@gmail.com,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net,
	netdev@vger.kernel.org
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem
 direction
Message-ID: <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch>
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_125246_851727_9C7553E5 
X-CRM114-Status: GOOD (  15.49  )
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

In addition to what GregKH said, look at the vendor information:

https://docs.amd.com/r/en-US/pg080-axi-fifo-mm-s/Core-Overview

  The AXI4-Stream FIFO core was designed to provide memory-mapped
  access to an AXI4-Stream interface connected to other IP (such as
  the AXI Ethernet core). Systems must be built through the AMD
  Vivado™ Design Suite to attach the AXI4-Stream FIFO core, AXI
  Ethernet core ...

when used for Ethernet, a uAPI is not needed. The FIFO driver would
just expose an kernel internal API the Ethernet driver would use. Are
there any Ethernet devices using it? Is there a driver for the AXI
Ethernet core? Does drivers/net/ethernet/xilinx/* duplicate the same
code? xilinx_axienet_main.c says:

 * TODO:
 *  - Add Axi Fifo support.

which could be this.

As GregKH said, find some hardware using these IP cores, or synthesise
your own, and then work on the driver.

	Andrew

